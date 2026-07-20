program SCI;

uses
  Forms,
  frmDM in 'frmDM.pas' {DM: TDataModule},
  frmPesqData in 'frmPesqData.pas' {pesqData},
  frmLogin in 'frmLogin.pas' {Login},
  frmMenuPrin in 'frmMenuPrin.pas' {menuPrin},
  frmFormPadrao1 in 'frmFormPadrao1.pas' {FormPadrao1};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'Sistema Comercial Integrado';
  Application.CreateForm(TmenuPrin, menuPrin);
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TpesqData, pesqData);
  Application.CreateForm(TLogin, Login);
  Application.CreateForm(TFormPadrao1, FormPadrao1);
  Application.Run;
end.
