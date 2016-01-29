unit uFrmImportacao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufrmStandard, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.Buttons, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Vcl.Grids, Vcl.DBGrids, udmConnect, Vcl.ComCtrls,
  Vcl.DBCtrls;

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
    btnSair: TButton;
    dcbEMP: TDBLookupComboBox;
    fqrEMP: TFDQuery;
    ddsEMP: TDataSource;
    Panel3: TPanel;
    pgcIMP: TPageControl;
    tshIMP: TTabSheet;
    dgrIMP: TDBGrid;
    fqrIMPEMP_CODIGO: TStringField;
    fqrIMPID: TIntegerField;
    fqrIMPDATA: TDateField;
    procedure sbtCaminhoArquivoClick(Sender: TObject);
    procedure btnImportarClick(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure btnDesfazerIMPClick(Sender: TObject);
  private
    procedure AtualizarQueries;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmImportacao: TfrmImportacao;

implementation

uses
  KrImportador, uUtils, uMain, uFuncoesIni, uDBUtils, uMensagem, uLogger;

{$R *.dfm}

procedure TfrmImportacao.btnImportarClick(Sender: TObject);
begin
  if (dcbEMP.KeyValue = null) or (dcbEMP.KeyValue = '') then
  begin
    ShowMessage('Por favor selecione uma Empresa');
    TControlUtils.TryFocus(dcbEMP);
  end
  else
  begin
    TImportador.ImportarArquivo(dcbEMP.KeyValue, edtCaminhoArquivo.Text);
    AtualizarQueries;
  end;
  if GetLogger.HasLog then
    ShowMessage(GetLogger.GetLog); //Alterar para um form com memo.
end;

procedure TfrmImportacao.sbtCaminhoArquivoClick(Sender: TObject);
begin
  edtCaminhoArquivo.Text := TUtilArquivo.GetCaminhoArquivo(edtCaminhoArquivo.Text);
end;

procedure TfrmImportacao.btnSairClick(Sender: TObject);
begin
  TFuncoesIni.GravarIni('CONFIG', 'FileName', edtCaminhoArquivo.Text);
  TFuncoesIni.GravarIni('CONFIG', 'Empresa', dcbEMP.KeyValue);
  Sair;
end;

procedure TfrmImportacao.btnDesfazerIMPClick(Sender: TObject);
begin
  inherited;
  if TMensagem.Confirmar('Deseja desfazer a importa��o?') then
  begin
    TLeitorCSV.DesfazerImportacao(fqrIMP.FieldByName('EMP_Codigo').AsString, fqrIMP.FieldByName('ID').AsInteger);
    ShowMessage('Importa��o desfeita!');
    AtualizarQueries;
  end
  else
    ShowMessage('Opera��o cancelada!');
end;

procedure TfrmImportacao.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
end;

procedure TfrmImportacao.FormCreate(Sender: TObject);
begin
  inherited;
  pgcIMP.ActivePage := tshIMP;
  edtCaminhoArquivo.Text := TFuncoesIni.LerIni('CONFIG', 'FileName', ExtractFilePath(ParamStr(0)));
  dcbEMP.KeyValue := TFuncoesIni.LerIni('CONFIG', 'Empresa', '');
  AtualizarQueries;
  fqrEMP.Open;
end;

procedure TfrmImportacao.AtualizarQueries;
begin
  TDBUtils.RefreshQuery(fqrIMP);
end;

end.
