object frmCategoria: TfrmCategoria
  Left = 0
  Top = 0
  Caption = 'Categor'#237'a'
  ClientHeight = 137
  ClientWidth = 315
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
    315
    137)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 11
    Width = 47
    Height = 13
    Caption = 'Categor'#237'a'
    FocusControl = cxDBTextEdit1
  end
  object Label2: TLabel
    Left = 8
    Top = 36
    Width = 25
    Height = 13
    Caption = 'Color'
  end
  object pnlAbajo: TPanel
    Left = 0
    Top = 96
    Width = 315
    Height = 41
    Align = alBottom
    TabOrder = 2
    DesignSize = (
      315
      41)
    object BitBtn1: TBitBtn
      Left = 101
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
      Left = 207
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
    Left = 61
    Top = 8
    Anchors = [akLeft, akTop, akRight]
    DataBinding.DataField = 'Categoria'
    DataBinding.DataSource = dsCategoria
    TabOrder = 0
    Width = 246
  end
  object pnlColor: TPanel
    Left = 61
    Top = 35
    Width = 246
    Height = 55
    Anchors = [akLeft, akTop, akRight, akBottom]
    Caption = 'Cambiar color'
    ParentBackground = False
    TabOrder = 1
    OnClick = pnlColorClick
  end
  object dsCategoria: TDataSource
    DataSet = dmTarea.qryCategoria
    Top = 88
  end
  object ColorDialog: TColorDialog
    Left = 21
    Top = 139
  end
end
