unit uFrmCdEmp;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufrmCrudbasic, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.StdCtrls, Vcl.Mask,
  Vcl.DBCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.ComCtrls, Vcl.ExtCtrls, Vcl.Buttons;

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
    detEstCartorio: TDBEdit;
    detCRSCartorio: TDBEdit;
    detCRDCartorio: TDBEdit;
    gbxContasaPagar: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    Label11: TLabel;
    detEstabCPG: TDBEdit;
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
    qryMainCPG_CON_CODIGO: TStringField;
    qryMainCPG_TDC_CODIGO: TStringField;
    lblCPG_CON: TLabel;
    detCPG_CON: TDBEdit;
    lblCPG_TDC: TLabel;
    detCPG_TDC: TDBEdit;
    gbxLAN_BVP: TGroupBox;
    SpeedButton1: TSpeedButton;
    qryMainBVP_CRD_DESC: TStringField;
    qryMainBVP_CRD_JUROS: TStringField;
    qryMainBVP_CON_CODIGO: TStringField;
    lblReceitaDescBVP: TLabel;
    detReceitaDescBVP: TDBEdit;
    lblDespJurosBVP: TLabel;
    detDespesaJurosBVP: TDBEdit;
    lblContaFinBVP: TLabel;
    detContaBaixaBVP: TDBEdit;
    BalloonHint1: TBalloonHint;
    procedure FormCreate(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure detEstabCPGExit(Sender: TObject);
    procedure detCPG_CONExit(Sender: TObject);
    procedure detContaBaixaBVPExit(Sender: TObject);
    procedure detCPG_TDCExit(Sender: TObject);
    procedure detCodServicoExit(Sender: TObject);
    procedure detCodModalidadeExit(Sender: TObject);
    procedure detTipoDocExit(Sender: TObject);
    procedure detEstabelecimentoExit(Sender: TObject);
    procedure detEstCartorioExit(Sender: TObject);
    procedure detAgenteCobExit(Sender: TObject);
    procedure edtIDExit(Sender: TObject);
    procedure detFRN_CNPJClick(Sender: TObject);
  private
    procedure ValidarEmpresa(ID: String);
    procedure TratarCodigoEst(detEst: TDBEdit);
    procedure ShowBalloonHintFRNCNPJ;
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

procedure TfrmCdEmp.detAgenteCobExit(Sender: TObject);
begin
  inherited;
  detagentecob.text := TUtil.LPad(detAgenteCob.Text, '0', 4);
end;

procedure TfrmCdEmp.detCodModalidadeExit(Sender: TObject);
begin
  inherited;
  detCodModalidade.Text := TUtil.LPad(detCodModalidade.Text, '0', 2);
end;

procedure TfrmCdEmp.detCodServicoExit(Sender: TObject);
begin
  inherited;
  detCodServico.Text := TUtil.LPad(detCodServico.Text, '0', 4);
end;

procedure TfrmCdEmp.detContaBaixaBVPExit(Sender: TObject);
begin
  inherited;
  detContaBaixaBVP.Text := TUtil.LPad(detContaBaixaBVP.Text, '0', 4);
end;

procedure TfrmCdEmp.detCPG_CONExit(Sender: TObject);
begin
  inherited;
  detCPG_CON.Text := TUtil.LPad(detCPG_CON.Text, '0', 4);
end;

procedure TfrmCdEmp.detCPG_TDCExit(Sender: TObject);
begin
  inherited;
  detCPG_TDC.Text := TUtil.LPad(detCPG_TDC.Text, '0', 3);
end;

procedure TfrmCdEmp.TratarCodigoEst(detEst: TDBEdit);
begin
  detEst.Text := TUtil.LPad(detEst.Text, '0', 4);
end;

procedure TfrmCdEmp.detEstabelecimentoExit(Sender: TObject);
begin
  inherited;
  TratarCodigoEst(detEstabelecimento);
end;

procedure TfrmCdEmp.detEstCartorioExit(Sender: TObject);
begin
  inherited;
  TratarCodigoEst(detEstCartorio);
end;

procedure TfrmCdEmp.ShowBalloonHintFRNCNPJ;
var
  Point: TPoint;
begin
  //Criar uma classe numa unit separada.
  BalloonHint1.Title := 'Informação:';
  BalloonHint1.Description := 'Se este campo for deixado em branco o CNPJ do Fornecedor será o mesmo do Convênio importado do arquivo.';
  BalloonHint1.ShowHint(detFRN_CNPJ);
end;

procedure TfrmCdEmp.detFRN_CNPJClick(Sender: TObject);
begin
  inherited;
  if detFRN_CNPJ.Text = '' then
    ShowBalloonHintFRNCNPJ;
end;

procedure TfrmCdEmp.detEstabCPGExit(Sender: TObject);
begin
  inherited;
  TratarCodigoEst(detEstabCPG);
end;

procedure TfrmCdEmp.detTipoDocExit(Sender: TObject);
begin
  inherited;
  detTipoDoc.Text := TUtil.LPad(detTipoDoc.Text, '0', 3);
end;

procedure TfrmCdEmp.edtIDExit(Sender: TObject);
begin
  inherited;
  edtID.Text := TUtil.LPad(edtID.Text, '0', 4);
end;

procedure TfrmCdEmp.FormCreate(Sender: TObject);
begin
  inherited;
  fPrincipal := frmMain;
  pgcEmpresa.ActivePage := tshContasaReceber;
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
