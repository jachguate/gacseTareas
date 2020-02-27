unit udmTarea;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TFiltroStatus = (Pendientes, Todas, Vencidas, Completadas);
  TOrdenTareas = (VPR, VRP, RPV, RVP, PRV, PVR);

  TdmTarea = class(TDataModule)
    qryResponsable: TFDQuery;
    qryCategoria: TFDQuery;
    qryTarea: TFDQuery;
    qryResponsableidResponsable: TLargeintField;
    qryResponsableNombreCompleto: TStringField;
    qryResponsableIniciales: TStringField;
    qryCategoriaidCategoria: TLargeintField;
    qryCategoriaCategoria: TStringField;
    qryCategoriaColor: TLargeintField;
    qryTareaidTarea: TLargeintField;
    qryTareaTarea: TMemoField;
    qryTareaPrioridad: TIntegerField;
    qryTareaFechaLimite: TSQLTimeStampField;
    qryTareaidResponsable: TLargeintField;
    qryTareaidCategoria: TLargeintField;
    qryTareaFlagCompletada: TBooleanField;
    qryTareabtLogin: TStringField;
    qryTareabtFecha: TSQLTimeStampField;
    qryTareabtHost: TStringField;
    qryTareaDescTarea: TStringField;
    qryTareaNombreCompleto: TStringField;
    qryTareaIniciales: TStringField;
    qryTareaCategoria: TStringField;
    qryTareaColor: TLargeintField;
    mtPrioridades: TFDMemTable;
    mtPrioridadesPrioridad: TIntegerField;
    mtPrioridadesNombrePrioridad: TStringField;
    procedure qryTareaNewRecord(DataSet: TDataSet);
    procedure qryResponsableNombreCompletoChange(Sender: TField);
    procedure StringSetTrimText(Sender: TField;
      const Text: string);
    procedure qryTareaPrioridadSetText(Sender: TField; const Text: string);
    procedure qryTareaPrioridadGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure DataModuleCreate(Sender: TObject);
  private
    FFiltroStatus: TFiltroStatus;
    FOrdenTareas: TOrdenTareas;
    function GetFiltro(): string;
  public
    procedure RefrescarResponsables;
    procedure RefrescarCategorias;
    procedure PrepararmtPrioridades;
    procedure MarcarTareaComoCompletada;
    procedure RotarCompletada;
    procedure EliminarTarea;
    procedure AsignarResponsable(AID: Int64);
    procedure AsignarCategoria(AID: Int64);
    procedure AsignarPrioridad(APrioridad: Integer);
    procedure QuitarCategoria;
    procedure QuitarResponsable;
    procedure SetFiltroStatus(AFiltroStatus: TFiltroStatus);
    procedure SetOrdenTareas(AOrdenTarea: TOrdenTareas);
  end;

implementation

uses
  udmConexion;

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

const
  NumPrioridades = 10;

  NombrePrioridades: array[0..NumPrioridades] of string = (
      ''
    , '1 - Super Urgente'
    , '2 - Urgente'
    , '3 - Muy Alta'
    , '4 - Alta'
    , '5 - Importante'
    , '6 - Normal'
    , '7 - Baja'
    , '8 - Muy baja'
    , '9 - Sin importancia'
    , '10 - Solo si hay tiempo'
  );

{ TdmTarea }

procedure TdmTarea.AsignarCategoria(AID: Int64);
begin
  if qryTarea.IsEmpty then Exit;
  qryTarea.Edit;
  qryTareaidCategoria.Value := AID;
  qryTarea.Post;
  qryTarea.Refresh;
end;

procedure TdmTarea.AsignarPrioridad(APrioridad: Integer);
begin
  if qryTarea.IsEmpty then Exit;
  qryTarea.Edit;
  qryTareaPrioridad.Value := APrioridad;
  qryTarea.Post;
  qryTarea.Refresh;
end;

procedure TdmTarea.AsignarResponsable(AID: Int64);
begin
  if qryTarea.IsEmpty then Exit;
  qryTarea.Edit;
  qryTareaidResponsable.Value := AID;
  qryTarea.Post;
  qryTarea.Refresh;
end;

procedure TdmTarea.DataModuleCreate(Sender: TObject);
begin
  SetFiltroStatus(Pendientes);
  SetOrdenTareas(VPR);
end;

procedure TdmTarea.EliminarTarea;
begin
  if qryTarea.IsEmpty then Exit;
  qryTarea.Delete;
end;

function TdmTarea.GetFiltro: string;

  function GetFiltroStatus: string;
  begin
    case FFiltroStatus of
      Pendientes: Result := '(FlagCompletada = False)';
      Todas: Result := '';
      Vencidas: Result := '('
       +      '(FlagCompletada = False)'
       + ' and (FechaLimite is not null)'
       + ' and (FechaLimite <= ''' + DateToStr(Date) + ''')'
       + ')';
      Completadas: Result := '(FlagCompletada = True)';
    end;
  end;

begin
  Result := GetFiltroStatus;
end;

procedure TdmTarea.MarcarTareaComoCompletada;
begin
  if qryTarea.IsEmpty then Exit;
  qryTarea.Edit;
  qryTareaFlagCompletada.Value := True;
  qryTarea.Post;
end;

procedure TdmTarea.PrepararmtPrioridades;
var
  I: Integer;
begin
  if not mtPrioridades.Active then
  begin
    mtPrioridades.CreateDataSet;
    for I := 1 to 10 do
      mtPrioridades.AppendRecord([I, NombrePrioridades[I]]);
  end;
end;

procedure TdmTarea.qryResponsableNombreCompletoChange(Sender: TField);
  function BuscarIniciales: string;
  var
    SL: TStringList;
    I: Integer;
  begin
    SL := TStringList.Create;
    try
      SL.Delimiter := ' ';
      SL.StrictDelimiter := False;
      SL.DelimitedText := qryResponsableNombreCompleto.AsString;
      for I := 0 to SL.Count - 1 do
        if not SL[I].IsEmpty then
          Result := Result + UpperCase(SL[I][1]);
    finally
      SL.Free;
    end;
  end;
begin
  if qryResponsableNombreCompleto.IsNull then
    qryResponsableIniciales.Clear
  else
    qryResponsableIniciales.AsString := BuscarIniciales;
end;

procedure TdmTarea.SetFiltroStatus(AFiltroStatus: TFiltroStatus);
var
  DoOpen: Boolean;
begin
  DoOpen := qryTarea.Active;
  FFiltroStatus := AFiltroStatus;
  if qryTarea.Active then
    qryTarea.Close;
  case FFiltroStatus of
    Pendientes: qryTarea.ParamByName('FlagCompletada').AsBoolean := False;
    Todas: qryTarea.ParamByName('FlagCompletada').Clear;
    Vencidas: qryTarea.ParamByName('FlagCompletada').AsBoolean := False;
    Completadas: qryTarea.ParamByName('FlagCompletada').AsBoolean := True;
  end;
  qryTarea.Filter := GetFiltro;
  qryTarea.Filtered := not qryTarea.Filter.IsEmpty;
  if DoOpen then
    qryTarea.Open;
end;

procedure TdmTarea.SetOrdenTareas(AOrdenTarea: TOrdenTareas);

  function GetOrderFields: string;
  begin
    case AOrdenTarea of
      VPR: Result := 't.FechaLimite, t.Prioridad, r.Iniciales';
      VRP: Result := 't.FechaLimite, r.Iniciales, t.Prioridad';
      RPV: Result := 'r.Iniciales, t.Prioridad, t.FechaLimite';
      RVP: Result := 'r.Iniciales, t.FechaLimite, t.Prioridad';
      PRV: Result := 't.Prioridad, r.Iniciales, t.FechaLimite';
      PVR: Result := 't.Prioridad, t.FechaLimite, r.Iniciales';
      else
        Result := '';
    end;
  end;
  function GetIndexName: string;
  begin
    case AOrdenTarea of
      VPR: Result := 'idxVPR';
      VRP: Result := 'idxVRP';
      RPV: Result := 'idxRPV';
      RVP: Result := 'idxRVP';
      PRV: Result := 'idxPRV';
      PVR: Result := 'idxPVR';
      else
        Result := '';
    end;
  end;
begin
  FOrdenTareas := AOrdenTarea;
  qryTarea.IndexName := GetIndexName;
end;

procedure TdmTarea.StringSetTrimText(Sender: TField;
  const Text: string);
begin
  if Text.Trim.IsEmpty then
    Sender.Clear
  else
    Sender.AsString := Text.Trim;
end;

procedure TdmTarea.RotarCompletada;
begin
  if qryTarea.IsEmpty then Exit;
  qryTarea.Edit;
  qryTareaFlagCompletada.Value := not qryTareaFlagCompletada.Value;
  qryTarea.Post;
end;

procedure TdmTarea.qryTareaNewRecord(DataSet: TDataSet);
begin
  qryTareaPrioridad.Value := 5;
  qryTareaFlagCompletada.Value := False;
end;

procedure TdmTarea.qryTareaPrioridadGetText(Sender: TField; var Text: string;
  DisplayText: Boolean);
begin
  if Sender.IsNull then
    Text := ''
  else if DisplayText then
  begin
    if Sender.AsInteger <= High(NombrePrioridades) then
      Text := NombrePrioridades[Sender.AsInteger]
    else
      Text := IntToStr(Sender.AsInteger);
  end
  else
    Text := IntToStr(Sender.AsInteger);
end;

procedure TdmTarea.qryTareaPrioridadSetText(Sender: TField; const Text: string);
var
  Prio: Integer;
  sPrio: string;
begin
  if Text.IsEmpty then
    qryTareaPrioridad.Clear
  else
  begin
    sPrio := Text.Trim;
    if Pos(' ', sPrio) > 0 then
      sPrio := Copy(sPrio, 1, Pos(' ', sPrio) - 1);
    if TryStrToInt(sPrio, Prio) then
      qryTareaPrioridad.Value := Prio
    else
      raise Exception.Create('Valor inválido para prioridad!');
  end;
end;

procedure TdmTarea.QuitarCategoria;
begin
  if qryTarea.IsEmpty then Exit;
  qryTarea.Edit;
  qryTareaidCategoria.Clear;
  qryTarea.Post;
  qryTarea.Refresh;
end;

procedure TdmTarea.QuitarResponsable;
begin
  if qryTarea.IsEmpty then Exit;
  qryTarea.Edit;
  qryTareaidResponsable.Clear;
  qryTarea.Post;
  qryTarea.Refresh;
end;

procedure TdmTarea.RefrescarCategorias;
begin
  if qryCategoria.Active then
    qryCategoria.Refresh
  else
    qryCategoria.Open;
end;

procedure TdmTarea.RefrescarResponsables;
begin
  if qryResponsable.Active then
    qryResponsable.Refresh
  else
    qryResponsable.Open;
end;

end.
