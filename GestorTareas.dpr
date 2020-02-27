program GestorTareas;

{$R *.dres}

uses
  Vcl.Forms,
  ufrmPrincipal in 'ufrmPrincipal.pas' {frmPrincipal},
  udmConexion in 'udmConexion.pas' {dmConexion: TDataModule},
  udmTarea in 'udmTarea.pas' {dmTarea: TDataModule},
  udmEsquema in 'udmEsquema.pas' {dmEsquema: TDataModule},
  ufrmTarea in 'ufrmTarea.pas' {frmTarea},
  ufrmResponsable in 'ufrmResponsable.pas' {frmResponsable},
  ufrmCategoria in 'ufrmCategoria.pas' {frmCategoria};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TdmConexion, dmConexion);
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TdmEsquema, dmEsquema);
  Application.Run;
end.
