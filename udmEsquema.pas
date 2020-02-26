unit udmEsquema;

interface

uses
  System.SysUtils, System.Classes, FireDAC.UI.Intf, FireDAC.Stan.Async,
  FireDAC.Comp.ScriptCommands, FireDAC.Stan.Util, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, FireDAC.Comp.Script;

type
  TdmEsquema = class(TDataModule)
    scriptActualizacion: TFDScript;
    qryValidaExisteEsquema: TFDQuery;
    qryValidaExisteEsquemacontador: TIntegerField;
    qryVersionEstructura: TFDQuery;
    qryVersionEstructuraVersionEstructura: TIntegerField;
    qryActualizaVersionEstructura: TFDQuery;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
    procedure scriptActualizacionError(ASender, AInitiator: TObject;
      var AException: Exception);
  private
    FScriptErrors: TStringList;
    procedure EjecutarScriptActualizacion(Version: Integer);
  public
    function ExisteEsquema: Boolean;
    procedure CrearEsquema;
    procedure ActualizarEsquema;
  end;

var
  dmEsquema: TdmEsquema;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses udmConexion, Winapi.Windows;

{$R *.dfm}

procedure TdmEsquema.ActualizarEsquema;
const
  NumScripts = 1;
  VersionEstructuraExe = 1;
  VersionesScripts: array[1..NumScripts] of Integer = (VersionEstructuraExe);
var
  VersionActualDB: Integer;
  I: Integer;
begin
  qryVersionEstructura.Open;
  try
    VersionActualDB := qryVersionEstructuraVersionEstructura.Value;
  finally
    qryVersionEstructura.Close;
  end;
  if VersionActualDB < VersionEstructuraExe then
  begin
    for I := 1 to NumScripts do
      if I > VersionActualDB then
      begin
        EjecutarScriptActualizacion(I);
      end;
  end;
end;

procedure TdmEsquema.CrearEsquema;
var
  RS: TResourceStream;
  scriptText: TStringList;
begin
  FScriptErrors.Clear;
  RS := TResourceStream.Create(hInstance, 'SQL000001', RT_RCDATA);
  try
    scriptText := TStringList.Create;
    try
      RS.Position := 0;
      scriptText.LoadFromStream(RS);
      dmConexion.Conexion.StartTransaction;
      try
        scriptActualizacion.ExecuteScript(scriptText);
        if FScriptErrors.Count > 0 then
          raise Exception.Create('Error(es) al crear esquema: '#13 + FScriptErrors.Text);
        dmConexion.Conexion.Commit;
      except
        dmConexion.Conexion.Rollback;
        raise;
      end;
    finally
      scriptText.Free;
    end;
  finally
    RS.Free;
  end;
end;

procedure TdmEsquema.DataModuleCreate(Sender: TObject);
begin
  FScriptErrors := TStringList.Create;
end;

procedure TdmEsquema.DataModuleDestroy(Sender: TObject);
begin
  FScriptErrors.Free;
end;

procedure TdmEsquema.EjecutarScriptActualizacion(Version: Integer);
var
  RS: TResourceStream;
  scriptText: TStringList;
  NombreScript: string;
begin
  try
    FScriptErrors.Clear;
    NombreScript := Format('SQL%6.6d', [Version]);
    RS := TResourceStream.Create(hInstance, NombreScript, RT_RCDATA);
    try
      scriptText := TStringList.Create;
      try
        RS.Position := 0;
        scriptText.LoadFromStream(RS);
        dmConexion.Conexion.StartTransaction;
        try
          scriptActualizacion.ExecuteScript(scriptText);
          if FScriptErrors.Count > 0 then
            raise Exception.Create(FScriptErrors.Text);
          qryActualizaVersionEstructura.ParamByName('NuevaVersion').AsInteger := Version;
          qryActualizaVersionEstructura.Execute();
          dmConexion.Conexion.Commit;
        except
          dmConexion.Conexion.Rollback;
          raise;
        end;
      finally
        scriptText.Free;
      end;
    finally
      RS.Free;
    end;
  except
    on E:Exception do
    begin
      E.Message := 'Error al actualizar estructura de DB a la versión '
        + IntToStr(Version) + #13
        + E.Message;
      raise;
    end;
  end;
end;

function TdmEsquema.ExisteEsquema: Boolean;
begin
  qryValidaExisteEsquema.Open;
  try
    Result := qryValidaExisteEsquemacontador.Value = 1;
  finally
    qryValidaExisteEsquema.Close;
  end;
end;

procedure TdmEsquema.scriptActualizacionError(ASender, AInitiator: TObject;
  var AException: Exception);
begin
  FScriptErrors.Add(AException.Message);
end;

end.
