object dmTarea: TdmTarea
  OldCreateOrder = False
  Height = 357
  Width = 282
  object qryResponsable: TFDQuery
    ActiveStoredUsage = []
    Connection = dmConexion.Conexion
    SQL.Strings = (
      'select idResponsable, NombreCompleto, Iniciales'
      '  from Responsable;')
    Left = 48
    Top = 32
    object qryResponsableidResponsable: TLargeintField
      AutoGenerateValue = arAutoInc
      FieldName = 'idResponsable'
      Origin = 'idResponsable'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object qryResponsableNombreCompleto: TStringField
      FieldName = 'NombreCompleto'
      Origin = 'NombreCompleto'
      Required = True
      Size = 200
    end
    object qryResponsableIniciales: TStringField
      FieldName = 'Iniciales'
      Origin = 'Iniciales'
      Required = True
    end
  end
  object qryCategoria: TFDQuery
    ActiveStoredUsage = []
    Connection = dmConexion.Conexion
    SQL.Strings = (
      'select idCategoria, Categoria, Color'
      '  from Categoria'
      ' order by Categoria')
    Left = 48
    Top = 104
    object qryCategoriaidCategoria: TLargeintField
      AutoGenerateValue = arAutoInc
      FieldName = 'idCategoria'
      Origin = 'idCategoria'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object qryCategoriaCategoria: TStringField
      FieldName = 'Categoria'
      Origin = 'Categoria'
      Required = True
      Size = 100
    end
    object qryCategoriaColor: TLargeintField
      FieldName = 'Color'
      Origin = 'Color'
      Required = True
    end
  end
  object qryTarea: TFDQuery
    ActiveStoredUsage = []
    OnEditError = qryTareaEditError
    OnNewRecord = qryTareaNewRecord
    OnPostError = qryTareaPostError
    Connection = dmConexion.Conexion
    UpdateOptions.AssignedValues = [uvRefreshMode]
    UpdateOptions.KeyFields = 'idTarea'
    OnError = qryTareaError
    SQL.Strings = (
      'select   t.*'
      
        '       , cast(substring(t.Tarea, 1, 255) as varchar(255)) DescTa' +
        'rea'
      '       , r.NombreCompleto'
      '       , r.Iniciales'
      '       , c.Categoria'
      '       , c.Color '
      '  from Tarea t'
      
        '       left join Responsable r on r.idResponsable = t.idResponsa' +
        'ble'
      '       left join Categoria c on c.idCategoria = t.idCategoria'
      
        ' where t.FlagCompletada = coalesce(:FlagCompletada, t.FlagComple' +
        'tada)')
    Left = 48
    Top = 176
    ParamData = <
      item
        Name = 'FLAGCOMPLETADA'
        DataType = ftBoolean
        ParamType = ptInput
        Value = Null
      end>
    object qryTareaidTarea: TLargeintField
      AutoGenerateValue = arAutoInc
      FieldName = 'idTarea'
      Origin = 'idTarea'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object qryTareaTarea: TMemoField
      FieldName = 'Tarea'
      Origin = 'Tarea'
      Required = True
      BlobType = ftMemo
      Size = 2147483647
    end
    object qryTareaPrioridad: TIntegerField
      FieldName = 'Prioridad'
      Origin = 'Prioridad'
    end
    object qryTareaFechaLimite: TSQLTimeStampField
      FieldName = 'FechaLimite'
      Origin = 'FechaLimite'
    end
    object qryTareaidResponsable: TLargeintField
      FieldName = 'idResponsable'
      Origin = 'idResponsable'
    end
    object qryTareaidCategoria: TLargeintField
      FieldName = 'idCategoria'
      Origin = 'idCategoria'
    end
    object qryTareaFlagCompletada: TBooleanField
      FieldName = 'FlagCompletada'
      Origin = 'FlagCompletada'
      Required = True
    end
    object qryTareabtLogin: TStringField
      FieldName = 'btLogin'
      Origin = 'btLogin'
      Size = 50
    end
    object qryTareabtFecha: TSQLTimeStampField
      FieldName = 'btFecha'
      Origin = 'btFecha'
    end
    object qryTareabtHost: TStringField
      FieldName = 'btHost'
      Origin = 'btHost'
      Size = 50
    end
    object qryTareaDescTarea: TStringField
      FieldName = 'DescTarea'
      Origin = 'DescTarea'
      ReadOnly = True
      Size = 255
    end
    object qryTareaNombreCompleto: TStringField
      FieldName = 'NombreCompleto'
      Origin = 'NombreCompleto'
      Size = 200
    end
    object qryTareaIniciales: TStringField
      FieldName = 'Iniciales'
      Origin = 'Iniciales'
    end
    object qryTareaCategoria: TStringField
      FieldName = 'Categoria'
      Origin = 'Categoria'
      Size = 100
    end
    object qryTareaColor: TLargeintField
      FieldName = 'Color'
      Origin = 'Color'
    end
  end
end
