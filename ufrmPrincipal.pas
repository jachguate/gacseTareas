unit ufrmPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, udmTarea, Vcl.DBCGrids,
  Data.DB, Vcl.ExtCtrls, Vcl.DBCtrls, Vcl.Menus, System.Actions, Vcl.ActnList,
  System.ImageList, Vcl.ImgList, System.Generics.Collections;

type
  TfrmPrincipal = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    cgrTareas: TDBCtrlGrid;
    dsTarea: TDataSource;
    Button5: TButton;
    pmTarea: TPopupMenu;
    alGeneral: TActionList;
    ImageList1: TImageList;
    actNuevaTarea: TAction;
    actTareaTerminada: TAction;
    actEliminarTarea: TAction;
    Nuevatarea1: TMenuItem;
    erminada1: TMenuItem;
    Eliminar1: TMenuItem;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    DBText3: TDBText;
    DBText2: TDBText;
    DBText1: TDBText;
    Label4: TLabel;
    DBText4: TDBText;
    Label5: TLabel;
    Responsable1: TMenuItem;
    Categora1: TMenuItem;
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
    procedure Button5Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cgrTareasClick(Sender: TObject);
    procedure cgrTareasMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure cgrTareasPaintPanel(DBCtrlGrid: TDBCtrlGrid; Index: Integer);
    procedure pmTareaPopup(Sender: TObject);
    procedure actNuevaTareaExecute(Sender: TObject);
    procedure actTareaTerminadaExecute(Sender: TObject);
    procedure actEliminarTareaExecute(Sender: TObject);
    procedure actTareaSinResponsableExecute(Sender: TObject);
    procedure actTareaSinCategoriaExecute(Sender: TObject);
    procedure actAgregarResponsableExecute(Sender: TObject);
    procedure actAgregarCategoríaExecute(Sender: TObject);
    procedure Responsable1Click(Sender: TObject);
    procedure Categora1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    FDM: tdmTarea;
    FOpcionesMenuResponsables: TList<TMenuItem>;
    FOpcionesMenuCategorias: TList<TMenuItem>;
    procedure AsignarResponsableClick(Sender: TObject);
    procedure ConfigurarBaseDeDatos;
    procedure ActualizarEsquema;
    procedure ConectarBaseDatos;
    procedure AgregarTareaNueva;
    procedure AgregarResponsable;
    procedure ActualizarMenuResponsables;
    procedure ActualizarMenuCategorias;
  public
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation
uses
  FireDAC.Phys.Intf, FireDAC.Comp.Client, FireDAC.Phys.MSSQL, FireDAC.VCLUI.ConnEdit, udmConexion,
  udmEsquema, ufrmTarea, System.UITypes;

{$R *.dfm}

procedure TfrmPrincipal.actAgregarCategoríaExecute(Sender: TObject);
begin
  //
end;

procedure TfrmPrincipal.actAgregarResponsableExecute(Sender: TObject);
begin
  //
end;

procedure TfrmPrincipal.actEliminarTareaExecute(Sender: TObject);
begin
  if MessageDlg('¿Está seguro que desea eliminar la tarea?', mtConfirmation, [mbYes, mbNo], 0, mbNo) <> mrYes then
    Exit;
  FDM.EliminarTarea;
end;

procedure TfrmPrincipal.actNuevaTareaExecute(Sender: TObject);
begin
  AgregarTareaNueva;
end;

procedure TfrmPrincipal.actTareaSinCategoriaExecute(Sender: TObject);
begin
  //
end;

procedure TfrmPrincipal.actTareaSinResponsableExecute(Sender: TObject);
begin
  //
end;

procedure TfrmPrincipal.actTareaTerminadaExecute(Sender: TObject);
begin
  FDM.MarcarTareaComoCompletada;
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

procedure TfrmPrincipal.ActualizarMenuCategorias;
begin

end;

procedure TfrmPrincipal.ActualizarMenuResponsables;
var
  AMenuItem: TMenuItem;
  I: Integer;
begin
  for I := FOpcionesMenuResponsables.Count - 1 downto 0 do
  begin
    AMenuItem := FOpcionesMenuResponsables[I];
    FOpcionesMenuResponsables.Delete(I);
    AMenuItem.Free;
  end;
  FDM.RefrescarResponsables;
  FDM.qryResponsable.First;
  while not FDM.qryResponsable.Eof do
  begin
    AMenuItem := TMenuItem.Create(Self);
    AMenuItem.Caption := FDM.qryResponsableNombreCompleto.AsString;
    AMenuItem.Tag := FDM.qryResponsableidResponsable.Value;
    AMenuItem.OnClick := AsignarResponsableClick;
    Responsable1.Add(AMenuItem);
    FDM.qryResponsable.Next;
  end;
end;

procedure TfrmPrincipal.AgregarResponsable;
//var
//  frmResponsable: TfrmResponsable;
begin
//  FDM.qryResponsable.Insert;
//  try
//    frmResponsable := TfrmResponsable.Create(nil);
//    try
//      frmResponsable.DM := FDM;
//      frmResponsable.Execute;
//    finally
//      frmResponsable.Free;
//    end;
//  finally
//    if FDM.qryResponsable.State in dsEditModes then
//      FDM.qryResponsable.Cancel;
//  end;
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

procedure TfrmPrincipal.AsignarResponsableClick(Sender: TObject);
begin
  //
end;

procedure TfrmPrincipal.Button5Click(Sender: TObject);
begin
  AgregarTareaNueva;
end;

procedure TfrmPrincipal.Categora1Click(Sender: TObject);
begin
  ActualizarMenuCategorias;
end;

procedure TfrmPrincipal.cgrTareasClick(Sender: TObject);
begin
  //
end;

procedure TfrmPrincipal.cgrTareasMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if Button = mbRight then
    cgrTareas.Perform(WM_LBUTTONDOWN, 0, MakeLParam(Word(X), Word(Y)));
end;

procedure TfrmPrincipal.cgrTareasPaintPanel(DBCtrlGrid: TDBCtrlGrid;
  Index: Integer);
begin
  //
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

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
  FOpcionesMenuResponsables := TList<TMenuItem>.Create;
  FOpcionesMenuCategorias := TList<TMenuItem>.Create;
end;

procedure TfrmPrincipal.FormDestroy(Sender: TObject);
begin
  FOpcionesMenuResponsables.Free;
  FOpcionesMenuCategorias.Free;
end;

procedure TfrmPrincipal.FormShow(Sender: TObject);
begin
  if not dmConexion.EstaConfigurado then
    ConfigurarBaseDeDatos;
  ConectarBaseDatos;
  ActualizarEsquema;
  FDM.qryTarea.Open;
end;

procedure TfrmPrincipal.pmTareaPopup(Sender: TObject);
begin
  //
end;

procedure TfrmPrincipal.Responsable1Click(Sender: TObject);
begin
  ActualizarMenuResponsables;
end;

end.
