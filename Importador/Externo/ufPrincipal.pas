unit ufPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, System.Actions, Vcl.ActnList, Vcl.Menus,
  uFTDI, cTDI, FireDAC.UI.Intf,
  FireDAC.VCLUI.Error, FireDAC.Stan.Error, Vcl.AppEvnts, FireDAC.Stan.Intf,
  FireDAC.Comp.UI, Vcl.ComCtrls;

type
  TfPrincipal = class(TForm)
    MainMenu: TMainMenu;
    Cadastro1: TMenuItem;
    Movimentos1: TMenuItem;
    ImportarPlanilhaI2B1: TMenuItem;
    Empresa1: TMenuItem;
    Sair1: TMenuItem;
    ActList: TActionList;
    actSair: TAction;
    actEmpresa: TAction;
    actImportarCsvI2B: TAction;
    Configuraes1: TMenuItem;
    Bancodedados1: TMenuItem;
    actConfigBD: TAction;
    ErrorDialog: TFDGUIxErrorDialog;
    AppEvents: TApplicationEvents;
    acExportacao: TAction;
    Exportao1: TMenuItem;
    StatusBar1: TStatusBar;
    procedure actSairExecute(Sender: TObject);
    procedure actConfigBDExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure actEmpresaExecute(Sender: TObject);
    procedure actImportarCsvI2BExecute(Sender: TObject);
    procedure acExportacaoExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    FFTDI: TFTDI;
    function VerificarChave: Boolean;
    function VerificarConexaoBD: Boolean;
  public
    { Public declarations }
    property FTDI: TFTDI read FFTDI write FFTDI;
  end;

var
  fPrincipal: TfPrincipal;

const
  WM_CLOSE_TAB = WM_USER + 1;
  CHAVE = 'Chave_I2B';

implementation

{$R *.dfm}

uses ufConfiguracaoBD, ufInicio, ufrmEmpresa, ufrmImportacao, ufrmExportacao, ufrmSenha, Data.DB,
  FireDAC.Comp.Client, uInterfaceQuery, uCripto, uRegistry, udmConnect, uMensagem, uAtualizaBanco;

procedure TfPrincipal.acExportacaoExecute(Sender: TObject);
begin
  FTDI.GetTDI.MostrarFormulario(TfrmExportacao, false);
end;

procedure TfPrincipal.actConfigBDExecute(Sender: TObject);
begin
  if fConfiguracaoBD = nil then
  begin
    fConfiguracaoBD := TfConfiguracaoBD.Create(Self);
    fConfiguracaoBD.ShowModal;
    FreeAndNil(fConfiguracaoBD);
  end
  else
    fConfiguracaoBD.ShowModal;

  TMensagem.Informar('É necessário reiniciar a aplicação para que as alterações na conexão sejam carregadas novamente.');
  Application.Terminate;
end;

procedure TfPrincipal.actEmpresaExecute(Sender: TObject);
begin
  FTDI.GetTDI.MostrarFormulario(TfrmEmpresa, false);
end;

procedure TfPrincipal.actImportarCsvI2BExecute(Sender: TObject);
begin
  FTDI.GetTDI.MostrarFormulario(TfrmImportacao, false);
end;

procedure TfPrincipal.actSairExecute(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TfPrincipal.FormCreate(Sender: TObject);
begin
  FTDI := TFTDI.Create(Self, TfInicio);
end;

procedure TfPrincipal.FormDestroy(Sender: TObject);
begin
  FreeAndNil(FFTDI);
end;

procedure TfPrincipal.FormShow(Sender: TObject);
var
  bd: TAtualizaBanco;
begin
  if not dmConnect.fdConn.Connected then
    Exit;
  if not VerificarChave then
    if not TfrmSenha.ValidarChaveSistema then
      Application.Terminate;

  try
    bd := TAtualizaBanco.Create;
    bd.AtualizarBanco;
  finally
    FreeAndNil(bd);
  end;
end;

function TfPrincipal.VerificarChave: Boolean;
var
  Qry: TFDQuery;
  ChaveReg, ChaveBanco: String;
begin
  try
  Result := True;
  Qry := AutoQuery.NewQuery('Select chave, data from SOFTWAREKEY');
  Qry.Open;
  if (Qry.IsEmpty) or (Qry.FieldByName('chave').AsString = EmptyStr) then
    Result := false
  else
  begin
    ChaveBanco := Qry.FieldByName('chave').AsString;
    ChaveBanco := TCripto.Decode(ChaveBanco);
    ChaveReg := TRegistro.LerRegistro(CHAVE);
    ChaveReg := TCripto.Decode(ChaveReg);
    if not(ChaveBanco = ChaveReg) then
      Result := false;
  end;
  except
    Result := False;
  end;
end;

function TfPrincipal.VerificarConexaoBD: Boolean;
begin
  Result := True;
  if not dmConnect.fdConn.Connected then
  begin
    Result := False;
    TMensagem.Informar('Não foi reconhecido nenhuma conexão com banco de dados. Favor configurar nas configurações do sistema.');
  end;
end;

end.
