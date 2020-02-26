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
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    FDM: TdmTarea;
    procedure SetDM(const Value: TdmTarea);
  public
    property DM: TdmTarea read FDM write SetDM;
    function Execute: Boolean;
  end;

implementation

{$R *.dfm}

{ TfrmTarea }

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
    dsTarea.DataSet := FDM.qryTarea;
    dsResponsable.DataSet := FDM.qryResponsable;
    dsCategoria.DataSet := FDM.qryCategoria;
    if not FDM.qryResponsable.Active then
      FDM.qryResponsable.Open();
    if not FDM.qryCategoria.Active then
      FDM.qryCategoria.Open();
  end
  else
  begin
    dsTarea.DataSet := nil;
    dsResponsable.DataSet := nil;
    dsCategoria.DataSet := nil;
  end;
end;

end.
