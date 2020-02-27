unit ufrmResponsable;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, udmTarea, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, Data.DB, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, cxTextEdit, cxDBEdit;

type
  TfrmResponsable = class(TForm)
    pnlAbajo: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    dsResponsable: TDataSource;
    Label1: TLabel;
    cxDBTextEdit1: TcxDBTextEdit;
    Label2: TLabel;
    cxDBTextEdit2: TcxDBTextEdit;
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

{ TForm1 }

function TfrmResponsable.Execute: Boolean;
begin
  Result := ShowModal = mrOK;
end;

procedure TfrmResponsable.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if ModalResult = mrOK then
  begin
    FDM.qryResponsable.Post;
    FDM.qryResponsable.Refresh;
  end
  else
    FDM.qryResponsable.Cancel;
end;

procedure TfrmResponsable.SetDM(const Value: TdmTarea);
begin
  FDM := Value;
  if Assigned(FDM) then
  begin
    dsResponsable.DataSet := FDM.qryResponsable;
  end
  else
  begin
    dsResponsable.DataSet := nil;
  end;
end;

end.
