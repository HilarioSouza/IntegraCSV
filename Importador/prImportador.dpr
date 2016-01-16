program PrImportador;

uses
  Forms,
  uMain in 'uMain.pas' {frmMain},
  KrImportador in 'KrImportador.pas',
  uFTDI in 'Externo\uFTDI.pas',
  cTDI in 'Externo\cTDI.pas',
  uFrmImportacao in 'uFrmImportacao.pas' {frmImportacao},
  ufrmStandard in 'Externo\ufrmStandard.pas' {frmStandard},
  uUtils in 'Externo\uUtils.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmMain, frmMain);
  Application.CreateForm(TfrmImportacao, frmImportacao);
  Application.CreateForm(TfrmStandard, frmStandard);
  Application.Run;
end.
