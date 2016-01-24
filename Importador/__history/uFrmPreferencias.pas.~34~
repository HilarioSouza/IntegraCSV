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
    btnOk: TButton;
    btnCancelar: TButton;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    pnlConexaoAG: TPanel;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    detUsuarioAG: TDBEdit;
    detSenhaAG: TDBEdit;
    DBRadioGroup1: TDBRadioGroup;
    detEmpresa: TDBEdit;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    pnlXimenesServices: TPanel;
    pnlCartorioXimenes: TPanel;
    detEstabelecimento: TDBEdit;
    detCentroResultados: TDBEdit;
    detReceita: TDBEdit;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
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
  qryCFG.Open();
  qryCFG.Edit;
end;

end.
