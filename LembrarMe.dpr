program LembrarMe;

uses
  System.StartUpCopy,
  FMX.Forms,
  FrmPrincipal in 'FrmPrincipal.pas' {FrmPrincipal1},
  dmPrincipal in 'dmPrincipal.pas' {dmPrincipal1: TDataModule},
  FrmLogin in 'FrmLogin.pas' {FrmLogin1},
  FremListaLembranca in 'Frame\FremListaLembranca.pas' {FrameListaLembraca: TFrame};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFrmLogin1, FrmLogin1);
  Application.CreateForm(TdmPrincipal1, dmPrincipal1);
  Application.CreateForm(TFrmPrincipal1, FrmPrincipal1);
  Application.Run;
end.
