unit uFrmImportacao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufrmStandard, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.Buttons, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Vcl.Grids, Vcl.DBGrids, udmConnect, Vcl.ComCtrls;

type
  TfrmImportacao = class(TfrmStandard)
    Panel1: TPanel;
    edtCaminhoArquivo: TLabeledEdit;
    sbtCaminhoArquivo: TSpeedButton;
    btnImportar: TButton;
    ddsIMP: TDataSource;
    fqrIMP: TFDQuery;
    Panel2: TPanel;
    btnDesfazerIMP: TButton;
    Button3: TButton;
    Panel3: TPanel;
    btnSair: TButton;
    PageControl1: TPageControl;
    tshIMP: TTabSheet;
    tshREG: TTabSheet;
    dgrIMP: TDBGrid;
    dgrREG: TDBGrid;
    ddsREG: TDataSource;
    fqrREG: TFDQuery;
    procedure sbtCaminhoArquivoClick(Sender: TObject);
    procedure btnImportarClick(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnDesfazerIMPClick(Sender: TObject);
  private
    procedure ImportarArquivo;
    procedure AtualizarQueries;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmImportacao: TfrmImportacao;

implementation

uses
  KrImportador, uUtils, uMain, uFuncoesIni, uDBUtils, uMensagem;

{$R *.dfm}

procedure TfrmImportacao.btnImportarClick(Sender: TObject);
begin
  ImportarArquivo;
  AtualizarQueries;
end;

procedure TfrmImportacao.sbtCaminhoArquivoClick(Sender: TObject);
begin
  edtCaminhoArquivo.Text := TUtilArquivo.GetCaminhoArquivo(edtCaminhoArquivo.Text);
end;

procedure TfrmImportacao.btnSairClick(Sender: TObject);
begin
  TFuncoesIni.GravarIni('CONFIG', 'FileName', edtCaminhoArquivo.Text);
  Sair;
end;

procedure TfrmImportacao.btnDesfazerIMPClick(Sender: TObject);
begin
  inherited;
  if TMensagem.Confirmar('Deseja desfazer a importação?') then
  begin
    TLeitorCSV.DesfazerImportacao(fqrIMP.FieldByName('EMP_Codigo').AsString, fqrIMP.FieldByName('ID').AsInteger);
    ShowMessage('Importação desfeita!');
    AtualizarQueries;
  end
  else
    ShowMessage('Operação cancelada!');
end;

procedure TfrmImportacao.Button3Click(Sender: TObject);
var Imp: TImportador;
begin
  inherited;
  Imp := timportador.Create;
  try

  finally
    FreeAndNil(Imp);
  end;
end;

procedure TfrmImportacao.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
end;

procedure TfrmImportacao.FormCreate(Sender: TObject);
begin
  inherited;
  edtCaminhoArquivo.Text := TFuncoesIni.LerIni('CONFIG', 'FileName', ExtractFilePath(ParamStr(0)));
  AtualizarQueries;
end;

procedure TfrmImportacao.AtualizarQueries;
begin
  TDBUtils.RefreshQuery(fqrIMP);
  TDBUtils.RefreshQuery(fqrREG);
end;

procedure TfrmImportacao.ImportarArquivo;
var
  Leitor: ILeitor;
begin
  Leitor := TLeitorCSV.Create('0001');
  try
    Leitor.LerArquivo(edtCaminhoArquivo.Text);
    ShowMessage('Importação realizada com sucesso.');
  except
    on E: Exception do
      raise Exception.Create('Erro durante a importação: ' + E.Message);
  end;
end;

end.
