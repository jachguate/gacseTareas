object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  BorderStyle = bsSizeToolWin
  Caption = 'Gestor de tareas'
  ClientHeight = 471
  ClientWidth = 356
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu
  OldCreateOrder = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnResize = FormResize
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object cgrTareas: TDBCtrlGrid
    Left = 0
    Top = 0
    Width = 356
    Height = 471
    Align = alClient
    AllowInsert = False
    DataSource = dsTarea
    PanelHeight = 78
    PanelWidth = 339
    PopupMenu = pmTarea
    TabOrder = 0
    RowCount = 6
    OnDblClick = cgrTareasDblClick
    OnMouseDown = cgrTareasMouseDown
    OnPaintPanel = cgrTareasPaintPanel
    ExplicitTop = 41
    ExplicitHeight = 858
    object Label1: TLabel
      Left = 8
      Top = 5
      Width = 28
      Height = 13
      Caption = 'Tarea'
      OnDblClick = cgrTareasDblClick
    end
    object Label2: TLabel
      Left = 8
      Top = 43
      Width = 27
      Height = 13
      Caption = 'L'#237'mite'
      OnDblClick = cgrTareasDblClick
    end
    object Label3: TLabel
      Left = 8
      Top = 24
      Width = 61
      Height = 13
      Caption = 'Responsable'
      OnDblClick = cgrTareasDblClick
    end
    object txtResponsable: TDBText
      Left = 75
      Top = 24
      Width = 86
      Height = 17
      Color = clInfoBk
      DataField = 'Iniciales'
      DataSource = dsTarea
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clInfoText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      Transparent = False
      OnDblClick = cgrTareasDblClick
    end
    object txtFecha: TDBText
      Left = 75
      Top = 43
      Width = 86
      Height = 17
      Color = clInfoBk
      DataField = 'FechaLimite'
      DataSource = dsTarea
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clInfoText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      Transparent = False
      OnDblClick = cgrTareasDblClick
    end
    object txtTarea: TDBText
      Left = 75
      Top = 5
      Width = 257
      Height = 17
      Anchors = [akLeft, akTop, akRight]
      Color = clInfoBk
      DataField = 'DescTarea'
      DataSource = dsTarea
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clInfoText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      Transparent = False
      OnDblClick = cgrTareasDblClick
      ExplicitWidth = 238
    end
    object Label4: TLabel
      Left = 167
      Top = 24
      Width = 42
      Height = 13
      Caption = 'Prioridad'
      OnDblClick = cgrTareasDblClick
    end
    object txtPrioridad: TDBText
      Left = 219
      Top = 24
      Width = 94
      Height = 17
      Color = clInfoBk
      DataField = 'Prioridad'
      DataSource = dsTarea
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clInfoText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      Transparent = False
      OnDblClick = cgrTareasDblClick
    end
    object Label5: TLabel
      Left = 167
      Top = 43
      Width = 47
      Height = 13
      Caption = 'Categor'#237'a'
      OnDblClick = cgrTareasDblClick
    end
    object txtCategoria: TDBText
      Left = 220
      Top = 43
      Width = 94
      Height = 17
      Color = clInfoBk
      DataField = 'Categoria'
      DataSource = dsTarea
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clInfoText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      Transparent = False
      OnDblClick = cgrTareasDblClick
    end
  end
  object dsTarea: TDataSource
    DataSet = dmTarea.qryTarea
    OnStateChange = dsTareaStateChange
    OnDataChange = dsTareaDataChange
    Left = 8
    Top = 248
  end
  object pmTarea: TPopupMenu
    Left = 64
    Top = 192
    object Nuevatarea1: TMenuItem
      Action = actNuevaTarea
    end
    object Editartarea1: TMenuItem
      Action = actEditarTarea
    end
    object erminada1: TMenuItem
      Action = actRotarCompletada
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
    object Categoria1: TMenuItem
      Caption = 'Categor'#237'a'
      OnClick = Categoria1Click
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
    object Prioridad1: TMenuItem
      Caption = 'Prioridad'
      OnClick = Prioridad1Click
      object N1SuperUrgente1: TMenuItem
        Action = actPrio1
      end
      object N2Urgente1: TMenuItem
        Action = actPrio2
      end
      object N3MuyAlta1: TMenuItem
        Action = actPrio3
      end
      object N4Alta1: TMenuItem
        Action = actPrio4
      end
      object N5Importante1: TMenuItem
        Action = actPrio5
      end
      object N6Normal1: TMenuItem
        Action = actPrio6
      end
      object N7Baja1: TMenuItem
        Action = actPrio7
      end
      object N8Muybaja1: TMenuItem
        Action = actPrio8
      end
      object N9Sinimportancia1: TMenuItem
        Action = actPrio9
      end
      object N10Solosihaytiempo1: TMenuItem
        Action = actPrio10
      end
    end
  end
  object alGeneral: TActionList
    Left = 8
    Top = 192
    object actVerPendientes: TAction
      Category = 'FiltroStatus'
      Caption = '&Pendientes'
      Checked = True
      GroupIndex = 2
      OnExecute = actFiltroStatusExecute
    end
    object actNuevaTarea: TAction
      Category = 'Tarea'
      Caption = 'Nueva tarea'
      ShortCut = 16462
      OnExecute = actNuevaTareaExecute
    end
    object actEditarTarea: TAction
      Category = 'Tarea'
      Caption = 'Editar tarea'
      ShortCut = 16453
      OnExecute = actEditarTareaExecute
    end
    object actRotarCompletada: TAction
      Category = 'Tarea'
      Caption = 'Completada'
      OnExecute = actRotarCompletadaExecute
    end
    object actEliminarTarea: TAction
      Category = 'Tarea'
      Caption = 'Eliminar'
      OnExecute = actEliminarTareaExecute
    end
    object actTareaSinResponsable: TAction
      Category = 'Tarea'
      Caption = 'Quitar responsable'
      OnExecute = actTareaSinResponsableExecute
    end
    object actTareaSinCategoria: TAction
      Category = 'Tarea'
      Caption = 'Quitar categor'#237'a'
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
    object actPrio1: TAction
      Tag = 1
      Category = 'Prioridad'
      Caption = '1 - Super Urgente'
      GroupIndex = 1
      ShortCut = 49201
      OnExecute = actPrioExecute
    end
    object actPrio2: TAction
      Tag = 2
      Category = 'Prioridad'
      Caption = '2 - Urgente'
      GroupIndex = 1
      ShortCut = 49202
      OnExecute = actPrioExecute
    end
    object actPrio3: TAction
      Tag = 3
      Category = 'Prioridad'
      Caption = '3 - Muy Alta'
      GroupIndex = 1
      ShortCut = 49203
      OnExecute = actPrioExecute
    end
    object actPrio4: TAction
      Tag = 4
      Category = 'Prioridad'
      Caption = '4 - Alta'
      GroupIndex = 1
      ShortCut = 49204
      OnExecute = actPrioExecute
    end
    object actPrio5: TAction
      Tag = 5
      Category = 'Prioridad'
      Caption = '5 - Importante'
      GroupIndex = 1
      ShortCut = 49205
      OnExecute = actPrioExecute
    end
    object actPrio6: TAction
      Tag = 6
      Category = 'Prioridad'
      Caption = '6 - Normal'
      GroupIndex = 1
      ShortCut = 49206
      OnExecute = actPrioExecute
    end
    object actPrio7: TAction
      Tag = 7
      Category = 'Prioridad'
      Caption = '7 - Baja'
      GroupIndex = 1
      ShortCut = 49207
      OnExecute = actPrioExecute
    end
    object actPrio8: TAction
      Tag = 8
      Category = 'Prioridad'
      Caption = '8 - Muy baja'
      GroupIndex = 1
      ShortCut = 49208
      OnExecute = actPrioExecute
    end
    object actPrio9: TAction
      Tag = 9
      Category = 'Prioridad'
      Caption = '9 - Sin importancia'
      GroupIndex = 1
      ShortCut = 49209
      OnExecute = actPrioExecute
    end
    object actPrio10: TAction
      Tag = 10
      Category = 'Prioridad'
      Caption = '10 - Solo si hay tiempo'
      GroupIndex = 1
      ShortCut = 49192
      OnExecute = actPrioExecute
    end
    object alCfgConexion: TAction
      Category = 'Configuraci'#243'n'
      Caption = 'Conexi'#243'n'
      OnExecute = alCfgConexionExecute
    end
    object actVerTodas: TAction
      Tag = 1
      Category = 'FiltroStatus'
      Caption = '&Todas'
      GroupIndex = 2
      OnExecute = actFiltroStatusExecute
    end
    object actVerVencidas: TAction
      Tag = 2
      Category = 'FiltroStatus'
      Caption = '&Vencidas'
      GroupIndex = 2
      OnExecute = actFiltroStatusExecute
    end
    object actVerCompletadas: TAction
      Tag = 3
      Category = 'FiltroStatus'
      Caption = 'T&erminadas'
      GroupIndex = 2
      OnExecute = actFiltroStatusExecute
    end
    object actOrdenVPR: TAction
      Category = 'Orden'
      Caption = 'Vencimiento, prioridad, responsable'
      Checked = True
      GroupIndex = 3
      OnExecute = actOrdenExecute
    end
    object actOrdenVRP: TAction
      Tag = 1
      Category = 'Orden'
      Caption = 'Vencimiento, responsable, prioridad'
      GroupIndex = 3
      OnExecute = actOrdenExecute
    end
    object actOrdenRPV: TAction
      Tag = 2
      Category = 'Orden'
      Caption = 'Responsable, prioridad, vencimiento'
      GroupIndex = 3
      OnExecute = actOrdenExecute
    end
    object actOrdenRVP: TAction
      Tag = 3
      Category = 'Orden'
      Caption = 'Responsable, vencimiento, prioridad'
      GroupIndex = 3
      OnExecute = actOrdenExecute
    end
    object actORdenPRV: TAction
      Tag = 4
      Category = 'Orden'
      Caption = 'Prioridad, responsable, vencimiento '
      GroupIndex = 3
      OnExecute = actOrdenExecute
    end
    object actORdenPVR: TAction
      Tag = 5
      Category = 'Orden'
      Caption = 'Prioridad, vencimiento, responsable'
      GroupIndex = 3
      OnExecute = actOrdenExecute
    end
  end
  object ImageList1: TImageList
    Left = 64
    Top = 248
  end
  object MainMenu: TMainMenu
    Left = 120
    Top = 192
    object area1: TMenuItem
      Caption = '&Tarea'
      object Nuevatarea2: TMenuItem
        Action = actNuevaTarea
      end
      object Editartarea2: TMenuItem
        Action = actEditarTarea
      end
      object Completada1: TMenuItem
        Action = actRotarCompletada
      end
      object Eliminar2: TMenuItem
        Action = actEliminarTarea
      end
      object Responsable2: TMenuItem
        Caption = 'Responsable'
        OnClick = Responsable1Click
        object Agregarresponsable2: TMenuItem
          Action = actAgregarResponsable
        end
        object Quitarresponsable1: TMenuItem
          Action = actTareaSinResponsable
        end
        object N1: TMenuItem
          Caption = '-'
        end
      end
      object Categoria2: TMenuItem
        Caption = 'Categor'#237'a'
        OnClick = Categoria1Click
        object Agregarcategora2: TMenuItem
          Action = actAgregarCategoría
        end
        object Quitarcategora1: TMenuItem
          Action = actTareaSinCategoria
        end
        object N2: TMenuItem
          Caption = '-'
        end
      end
      object Prioridad2: TMenuItem
        Caption = 'Prioridad'
        OnClick = Prioridad1Click
        object N1SuperUrgente2: TMenuItem
          Action = actPrio1
        end
        object N2Urgente2: TMenuItem
          Action = actPrio2
        end
        object N3MuyAlta2: TMenuItem
          Action = actPrio3
        end
        object N4Alta2: TMenuItem
          Action = actPrio4
        end
        object N5Importante2: TMenuItem
          Action = actPrio5
        end
        object N6Normal2: TMenuItem
          Action = actPrio6
        end
        object N7Baja2: TMenuItem
          Action = actPrio7
        end
        object N8Muybaja2: TMenuItem
          Action = actPrio8
        end
        object N9Sinimportancia2: TMenuItem
          Action = actPrio9
        end
        object N10Solosihaytiempo2: TMenuItem
          Action = actPrio10
        end
      end
    end
    object Vista1: TMenuItem
      Caption = '&Vista'
      object Orden1: TMenuItem
        Caption = '&Orden'
        object Prioridadresponsablevencimiento1: TMenuItem
          Action = actORdenPRV
        end
        object Prioridadvencimientoresponsable1: TMenuItem
          Action = actORdenPVR
        end
        object Responsableprioridadvencimiento1: TMenuItem
          Action = actOrdenRPV
        end
        object Responsablevencimientoprioridad1: TMenuItem
          Action = actOrdenRVP
        end
        object Vencimientoprioridadresponsable1: TMenuItem
          Action = actOrdenVPR
        end
        object Vencimientoresponsableprioridad1: TMenuItem
          Action = actOrdenVRP
        end
      end
      object FiltroporStatus1: TMenuItem
        Caption = 'Filtro por &Status'
        object actVerPendientes1: TMenuItem
          Action = actVerPendientes
        end
        object odas1: TMenuItem
          Action = actVerTodas
        end
        object actVerVencidas1: TMenuItem
          Action = actVerVencidas
        end
        object actVerCompletadas1: TMenuItem
          Action = actVerCompletadas
        end
      end
    end
    object Configuracin1: TMenuItem
      Caption = '&Configuraci'#243'n'
      object Conexin1: TMenuItem
        Action = alCfgConexion
      end
    end
  end
end
