object frmTarea: TfrmTarea
  Left = 0
  Top = 0
  Caption = 'Tarea'
  ClientHeight = 269
  ClientWidth = 510
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCloseQuery = FormCloseQuery
  DesignSize = (
    510
    269)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 13
    Width = 28
    Height = 13
    Caption = 'Tarea'
  end
  object lblFechaLimite: TLabel
    Left = 8
    Top = 150
    Width = 56
    Height = 13
    Anchors = [akLeft, akBottom]
    Caption = '&Fecha l'#237'mite'
    FocusControl = edtFechaLimite
  end
  object lblResponsable: TLabel
    Left = 8
    Top = 177
    Width = 61
    Height = 13
    Anchors = [akLeft, akBottom]
    Caption = '&Responsable'
  end
  object lblCategoria: TLabel
    Left = 8
    Top = 204
    Width = 47
    Height = 13
    Anchors = [akLeft, akBottom]
    Caption = '&Categor'#237'a'
    FocusControl = lcbCategoria
  end
  object lblPrioridad: TLabel
    Left = 351
    Top = 179
    Width = 42
    Height = 13
    Anchors = [akRight, akBottom]
    Caption = 'Prioridad'
  end
  object lcbCategoria: TDBLookupComboBox
    Left = 71
    Top = 201
    Width = 236
    Height = 21
    Anchors = [akLeft, akRight, akBottom]
    DataField = 'idCategoria'
    DataSource = dsTarea
    KeyField = 'idCategoria'
    ListField = 'Categoria'
    ListSource = dsCategoria
    TabOrder = 6
  end
  object lcbResponsable: TDBLookupComboBox
    Left = 71
    Top = 174
    Width = 236
    Height = 21
    Anchors = [akLeft, akRight, akBottom]
    DataField = 'idResponsable'
    DataSource = dsTarea
    KeyField = 'idResponsable'
    ListField = 'NombreCompleto'
    ListSource = dsResponsable
    TabOrder = 3
  end
  object DBMemo1: TDBMemo
    Left = 71
    Top = 10
    Width = 407
    Height = 131
    Anchors = [akLeft, akTop, akRight, akBottom]
    DataField = 'Tarea'
    DataSource = dsTarea
    TabOrder = 0
  end
  object edtFechaLimite: TDBEdit
    Left = 71
    Top = 147
    Width = 266
    Height = 21
    Anchors = [akLeft, akRight, akBottom]
    DataField = 'FechaLimite'
    DataSource = dsTarea
    TabOrder = 1
  end
  object DBCheckBox1: TDBCheckBox
    Left = 351
    Top = 149
    Width = 79
    Height = 17
    Anchors = [akRight, akBottom]
    Caption = 'Completada'
    DataField = 'FlagCompletada'
    DataSource = dsTarea
    TabOrder = 2
  end
  object cbPrioridad: TDBLookupComboBox
    Left = 399
    Top = 174
    Width = 103
    Height = 21
    Anchors = [akRight, akBottom]
    DataField = 'Prioridad'
    DataSource = dsTarea
    KeyField = 'Prioridad'
    ListField = 'NombrePrioridad'
    ListSource = dsPrioridad
    TabOrder = 5
  end
  object pnlColorCategoria: TPanel
    Left = 351
    Top = 201
    Width = 151
    Height = 22
    HelpType = htKeyword
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 8
  end
  object btnAgregarResponsable: TButton
    Left = 310
    Top = 174
    Width = 27
    Height = 21
    Anchors = [akRight, akBottom]
    Caption = '+'
    TabOrder = 4
    TabStop = False
    OnClick = btnAgregarResponsableClick
  end
  object btnAgregarCategoría: TButton
    Left = 310
    Top = 201
    Width = 27
    Height = 21
    Anchors = [akRight, akBottom]
    Caption = '+'
    TabOrder = 7
    TabStop = False
    OnClick = btnAgregarCategoríaClick
  end
  object pnlAbajo: TPanel
    Left = 0
    Top = 228
    Width = 510
    Height = 41
    Align = alBottom
    TabOrder = 9
    DesignSize = (
      510
      41)
    object BitBtn1: TBitBtn
      Left = 296
      Top = 8
      Width = 100
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'Aceptar'
      Kind = bkOK
      NumGlyphs = 2
      TabOrder = 0
    end
    object BitBtn2: TBitBtn
      Left = 402
      Top = 8
      Width = 100
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'Cancelar'
      Kind = bkCancel
      NumGlyphs = 2
      TabOrder = 1
    end
  end
  object dsTarea: TDataSource
    DataSet = dmTarea.qryTarea
    OnDataChange = dsTareaDataChange
    Left = 128
    Top = 72
  end
  object dsResponsable: TDataSource
    DataSet = dmTarea.qryResponsable
    Left = 200
    Top = 72
  end
  object dsCategoria: TDataSource
    DataSet = dmTarea.qryCategoria
    Left = 273
    Top = 72
  end
  object dsPrioridad: TDataSource
    DataSet = dmTarea.mtPrioridades
    Left = 346
    Top = 72
  end
end
