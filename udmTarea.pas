unit udmTarea;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
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
    procedure qryTareaNewRecord(DataSet: TDataSet);
    procedure qryTareaError(ASender, AInitiator: TObject;
      var AException: Exception);
    procedure qryTareaEditError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure qryTareaPostError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
  private
  public
    procedure RefrescarResponsables;
    procedure RefrescarCategorias;
    procedure MarcarTareaComoCompletada;
    procedure EliminarTarea;

  end;

implementation

uses
  udmConexion;

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TdmTarea }

procedure TdmTarea.EliminarTarea;
begin
  if qryTarea.IsEmpty then
    Exit;
  qryTarea.Delete;
end;

procedure TdmTarea.MarcarTareaComoCompletada;
begin
  if qryTarea.IsEmpty then
    Exit;
  qryTarea.Edit;
  qryTareaFlagCompletada.Value := True;
  qryTarea.Post;
end;

procedure TdmTarea.qryTareaEditError(DataSet: TDataSet; E: EDatabaseError;
  var Action: TDataAction);
begin
  Action := daFail;
end;

procedure TdmTarea.qryTareaError(ASender, AInitiator: TObject;
  var AException: Exception);
begin
  AException.Message := '123' + AException.Message;
end;

procedure TdmTarea.qryTareaNewRecord(DataSet: TDataSet);
begin
  qryTareaPrioridad.Value := 5;
  qryTareaFlagCompletada.Value := False;
end;

procedure TdmTarea.qryTareaPostError(DataSet: TDataSet; E: EDatabaseError;
  var Action: TDataAction);
begin
  Action := daFail;
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
