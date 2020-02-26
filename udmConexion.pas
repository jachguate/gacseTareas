unit udmConexion;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.MSSQL,
  FireDAC.Phys.MSSQLDef, FireDAC.VCLUI.Wait, Data.DB, FireDAC.Comp.Client;

type
  TdmConexion = class(TDataModule)
    Conexion: TFDConnection;
  private
    const
      RegistryKeyBase = '\SOFTWARE\jachguate\gestortareas';
      RegValParamsConexion = 'DatosConexion';
  public
    function EstaConfigurado: Boolean;
    procedure LeerConfig;
    procedure GuardarConfig;
  end;

var
  dmConexion: TdmConexion;

implementation

uses
  System.Win.Registry, Winapi.Windows;

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TdmConexion }

function TdmConexion.EstaConfigurado: Boolean;
var
  Reg: TRegistry;
begin
  Reg := TRegistry.Create;
  try
    Reg.RootKey := HKEY_CURRENT_USER;
    Result := Reg.OpenKey(RegistryKeyBase, False)
          and Reg.ValueExists(RegValParamsConexion)
  finally
    Reg.Free;
  end;
end;

procedure TdmConexion.GuardarConfig;
var
  Reg: TRegistry;
  MS: TMemoryStream;
begin
  Reg := TRegistry.Create;
  try
    Reg.RootKey := HKEY_CURRENT_USER;
    if Reg.OpenKey(RegistryKeyBase, True) then
    begin
      MS := TMemoryStream.Create;
      try
        Conexion.Params.SaveToStream(MS);
        MS.Position := 0;
        Reg.WriteBinaryData(RegValParamsConexion, MS.Memory^, MS.Size);
      finally
        MS.Free;
      end;
    end
    else
      raise Exception.Create('Error al guardar la configuración');
  finally
    Reg.Free;
  end;
end;

procedure TdmConexion.LeerConfig;
var
  Reg: TRegistry;
  MS: TMemoryStream;
begin
  Reg := TRegistry.Create;
  try
    Reg.RootKey := HKEY_CURRENT_USER;
    if Reg.OpenKey(RegistryKeyBase, False) then
    begin
      if Reg.ValueExists(RegValParamsConexion) then
      begin
        MS := TMemoryStream.Create;
        try
          MS.Size := Reg.GetDataSize(RegValParamsConexion);
          MS.Position := 0;
          if Reg.ReadBinaryData(RegValParamsConexion, MS.Memory^, MS.Size) = MS.Size then
          begin
            MS.Position := 0;
            Conexion.Params.LoadFromStream(MS);
          end
          else
            raise Exception.Create('Error al leer datos de conexión (datos corruptos)');
        finally
          MS.Free;
        end;
      end
      else
        raise Exception.Create('Error al leer datos de conexión');
    end
    else
      raise Exception.Create('Error al leer la configuración');
  finally
    Reg.Free;
  end;
end;

end.
