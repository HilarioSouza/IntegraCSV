unit ufConfiguracaoBD;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufrmStandard, Vcl.Imaging.pngimage,
  Vcl.StdCtrls, Vcl.Imaging.jpeg,
  Vcl.ExtCtrls, Vcl.Buttons, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf,
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async,
  FireDAC.Phys, Data.DB, FireDAC.Comp.Client, FireDAC.Phys.IBBase, FireDAC.Phys.IB,
  FireDAC.Phys.FB, FireDAC.Phys.FBDef;

type
  TfConfiguracaoBD = class(TfrmStandard)
    Panel2: TPanel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    sbtCaminhoBanco: TSpeedButton;
    Label9: TLabel;
    ImgGAC: TImage;
    edtCaminho: TEdit;
    edtUser: TEdit;
    edtSenha: TEdit;
    btnConectar: TButton;
    pnTop: TPanel;
    imgDataBase: TImage;
    Label1: TLabel;
    FDConn: TFDConnection;
    FDPhysFBDriverLink1: TFDPhysFBDriverLink;
    procedure btnConectarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sbtCaminhoBancoClick(Sender: TObject);
  private
    function TestarConexao(User, Pass, DataBase: String): Boolean;
    procedure SetCaminhoBanco;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fConfiguracaoBD: TfConfiguracaoBD;

implementation

{$R *.dfm}

uses uMensagem, uFuncoesIni, uUtils, udmConnect;

procedure TfConfiguracaoBD.btnConectarClick(Sender: TObject);
begin
  inherited;
  if TestarConexao(edtUser.Text, edtSenha.Text, edtCaminho.Text) then
  begin
    TFuncoesIni.GravarIni('BANCO', 'User_Name', edtUser.Text);
    TFuncoesIni.GravarIni('BANCO', 'Pass', edtSenha.Text);
    TFuncoesIni.GravarIni('BANCO', 'Database', edtCaminho.Text);
    dmConnect.Conectar;
    Close;
  end;
end;

procedure TfConfiguracaoBD.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
end;

procedure TfConfiguracaoBD.FormShow(Sender: TObject);
begin
  inherited;
  edtUser.Text := TFuncoesIni.LerIni('BANCO', 'User_name');
  edtSenha.Text := TFuncoesIni.LerIni('BANCO', 'Pass');
  edtCaminho.Text := TFuncoesIni.LerIni('BANCO', 'Database');
end;

procedure TfConfiguracaoBD.SetCaminhoBanco;
var
  sCaminho: String;
begin
  sCaminho := TUtilArquivo.GetCaminhoArquivo;
  if not (sCaminho.IsEmpty) then
    edtCaminho.Text := sCaminho;
end;

procedure TfConfiguracaoBD.sbtCaminhoBancoClick(Sender: TObject);
begin
  inherited;
  SetCaminhoBanco;
end;

function TfConfiguracaoBD.TestarConexao(User, Pass, DataBase: String): Boolean;
begin
  FDConn.Params.Values['User_Name'] := User;
  FDConn.Params.Values['Password'] := Pass;
  FDConn.Params.Values['Database'] := DataBase;
  FDConn.DriverName := 'FB';
  try
    FDConn.Connected := True;
    FDConn.Connected := False;
    result := True;
    TMensagem.Informar('Configuração realizada com Sucesso !');
  Except
    on e: Exception do
    begin
      result := False;
      TMensagem.Informar('Falha na Configuração !' + #13#10 + e.Message);
    end;
  end;
end;

end.
