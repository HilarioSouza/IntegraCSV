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
    procedure btnOkClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPreferencias: TfrmPreferencias;

implementation

{$R *.dfm}

uses uDBUtils;


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

procedure TfrmPreferencias.FormCreate(Sender: TObject);
begin
  inherited;
  qryCFG.Open;
  qryCFG.Edit;
end;

end.
