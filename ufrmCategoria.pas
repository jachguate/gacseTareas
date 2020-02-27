unit ufrmCategoria;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, udmTarea, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, Data.DB, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, cxTextEdit, cxDBEdit;

type
  TfrmCategoria = class(TForm)
    pnlAbajo: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    dsCategoria: TDataSource;
    Label1: TLabel;
    cxDBTextEdit1: TcxDBTextEdit;
    Label2: TLabel;
    pnlColor: TPanel;
    ColorDialog: TColorDialog;
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure pnlColorClick(Sender: TObject);
  private
    FDM: TdmTarea;
    procedure SetDM(const Value: TdmTarea);
  public
    property DM: TdmTarea read FDM write SetDM;
    function Execute: Boolean;
  end;

implementation

{$R *.dfm}

{ TForm2 }

function TfrmCategoria.Execute: Boolean;
begin
  Result := ShowModal = mrOK;
end;

procedure TfrmCategoria.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if ModalResult = mrOK then
  begin
    FDM.qryCategoria.Post;
    FDM.qryCategoria.Refresh;
  end
  else
    FDM.qryCategoria.Cancel;
end;

procedure TfrmCategoria.pnlColorClick(Sender: TObject);
begin
  ColorDialog.Color := TColor(DM.qryCategoriaColor.Value);
  if ColorDialog.Execute then
  begin
    pnlColor.Color := ColorDialog.Color;
    DM.qryCategoriaColor.Value := ColorDialog.Color;
  end;
end;

procedure TfrmCategoria.SetDM(const Value: TdmTarea);
begin
  FDM := Value;
  if Assigned(FDM) then
  begin
    dsCategoria.DataSet := FDM.qryCategoria;
  end
  else
  begin
    dsCategoria.DataSet := nil;
  end;
end;

end.
