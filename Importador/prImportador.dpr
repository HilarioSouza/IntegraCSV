program PrImportador;

uses
  Forms,
  uMain in 'uMain.pas' {frmMain},
  KrImportador in 'KrImportador.pas',
  uFTDI in 'Externo\uFTDI.pas',
  cTDI in 'Externo\cTDI.pas',
  uFrmImportacao in 'uFrmImportacao.pas' {frmImportacao},
  ufrmStandard in 'Externo\ufrmStandard.pas' {frmStandard},
  uUtils in 'Externo\uUtils.pas',
  ufrmCrudbasic in 'Externo\ufrmCrudbasic.pas' {frmCrudbasic},
  uMensagem in 'Externo\uMensagem.pas',
  IntfFormPrincipal in 'IntfFormPrincipal.pas',
  uFrmCdEmp in 'uFrmCdEmp.pas' {frmCdEmp};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;
end.
