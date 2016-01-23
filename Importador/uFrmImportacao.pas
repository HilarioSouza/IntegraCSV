unit uFrmImportacao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufrmStandard, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.Buttons, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Vcl.Grids, Vcl.DBGrids, udmConnect;

type
  TfrmImportacao = class(TfrmStandard)
    Panel1: TPanel;
    edtCaminhoArquivo: TLabeledEdit;
    sbtCaminhoArquivo: TSpeedButton;
    btnImportar: TButton;
    btnSair: TButton;
    Button3: TButton;
    dgrImportacao: TDBGrid;
    DataSource1: TDataSource;
    FDQuery1: TFDQuery;
    Panel2: TPanel;
    Button1: TButton;
    procedure sbtCaminhoArquivoClick(Sender: TObject);
    procedure btnImportarClick(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    procedure ImportarArquivo;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmImportacao: TfrmImportacao;

implementation

uses
  KrImportador, uUtils, uMain, uFuncoesIni;

{$R *.dfm}

procedure TfrmImportacao.btnImportarClick(Sender: TObject);
begin
  ImportarArquivo;
  FDQuery1.Refresh;
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

procedure TfrmImportacao.Button1Click(Sender: TObject);
begin
  inherited;
  DesfazerImportacao(FDQuery1.FieldByName('ID'));
end;

procedure TfrmImportacao.Button3Click(Sender: TObject);
var Imp: TImportador;
begin
  inherited;
  imp := timportador.Create;


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
  FDQuery1.Open;
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
