unit uFrmImportacao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufrmStandard, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.Buttons, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Vcl.Grids, Vcl.DBGrids, udmConnect, Vcl.ComCtrls,
  Vcl.DBCtrls, uFraEmpresa;

type
  TfrmImportacao = class(TfrmStandard)
    pnlMain: TPanel;
    ddsIMP: TDataSource;
    fqrIMP: TFDQuery;
    pnlButtons: TPanel;
    btnDesfazerIMP: TButton;
    btnSair: TButton;
    pnlGrid: TPanel;
    pgcIMP: TPageControl;
    tshIMP: TTabSheet;
    dgrIMP: TDBGrid;
    fqrIMPEMP_CODIGO: TStringField;
    fqrIMPID: TIntegerField;
    fqrIMPDATA: TDateField;
    pnlArquivo: TPanel;
    btnImportar: TButton;
    edtCaminhoArquivo: TLabeledEdit;
    sbtCaminhoArquivo: TSpeedButton;
    btnListarImp: TButton;
    frEmpresa1: TfrEmpresa;
    pnlBase: TPanel;
    pgbImportacao: TProgressBar;
    lblImportacao: TLabel;
    procedure sbtCaminhoArquivoClick(Sender: TObject);
    procedure btnImportarClick(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure btnDesfazerIMPClick(Sender: TObject);
    procedure btnListarImpClick(Sender: TObject);
  private
    procedure AtualizarQueries;
    procedure GravarDadosINI;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmImportacao: TfrmImportacao;

implementation

uses
  KrImportador, uUtils, uMain, uFuncoesIni, uDBUtils, uMensagem, uLogger,
  uFrmOiRlImport, IWSystem;

{$R *.dfm}

procedure TfrmImportacao.btnImportarClick(Sender: TObject);
var
  Importador: TImportador;
  EMP_Codigo: String;
begin
  if (frEmpresa1.dcbEMP.KeyValue <> null) then
    EMP_Codigo := frEmpresa1.dcbEMP.KeyValue;
  GravarDadosINI;
  if EMP_Codigo.IsEmpty then
  begin
    ShowMessage('Por favor selecione uma Empresa');
    TControlUtils.TryFocus(frEmpresa1.dcbEMP);
  end
  else
  begin
    Importador := TImportador.Create(EMP_Codigo);
    try
      try
        Importador.lblProgresso := lblImportacao;
        Importador.pgbImportacao := pgbImportacao;
        pnlBase.Visible := True;
        pgbImportacao.Visible := True;
        Importador.ImportarArquivo(EMP_Codigo, edtCaminhoArquivo.Text);
      finally
        FreeAndNil(Importador);
      end;
    except
      on E: Exception do
      begin
        GetLogger.Log(E.Message);
        GetLogger.SaveLog(gsAppPath + gsAppName + '.log');
      end;
    end;
    AtualizarQueries;
  end;
  if GetLogger.HasLog then
    GetLogger.ShowLog
  else
    ShowMessage('Importação concluída.');
  pgbImportacao.Visible := False;
  pnlBase.Visible := False;
end;

procedure TfrmImportacao.btnListarImpClick(Sender: TObject);
var
  OiRlImport: TfrmOiRlImport;
begin
  OiRlImport := TfrmOiRlImport.Create(nil);
  try
    OiRlImport.IDImportacao := fqrIMPID.AsInteger;
    OiRlImport.ShowModal;
  finally
    FreeAndNil(OiRlImport);
  end;
end;

procedure TfrmImportacao.sbtCaminhoArquivoClick(Sender: TObject);
begin
  edtCaminhoArquivo.Text := TUtilArquivo.GetCaminhoArquivo(edtCaminhoArquivo.Text);
end;

procedure TfrmImportacao.btnSairClick(Sender: TObject);
begin
  GravarDadosINI;
  Sair;
end;

procedure TfrmImportacao.GravarDadosINI;
begin
  TFuncoesIni.GravarIni('CONFIG', 'FileName', edtCaminhoArquivo.Text);
  TFuncoesIni.GravarIni('CONFIG', 'Empresa', frEmpresa1.dcbEMP.KeyValue);
end;

procedure TfrmImportacao.btnDesfazerIMPClick(Sender: TObject);
var
  Importador: TImportador;
begin
  inherited;
  if TMensagem.Confirmar('Deseja desfazer a importação?') then
  begin
    try
      Importador := TImportador.Create(fqrIMP.FieldByName('EMP_Codigo').AsString);
      Importador.DesfazerImportacao(fqrIMP.FieldByName('ID').AsInteger);
    finally
      FreeAndNil(Importador);
    end;
    ShowMessage('Importação desfeita!');
    AtualizarQueries;
  end
  else
    ShowMessage('Operação cancelada!');
end;

procedure TfrmImportacao.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
end;

procedure TfrmImportacao.FormCreate(Sender: TObject);
begin
  inherited;
  {$IFDEF DEBUG}
//    btnDesfazerIMP.Visible := True;
  {$ENDIF}
  pgcIMP.ActivePage := tshIMP;
  edtCaminhoArquivo.Text := TFuncoesIni.LerIni('CONFIG', 'FileName', ExtractFilePath(ParamStr(0)));
  frEmpresa1.dcbEMP.KeyValue := TFuncoesIni.LerIni('CONFIG', 'Empresa', '');
  AtualizarQueries;
  frEmpresa1.AbrirQuery;
  frEmpresa1.AtualizarEMP_Codigo;
end;

procedure TfrmImportacao.AtualizarQueries;
begin
  TDBUtils.RefreshQuery(fqrIMP);
end;

end.
