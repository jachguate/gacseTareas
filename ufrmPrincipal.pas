unit ufrmPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, udmTarea, Vcl.DBCGrids,
  Data.DB, Vcl.ExtCtrls, Vcl.DBCtrls, Vcl.Menus, System.Actions, Vcl.ActnList,
  System.ImageList, Vcl.ImgList, System.Generics.Collections;

const
  WM_INIT_CONECTAR = WM_USER + 1;

type
  TfrmPrincipal = class(TForm)
    cgrTareas: TDBCtrlGrid;
    dsTarea: TDataSource;
    pmTarea: TPopupMenu;
    alGeneral: TActionList;
    ImageList1: TImageList;
    actNuevaTarea: TAction;
    actRotarCompletada: TAction;
    actEliminarTarea: TAction;
    Nuevatarea1: TMenuItem;
    erminada1: TMenuItem;
    Eliminar1: TMenuItem;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    txtResponsable: TDBText;
    txtFecha: TDBText;
    txtTarea: TDBText;
    Label4: TLabel;
    txtPrioridad: TDBText;
    Label5: TLabel;
    Responsable1: TMenuItem;
    Categoria1: TMenuItem;
    actTareaSinResponsable: TAction;
    actTareaSinCategoria: TAction;
    actAgregarResponsable: TAction;
    actAgregarCategoría: TAction;
    Agregarresponsable1: TMenuItem;
    Sinresponsable1: TMenuItem;
    miSeparadorResponsable: TMenuItem;
    Agregarcategora1: TMenuItem;
    Sincategora1: TMenuItem;
    miSeparadorCategoria: TMenuItem;
    txtCategoria: TDBText;
    MainMenu: TMainMenu;
    area1: TMenuItem;
    Configuracin1: TMenuItem;
    Nuevatarea2: TMenuItem;
    actEditarTarea: TAction;
    Editartarea1: TMenuItem;
    actPrio1: TAction;
    actPrio2: TAction;
    actPrio3: TAction;
    actPrio4: TAction;
    actPrio5: TAction;
    actPrio6: TAction;
    actPrio7: TAction;
    actPrio8: TAction;
    actPrio9: TAction;
    actPrio10: TAction;
    Prioridad1: TMenuItem;
    N1SuperUrgente1: TMenuItem;
    N2Urgente1: TMenuItem;
    N3MuyAlta1: TMenuItem;
    N4Alta1: TMenuItem;
    N5Importante1: TMenuItem;
    N6Normal1: TMenuItem;
    N7Baja1: TMenuItem;
    N8Muybaja1: TMenuItem;
    N9Sinimportancia1: TMenuItem;
    N10Solosihaytiempo1: TMenuItem;
    Editartarea2: TMenuItem;
    Completada1: TMenuItem;
    Eliminar2: TMenuItem;
    Responsable2: TMenuItem;
    Categoria2: TMenuItem;
    Prioridad2: TMenuItem;
    N1SuperUrgente2: TMenuItem;
    N2Urgente2: TMenuItem;
    N3MuyAlta2: TMenuItem;
    N4Alta2: TMenuItem;
    N5Importante2: TMenuItem;
    N6Normal2: TMenuItem;
    N7Baja2: TMenuItem;
    N8Muybaja2: TMenuItem;
    N9Sinimportancia2: TMenuItem;
    N10Solosihaytiempo2: TMenuItem;
    Quitarresponsable1: TMenuItem;
    Agregarresponsable2: TMenuItem;
    N1: TMenuItem;
    Agregarcategora2: TMenuItem;
    Quitarcategora1: TMenuItem;
    N2: TMenuItem;
    alCfgConexion: TAction;
    Conexin1: TMenuItem;
    actVerTodas: TAction;
    actVerPendientes: TAction;
    actVerCompletadas: TAction;
    actVerVencidas: TAction;
    actOrdenVPR: TAction;
    actOrdenRPV: TAction;
    actOrdenRVP: TAction;
    actOrdenVRP: TAction;
    actORdenPRV: TAction;
    actORdenPVR: TAction;
    Vista1: TMenuItem;
    Orden1: TMenuItem;
    FiltroporStatus1: TMenuItem;
    Prioridadresponsablevencimiento1: TMenuItem;
    Prioridadvencimientoresponsable1: TMenuItem;
    Responsableprioridadvencimiento1: TMenuItem;
    Responsablevencimientoprioridad1: TMenuItem;
    Vencimientoprioridadresponsable1: TMenuItem;
    Vencimientoresponsableprioridad1: TMenuItem;
    actVerPendientes1: TMenuItem;
    odas1: TMenuItem;
    actVerVencidas1: TMenuItem;
    actVerCompletadas1: TMenuItem;
    procedure FormShow(Sender: TObject);
    procedure cgrTareasMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure cgrTareasPaintPanel(DBCtrlGrid: TDBCtrlGrid; Index: Integer);
    procedure actNuevaTareaExecute(Sender: TObject);
    procedure actRotarCompletadaExecute(Sender: TObject);
    procedure actEliminarTareaExecute(Sender: TObject);
    procedure actTareaSinResponsableExecute(Sender: TObject);
    procedure actTareaSinCategoriaExecute(Sender: TObject);
    procedure actAgregarResponsableExecute(Sender: TObject);
    procedure actAgregarCategoríaExecute(Sender: TObject);
    procedure Responsable1Click(Sender: TObject);
    procedure Categoria1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure cgrTareasDblClick(Sender: TObject);
    procedure actEditarTareaExecute(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure actPrioExecute(Sender: TObject);
    procedure dsTareaDataChange(Sender: TObject; Field: TField);
    procedure dsTareaStateChange(Sender: TObject);
    procedure Prioridad1Click(Sender: TObject);
    procedure alCfgConexionExecute(Sender: TObject);
    procedure actFiltroStatusExecute(Sender: TObject);
    procedure actOrdenExecute(Sender: TObject);
  private
    const
      IdealRecordHeight = 70;
    var
      FDM: tdmTarea;
      FOpcionesMenuResponsables: TList<TMenuItem>;
      FOpcionesMenuCategorias: TList<TMenuItem>;
      FFiltroStatus: TFiltroStatus;
      FOrdenTareas: TOrdenTareas;
    procedure wmInitConectar(var AMessage: TMessage); message WM_INIT_CONECTAR;
    procedure AsignarResponsableClick(Sender: TObject);
    procedure AsignarCategoriaClick(Sender: TObject);
    procedure ConfigurarBaseDeDatos;
    procedure ActualizarEsquema;
    procedure ConectarBaseDatos;
    procedure AgregarTareaNueva;
    procedure EditarTarea;
    procedure AgregarResponsable;
    procedure AgregarCategoria;
    procedure ActualizarMenuResponsables(ParentItem: TMenuItem);
    procedure ActualizarMenuCategorias(ParentItem: TMenuItem);
    procedure ActualizarEstadoAcciones;
    procedure MarcarPrioridadSeleccionada;
    procedure PosicionarEnPantalla;
    procedure EstablecerConexionInicial;
  public
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation
uses
  FireDAC.Phys.Intf, FireDAC.Comp.Client, FireDAC.Phys.MSSQL, FireDAC.VCLUI.ConnEdit, udmConexion,
  udmEsquema, ufrmTarea, System.UITypes, ufrmResponsable, ufrmCategoria;

{$R *.dfm}

procedure TfrmPrincipal.actAgregarCategoríaExecute(Sender: TObject);
begin
  AgregarCategoria;
end;

procedure TfrmPrincipal.actAgregarResponsableExecute(Sender: TObject);
begin
  AgregarResponsable;
end;

procedure TfrmPrincipal.actEditarTareaExecute(Sender: TObject);
begin
  EditarTarea;
end;

procedure TfrmPrincipal.actEliminarTareaExecute(Sender: TObject);
begin
  if MessageDlg('¿Está seguro que desea eliminar la tarea?', mtConfirmation, [mbYes, mbNo], 0, mbNo) <> mrYes then
    Exit;
  FDM.EliminarTarea;
end;

procedure TfrmPrincipal.actFiltroStatusExecute(Sender: TObject);
var
  Act: TAction;
begin
  Act := (Sender as TAction);
  Act.Checked := True;
  FFiltroStatus := TFiltroStatus(Act.Tag);
  if Assigned(FDM) then
    FDM.SetFiltroStatus(FFiltroStatus);
end;

procedure TfrmPrincipal.actNuevaTareaExecute(Sender: TObject);
begin
  AgregarTareaNueva;
end;

procedure TfrmPrincipal.actOrdenExecute(Sender: TObject);
var
  Act: TAction;
begin
  Act := (Sender as TAction);
  Act.Checked := True;
  FOrdenTareas := TOrdenTareas(Act.Tag);
  if Assigned(FDM) then
    FDM.SetOrdenTareas(FOrdenTareas);
end;

procedure TfrmPrincipal.actPrioExecute(Sender: TObject);
var
  Prio: Integer;
begin
  Prio := (Sender as TComponent).Tag;
  FDM.AsignarPrioridad(Prio);
end;

procedure TfrmPrincipal.actTareaSinCategoriaExecute(Sender: TObject);
begin
  FDM.QuitarCategoria;
end;

procedure TfrmPrincipal.actTareaSinResponsableExecute(Sender: TObject);
begin
  FDM.QuitarResponsable;
end;

procedure TfrmPrincipal.actRotarCompletadaExecute(Sender: TObject);
begin
  FDM.RotarCompletada;
end;

procedure TfrmPrincipal.ActualizarEsquema;
var
  DME: TdmEsquema;
begin
  DME := TdmEsquema.Create(nil);
  try
    if not DME.ExisteEsquema then
      DME.CrearEsquema;
    DME.ActualizarEsquema;
  finally
    DME.Free;
  end;
end;

procedure TfrmPrincipal.ActualizarEstadoAcciones;
begin
  actRotarCompletada.Checked := Assigned(FDM) and FDM.qryTareaFlagCompletada.Value;
  actTareaSinResponsable.Enabled := Assigned(FDM) and not FDM.qryTareaidResponsable.IsNull;
  actTareaSinCategoria.Enabled := Assigned(FDM) and not FDM.qryTareaidCategoria.IsNull;
  actRotarCompletada.Enabled := Assigned(FDM) and not FDM.qryTarea.IsEmpty;
  actEliminarTarea.Enabled := Assigned(FDM) and not FDM.qryTarea.IsEmpty;
  actEditarTarea.Enabled := Assigned(FDM) and not FDM.qryTarea.IsEmpty;
  Responsable1.Enabled := Assigned(FDM) and not FDM.qryTarea.IsEmpty;
  Categoria1.Enabled := Assigned(FDM) and not FDM.qryTarea.IsEmpty;
  Prioridad1.Enabled := Assigned(FDM) and not FDM.qryTarea.IsEmpty;
  Responsable2.Enabled := Assigned(FDM) and not FDM.qryTarea.IsEmpty;
  Categoria2.Enabled := Assigned(FDM) and not FDM.qryTarea.IsEmpty;
  Prioridad2.Enabled := Assigned(FDM) and not FDM.qryTarea.IsEmpty;
end;

procedure TfrmPrincipal.ActualizarMenuCategorias(ParentItem: TMenuItem);
var
  AMenuItem: TMenuItem;
  I: Integer;
begin
  Screen.Cursor := crHourGlass;
  try
    for I := FOpcionesMenuCategorias.Count - 1 downto 0 do
    begin
      AMenuItem := FOpcionesMenuCategorias[I];
      FOpcionesMenuCategorias.Delete(I);
      AMenuItem.Free;
    end;
    FDM.RefrescarCategorias;
    FDM.qryCategoria.First;
    while not FDM.qryCategoria.Eof do
    begin
      AMenuItem := TMenuItem.Create(Self);
      FOpcionesMenuCategorias.Add(AMenuItem);
      AMenuItem.Caption := FDM.qryCategoriaCategoria.AsString;
      AMenuItem.Tag := FDM.qryCategoriaidCategoria.Value;
      AMenuItem.OnClick := AsignarCategoriaClick;
      ParentItem.Add(AMenuItem);
      if FDM.qryCategoriaidCategoria.Value = FDM.qryTareaidCategoria.Value then
        AMenuItem.Checked := True;
      FDM.qryCategoria.Next;
    end;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmPrincipal.ActualizarMenuResponsables(ParentItem: TMenuItem);
var
  AMenuItem: TMenuItem;
  I: Integer;
begin
  FDM.RefrescarResponsables;
  Screen.Cursor := crHourGlass;
  try
    for I := FOpcionesMenuResponsables.Count - 1 downto 0 do
    begin
      AMenuItem := FOpcionesMenuResponsables[I];
      FOpcionesMenuResponsables.Delete(I);
      AMenuItem.Free;
    end;
    FDM.qryResponsable.First;
    while not FDM.qryResponsable.Eof do
    begin
      AMenuItem := TMenuItem.Create(Self);
      FOpcionesMenuResponsables.Add(AMenuItem);
      AMenuItem.Caption := FDM.qryResponsableNombreCompleto.AsString;
      AMenuItem.Tag := FDM.qryResponsableidResponsable.Value;
      AMenuItem.OnClick := AsignarResponsableClick;
      ParentItem.Add(AMenuItem);
      if FDM.qryResponsableidResponsable.Value = FDM.qryTareaidResponsable.Value then
        AMenuItem.Checked := True;
      FDM.qryResponsable.Next;
    end;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmPrincipal.AgregarCategoria;
var
  frmCategoria: TfrmCategoria;
begin
  FDM.qryCategoria.Insert;
  try
    frmCategoria := TfrmCategoria.Create(nil);
    try
      frmCategoria.DM := FDM;
      if frmCategoria.Execute then
        FDM.AsignarCategoria(FDM.qryCategoriaidCategoria.Value);
    finally
      frmCategoria.Free;
    end;
  finally
    if FDM.qryCategoria.State in dsEditModes then
      FDM.qryCategoria.Cancel;
  end;
end;

procedure TfrmPrincipal.AgregarResponsable;
var
  frmResponsable: TfrmResponsable;
begin
  FDM.qryResponsable.Insert;
  try
    frmResponsable := TfrmResponsable.Create(nil);
    try
      frmResponsable.DM := FDM;
      if frmResponsable.Execute then
        FDM.AsignarResponsable(FDM.qryResponsableidResponsable.Value);
    finally
      frmResponsable.Free;
    end;
  finally
    if FDM.qryResponsable.State in dsEditModes then
      FDM.qryResponsable.Cancel;
  end;
end;

procedure TfrmPrincipal.AgregarTareaNueva;
var
  frmTarea: TfrmTarea;
begin
  FDM.qryTarea.Insert;
  try
    frmTarea := TfrmTarea.Create(nil);
    try
      frmTarea.DM := FDM;
      frmTarea.Execute;
    finally
      frmTarea.Free;
    end;
  finally
    if FDM.qryTarea.State in dsEditModes then
      FDM.qryTarea.Cancel;
  end;
end;

procedure TfrmPrincipal.alCfgConexionExecute(Sender: TObject);
begin
  FreeAndNil(FDM);
  ConfigurarBaseDeDatos;
  if dmConexion.EstaConfigurado then
  begin
    ConectarBaseDatos;
    ActualizarEsquema;
    FDM.qryTarea.Open;
  end;
end;

procedure TfrmPrincipal.AsignarCategoriaClick(Sender: TObject);
begin
  FDM.AsignarCategoria((Sender as TComponent).Tag);
end;

procedure TfrmPrincipal.AsignarResponsableClick(Sender: TObject);
begin
  FDM.AsignarResponsable((Sender as TComponent).Tag);
end;

procedure TfrmPrincipal.Categoria1Click(Sender: TObject);
begin
  ActualizarMenuCategorias(Sender as TMenuItem);
end;

procedure TfrmPrincipal.cgrTareasDblClick(Sender: TObject);
begin
  if FDM.qryTarea.IsEmpty then
    AgregarTareaNueva
  else
    EditarTarea;
end;

procedure TfrmPrincipal.cgrTareasMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if Button = mbRight then
    cgrTareas.Perform(WM_LBUTTONDOWN, 0, MakeLParam(Word(X), Word(Y)));
end;

procedure TfrmPrincipal.cgrTareasPaintPanel(DBCtrlGrid: TDBCtrlGrid;
  Index: Integer);
var
  AColor: TColor;
  ARect: TRect;
begin
  if FDM.qryTareaFlagCompletada.Value then
    AColor := clGray
  else if not FDM.qryTareaColor.IsNull then
    AColor := FDM.qryTareaColor.Value
  else
    AColor := clBtnFace;
  cgrTareas.Canvas.Brush.Color := AColor;
  cgrTareas.Canvas.FillRect(Rect(2, 2, cgrTareas.PanelWidth - 4, cgrTareas.PanelHeight - 4));
  if     (not FDM.qryTareaFlagCompletada.Value)
     and (not FDM.qryTareaFechaLimite.IsNull)
     and (FDM.qryTareaFechaLimite.AsDateTime <= Date)
  then
  begin
    cgrTareas.Canvas.Brush.Color := clRed;
    ARect := Rect(txtFecha.Left - 4, txtFecha.Top - 2,
                  txtFecha.Left + txtFecha.Width + 4, txtFecha.Top + txtFecha.Height + 2);
    cgrTareas.Canvas.FillRect(ARect);
  end;
end;

procedure TfrmPrincipal.ConectarBaseDatos;
begin
  if dmConexion.EstaConfigurado then
  begin
    if Assigned(FDM) then
      FreeAndNil(FDM);
    dmConexion.Conexion.Close;
    dmConexion.LeerConfig;
    dmConexion.Conexion.Open;
    FDM := TdmTarea.Create(Self);
    FDM.SetOrdenTareas(FOrdenTareas);
    FDM.SetFiltroStatus(FFiltroStatus);
    dsTarea.DataSet := FDM.qryTarea;
  end;
end;

procedure TfrmPrincipal.ConfigurarBaseDeDatos;
var
  oDrv: IFDPhysDriver;
  oWizard: IFDPhysDriverConnectionWizard;
  pWindowList: TTaskWindowList;
  hWin: HWND;
begin
  FDManager.Active := True;
  dmConexion.Conexion.Close;
  dmConexion.Conexion.CheckConnectionDef;
  FDPhysManager.CreateDriver(dmConexion.Conexion.Params.DriverID, oDrv);
  oDrv.CreateConnectionWizard(oWizard);
  if not Assigned(oWizard) then
    raise Exception.Create('No se ha podido inicializar el asistente de conexión')
  else begin
    hWin := GetActiveWindow;
    pWindowList := DisableTaskWindows(0);
    try
      if oWizard.Run(dmConexion.Conexion.ResultConnectionDef, hWin) then
      begin
        dmConexion.Conexion.Open;
        dmConexion.GuardarConfig;
      end;
    finally
      EnableTaskWindows(pWindowList);
      SetActiveWindow(hWin);
    end;
  end;
end;

procedure TfrmPrincipal.dsTareaDataChange(Sender: TObject; Field: TField);
begin
  if not Assigned(Field) then
    ActualizarEstadoAcciones;
end;

procedure TfrmPrincipal.dsTareaStateChange(Sender: TObject);
begin
  ActualizarEstadoAcciones;
end;

procedure TfrmPrincipal.EditarTarea;
var
  frmTarea: TfrmTarea;
begin
  FDM.qryTarea.Edit;
  try
    frmTarea := TfrmTarea.Create(nil);
    try
      frmTarea.DM := FDM;
      frmTarea.Execute;
    finally
      frmTarea.Free;
    end;
  finally
    if FDM.qryTarea.State in dsEditModes then
      FDM.qryTarea.Cancel;
  end;
end;

procedure TfrmPrincipal.EstablecerConexionInicial;
begin
  if not dmConexion.EstaConfigurado then
    ConfigurarBaseDeDatos;
  ConectarBaseDatos;
  ActualizarEsquema;
  FDM.qryTarea.Open;
end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
  FOpcionesMenuResponsables := TList<TMenuItem>.Create;
  FOpcionesMenuCategorias := TList<TMenuItem>.Create;
  PosicionarEnPantalla;
end;

procedure TfrmPrincipal.FormDestroy(Sender: TObject);
begin
  FOpcionesMenuResponsables.Free;
  FOpcionesMenuCategorias.Free;
end;

procedure TfrmPrincipal.FormResize(Sender: TObject);
var
  NumRows: Integer;
begin
  NumRows := ClientHeight div IdealRecordHeight;
  if NumRows = 0 then
    NumRows := 1;
  cgrTareas.RowCount := NumRows;
end;

procedure TfrmPrincipal.FormShow(Sender: TObject);
begin
  HandleNeeded;
  PostMessage(Handle, WM_INIT_CONECTAR, 0, 0);
end;

procedure TfrmPrincipal.MarcarPrioridadSeleccionada;
var
  ActPrio: TAction;
begin
  if FDM.qryTarea.IsEmpty then Exit;
  ActPrio := FindComponent('ActPrio' + IntToStr(FDM.qryTareaPrioridad.Value)) as TAction;
  if not Assigned(ActPrio) then Exit;
  ActPrio.Checked := True;
end;

procedure TfrmPrincipal.PosicionarEnPantalla;
begin
  Self.Left := Self.Monitor.WorkareaRect.Left + Self.Monitor.WorkareaRect.Width - Self.Width;
  Self.Top := Self.Monitor.WorkareaRect.Top;
  Self.Height := Self.Monitor.WorkareaRect.Height;
end;

procedure TfrmPrincipal.Prioridad1Click(Sender: TObject);
begin
  MarcarPrioridadSeleccionada;
end;

procedure TfrmPrincipal.Responsable1Click(Sender: TObject);
begin
  ActualizarMenuResponsables(Sender as TMenuItem);
end;

procedure TfrmPrincipal.wmInitConectar(var AMessage: TMessage);
begin
  EstablecerConexionInicial;
end;

end.
