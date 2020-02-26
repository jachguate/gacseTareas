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
    Top = 8
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
    ExplicitTop = 198
  end
  object lblResponsable: TLabel
    Left = 8
    Top = 174
    Width = 61
    Height = 13
    Anchors = [akLeft, akBottom]
    Caption = '&Responsable'
    ExplicitTop = 222
  end
  object lblCategoria: TLabel
    Left = 8
    Top = 201
    Width = 47
    Height = 13
    Anchors = [akLeft, akBottom]
    Caption = '&Categor'#237'a'
    FocusControl = lcbCategoria
    ExplicitTop = 249
  end
  object pnlAbajo: TPanel
    Left = 0
    Top = 228
    Width = 510
    Height = 41
    Align = alBottom
    TabOrder = 0
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
  object lcbCategoria: TDBLookupComboBox
    Left = 95
    Top = 201
    Width = 407
    Height = 21
    Anchors = [akLeft, akRight, akBottom]
    DataField = 'idCategoria'
    DataSource = dsTarea
    KeyField = 'idCategoria'
    ListField = 'Categoria'
    ListSource = dsCategoria
    TabOrder = 1
  end
  object lcbResponsable: TDBLookupComboBox
    Left = 95
    Top = 174
    Width = 407
    Height = 21
    Anchors = [akLeft, akRight, akBottom]
    DataField = 'idResponsable'
    DataSource = dsTarea
    KeyField = 'idResponsable'
    ListField = 'NombreCompleto'
    ListSource = dsResponsable
    TabOrder = 2
  end
  object DBMemo1: TDBMemo
    Left = 95
    Top = 10
    Width = 407
    Height = 133
    Anchors = [akLeft, akTop, akRight, akBottom]
    DataField = 'Tarea'
    DataSource = dsTarea
    TabOrder = 3
  end
  object edtFechaLimite: TDBEdit
    Left = 95
    Top = 147
    Width = 322
    Height = 21
    Anchors = [akLeft, akRight, akBottom]
    DataField = 'FechaLimite'
    DataSource = dsTarea
    TabOrder = 4
  end
  object DBCheckBox1: TDBCheckBox
    Left = 423
    Top = 149
    Width = 79
    Height = 17
    Anchors = [akRight, akBottom]
    Caption = 'Completada'
    DataField = 'FlagCompletada'
    DataSource = dsTarea
    TabOrder = 5
  end
  object dsTarea: TDataSource
    DataSet = dmTarea.qryTarea
    Left = 128
    Top = 72
  end
  object dsResponsable: TDataSource
    DataSet = dmTarea.qryResponsable
    Left = 176
    Top = 80
  end
  object dsCategoria: TDataSource
    DataSet = dmTarea.qryCategoria
    Left = 224
    Top = 80
  end
end
