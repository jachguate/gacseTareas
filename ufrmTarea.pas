unit ufrmTarea;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  Data.DB, Vcl.Mask, Vcl.DBCtrls, udmTarea;

type
  TfrmTarea = class(TForm)
    pnlAbajo: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    dsTarea: TDataSource;
    Label1: TLabel;
    lblFechaLimite: TLabel;
    lblResponsable: TLabel;
    lblCategoria: TLabel;
    lcbCategoria: TDBLookupComboBox;
    lcbResponsable: TDBLookupComboBox;
    DBMemo1: TDBMemo;
    edtFechaLimite: TDBEdit;
    DBCheckBox1: TDBCheckBox;
    dsResponsable: TDataSource;
    dsCategoria: TDataSource;
    lblPrioridad: TLabel;
    cbPrioridad: TDBLookupComboBox;
    pnlColorCategoria: TPanel;
    dsPrioridad: TDataSource;
    btnAgregarResponsable: TButton;
    btnAgregarCategoría: TButton;
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure dsTareaDataChange(Sender: TObject; Field: TField);
    procedure btnAgregarResponsableClick(Sender: TObject);
    procedure btnAgregarCategoríaClick(Sender: TObject);
  private
    FDM: TdmTarea;
    procedure SetDM(const Value: TdmTarea);
  public
    property DM: TdmTarea read FDM write SetDM;
    function Execute: Boolean;
  end;

implementation

uses
  ufrmCategoria, ufrmResponsable;

{$R *.dfm}

{ TfrmTarea }

procedure TfrmTarea.btnAgregarCategoríaClick(Sender: TObject);
var
  frmCategoria: TfrmCategoria;
begin
  FDM.qryCategoria.Insert;
  try
    frmCategoria := TfrmCategoria.Create(nil);
    try
      frmCategoria.DM := FDM;
      frmCategoria.Execute;
    finally
      frmCategoria.Free;
    end;
  finally
    if FDM.qryCategoria.State in dsEditModes then
      FDM.qryCategoria.Cancel;
  end;
end;

procedure TfrmTarea.btnAgregarResponsableClick(Sender: TObject);
var
  frmResponsable: TfrmResponsable;
begin
  FDM.qryResponsable.Insert;
  try
    frmResponsable := TfrmResponsable.Create(nil);
    try
      frmResponsable.DM := FDM;
      frmResponsable.Execute;
    finally
      frmResponsable.Free;
    end;
  finally
    if FDM.qryResponsable.State in dsEditModes then
      FDM.qryResponsable.Cancel;
  end;
end;

procedure TfrmTarea.dsTareaDataChange(Sender: TObject; Field: TField);
var
  vColor: Variant;
  Color: Int64;
begin
  if not Assigned(FDM) then Exit;
  if (not Assigned(Field)) or (Field = FDM.qryTareaidCategoria) then
  begin
    if FDM.qryTareaidCategoria.IsNull then
      Color := 0
    else
    begin
      vColor := FDM.qryCategoria.Lookup('idCategoria', FDM.qryTareaidCategoria.Value, 'Color');
      if not VarIsNull(vColor) then
        Color := vColor
      else
        Color := 0;
    end;
    if Color <> 0 then
    begin
      pnlColorCategoria.Color := Color;
    end
    else
      pnlColorCategoria.Color := clBtnFace;
  end;
end;

function TfrmTarea.Execute: Boolean;
begin
  Result := ShowModal = mrOK;
end;

procedure TfrmTarea.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if ModalResult = mrOK then
  begin
    FDM.qryTarea.Post;
    FDM.qryTarea.Refresh;
  end
  else
    FDM.qryTarea.Cancel;
end;

procedure TfrmTarea.SetDM(const Value: TdmTarea);
begin
  FDM := Value;
  if Assigned(FDM) then
  begin
    FDM.PrepararmtPrioridades;
    FDM.RefrescarResponsables;
    FDM.RefrescarCategorias;
    dsTarea.DataSet := FDM.qryTarea;
    dsResponsable.DataSet := FDM.qryResponsable;
    dsCategoria.DataSet := FDM.qryCategoria;
    dsPrioridad.DataSet := FDM.mtPrioridades;
  end
  else
  begin
    dsTarea.DataSet := nil;
    dsResponsable.DataSet := nil;
    dsCategoria.DataSet := nil;
  end;
end;

end.
