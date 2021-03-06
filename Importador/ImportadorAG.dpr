program ImportadorAG;

uses
  ShareMem,
  Forms,
  uMain in 'uMain.pas' {frmMain},
  KrImportador in 'KrImportador.pas',
  uFTDI in 'Externo\uFTDI.pas',
  cTDI in 'Externo\cTDI.pas',
  uFrmImportacao in 'uFrmImportacao.pas' {frmImportacao},
  ufrmStandard in 'Externo\ufrmStandard.pas' {frmStandard},
  uUtils in 'Externo\uUtils.pas',
  uMensagem in 'Externo\uMensagem.pas',
  IntfFormPrincipal in 'IntfFormPrincipal.pas',
  udmConnect in 'Externo\udmConnect.pas' {dmConnect: TDataModule},
  uFuncoesIni in 'Externo\uFuncoesIni.pas',
  ufConfiguracaoBD in 'Externo\ufConfiguracaoBD.pas' {fConfiguracaoBD},
  ufrmCrudbasic in 'Externo\ufrmCrudbasic.pas' {frmCrudbasic},
  uFrmCdEmp in 'uFrmCdEmp.pas' {frmCdEmp},
  uAtualizaBanco in 'Externo\uAtualizaBanco.pas',
  uInterfaceQuery in 'Externo\uInterfaceQuery.pas',
  IntfFinanceiro in 'Externo\IntfFinanceiro.pas',
  uFrmPreferencias in 'uFrmPreferencias.pas' {frmPreferencias},
  uDBUtils in 'Externo\uDBUtils.pas',
  uEstabelecimento in 'Externo\uEstabelecimento.pas',
  uAuditoria in 'uAuditoria.pas',
  uLogger in 'Externo\uLogger.pas',
  uFrmLog in 'uFrmLog.pas' {frmLog},
  Vcl.Themes,
  Vcl.Styles,
  uEmpresa in 'uEmpresa.pas',
  uFrmRlImportacao in 'uFrmRlImportacao.pas' {FrmRlImport},
  uFrmOiRlImport in 'uFrmOiRlImport.pas' {frmOiRlImport},
  uFraEmpresa in 'uFraEmpresa.pas' {frEmpresa: TFrame};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TdmConnect, dmConnect);
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;
end.