object frmResponsable: TfrmResponsable
  Left = 0
  Top = 0
  Caption = 'Responsable'
  ClientHeight = 105
  ClientWidth = 411
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
    411
    105)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 12
    Width = 83
    Height = 13
    Caption = 'Nombre completo'
    FocusControl = cxDBTextEdit1
  end
  object Label2: TLabel
    Left = 8
    Top = 38
    Width = 38
    Height = 13
    Caption = 'Iniciales'
    FocusControl = cxDBTextEdit2
  end
  object pnlAbajo: TPanel
    Left = 0
    Top = 64
    Width = 411
    Height = 41
    Align = alBottom
    TabOrder = 2
    DesignSize = (
      411
      41)
    object BitBtn1: TBitBtn
      Left = 197
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
      Left = 303
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
  object cxDBTextEdit1: TcxDBTextEdit
    Left = 97
    Top = 8
    Anchors = [akLeft, akTop, akRight]
    DataBinding.DataField = 'NombreCompleto'
    DataBinding.DataSource = dsResponsable
    TabOrder = 0
    Width = 306
  end
  object cxDBTextEdit2: TcxDBTextEdit
    Left = 97
    Top = 35
    DataBinding.DataField = 'Iniciales'
    DataBinding.DataSource = dsResponsable
    TabOrder = 1
    Width = 121
  end
  object dsResponsable: TDataSource
    DataSet = dmTarea.qryResponsable
    Left = 368
    Top = 16
  end
end
