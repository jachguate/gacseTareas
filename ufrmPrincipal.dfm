object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  Caption = 'frmPrincipal'
  ClientHeight = 529
  ClientWidth = 702
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Button1: TButton
    Left = 24
    Top = 32
    Width = 75
    Height = 25
    Caption = 'Button1'
    TabOrder = 0
  end
  object Button2: TButton
    Left = 105
    Top = 32
    Width = 75
    Height = 25
    Caption = 'Button2'
    TabOrder = 1
  end
  object Button3: TButton
    Left = 186
    Top = 32
    Width = 75
    Height = 25
    Caption = 'Button3'
    TabOrder = 2
  end
  object Button4: TButton
    Left = 24
    Top = 97
    Width = 75
    Height = 32
    Caption = 'Button4'
    TabOrder = 3
  end
  object cgrTareas: TDBCtrlGrid
    Left = 312
    Top = 32
    Width = 337
    Height = 288
    AllowInsert = False
    DataSource = dsTarea
    PanelHeight = 96
    PanelWidth = 320
    PopupMenu = pmTarea
    TabOrder = 4
    OnClick = cgrTareasClick
    OnMouseDown = cgrTareasMouseDown
    OnPaintPanel = cgrTareasPaintPanel
    object Label1: TLabel
      Left = 16
      Top = 10
      Width = 28
      Height = 13
      Caption = 'Tarea'
    end
    object Label2: TLabel
      Left = 16
      Top = 38
      Width = 59
      Height = 13
      Caption = 'Fecha L'#237'mite'
    end
    object Label3: TLabel
      Left = 16
      Top = 64
      Width = 61
      Height = 13
      Caption = 'Responsable'
    end
    object DBText3: TDBText
      Left = 80
      Top = 62
      Width = 65
      Height = 17
      DataField = 'Iniciales'
      DataSource = dsTarea
    end
    object DBText2: TDBText
      Left = 81
      Top = 38
      Width = 65
      Height = 17
      DataField = 'FechaLimite'
      DataSource = dsTarea
    end
    object DBText1: TDBText
      Left = 81
      Top = 15
      Width = 65
      Height = 17
      DataField = 'DescTarea'
      DataSource = dsTarea
    end
    object Label4: TLabel
      Left = 176
      Top = 24
      Width = 42
      Height = 13
      Caption = 'Prioridad'
    end
    object DBText4: TDBText
      Left = 224
      Top = 24
      Width = 65
      Height = 17
      DataField = 'Prioridad'
      DataSource = dsTarea
    end
    object Label5: TLabel
      Left = 176
      Top = 48
      Width = 31
      Height = 13
      Caption = 'Label5'
    end
  end
  object Button5: TButton
    Left = 24
    Top = 135
    Width = 75
    Height = 25
    Caption = 'Button5'
    TabOrder = 5
    OnClick = Button5Click
  end
  object dsTarea: TDataSource
    DataSet = dmTarea.qryTarea
    Left = 184
    Top = 256
  end
  object pmTarea: TPopupMenu
    OnPopup = pmTareaPopup
    Left = 96
    Top = 328
    object Nuevatarea1: TMenuItem
      Action = actNuevaTarea
    end
    object erminada1: TMenuItem
      Action = actTareaTerminada
    end
    object Eliminar1: TMenuItem
      Action = actEliminarTarea
    end
    object Responsable1: TMenuItem
      Caption = 'Responsable'
      OnClick = Responsable1Click
      object Agregarresponsable1: TMenuItem
        Action = actAgregarResponsable
      end
      object Sinresponsable1: TMenuItem
        Action = actTareaSinResponsable
      end
      object miSeparadorResponsable: TMenuItem
        Caption = '-'
      end
    end
    object Categora1: TMenuItem
      Caption = 'Categor'#237'a'
      OnClick = Categora1Click
      object Agregarcategora1: TMenuItem
        Action = actAgregarCategoría
      end
      object Sincategora1: TMenuItem
        Action = actTareaSinCategoria
      end
      object miSeparadorCategoria: TMenuItem
        Caption = '-'
      end
    end
  end
  object alGeneral: TActionList
    Left = 120
    Top = 208
    object actNuevaTarea: TAction
      Category = 'Tarea'
      Caption = 'Nueva tarea'
      ShortCut = 16462
      OnExecute = actNuevaTareaExecute
    end
    object actTareaTerminada: TAction
      Category = 'Tarea'
      Caption = 'Terminada'
      OnExecute = actTareaTerminadaExecute
    end
    object actEliminarTarea: TAction
      Category = 'Tarea'
      Caption = 'Eliminar'
      OnExecute = actEliminarTareaExecute
    end
    object actTareaSinResponsable: TAction
      Category = 'Tarea'
      Caption = 'Sin responsable'
      OnExecute = actTareaSinResponsableExecute
    end
    object actTareaSinCategoria: TAction
      Category = 'Tarea'
      Caption = 'Sin categor'#237'a'
      OnExecute = actTareaSinCategoriaExecute
    end
    object actAgregarResponsable: TAction
      Category = 'Tarea'
      Caption = 'Agregar responsable'
      OnExecute = actAgregarResponsableExecute
    end
    object actAgregarCategoría: TAction
      Category = 'Tarea'
      Caption = 'Agregar categor'#237'a'
      OnExecute = actAgregarCategoríaExecute
    end
  end
  object ImageList1: TImageList
    Left = 176
    Top = 152
  end
end
