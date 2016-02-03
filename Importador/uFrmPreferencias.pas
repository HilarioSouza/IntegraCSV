unit uFrmPreferencias;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufrmStandard, Vcl.StdCtrls,
  Vcl.ExtCtrls, Vcl.DBCtrls, Vcl.Mask, udmConnect, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.ComCtrls;

type
  TfrmPreferencias = class(TfrmStandard)
    pnlConfigAGLib: TPanel;
    dtsCFG: TDataSource;
    qryCFG: TFDQuery;
    pnlBotoes: TPanel;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    pnlConexaoAG: TPanel;
    lblEnderecoBanco: TLabel;
    detEnderecoBanco: TDBEdit;
    detUsuarioAG: TDBEdit;
    detSenhaAG: TDBEdit;
    drgServidor: TDBRadioGroup;
    lblUsuario: TLabel;
    lblSenha: TLabel;
    pnlButtons: TPanel;
    btnOk: TButton;
    btnCancelar: TButton;
    btnTestarConexao: TButton;
    procedure btnOkClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnTestarConexaoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPreferencias: TfrmPreferencias;

implementation

{$R *.dfm}

uses uDBUtils, IntfFinanceiro, iwSystem, System.StrUtils;


procedure TfrmPreferencias.btnCancelarClick(Sender: TObject);
begin
  inherited;
  qryCFG.Cancel;
  Sair;
end;

procedure TfrmPreferencias.btnOkClick(Sender: TObject);
begin
  inherited;
  TDBUtils.SetID(qryCFG, 'CFG');
  qryCFG.Post;
  Sair;
end;

procedure TfrmPreferencias.btnTestarConexaoClick(Sender: TObject);
var
  Financeiro: IFinanceiro;
begin
  inherited;
  Financeiro := nil;
  try
    Financeiro := GetFinanceiro(GsAppPath);
    Financeiro.DriverNameBanco := IfThen(drgServidor.ItemIndex = 0, 'MSSQL', 'INTRBASE');
    Financeiro.UsuarioBanco    := detUsuarioAG.Text;
    Financeiro.SenhaBanco      := detSenhaAG.Text;
    Financeiro.Open(detEnderecoBanco.Text);
    Financeiro.Empresa := '0001';
    Financeiro.Close;
    ShowMessage('Conexão realizada com sucesso.');
  except
    on E: Exception do
      raise Exception.Create('Não foi possível conectar com a dll do Fortes Financeiro: ' + #13#10 + E.Message);
  end;
end;

procedure TfrmPreferencias.FormCreate(Sender: TObject);
begin
  inherited;
  qryCFG.Open;
  qryCFG.Edit;
end;

end.
