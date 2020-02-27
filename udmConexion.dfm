object dmConexion: TdmConexion
  OldCreateOrder = False
  Height = 150
  Width = 215
  object Conexion: TFDConnection
    ConnectionName = 'GestorTareasConexion'
    Params.Strings = (
      'ApplicationName=GestorTareas'
      'MARS=yes'
      'DriverID=MSSQL')
    ConnectedStoredUsage = []
    LoginPrompt = False
    Left = 72
    Top = 48
  end
end
