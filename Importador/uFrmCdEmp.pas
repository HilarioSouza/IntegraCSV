unit uFrmCdEmp;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufrmCrudbasic, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.StdCtrls, Vcl.Mask,
  Vcl.DBCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.ComCtrls, Vcl.ExtCtrls;

type
  TfrmCdEmp = class(TfrmCrudbasic)
    qryMainCODIGO: TStringField;
    qryMainNOME: TStringField;
    edtNome: TDBEdit;
    lblNome: TLabel;
    qryMainCARTORIOEST: TStringField;
    qryMainCARTORIOCRD: TStringField;
    qryMainCARTORIOCRS: TStringField;
    qryMainSERVICESEST: TStringField;
    qryMainSERVICESCRD: TStringField;
    qryMainSERVICESCRS: TStringField;
    qryMainCPG_EST: TStringField;
    qryMainCPG_CRD: TStringField;
    qryMainCPG_CRS: TStringField;
    qryMainVDR_COB_CODIGO: TStringField;
    qryMainSER_CODIGO: TStringField;
    qryMainVDR_TDC_CODIGO: TStringField;
    qryMainMDS_CODIGO: TStringField;
    qryMainCPG_FRN_CNPJ: TStringField;
    pgcEmpresa: TPageControl;
    tshContasaReceber: TTabSheet;
    tshContasaPagar: TTabSheet;
    tshServicos: TTabSheet;
    gbxXimenesServices: TGroupBox;
    Label7: TLabel;
    Label6: TLabel;
    Label5: TLabel;
    detReceita: TDBEdit;
    detCentroResultados: TDBEdit;
    detEstabelecimento: TDBEdit;
    gbxCartorioXimenes: TGroupBox;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    gbxContasaPagar: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    Label11: TLabel;
    detEstab: TDBEdit;
    detCRS: TDBEdit;
    detCRD: TDBEdit;
    detFRN_CNPJ: TDBEdit;
    Label12: TLabel;
    GroupBox1: TGroupBox;
    detCodServico: TDBEdit;
    detCodModalidade: TDBEdit;
    detTipoDoc: TDBEdit;
    detAgenteCob: TDBEdit;
    lblServico: TLabel;
    lblModalidade: TLabel;
    lblTipoDoc: TLabel;
    lblAgenteCob: TLabel;
    sptHeader: TSplitter;
    procedure FormCreate(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
  private
    procedure ValidarEmpresa(ID: String);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCdEmp: TfrmCdEmp;

implementation

{$R *.dfm}

uses udmConnect, uMain, uUtils;

procedure TfrmCdEmp.btnSalvarClick(Sender: TObject);
begin
  ValidarEmpresa(edtID.Text);
  inherited;
end;

procedure TfrmCdEmp.FormCreate(Sender: TObject);
begin
  inherited;
  fPrincipal := frmMain;
end;

procedure TfrmCdEmp.ValidarEmpresa(ID: String);
begin
  if ID.IsEmpty then
  begin
    TControlUtils.TryFocus(edtID);
    raise Exception.Create('É necessário informar o código da Empresa cadastrada no Fortes Financeiro.');
  end;
end;

end.
