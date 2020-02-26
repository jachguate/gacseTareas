object dmEsquema: TdmEsquema
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Height = 276
  Width = 208
  object scriptActualizacion: TFDScript
    SQLScripts = <>
    Connection = dmConexion.Conexion
    Params = <>
    Macros = <>
    OnError = scriptActualizacionError
    Left = 88
    Top = 184
  end
  object qryValidaExisteEsquema: TFDQuery
    ActiveStoredUsage = []
    Connection = dmConexion.Conexion
    SQL.Strings = (
      'select count(1) contador'
      '  from sys.tables'
      ' where name = '#39'Tarea'#39)
    Left = 88
    Top = 16
    object qryValidaExisteEsquemacontador: TIntegerField
      FieldName = 'contador'
      Origin = 'contador'
      ReadOnly = True
    end
  end
  object qryVersionEstructura: TFDQuery
    ActiveStoredUsage = []
    Connection = dmConexion.Conexion
    SQL.Strings = (
      'select VersionEstructura'
      '  from Control')
    Left = 88
    Top = 72
    object qryVersionEstructuraVersionEstructura: TIntegerField
      FieldName = 'VersionEstructura'
      Origin = 'VersionEstructura'
      Required = True
    end
  end
  object qryActualizaVersionEstructura: TFDQuery
    ActiveStoredUsage = []
    ConnectionName = 'GestorTareasConexion'
    SQL.Strings = (
      
        'update Control set VersionEstructura = :NuevaVersion where Versi' +
        'onEstructura < :NuevaVersion')
    Left = 88
    Top = 128
    ParamData = <
      item
        Name = 'NUEVAVERSION'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
  end
end
