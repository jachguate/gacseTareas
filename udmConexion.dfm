object dmConexion: TdmConexion
  OldCreateOrder = False
  Height = 150
  Width = 215
  object Conexion: TFDConnection
    ConnectionName = 'GestorTareasConexion'
    Params.Strings = (
      'Database=Tareas'
      'SERVER=JUANLP\SQL17'
      'OSAuthent=Yes'
      'ApplicationName=GestorTareas'
      'MARS=yes'
      'User_Name=sa'
      'Password=estenoes'
      'Workstation=JUANLP'
      'DriverID=MSSQL')
    ConnectedStoredUsage = []
    LoginPrompt = False
    Left = 72
    Top = 48
  end
end
