{************************************************************************************************
* ATENÇÃO - É obrigatório o uso de GUID quando se trabalha com interface.                       *
* Por que uma interface precisa ser unicamente identificável?                                   *
* A resposta é simples: porque as classes Delphi pode implementar várias interfaces.            *
* Quando um aplicativo estiver em execução, tem de haver um mecanismo que vai ter um            *
* ponteiro para uma interface adequada de uma implementação.                                    *
* A única maneira de descobrir se um objeto implementa uma interface e para obter               *
* um ponteiro para a implementação dessa interface é através de GUIDs.                          *
*************************************************************************************************}
unit IntfFinanceiro;

interface

uses
  Windows, SysUtils, StdCtrls, DB, Classes;

type
  IDBEditActions = interface
  ['{193505EA-78DD-437C-B98E-3797DEBB038E}']
    procedure Append;
    procedure Edit;
    procedure Post;
    procedure Cancel;
    procedure Delete;
  end;

  IDBEditAndNavigateActions = interface(IDBEditActions)
  ['{DD5743DF-80CA-41C3-85DE-17F1AB914B63}']
    procedure First;
    procedure Last;
    procedure Prior;
    procedure Next;
    function  Eof: Boolean;
    function  Bof: Boolean;
  end;

  IFinanceiro = interface;
  IContasaReceber = interface;
  IVencimentosaReceber = interface;        // Vencimentos Diversos do Contas a Receber
  IVencimentosChequesaReceber = interface; // Vencimentos Cheques do Contas a Receber
  IVencimentosCartoesaReceber = interface; // Vencimentos Cheques do Contas a Receber
  IServicosaReceber = interface;           // Serviços do Contas a Receber
  IItensaReceber = interface;              // Itens do Contas a Receber
  TLista = array of String;
  IListaCRD = array of String;             // Lista receitas e despesas
  IListaCES = array of String;             // Lista Centros de Estoque
  IRateiosaReceber = interface;            // Rateios do Contas a Receber
  IItensNotaFiscalSaida = interface;       // Itens da Nota Fiscal de Saida
  IItens = interface;                      // Cadastro de itens
  IListaItens = array of String;
  IListaRequisitantes = array of String;
  IListaEstoquesPRO_CES_LOTE = array of String;
  IListaEstoqueAtivoComLote = array of String;
  IListaEmpresas = array of String;
  IListaEstabelecimentos = TLista;
  IListaCentrosDeResultados = TLista;
  IListaRequisicoes = TLista;
  IListaServicos = TLista;
  IListaModalidades = TLista;
  IListaMunicipios = TLista;
  IListaBancos = TLista;
  IListaAdministradorasDeCartoes = TLista;
  IListaAgentesCobradores = TLista;
  IListaGrupoClientes = TLista;
  IListaCentroDeResultado = TLista;

  ISaidas = interface;
  IItensSaida = interface;

  ITransferenciaEstoque = interface;
  IItensTransferenciaEstoque = interface;

  IEntradas = interface;
  IItensEntrada = interface;

  IRequisicoes = interface;
  IItensRequisicao = interface;

  IDevolucoesEntrada = interface;
  IItensDevolucoesEntrada = interface;

  IDevolucoesSaida = interface;
  IItensDevolucoesSaida = interface;

  TGetFinanceiroProc = function: IFinanceiro;

  TListaVencimentos = array of IVencimentosaReceber;

  IParcelasDoPrazoDePagamento = interface;
  IContasaPagar = interface;

  IFaturasCupomFiscal = interface;
  ICupomDoCupom = interface;
  IICMSCupomFiscal = interface;
  IISSCupomFiscal = interface;
  IOutrosValoresCupomFiscal = interface;
  IProdutoCupom = interface;
  ITitulosCupomFiscal = interface;
  IBaixasCupomFiscal = interface;
  IApuracaoCupomFiscal = interface;
  IDetalhamentoSNCupomFiscal = interface;

  INotasFiscaisConhecimento = interface;
  IOutrosValoresConhecimento = interface;
  IFaturaConhecimento = interface;
  ITitulosConhecimento = interface;
  IBaixasConhecimento = interface;
  IApuracoesConhecimento = interface;
  IDetalhamentosConhecimento = interface;

  IProdutoNotaMercadoria           = interface;
  IICMSIPINotaMercadoria           = interface;
  IICMSAntecipadoNotaMercadoria    = interface;
  IICMSSubstNotaMercadoria         = interface;
  IICMSDiferencialNotaMercadoria   = interface;
  IOutrosValoresNotaMercadoria     = interface;
  IDetalheTransporteNotaMercadoria = interface;
  IFaturaNotaMercadoria            = interface;
  ITitulosNotaMercadoria           = interface;
  IBaixasNotaMercadoria            = interface;
  IApuracoesNotaMercadoria         = interface;
  IDetalhamentoNotaMercadoria      = interface;

  IDadosColetaFornecedor = interface
  ['{B466F8CB-D018-4F84-A454-E5FCAB19D38B}']
    function GetEmp_Codigo: string;
    procedure SetEmp_Codigo(Value: string);
    function GetClt_Codigo: string;
    procedure SetClt_Codigo(Value: string);
    function GetPro_Codigo: string;
    procedure SetPro_Codigo(Value: string);
    function GetFrn_Codigo: string;
    procedure SetFrn_Codigo(Value: string);
    function GetSequencial: Integer;
    procedure SetSequencial(Value: Integer);
    function GetFrn_Nome: string;
    procedure SetFrn_Nome(Value: string);
    function GetSituacao: Integer;
    procedure SetSituacao(Value: Integer);
    function GetDataUltimaSituacao: TDateTime;
    procedure SetDataUltimaSituacao(Value: TDateTime);
    function GetQuantidade: Double;
    procedure SetQuantidade(Value: Double);
    function GetValor: Double;
    procedure SetValor(Value: Double);
    function GetValortotal: Double;
    procedure SetValortotal(Value: Double);
    function GetMar_Codigo: string;
    procedure SetMar_Codigo(Value: string);
    function GetMar_Nome: string;
    procedure SetMar_Nome(Value: string);
    function GetObs: string;
    procedure SetObs(Value: string);
    function GetCondicaopagamento: string;
    procedure SetCondicaopagamento(Value: string);
    function GetFrete: Double;
    procedure SetFrete(Value: Double);
    function GetPrevisao: TDateTime;
    procedure SetPrevisao(Value: TDateTime);
    function GetTipofrete: string;
    procedure SetTipofrete(Value: string);
    function GetDesconto: Double;
    procedure SetDesconto(Value: Double);
    function GetDescontoTotal: Double;
    procedure SetDescontoTotal(Value: Double);
    function GetDataValidade: TDateTime;
    procedure SetDataValidade(Value: TDateTime);
    function GetValorOriginal: Double;
    procedure SetValorOriginal(Value: Double);
    function GetAcrescimo: Double;
    procedure SetAcrescimo(Value: Double);
    function GetDtlimiteEntrega: TDateTime;
    procedure SetDtlimiteEntrega(Value: TDateTime);
    function GetFatorConversao: Double;
    procedure SetFatorConversao(Value: Double);
    property Emp_Codigo: string read GetEmp_Codigo write SetEmp_Codigo;
    property Clt_Codigo: string read GetClt_Codigo write SetClt_Codigo;
    property Pro_Codigo: string read GetPro_Codigo write SetPro_Codigo;
    property Frn_Codigo: string read GetFrn_Codigo write SetFrn_Codigo;
    property Sequencial: Integer read GetSequencial write SetSequencial;
    property Frn_Nome: string read GetFrn_Nome write SetFrn_Nome;
    property Situacao: Integer read GetSituacao write SetSituacao;
    property DataUltimaSituacao: TDateTime read GetDataUltimaSituacao write SetDataUltimaSituacao;
    property Quantidade: Double read GetQuantidade write SetQuantidade;
    property Valor: Double read GetValor write SetValor;
    property Valortotal: Double read GetValortotal write SetValortotal;
    property Mar_Codigo: string read GetMar_Codigo write SetMar_Codigo;
    property Mar_Nome: string read GetMar_Nome write SetMar_Nome;
    property Obs: string read GetObs write SetObs;
    property Condicaopagamento: string read GetCondicaopagamento write SetCondicaopagamento;
    property Frete: Double read GetFrete write SetFrete;
    property Previsao: TDateTime read GetPrevisao write SetPrevisao;
    property Tipofrete: string read GetTipofrete write SetTipofrete;
    property Desconto: Double read GetDesconto write SetDesconto;
    property DescontoTotal: Double read GetDescontoTotal write SetDescontoTotal;
    property DataValidade: TDateTime read GetDataValidade write SetDataValidade;
    property ValorOriginal: Double read GetValorOriginal write SetValorOriginal;
    property Acrescimo: Double read GetAcrescimo write SetAcrescimo;
    property DtlimiteEntrega: TDateTime read GetDtlimiteEntrega write SetDtlimiteEntrega;
    property FatorConversao: Double read GetFatorConversao write SetFatorConversao;
  end;


  TArrayDadosColetaFornecedor = array of IDadosColetaFornecedor;

    IDadosColetaItem = interface
  ['{03931DBA-62C9-44AB-8FE2-1B1448CD46CC}']
    function GetEmp_Codigo: string;
    procedure SetEmp_Codigo(Value: string);
    function GetClt_Codigo: string;
    procedure SetClt_Codigo(Value: string);
    function GetPro_Codigo: string;
    procedure SetPro_Codigo(Value: string);
    function GetPro_Nome: string;
    procedure SetPro_Nome(Value: string);
    function GetQuantidade: Double;
    procedure SetQuantidade(Value: Double);
    function GetUndEntrada: string;
    procedure SetUndEntrada(Value: string);
    function GetUndSaida: string;
    procedure SetUndSaida(Value: string);
    function GetSaldo: Double;
    procedure SetSaldo(Value: Double);
    function GetPro_Compdescricao: string;
    procedure SetPro_Compdescricao(Value: string);
    function GetDataValidade: TDateTime;
    procedure SetDataValidade(Value: TDateTime);
    function GetValidadeMinima: Integer;
    procedure SetValidadeMinima(Value: Integer);
    function GetDtlimiteEntrega: TDateTime;
    procedure SetDtlimiteEntrega(Value: TDateTime);
    function GetPro_Codigointerno: string;
    procedure SetPro_Codigointerno(Value: string);
    function GetPro_FatorConversao: Double;
    procedure SetPro_FatorConversao(Value: Double);
    function GetArrayDadosColetaFornecedor: TArrayDadosColetaFornecedor;
    procedure SetArrayDadosColetaFornecedor(Value: TArrayDadosColetaFornecedor);
    property Emp_Codigo: string read GetEmp_Codigo write SetEmp_Codigo;
    property Clt_Codigo: string read GetClt_Codigo write SetClt_Codigo;
    property Pro_Codigo: string read GetPro_Codigo write SetPro_Codigo;
    property Pro_Nome: string read GetPro_Nome write SetPro_Nome;
    property Quantidade: Double read GetQuantidade write SetQuantidade;
    property UndEntrada: string read GetUndEntrada write SetUndEntrada;
    property UndSaida: string read GetUndSaida write SetUndSaida;
    property Saldo: Double read GetSaldo write SetSaldo;
    property Pro_Compdescricao: string read GetPro_Compdescricao write SetPro_Compdescricao;
    property DataValidade: TDateTime read GetDataValidade write SetDataValidade;
    property ValidadeMinima: Integer read GetValidadeMinima write SetValidadeMinima;
    property DtlimiteEntrega: TDateTime read GetDtlimiteEntrega write SetDtlimiteEntrega;
    property Pro_Codigointerno: string read GetPro_Codigointerno write SetPro_Codigointerno;
    property Pro_FatorConversao: Double read GetPro_FatorConversao write SetPro_FatorConversao;
    property ArrayDadosColetaFornecedor: TArrayDadosColetaFornecedor read GetArrayDadosColetaFornecedor write SetArrayDadosColetaFornecedor;
  end;
  
  TArrayDadosColetaItem = array of IDadosColetaItem;

  IDadosColeta = interface
  ['{3D2A85C1-687D-4585-A540-6B43C9BEA3DF}']
    function GetEmp_Codigo: string;
    procedure SetEmp_Codigo(Value: string);
    function GetCodigo: string;
    procedure SetCodigo(Value: string);
    function GetEst_Codigo: string;
    procedure SetEst_Codigo(Value: string);
    function GetEst_Nome: string;
    procedure SetEst_Nome(Value: string);
    function GetData: TDateTime;
    procedure SetData(Value: TDateTime);
    function GetCriterio: Integer;
    procedure SetCriterio(Value: Integer);
    function GetObs: string;
    procedure SetObs(Value: string);
    function GetUsu_Codigo: string;
    procedure SetUsu_Codigo(Value: string);
    function GetCes_Codigo: string;
    procedure SetCes_Codigo(Value: string);
    function GetCes_Nome: string;
    procedure SetCes_Nome(Value: string);
    function GetArrayDadosColetaItem: TArrayDadosColetaItem;
    procedure SetArrayDadosColetaItem(Value: TArrayDadosColetaItem);
    function GetRequisicoes: string;
    procedure SetRequisicoes(Value: string);
    property Emp_Codigo: string read GetEmp_Codigo write SetEmp_Codigo;
    property Codigo: string read GetCodigo write SetCodigo;
    property Est_Codigo: string read GetEst_Codigo write SetEst_Codigo;
    property Est_Nome: string read GetEst_Nome write SetEst_Nome;
    property Data: TDateTime read GetData write SetData;
    property Criterio: Integer read GetCriterio write SetCriterio;
    property Obs: string read GetObs write SetObs;
    property Usu_Codigo: string read GetUsu_Codigo write SetUsu_Codigo;
    property Ces_Codigo: string read GetCes_Codigo write SetCes_Codigo;
    property Ces_Nome: string read GetCes_Nome write SetCes_Nome;
    property ArrayDadosColetaItem: TArrayDadosColetaItem read GetArrayDadosColetaItem write SetArrayDadosColetaItem;
    property Requisicoes: string read GetRequisicoes write SetRequisicoes;
  end;

  TArrayDadosColeta = array of IDadosColeta;

  IDadosPedidoDeCompraItem = interface
  ['{A1E38C0C-95D6-4B02-9713-39E183D49C5C}']
    function GetEMP_Codigo: string;
    procedure SetEMP_Codigo(Value: string);
    function GetPED_CODIGO: string;
    procedure SetPED_CODIGO(Value: string);
    function GetPRO_CODIGO: string;
    procedure SetPRO_CODIGO(Value: string);
    function GetPRO_Nome: string;
    procedure SetPRO_Nome(Value: string);
    function GetSEQUENCIAL: integer;
    procedure SetSEQUENCIAL(Value: integer);
    function GetQTDE: Double;
    procedure SetQTDE(Value: Double);
    function GetVALOR: Double;
    procedure SetVALOR(Value: Double);
    function GetObs: string;
    procedure SetObs(Value: string);
    function GetFATORCONVERSAO: double;
    procedure SetFATORCONVERSAO(Value: Double);
    property EMP_Codigo: string read GetEMP_Codigo write SetEMP_Codigo;
    property PED_COdigo: string read GetPED_Codigo write SetPED_Codigo;
    property PRO_Codigo: string read GetPRO_Codigo write SetPRO_Codigo;
    property PRO_Nome: string read GetPRO_Nome write SetPRO_Nome;
    property Sequencial: integer read GetSequencial write SetSequencial;
    property Qtde: Double read GetQtde write SetQtde;
    property Valor: Double read GetValor write SetValor;
    property Obs: string read GetObs write SetObs;
    property FatorConversao: Double read GetFatorConversao write SetFatorConversao;
  end;

  TArrayDadosPedidoDeCompraItem = array of IDadosPedidoDeCompraItem;

  IDadosPedidoDeCompra = interface
  ['{16487F7E-EF32-4B24-9E12-AED811984023}']
    function GetEmp_Codigo: string;
    procedure SetEmp_Codigo(Value: string);
    function GetCodigo: string;
    procedure SetCodigo(Value: string);
    function GetEst_Codigo: string;
    procedure SetEst_Codigo(Value: string);
    function GetEst_Nome: string;
    procedure SetEst_Nome(Value: string);
    function GetDescricao: string;
    procedure SetDescricao(Value: string);
    function GetPrevisao: TDateTime;
    procedure SetPrevisao(Value: TDateTime);
    function GetData: TDateTime;
    procedure SetData(Value: TDateTime);
    function GetStatus: integer;
    procedure SetStatus(Value: integer);
    function GetTipoPedido: integer;
    procedure SetTipoPedido(Value: integer);
    function GetValorFrete: Double;
    procedure SetValorFrete(Value: Double);
    function GetCondicaoPagamento: string;
    procedure SetCondicaoPagamento(Value: string);
    function GetUSU_Codigo: string;
    procedure SetUSU_Codigo(Value: string);
    function GetCPG_Codigo: string;
    procedure SetCPG_Codigo(Value: string);
    function GetENDCEP: string;
    procedure SetENDCEP(Value: string);
    function GetEndLogradouro: string;
    procedure SetEndLogradouro(Value: string);
    function GetEndNumero: string;
    procedure SetEndNumero(Value: string);
    function GetEndComplemento: string;
    procedure SetEndComplemento(Value: string);
    function GetENDBairro: string;
    procedure SetENDBairro(Value: string);
    function GetMUN_UFD_Sigla: string;
    procedure SetMUN_UFD_Sigla(Value: string);
    function GetMUN_Codigo: string;
    procedure SetMUN_Codigo(Value: string);
    function GetREFERENCIA: string;
    procedure SetREFERENCIA(Value: string);
    function GetCES_CODIGO: string;
    procedure SetCES_CODIGO(Value: string);
    function GetCES_Nome: string;
    procedure SetCES_Nome(Value: string);
    function GetCRS_Codigo: string;
    procedure SetCRS_Codigo(Value: string);
    function GetCRS_Nome: string;
    procedure SetCRS_Nome(Value: string);
    function GetTipoFrete: string;
    procedure SetTipoFrete(Value: string);
    function GetDocumento: string;
    procedure SetDocumento(Value: string);
    function GetDadosPedidoDeCompraItem: TArrayDadosPedidoDeCompraItem;
    procedure SetDadosPedidoDeCompraItem(Value: TArrayDadosPedidoDeCompraItem);
    function GetContasaPagar: IContasaPagar;
    procedure SetContasaPagar(Value: IContasaPagar);
    property Emp_Codigo: string read GetEmp_Codigo write SetEmp_Codigo;
    property Codigo: string read GetCodigo write SetCodigo;
    property Est_Codigo: string read GetEst_Codigo write SetEst_Codigo;
    property Est_Nome: string read GetEst_Nome write SetEst_Nome;
    property Descricao: string read GetDescricao write SetDescricao;
    property Previsao: TDateTime read GetPrevisao write SetPrevisao;
    property Data: TDateTime read GetData write SetData;
    property Status: integer read GetStatus write SetStatus;
    property TipoPedido: integer read GetTipoPedido write SetTipoPedido;
    property ValorFrete: Double read GetValorFrete write SetValorFrete;
    property CondicaoPagamento: string read GetCondicaoPagamento write SetCondicaoPagamento;
    property USU_Codigo: string read GetUSU_Codigo write SetUSU_Codigo;
    property CPG_Codigo: string read GetCPG_Codigo write SetCPG_Codigo;
    property ENDCEP: string read GetENDCEP write SetENDCEP;
    property EndLogradouro: string read GetEndLogradouro write SetEndLogradouro;
    property EndNumero: string read GetEndNumero write SetEndNumero;
    property EndComplemento: string read GetEndComplemento write SetEndComplemento;
    property ENDBairro: string read GetENDBairro write SetENDBairro;
    property MUN_UFD_Sigla: string read GetMUN_UFD_Sigla write SetMUN_UFD_Sigla;
    property MUN_Codigo: string read GetMUN_Codigo write SetMUN_Codigo;
    property REFERENCIA: string read GetREFERENCIA write SetREFERENCIA;
    property CES_CODIGO: string read GetCES_CODIGO write SetCES_CODIGO;
    property CES_Nome: string read GetCES_Nome write SetCES_Nome;
    property CRS_CODIGO: string read GetCRS_CODIGO write SetCRS_CODIGO;
    property CRS_Nome: string read GetCRS_Nome write SetCRS_Nome;
    property TipoFrete: string read GetTipoFrete write SetTipoFrete;
    property Documento: string read GetDocumento write SetDocumento;
    property DadosPedidoDeCompraItem: TArrayDadosPedidoDeCompraItem read GetDadosPedidoDeCompraItem write SetDadosPedidoDeCompraItem;
    property ContasaPagar: IContasaPagar read GetContasaPagar write SetContasaPagar;
  end;

  TArrayDadosPedidoDeCompra = array of IDadosPedidoDeCompra;

  IPedidoDeVenda = interface;
  IItensPedidoDeVenda = interface;
  IServicosPedidoDeVenda = interface;
  // Saídas
  ISaidas = interface(IDBEditActions)
  ['{46D7010C-D5DE-4435-BEA7-25E0D6528C4A}']
    procedure Open;
    function  Find(Codigo: String): Boolean;
    //
    function  GetCodigo: String;
    function  GetEstabelecimento: String;
    procedure SetEstabelecimento(const Value: String);
    function  GetCentroDeResultados: String;
    procedure SetCentroDeResultados(const Value: String);
    function  GetCentroDeResultadosOrigem: String;
    procedure SetCentroDeResultadosOrigem(const Value: String);
    function  GetRequisitante: String;
    procedure SetRequisitante(const Value: String);
    function  GetCentroDeEstoque: String;
    procedure SetCentroDeEstoque(const Value: String);
    function  GetData: TDateTime;
    procedure SetData(Value: TDateTime);
    function  GetHora: TDateTime;
    procedure SetHora(Value: TDateTime);
    function  GetOBS: String;
    procedure SetOBS(const Value: String);
    function  GetDocumento: String;
    procedure SetDocumento(const Value: String);
    function  GetItensSaida: IItensSaida;
    //
    property  Codigo: String read GetCodigo;
    property  Estabelecimento: String read GetEstabelecimento write SetEstabelecimento;
    property  Requisitante: String read GetRequisitante write SetRequisitante;
    property  CentroDeEstoque: String read GetCentroDeEstoque write SetCentroDeEstoque;
    property  CentroDeResultados: String read GetCentroDeResultados write SetCentroDeResultados;
    property  CentroDeResultadosOrigem: String read GetCentroDeResultadosOrigem write SetCentroDeResultadosOrigem;
    property  Data: TDateTime read GetData write SetData;
    property  Hora: TDateTime read GetHora write SetHora;
    property  OBS: String read GetOBS write SetOBS;
    property  Documento: String read GetDocumento write SetDocumento;
    property  ItensSaida: IItensSaida read GetItensSaida;
  end;

  // Itens Saídas
  IItensSaida = interface(IDBEditAndNavigateActions)
  ['{7222018E-1139-4940-90FC-AD3DC525A32F}']
    function  Find(Codigo: String; Sequencial: Integer): Boolean;
    function  Open: Boolean;
    //
    function  GetCodigo: String;
    function  GetSequencial: Integer;
    procedure SetSequencial(const Value: Integer);
    function  GetItem: String;
    procedure SetItem(const Value: String);
    function  GetQuantidade: Double;
    procedure SetQuantidade(Value: Double);
    function  GetLOT_Sequencial: Integer;
    procedure SetLOT_Sequencial(Value: Integer);
    procedure ApplyUpdatesISI;
    //
    property  Codigo: String read GetCodigo;
    property  Sequencial: Integer read GetSequencial write SetSequencial;
    property  Item: String read GetItem write SetItem;
    property  Quantidade: Double read GetQuantidade write SetQuantidade;
    property  LOT_Sequencial: Integer read GetLOT_Sequencial write SetLOT_Sequencial;
  end;

  // Transferência Estoque
  ITransferenciaEstoque = interface(IDBEditActions)
  ['{C9FC7FA1-1457-4BB5-99F0-46952C773934}']
    procedure Open;
    function  Find(Codigo: String): Boolean;
    //
    function  GetCodigo: String;
    function  GetEstabelecimento: String;
    procedure SetEstabelecimento(const Value: String);
    function  GetData: TDateTime;
    procedure SetData(Value: TDateTime);
    function  GetCentroDeEstoqueOrigem: String;
    procedure SetCentroDeEstoqueOrigem(const Value: String);
    function  GetCentroDeEstoqueDestino: String;
    procedure SetCentroDeEstoqueDestino(const Value: String);
    function  GetDescricao: String;
    procedure SetDescricao(const Value: String);
    function  GetHora: TDateTime;
    procedure SetHora(Value: TDateTime);
    function  GetItensTransferenciaEstoque: IItensTransferenciaEstoque;
    //
    property  Codigo: String read GetCodigo;
    property  Estabelecimento: String read GetEstabelecimento write SetEstabelecimento;
    property  Data: TDateTime read GetData write SetData;
    property  CentroDeEstoqueOrigem: String read GetCentroDeEstoqueOrigem write SetCentroDeEstoqueOrigem;
    property  CentroDeEstoqueDestino: String read GetCentroDeEstoqueDestino write SetCentroDeEstoqueDestino;
    property  Descricao: String read GetDescricao write SetDescricao;
    property  Hora: TDateTime read GetHora write SetHora;
    property  ItensTransferenciaEstoque: IItensTransferenciaEstoque read GetItensTransferenciaEstoque;
  end;

  // Itens Transferencias Estoque
  IItensTransferenciaEstoque = interface(IDBEditAndNavigateActions)
  ['{E8A8817A-55F5-434E-93B0-6E5F11D98CED}']
    function  Find(Codigo: String; Sequencial: Integer): Boolean;
    function  Open: Boolean;
    //
    function  GetCodigo: String;
    function  GetSequencial: Integer;
    procedure SetSequencial(const Value: Integer);
    function  GetItem: String;
    procedure SetItem(const Value: String);
    function  GetQuantidade: Double;
    procedure SetQuantidade(Value: Double);
    function  GetLOT_Sequencial: Integer;
    procedure SetLOT_Sequencial(Value: Integer);
    procedure ApplyUpdatesITE;
    //
    property  Codigo: String read GetCodigo;
    property  Sequencial: Integer read GetSequencial write SetSequencial;
    property  Item: String read GetItem write SetItem;
    property  Quantidade: Double read GetQuantidade write SetQuantidade;
    property  LOT_Sequencial: Integer read GetLOT_Sequencial write SetLOT_Sequencial;
  end;

  IEntradas = interface(IDBEditActions)
  ['{0B934D58-CFBE-4AC0-BE49-822AE3F51819}']
    procedure Open;
    function  Find(Codigo: String): Boolean;
    //
    function  GetCodigo: String;
    function  GetEstabelecimento: String;
    procedure SetEstabelecimento(const Value: String);
    function  GetCentroDeResultados: String;
    procedure SetCentroDeResultados(const Value: String);
    function  GetCentroDeEstoque: String;
    procedure SetCentroDeEstoque(const Value: String);
    function  GetFornecedor: String;
    procedure SetFornecedor(const Value: String);
    function  GetPedido: String;
    procedure SetPedido(const Value: String);
    function  GetTransportadora: String;
    procedure SetTransportadora(const Value: String);
    function  GetData: TDateTime;
    procedure SetData(Value: TDateTime);
    function  GetHora: TDateTime;
    procedure SetHora(Value: TDateTime);
    function  GetOBS: String;
    procedure SetOBS(const Value: String);
    function  GetDocumento: String;
    procedure SetDocumento(const Value: String);
    procedure SetValor(const Value: Double);
    function  GetValor: Double;
    procedure SetFrete(const Value: Double);
    function  GetFrete: Double;
    function  GetItensEntrada: IItensEntrada;
    //
    property  Codigo: String read GetCodigo;
    property  Estabelecimento: String read GetEstabelecimento write SetEstabelecimento;
    property  CentroDeEstoque: String read GetCentroDeEstoque write SetCentroDeEstoque;
    property  CentroDeResultados: String read GetCentroDeResultados write SetCentroDeResultados;
    property  Fornecedor: String read GetFornecedor write SetFornecedor;
    property  Pedido: string read GetPedido write SetPedido;
    property  Transportadora: string read GetTransportadora write SetTransportadora;
    property  Data: TDateTime read GetData write SetData;
    property  Hora: TDateTime read GetHora write SetHora;
    property  OBS: String read GetOBS write SetOBS;
    property  Documento: String read GetDocumento write SetDocumento;
    property  Valor: Double read GetValor write SetValor;
    property  Frete: Double read GetFrete write SetFrete;
    property  ItensEntrada: IItensEntrada read GetItensEntrada;
  end;

  //Itens da Entrada
  IItensEntrada = interface(IDBEditAndNavigateActions)
  ['{B50B25EA-CFC6-4B4E-AEF3-A67386471D76}']
    function  Find(Codigo: String; Sequencial: Integer): Boolean;
    function  Open: Boolean;
    //
    function  GetCodigo: String;
    function  GetSequencial: Integer;
    procedure SetSequencial(const Value: Integer);
    function  GetItem: String;
    procedure SetItem(const Value: String);
    function  GetQuantidade: Double;
    procedure SetQuantidade(Value: Double);
    function  GetLOT_Sequencial: Integer;
    procedure SetLOT_Sequencial(Value: Integer);
    procedure SetAliquotaIPI(const Value: Double);
    function  GetAliquotaIPI: Double;
    procedure SetAliquotaICMSSUBST(const Value: Double);
    function  GetAliquotaICMSSUBST: Double;
    procedure SetFrete(const Value: Double);
    function  GetFrete: Double;
    procedure SetICMSSobreIPI(const Value: Integer);
    function  GetICMSSobreIPI: Integer;
    procedure SetAliqICMSDiferenciada(const Value: Double);
    function  GetAliqICMSDiferenciada: Double;
    procedure SetICMSNaoDeduzTotal(const Value: Integer);
    function  GetICMSNaoDeduzTotal: Integer;
    procedure SetICMSBase(Const Value: Double);
    function  GetICMSBase: Double;
    procedure SetAliquotaICMS(Const Value: Double);
    function  GetAliquotaICMS: Double;
    procedure SetFreteCompoeBaseICMSSubst(const Value: Integer);
    function  GetFreteCompoeBaseICMSSubst: Integer;
    procedure SetUnidadeEntrada(const Value: String);
    function  GetUnidadeEntrada: String;
    procedure SetFatorConversao(const Value: Double);
    function  GetFatorConversao: Double;
    procedure SetAcrescimo(const Value: Double);
    function  GetAcrescimo: Double;
    procedure SetDesconto(const Value: Double);
    function  GetDesconto: Double;
    procedure SetValor(const Value: Double);
    function  GetValor: Double;
    procedure ApplyUpdatesIEN;
    //
    property  Codigo: String read GetCodigo;
    property  Sequencial: Integer read GetSequencial write SetSequencial;
    property  Item: String read GetItem write SetItem;
    property  Quantidade: Double read GetQuantidade write SetQuantidade;
    property  LOT_Sequencial: Integer read GetLOT_Sequencial write SetLOT_Sequencial;
    property  AliquotaIPI: Double read GetAliquotaIPI write SetAliquotaIPI;
    property  AliquotaICMSSUBST: Double read GetAliquotaICMSSUBST write SetAliquotaICMSSUBST;
    property  Frete: Double read GetFrete write SetFrete;
    property  ICMSSobreIPI: Integer read GetICMSSobreIPI write SetICMSSobreIPI;
    property  AliqICMSDiferenciada: Double read GetAliqICMSDiferenciada write SetAliqICMSDiferenciada;
    property  ICMSNaoDeduzTotal: Integer read GetICMSNaoDeduzTotal write SetICMSNaoDeduzTotal;
    property  ICMSBase: Double read GetICMSBase write SetICMSBase;
    property  AliquotaICMS: Double read GetAliquotaICMS write SetAliquotaICMS;
    property  FreteCompoeBaseICMSSubst: Integer read GetFreteCompoeBaseICMSSubst write SetFreteCompoeBaseICMSSubst;
    property  UnidadeEntrada: String read GetUnidadeEntrada write SetUnidadeEntrada;
    property  FatorConversao: Double read GetFatorConversao write SetFatorConversao;
    property  Acrescimo: Double read GetAcrescimo write SetAcrescimo;
    property  Desconto: Double read GetDesconto write SetDesconto;
    property  Valor: Double read GetValor write SetValor;
  end;

  //Devoluções de Entrada
  IDevolucoesEntrada = interface(IDBEditActions)
  ['{1975A8B9-65BA-4F33-A17A-ACCB83C27251}']
    procedure Open;
    function  Find(Codigo: String): Boolean;
    //
    function  GetCodigo: String;
    function  GetEstabelecimento: String;
    procedure SetEstabelecimento(const Value: String);
    function  GetCentroDeEstoque: String;
    procedure SetCentroDeEstoque(const Value: String);
    function  GetFornecedor: String;
    procedure SetFornecedor(const Value: String);
    function  GetNotaFiscal: String;
    procedure SetNotaFiscal(const Value: String );
    function  GetData: TDateTime;
    procedure SetData(Value: TDateTime);
    function  GetHora: TDateTime;
    procedure SetHora(Value: TDateTime);
    function  GetOBS: String;
    procedure SetOBS(const Value: String);
    function  GetItensDevolucao: IItensDevolucoesEntrada;
    //
    property  Codigo: String read GetCodigo;
    property  Estabelecimento: String read GetEstabelecimento write SetEstabelecimento;
    property  CentroDeEstoque: String read GetCentroDeEstoque write SetCentroDeEstoque;
    property  Fornecedor: String read GetFornecedor write SetFornecedor;
    property  NotaFiscal: String read GetNotaFiscal write SetNotaFiscal;
    property  Data: TDateTime read GetData write SetData;
    property  Hora: TDateTime read GetHora write SetHora;
    property  OBS: String read GetOBS write SetOBS;
    property  ItensDevolucao: IItensDevolucoesEntrada read GetItensDevolucao;
  end;

  //Intes das Devoluções de Entrada
  IItensDevolucoesEntrada = interface(IDBEditAndNavigateActions)
  ['{BA25DAF1-9BA3-4715-84AF-8CB0C21AEA90}']
    function  Find(Codigo: String; Sequencial: Integer): Boolean;
    function  Open: Boolean;
    //
    function  GetCodigo: String;
    function  GetSequencial: Integer;
    procedure SetSequencial(const Value: Integer);
    function  GetItem: String;
    procedure SetItem(const Value: String);
    function  GetQuantidade: Double;
    procedure SetQuantidade(Value: Double);
    function  GetLOT_Sequencial: Integer;
    procedure SetLOT_Sequencial(Value: Integer);
    procedure ApplyUpdatesIDF;
    //
    property  Codigo: String read GetCodigo;
    property  Sequencial: Integer read GetSequencial write SetSequencial;
    property  Item: String read GetItem write SetItem;
    property  Quantidade: Double read GetQuantidade write SetQuantidade;
    property  LOT_Sequencial: Integer read GetLOT_Sequencial write SetLOT_Sequencial;
  end;

  //Devoluções de Saída
  IDevolucoesSaida = interface(IDBEditActions)
  ['{BFCEAC76-2988-409A-8A70-D66BC5DC07B3}']  
    procedure Open;
    function  Find(Codigo: String): Boolean;
    //
    function  GetCodigo: String;
    function  GetEstabelecimento: String;
    procedure SetEstabelecimento(const Value: String);
    function  GetCentroDeEstoque: String;
    procedure SetCentroDeEstoque(const Value: String);
    function  GetCentroDeResultados: String;
    procedure SetCentroDeResultados(const Value: String);
    function  GetCentroDeResultadosDestino: String;
    procedure SetCentroDeResultadosDestino(const Value: String);
    function  GetNumeroNotaFiscal: String;
    procedure SetNumeroNotaFiscal(const Value: String );
    function  GetEspecie: String;
    procedure SetEspecie(const Value: String);
    function  GetData: TDateTime;
    procedure SetData(Value: TDateTime);
    function  GetHora: TDateTime;
    procedure SetHora(Value: TDateTime);
    function  GetOBS: String;
    procedure SetOBS(const Value: String);
    function  GetItensDevolucoesSaida: IItensDevolucoesSaida;
    //
    property  Codigo: String read GetCodigo;
    property  Estabelecimento: String read GetEstabelecimento write SetEstabelecimento;
    property  CentroDeEstoque: String read GetCentroDeEstoque write SetCentroDeEstoque;
    property  CentroDeResultados: String read GetCentroDeResultados write SetCentroDeResultados;
    property  CentroDeResultadosDestino: String read GetCentroDeResultadosDestino write SetCentroDeResultadosDestino;
    property  NumeroNotaFiscal: String read GetNumeroNotaFiscal write SetNumeroNotaFiscal;
    property  Especie: String read GetEspecie write SetEspecie;
    property  Data: TDateTime read GetData write SetData;
    property  Hora: TDateTime read GetHora write SetHora;
    property  OBS: String read GetOBS write SetOBS;
    property  ItensDevolucoesSaida: IItensDevolucoesSaida read GetItensDevolucoesSaida;
  end;

  //Itens das Devoluções de Saída
  IItensDevolucoesSaida = interface(IDBEditAndNavigateActions)
  ['{FDBDD4C4-12D1-4116-B363-4CDDD229C9C7}']
    function  Find(Codigo: String; Sequencial: Integer): Boolean;
    function  Open: Boolean;
    //
    function  GetCodigo: String;
    function  GetSequencial: Integer;
    procedure SetSequencial(const Value: Integer);
    function  GetItem: String;
    procedure SetItem(const Value: String);
    function  GetQuantidade: Double;
    procedure SetQuantidade(Value: Double);
    function  GetLOT_Sequencial: Integer;
    procedure SetLOT_Sequencial(Value: Integer);
    procedure ApplyUpdatesIDI;
    //
    property  Codigo: String read GetCodigo;
    property  Sequencial: Integer read GetSequencial write SetSequencial;
    property  Item: String read GetItem write SetItem;
    property  Quantidade: Double read GetQuantidade write SetQuantidade;
    property  LOT_Sequencial: Integer read GetLOT_Sequencial write SetLOT_Sequencial;
  end;

  //Requisições
  IRequisicoes = interface(IDBEditAndNavigateActions)
  ['{4D348269-AEF2-4D9D-B219-6614AF4CBD4C}']
    procedure Open;
    function  Find(Codigo: String): Boolean;
    function  FindRequisicoes(CodCentroDeResultados, CodGrupoItem: String; Data: TDateTime): Boolean;
    //
    function  GetCodigo: String;
    function  GetEstabelecimento: String;
    function  GetEmpresa: String;
    procedure SetEstabelecimento(const Value: String);
    procedure SetEmpresa(const Value: String);
    function  GetCentroDeResultados: String;
    procedure SetCentroDeResultados(const Value: String);
    function  GetRequisitante: String;
    procedure SetRequisitante(const Value: String);
    function  GetUsuarioResponsavel: String;
    procedure SetUsuarioResponsavel(const Value: String);
    function  GetCentroDeEstoque: String;
    procedure SetCentroDeEstoque(const Value: String);
    function  GetData: TDateTime;
    procedure SetData(Value: TDateTime);
    function  GetOBS: String;
    procedure SetOBS(const Value: String);
    function  GetDocumento: String;
    procedure SetDocumento(const Value: String);
    function  GetItensRequisicao: IItensRequisicao;

    //
    property  Codigo: String read GetCodigo;
    property  Estabelecimento: String read GetEstabelecimento write SetEstabelecimento;
    property  Empresa: String read GetEmpresa write SetEmpresa;
    property  Requisitante: String read GetRequisitante write SetRequisitante;
    property  UsuarioResponsavel: String read GetUsuarioResponsavel write SetUsuarioResponsavel;
    property  CentroDeEstoque: String read GetCentroDeEstoque write SetCentroDeEstoque;
    property  CentroDeResultados: String read GetCentroDeResultados write SetCentroDeResultados;
    property  Data: TDateTime read GetData write SetData;
    property  OBS: String read GetOBS write SetOBS;
    property  Documento: String read GetDocumento write SetDocumento;
    property  ItensRequisicao: IItensRequisicao read GetItensRequisicao;
  end;

  //Itens da Requisição
  IItensRequisicao = interface(IDBEditAndNavigateActions)
  ['{4153501E-5361-42F3-AE56-60738BF6F1C3}']
    function Find(const RIT_Codigo, PRO_Codigo: string): Boolean;
    function Locate(const RIT_Codigo, PRO_Codigo: string): Boolean;
    function Open: Boolean;
    //
    function GetCodigo: String;
    function GetItem: String;
    procedure SetItem(const Value: String);
    function GetQuantidade: Double;
    procedure SetQuantidade(Value: Double);
    function GetOBS: String;
    procedure SetOBS(const Value: String);
    procedure ApplyUpdatesIRE;
    //
    property Codigo: String read GetCodigo;
    property Item: String read GetItem write SetItem;
    property Quantidade: Double read GetQuantidade write SetQuantidade;
    property OBS: String read GetOBS write SetOBS;
  end;

  //Centro de Estoque
  ICentroEstoque = interface(IDBEditActions)
  ['{4D348269-AEF2-4D9D-B219-6614AF4CBD4C}']
    function  getListaCES(CES_Mae: String): IListaCES;
    procedure Open;
    function  Find(Codigo: String): Boolean;
    //
    function  GetCodigo: String;
    procedure SetCodigo(const Value: String);
    function  GetCES_Codigo_Mae: String;
    procedure SetCES_Codigo_Mae(const Value: String);
    function  GetNome: String;
    procedure SetNome(const Value: String);
    //
    property  Codigo: String read GetCodigo write SetCodigo;
    property  CES_Codigo_Mae: String read GetCES_Codigo_Mae write SetCES_Codigo_Mae;
    property  Nome: String read GetNome write SetNome;
  end;

  // Adiantamento de ClienteS
  IAdiantamentoCliente = interface(IDBEditActions)
  ['{CAFC9079-E3B4-49A8-ADF6-6A7BB6DE9666}']
    procedure Open;
    function Find(Codigo: String): Boolean;
    function FindIDWS(IDWS: String): Boolean;

    function GetCodigo: String;
    function GetEstabelecimento: String;
    procedure SetEstabelecimento(const Value: String);
    function GetContaFinanceira: String;
    procedure SetContaFinanceira(const Value: String);
    function GetData: TDateTime;
    procedure SetData(const Value: TDateTime);
    function GetCentroResultados: String;
    procedure SetCentroResultados(const Value: String);
    function GetReceitaAdiantamento: String;
    procedure SetReceitaAdiantamento(const Value: String);
    function GetCliente: String;
    procedure SetCliente(const Value: String);
    function GetValor: Double;
    procedure SetValor(const Value: Double);
    function GetObservacao: String;
    procedure SetObservacao(const Value: String);
    function GetExportaAC: Integer;
    procedure SetExportaAC(const Value: Integer);
    //
    property  Codigo: String read GetCodigo;
    property  Estabelecimento: String read GetEstabelecimento write SetEstabelecimento;
    property  ContaFinanceira: String read GetContaFinanceira write SetContaFinanceira;
    property  Data: TDateTime read GetData write SetData;
    property  CentroResultados: String read GetCentroResultados write SetCentroResultados;
    property  ReceitaAdiantamento: String read GetReceitaAdiantamento write SetReceitaAdiantamento;
    property  Cliente: String read GetCliente write SetCliente;
    property  Valor: Double read GetValor write SetValor;
    property  Observacao: String read GetObservacao write SetObservacao;
    property  ExportaAC: Integer read GetExportaAC write SetExportaAC;
  end;

  // Contas a Receber
  IContasaReceber = interface(IDBEditActions)
  ['{EAB3087A-52F6-434B-92C1-BBC65B643A2B}']
    procedure Open;
    function  Find(Codigo: String): Boolean;
    function FindIDWS(IDWS: String): Boolean;
    //
    function  GetCodigoWithDocumento(aDocumento: String): String;
    function  GetCodigoWithBoleto(aBoleto: String; aIdBloquete: Integer = 1): String;
    function  CancelaVencimentosDiversosEmAberto(aDtCancel: TDateTime; aMotCancel: String): String;
    function  AlteraVencimentoDiversoEmAberto(aNewDtVenc: TDateTime; aOldNrBoleto, aNewNrBoleto: String; aOldIdBloquete, aNewIdBloquete: Integer): String;
    function  GetListaVencimentosEmAberto: TStringList;
    //
    function  GetCodigo: String;
    function  GetEstabelecimento: String;
    procedure SetEstabelecimento(const Value: String);
    function  GetCentroResultados: String;
    procedure SetCentroResultados(const Value: String);
    function  GetCliente: String;
    procedure SetCliente(const Value: String);
    function  GetCodigoCliente: String;
    procedure SetCodigoCliente(const Value: String);
    function  GetReceita: String;
    procedure SetReceita(const Value: String);
    function  GetDocumento: String;
    procedure SetDocumento(const Value: String);
    function  GetTipoGeracao: String;
    procedure SetTipoGeracao(const Value: String);
    function  GetEmissao: TDateTime;
    procedure SetEmissao(Value: TDateTime);
    function  GetValor: Double;
    function  GetISS: Double;
    procedure SetISS(Value: Double);
    function  GetIRRF: Double;
    procedure SetIRRF(Value: Double);
    function  GetINSS: Double;
    procedure SetINSS(Value: Double);
    function  GetPIS: Double;
    procedure SetPIS(Value: Double);
    function  GetCOFINS: Double;
    procedure SetCOFINS(Value: Double);
    function  GetCSLL: Double;
    procedure SetCSLL(Value: Double);
    function  GetDescontoIncondicional: Double;
    function  GetExportaAC: Integer;
    procedure SetExportaAC(Value: Integer);
    function  GetOBS: String;
    procedure SetOBS(const Value: String);
    function  GetMesAno: String;
    procedure SetMesAno(const Value: String);
    function  GetVencimentosaReceber: IVencimentosaReceber;
    function  GetVencimentosChequesaReceber: IVencimentosChequesaReceber;
    function  GetVencimentosCartoesaReceber: IVencimentosCartoesaReceber;
    function  GetServicosaReceber: IServicosaReceber;
    function  GetItensaReceber: IItensaReceber;
    function  GetRateiosaReceber: IRateiosaReceber;
    procedure SetIDWS(const Value: String);
    function GetIDWS: String;
    //
    property  Codigo: String read GetCodigo;
    property  Estabelecimento: String read GetEstabelecimento write SetEstabelecimento;
    property  CentroResultados: String read GetCentroResultados write SetCentroResultados;
    property  Cliente: String read GetCliente write SetCliente;
    property  CodigoCliente: String read GetCodigoCliente write SetCodigoCliente;
    property  Receita: String read GetReceita write SetReceita;
    property  Documento: String read GetDocumento write SetDocumento;
    property  TipoGeracao: String read GetTipoGeracao write SetTipoGeracao;
    property  Emissao: TDateTime read GetEmissao write SetEmissao;
    property  Valor: Double read GetValor;
    property  ISS: Double read GetISS write SetISS;
    property  IRRF: Double read GetIRRF write SetIRRF;
    property  INSS: Double read GetINSS write SetINSS;
    property  PIS: Double read GetPIS write SetPIS;
    property  COFINS: Double read GetCOFINS write SetCOFINS;
    property  CSLL: Double read GetCSLL write SetCSLL;
    property  DescontoIncondicional: Double read GetDescontoIncondicional;
    property  ExportaAC: Integer read GetExportaAC write SetExportaAC;
    property  Obs: String read GetObs write SetObs;
    property  MesAno: String read GetMesAno write SetMesAno;
    property  VencimentosaReceber: IVencimentosaReceber read GetVencimentosaReceber;
    property  VencimentosChequesaReceber: IVencimentosChequesaReceber read GetVencimentosChequesaReceber;
    property  VencimentosCartoesaReceber: IVencimentosCartoesaReceber read GetVencimentosCartoesaReceber;
    property  ServicosaReceber: IServicosaReceber read GetServicosaReceber;
    property  ItensaReceber: IItensaReceber read GetItensaReceber;
    property  RateiosaReceber: IRateiosaReceber read GetRateiosaReceber;
    property IDWS: String read GetIDWS write SetIDWS;
  end;

  IVencimentosaReceber = interface(IDBEditAndNavigateActions)
  ['{1E58976D-0E8E-4373-BBF3-D51CC328A3A7}']
    function  Open: Boolean;
    function  Find(Codigo: String; Sequencial: Integer): Boolean;
    //
    procedure CancelarVencimento(aData: TDateTime; aMotivo: String);
    function ExluirTodasBaixas: Boolean;
    function  ValorEmAberto(aCRE_Codigo: String; aSequencial: Integer): Double;
    //
    function  GetCodigo: String;
    function  GetSequencial: Integer;
    procedure SetSequencial(Value: Integer);
    function  GetVencimento: TDateTime;
    procedure SetVencimento(Value: TDateTime);
    function  GetValor: Double;
    procedure SetValor(Value: Double);
    function  GetTipoDocumento: String;
    procedure SetTipoDocumento(const Value: String);
    function  GetTitulo: String;
    procedure SetTitulo(const Value: String);
    function  GetAgenteCobrador: String;
    procedure SetAgenteCobrador(const Value: String);
    function  GetNrBoleto: String;
    procedure SetNrBoleto(const Value: String);
    function  GetIdBloquete: Integer;
    procedure SetIdBloquete(Value: Integer);
    function  GetDtCancel: TDateTime;
    function  GetDescontoPrevisto: Double;
    procedure SetDescontoPrevisto(Value: Double);
    function  GetQuitado: Integer;
    procedure SetQuitado(Value: Integer);
    //
    property  Codigo: String read GetCodigo;
    property  Sequencial: Integer read GetSequencial write SetSequencial;
    property  Vencimento: TDateTime read GetVencimento write SetVencimento;
    property  Valor: Double read GetValor write SetValor;
    property  TipoDocumento: String read GetTipoDocumento write SetTipoDocumento;
    property  Titulo: String read GetTitulo write SetTitulo;
    property  AgenteCobrador: String read GetAgenteCobrador write SetAgenteCobrador;
    property  NrBoleto: String read GetNrBoleto write SetNrBoleto;
    property  IdBloquete: Integer read GetIdBloquete write SetIdBloquete;
    property  DtCancel: TDateTime read GetDtCancel;
    property  DescontoPrevisto: Double read GetDescontoPrevisto write SetDescontoPrevisto;
    property  Quitado: Integer read GetQuitado write SetQuitado;
  end;

  IVencimentosChequesaReceber = interface(IDBEditAndNavigateActions)
  ['{2B5857CD-E3EE-4DA1-8C87-0BC53DB16161}']
    function  Find(Codigo: String; Sequencial: Integer): Boolean;
    function  Open:Boolean;
    //
    procedure CancelarVencimento(aData: TDateTime; aMotivo: String);
    function  ValorEmAberto(aCRE_Codigo: String; aSequencial: Integer): Double;
    //
    function  GetCodigo: String;
    function  GetSequencial: Integer;
    procedure SetSequencial(Value: Integer);
    function  GetBanco: String;
    procedure SetBanco(Value: String);
    function  GetBancoNumero: String;
    procedure SetBancoNumero(const Value: String);
    function  GetAgencia: String;
    procedure SetAgencia(Value: String);
    function  GetCC: String;
    procedure SetCC(Value: String);
    function  GetNumero: String;
    procedure SetNumero(Value: String);
    function  GetTitular: String;
    procedure SetTitular(Value: String);
    function  GetVencimento: TDateTime;
    procedure SetVencimento(Value: TDateTime);
    function  GetValor: Double;
    procedure SetValor(Value: Double);
    function  GetDtCancel: TDateTime;
    function  GetQuitado: Integer;
    procedure SetQuitado(Value: Integer);
    //
    property  Codigo: String read GetCodigo;
    property  Sequencial: Integer read GetSequencial write SetSequencial;
    property  Banco: String read GetBanco write SetBanco;
    property  BancoNumero: string read GetBancoNumero write SetBancoNumero;
    property  Agencia: String read GetAgencia write SetAgencia;
    property  CC: String read GetCC write SetCC;
    property  Numero: String read GetNumero write SetNumero;
    property  Titular: String read GetTitular write SetTitular;
    property  Vencimento: TDateTime read GetVencimento write SetVencimento;
    property  Valor: Double read GetValor write SetValor;
    property  DtCancel: TDateTime read GetDtCancel;
    property  Quitado: Integer read GetQuitado write SetQuitado;
  end;

  IVencimentosCartoesaReceber = interface(IDBEditAndNavigateActions)
  ['{EC9A4EDF-BFDE-4B8F-8B33-127D15F4FE6B}']
    function  Find(Codigo: String; Sequencial: Integer): Boolean;
    function  Open:Boolean;
    //
    procedure CancelarVencimento(aData: TDateTime; aMotivo: String);
    function  ValorEmAberto(aCRE_Codigo: String; aSequencial: Integer): Double;
    //
    function  GetCodigo: String;
    function  GetSequencial: Integer;
    procedure SetSequencial(Value: Integer);
    function  GetVencimento: TDateTime;
    procedure SetVencimento(Value: TDateTime);
    function  GetValor: Double;
    procedure SetValor(Value: Double);
    function  GetAdministradora: String;
    procedure SetAdministradora(Value: String);
    function  GetDtCancel: TDateTime;
    function  GetTAD_Valor: Double;
    procedure SetTAD_Valor(Value: Double);
    function  GetQuitado: Integer;
    procedure SetQuitado(Value: Integer);

    property  Codigo: String read GetCodigo;
    property  Sequencial: Integer read GetSequencial write SetSequencial;
    property  Vencimento: TDateTime read GetVencimento write SetVencimento;
    property  Valor: Double read GetValor write SetValor;
    property  Administradora: String read GetAdministradora write SetAdministradora;
    property  DtCancel: TDateTime read GetDtCancel;
    property  TAD_Valor: Double read GetTAD_Valor write SetTAD_Valor;
    property  Quitado: Integer read GetQuitado write SetQuitado;
  end;

  IComissionadosServicosaReceber = interface(IDBEditAndNavigateActions)
  ['{832C9750-95F8-427B-A19E-247521979B37}']
    function  Find(CRE_Codigo: String; SCR_Sequencial: Integer; VRP_Codigo: String; Sequencial: Integer): Boolean;
    function  Open: Boolean;
    //
    function  GetCodigoContasAReceber: String;
    function  GetSequencialServicoContasAReceber: Integer;
    function  GetVendedorRepresentante: String;
    procedure SetVendedorRepresentante(const Value: String);
    function  GetSequencial: Integer;
    procedure SetSequencial(const Value: Integer);
    function  GetPercentualComissao: Double;
    procedure SetPercentualComissao(Value: Double);
    //
    property  CodigoContasAReceber: String read GetCodigoContasAReceber;
    property  SequencialServicoContasAReceber: Integer read GetSequencialServicoContasAReceber;
    property  VendedorRepresentante: String read GetVendedorRepresentante write SetVendedorRepresentante;
    property  Sequencial: Integer read GetSequencial write SetSequencial;
    property  PercentualComissao: Double read GetPercentualComissao write SetPercentualComissao;
  end;

  IServicosaReceber = interface(IDBEditAndNavigateActions)
  ['{FF652AFD-2181-4420-945F-7BE5E87ED461}']
    function  Find(Codigo: String; Sequencial: Integer): Boolean;
    function  Open: Boolean;
    //
    function  GetCodigo: String;
    function  GetSequencial: Integer;
    procedure SetSequencial(const Value: Integer);
    function  GetServico: String;
    procedure SetServico(const Value: String);
    function  GetModalidade: String;
    procedure SetModalidade(const Value: String);
    function  GetValor: Double;
    procedure SetValor(Value: Double);
    function  GetComissionadosServicosaReceber: IComissionadosServicosaReceber;
    procedure ApplyUpdatesSCR;
    function  GetDescontoIncondicional: Double;
    procedure SetDescontoIncondicional(Value: Double);
    function  GetValorLiquido: Double;

    //
    property  Codigo: String read GetCodigo;
    property  Sequencial: Integer read GetSequencial write SetSequencial;
    property  Servico: String read GetServico write SetServico;
    property  Modalidade: String read GetModalidade write SetModalidade;
    property  Valor: Double read GetValor write SetValor;
    property  ComissionadosServicosaReceber: IComissionadosServicosaReceber read GetComissionadosServicosaReceber;
    property  DescontoIncondicional: Double read GetDescontoIncondicional write SetDescontoIncondicional;
    property  ValorLiquido: Double read GetValorLiquido;
  end;

  IItensaReceber = interface(IDBEditAndNavigateActions)
  ['{62EF9A1B-15A3-4349-BDF7-93972223538F}']
    function  Find(Codigo: String; Sequencial: Integer): Boolean;
    function  Open: Boolean;
    //
    function  GetCodigo: String;
    function  GetSequencial: Integer;
    procedure SetSequencial(const Value: Integer);
    function  GetItem: String;
    procedure SetItem(const Value: String);
    function  GetQuantidade: Double;
    procedure SetQuantidade(Value: Double);
    function  GetValor: Double;
    procedure SetValor(Value: Double);
    function  GetCFOP_Codigo: String;
    procedure SetCFOP_Codigo(const Value: String);
    function  GetSTA_Codigo: String;
    procedure SetSTA_Codigo(const Value: String);
    function  GetSTB_Codigo: String;
    procedure SetSTB_Codigo(const Value: String);
    procedure ApplyUpdatesICR;
    //
    property  Codigo: String read GetCodigo;
    property  Sequencial: Integer read GetSequencial write SetSequencial;
    property  Item: String read GetItem write SetItem;
    property  Quantidade: Double read GetQuantidade write SetQuantidade;
    property  Valor: Double read GetValor write SetValor;
    property  CFOP_Codigo: String read GetCFOP_Codigo write SetCFOP_Codigo;
    property  STA_Codigo: String read GetSTA_Codigo write SetSTA_Codigo;
    property  STB_Codigo: String read GetSTB_Codigo write SetSTB_Codigo;
  end;

  IRateiosaReceber = interface(IDBEditAndNavigateActions)
  ['{FAD9FBEC-5683-4648-B6B2-DA9426965D72}']
    function  Find(CodEstabelecimento, CodReceita, CodCentroResultados: String): Boolean;
    function  Open: Boolean;
    //
    function  GetCodigo: String;
    function  GetEstabelecimento: String;
    procedure SetEstabelecimento(const Value: String);
    function  GetCentroDeResultados: String;
    procedure SetCentroDeResultados(const Value: String);
    function  GetReceita: String;
    procedure SetReceita(const Value: String);
    function  GetObservacao: String;
    procedure SetObservacao(const Value: String);
    function  GetValor: Double;
    procedure SetValor(Value: Double);
    procedure ApplyUpdatesRRR;
    //
    property  Codigo: String read GetCodigo;
    property  Estabelecimento: String read GetEstabelecimento write SetEstabelecimento;
    property  CentroDeResultados: String read GetCentroDeResultados write SetCentroDeResultados;
    property  Receita: String read GetReceita write SetReceita;
    property  Observacao: String read GetObservacao write SetObservacao;
    property  Valor: Double read GetValor write SetValor;
  end;

  // Baixas dos Vencimentos do Contas a Receber
  IBaixaVencimentoaReceber = interface(IDBEditActions)
  ['{0C04DB06-B83F-4FF8-BC74-FDA06F93C818}']
    procedure Open;
    function  Find(Codigo: String; SequencialVencimento, Sequencial: Integer): Boolean;
    //
    procedure CancelarBaixa(aData: TDateTime; aMotivo: String);
    //
    function  GetCRE_Codigo: String;
    procedure SetCRE_Codigo(const Value: String);
    function  GetSequencialVencimento: Integer;
    procedure SetSequencialVencimento(Value: Integer);
    function  GetSequencial: Integer;
    procedure SetSequencial(Value: Integer);
    function  GetData: TDateTime;
    procedure SetData(Value: TDateTime);
    function  GetValor: Double;
    procedure SetValor(Value: Double);
    function  GetDesconto: Double;
    procedure SetDesconto(Value: Double);
    function  GetJuros: Double;
    procedure SetJuros(Value: Double);
    function  GetMulta: Double;
    procedure SetMulta(Value: Double);
    function  GetDtCancel: TDateTime;
    function  GetMotivoCancel: String;
    function  GetExportaAC: Integer;
    procedure SetExportaAC(Value: Integer);
    // Necessários para a geração do lançamento
    procedure SetLAN_ContaFinanceira(const Value: String);
    procedure SetLAN_Historico(const Value: String);
    procedure SetLAN_CRD_Desconto(const Value: String);
    procedure SetLAN_CRD_Juros(const Value: String);
    procedure SetLAN_CRD_Multa(const Value: String);
    procedure SetLAN_CRS_Desconto(const Value: String);
    procedure SetLAN_CRS_Juros(const Value: String);
    procedure SetLAN_CRS_Multa(const Value: String);
    //
    property  CRE_Codigo: String read GetCRE_Codigo write SetCRE_Codigo;
    property  SequencialVencimento: Integer read GetSequencialVencimento write SetSequencialVencimento;
    property  Sequencial: Integer read GetSequencial write SetSequencial;
    property  Data: TDateTime read GetData write SetData;
    property  Valor: Double read GetValor write SetValor;
    property  Desconto: Double read GetDesconto write SetDesconto;
    property  Juros: Double read GetJuros write SetJuros;
    property  Multa: Double read GetMulta write SetMulta;
    property  DtCancel: TDateTime read GetDtCancel;
    property  MotivoCancel: String read GetMotivoCancel;
    property  ExportaAC: Integer read GetExportaAC write SetExportaAC;
    // Necessários para a geração do lançamento
    property  LAN_ContaFinanceira: String write SetLAN_ContaFinanceira;
    property  LAN_Historico: String write SetLAN_Historico;
    property  LAN_CRD_Desconto: String write SetLAN_CRD_Desconto;
    property  LAN_CRD_Juros: String write SetLAN_CRD_Juros;
    property  LAN_CRD_Multa: String write SetLAN_CRD_Multa;
    property  LAN_CRS_Desconto: String write SetLAN_CRS_Desconto;
    property  LAN_CRS_Juros: String write SetLAN_CRS_Juros;
    property  LAN_CRS_Multa: String write SetLAN_CRS_Multa;
  end;

  // Baixas dos Vencimentos Cheque do Contas a Receber
  IBaixaVencimentoChequeaReceber = interface(IDBEditActions)
  ['{A87DD286-FE23-4885-B468-C6577102B183}']
    procedure Open;
    function  Find(Codigo: String; SequencialVencimento, Sequencial: Integer): Boolean;
    //
    procedure CancelarBaixa(aData: TDateTime; aMotivo: String);
    //
    function  GetCRE_Codigo: String;
    procedure SetCRE_Codigo(const Value: String);
    function  GetSequencialVencimento: Integer;
    procedure SetSequencialVencimento(Value: Integer);
    function  GetSequencial: Integer;
    procedure SetSequencial(Value: Integer);
    function  GetData: TDateTime;
    procedure SetData(Value: TDateTime);
    function  GetValor: Double;
    procedure SetValor(Value: Double);
    function  GetDesconto: Double;
    procedure SetDesconto(Value: Double);
    function  GetJuros: Double;
    procedure SetJuros(Value: Double);
    function  GetDtCancel: TDateTime;
    function  GetMotivoCancel: String;
    function  GetExportaAC: Integer;
    procedure SetExportaAC(Value: Integer);
    // Necessários para a geração do lançamento
    procedure SetLAN_ContaFinanceira(const Value: String);
    procedure SetLAN_Historico(const Value: String);
    procedure SetLAN_CRD_Desconto(const Value: String);
    procedure SetLAN_CRD_Juros(const Value: String);
    //
    property  CRE_Codigo: String read GetCRE_Codigo write SetCRE_Codigo;
    property  SequencialVencimento: Integer read GetSequencialVencimento write SetSequencialVencimento;
    property  Sequencial: Integer read GetSequencial write SetSequencial;
    property  Data: TDateTime read GetData write SetData;
    property  Valor: Double read GetValor write SetValor;
    property  Desconto: Double read GetDesconto write SetDesconto;
    property  Juros: Double read GetJuros write SetJuros;
    property  DtCancel: TDateTime read GetDtCancel;
    property  MotivoCancel: String read GetMotivoCancel;
    property  ExportaAC: Integer read GetExportaAC write SetExportaAC;
    // Necessários para a geração do lançamento
    property  LAN_ContaFinanceira: String write SetLAN_ContaFinanceira;
    property  LAN_Historico: String write SetLAN_Historico;
    property  LAN_CRD_Desconto: String write SetLAN_CRD_Desconto;
    property  LAN_CRD_Juros: String write SetLAN_CRD_Juros;
  end;

  // Baixas dos Vencimentos Cartões do Contas a Receber
  IBaixaVencimentoCartaoaReceber = interface(IDBEditActions)
  ['{7F98BBE9-4E59-48F5-AECA-32731C566330}']
    procedure Open;
    function  Find(Codigo: String; SequencialVencimento, Sequencial: Integer): Boolean;
    //
    procedure CancelarBaixa(aData: TDateTime; aMotivo: String);
    //
    function  GetCRE_Codigo: String;
    procedure SetCRE_Codigo(const Value: String);
    function  GetSequencialVencimento: Integer;
    procedure SetSequencialVencimento(Value: Integer);
    function  GetSequencial: Integer;
    procedure SetSequencial(Value: Integer);
    function  GetData: TDateTime;
    procedure SetData(Value: TDateTime);
    function  GetValor: Double;
    procedure SetValor(Value: Double);
    function  GetTaxa: Double;
    procedure SetTaxa(Value: Double);
    function  GetDtCancel: TDateTime;
    function  GetMotivoCancel: String;
    function  GetExportaAC: Integer;
    procedure SetExportaAC(Value: Integer);
    // Necessários para a geração do lançamento
    procedure SetLAN_ContaFinanceira(const Value: String);
    procedure SetLAN_Historico(const Value: String);
    procedure SetLAN_CRD_Taxa(const Value: String);
    //
    property  CRE_Codigo: String read GetCRE_Codigo write SetCRE_Codigo;
    property  SequencialVencimento: Integer read GetSequencialVencimento write SetSequencialVencimento;
    property  Sequencial: Integer read GetSequencial write SetSequencial;
    property  Data: TDateTime read GetData write SetData;
    property  Valor: Double read GetValor write SetValor;
    property  Taxa: Double read GetTaxa write SetTaxa;
    property  DtCancel: TDateTime read GetDtCancel;
    property  MotivoCancel: String read GetMotivoCancel;
    property  ExportaAC: Integer read GetExportaAC write SetExportaAC;
    // Necessários para a geração do lançamento
    property  LAN_ContaFinanceira: String write SetLAN_ContaFinanceira;
    property  LAN_Historico: String write SetLAN_Historico;
    property  LAN_CRD_Taxa: String write SetLAN_CRD_Taxa;
  end;

  // Notas fiscais de entrada
  INotasFiscaisEntrada = interface(IDBEditActions)
  ['{3CB50095-E6F3-47AA-87AE-BFDED72A1C7F}']
    procedure Open;
    function  Find(Sequencial: Integer): Boolean;
    //
    function  GetSequencial: Integer;
    function  GetEstabelecimento: String;
    procedure SetEstabelecimento(const Value: String);
    function  GetDtEntrada: TDateTime;
    procedure SetDtEntrada(const Value: TDateTime);
    function  GetDtEmissao: TDateTime;
    procedure SetDtEmissao(const Value: TDateTime);
    function  GetNumero: String;
    procedure SetNumero(const Value: String);
    function  GetEspecie: String;
    procedure SetEspecie(const Value: String);
    function  GetSerieSubserie: String;
    procedure SetSerieSubserie(const Value: String);
    function  GetCFOP_Codigo: String;
    procedure SetCFOP_Codigo(const Value: String);
    function  GetFrete: String;
    procedure SetFrete(const Value: String);
    function  GetICMSBase: Double;
    procedure SetICMSBase(const Value: Double);
    function  GetICMSAliq: Double;
    procedure SetICMSAliq(const Value: Double);
    function  GetICMSValor: Double;
    procedure SetICMSValor(const Value: Double);
    function  GetICMSIsentas: Double;
    procedure SetICMSIsentas(const Value: Double);
    function  GetICMSOutras: Double;
    procedure SetICMSOutras(const Value: Double);
    function  GetICMSDifAliq: Double;
    procedure SetICMSDifAliq(const Value: Double);
    function  GetObs: String;
    procedure SetObs(const Value: String);
    function  GetFRN_Codigo: String;
    procedure SetFRN_Codigo(const Value: String);
    function  GetLAN_Codigo: String;
    procedure SetLAN_Codigo(const Value: String);
    function  GetValor: double;
    procedure SetValor(const Value: double);
    function  GetICMSDifBaseCalculo: double;
    procedure SetICMSDifBaseCalculo(const Value: double);
    function  GetICMSDifAliqOrig: double;
    procedure SetICMSDifAliqOrig(const Value: double);
    function  GetICMSDIfAliqInt: double;
    procedure SetICMSDIfAliqInt(const Value: double);
    function  GetCPG_Codigo: String;
    procedure SetCPG_Codigo(const Value: String);
    function  GetFormCont: integer;
    procedure SetFormCont(const Value: integer);
    function  GetConstrucaoCivil: integer;
    procedure SetConstrucaoCivil(const Value: integer);
    function  GetDtRetencaoISS: TDateTime;
    procedure SetDtRetencaoISS(const Value: TDateTime);
    function  GetTributacao: String;
    procedure SetTributacao(const Value: String);
    function  GetValorServicos: double;
    procedure SetValorServicos(const Value: double);
    function  GetAliqISS: double;
    procedure SetAliqISS(const Value: double);
    function  GetIPIBase: double;
    procedure SetIPIBase(const Value: double);
    function  GetIPIValor: double;
    procedure SetIPIValor(const Value: double);
    function  GetIPIIsentas: double;
    procedure SetIPIIsentas(const Value: double);
    function  GetIPIOutras: double;
    procedure SetIPIOutras(const Value: double);
    //
    property  Sequencial: Integer read GetSequencial;
    property  Estabelecimento: String read GetEstabelecimento write SetEstabelecimento;
    property  DtEntrada: TDateTime read GetDtEntrada write SetDtEntrada;
    property  DtEmissao: TDateTime read GetDtEmissao write SetDtEmissao;
    property  Numero: String read GetNumero write SetNumero;
    property  Especie: String read GetEspecie write SetEspecie;
    property  SerieSubserie: String read GetSerieSubserie write SetSerieSubserie;
    property  CFOP_Codigo: String read GetCFOP_Codigo write SetCFOP_Codigo;
    property  Frete: String read GetFrete write SetFrete;
    property  ICMSBase: Double read GetICMSBase write SetICMSBase;
    property  ICMSAliq: Double read GetICMSAliq write SetICMSAliq;
    property  ICMSValor: Double read GetICMSValor write SetICMSValor;
    property  ICMSIsentas: Double read GetICMSIsentas write SetICMSIsentas;
    property  ICMSOutras: Double read GetICMSOutras write SetICMSOutras;
    property  ICMSDifAliq: Double read GetICMSDifAliq write SetICMSDifAliq;
    property  Obs: String read GetObs write SetObs;
    property  FRN_Codigo: String read GetFRN_Codigo write SetFRN_Codigo;
    property  LAN_Codigo: String read GetLAN_Codigo write SetLAN_Codigo;
    property  Valor: double read GetValor write SetValor;
    property  ICMSDifBaseCalculo: double read GetICMSDifBaseCalculo write SetICMSDifBaseCalculo;
    property  ICMSDifAliqOrig: double read GetICMSDifAliqOrig write SetICMSDifAliqOrig;
    property  ICMSDIfAliqInt: double read GetICMSDIfAliqInt write SetICMSDIfAliqInt;
    property  CPG_Codigo: String read GetCPG_Codigo write SetCPG_Codigo;
    property  FormCont: integer read GetFormCont write SetFormCont;
    property  ConstrucaoCivil: integer read GetConstrucaoCivil write SetConstrucaoCivil;
    property  DtRetencaoISS: TDateTime read GetDtRetencaoISS write SetDtRetencaoISS;
    property  Tributacao: String read GetTributacao write SetTributacao;
    property  ValorServicos: double read GetValorServicos write SetValorServicos;
    property  AliqISS: double read GetAliqISS write SetAliqISS;
    property  IPIBase: double read GetIPIBase write SetIPIBase;
    property  IPIValor: double read GetIPIValor write SetIPIValor;
    property  IPIIsentas: double read GetIPIIsentas write SetIPIIsentas;
    property  IPIOutras: double read GetIPIOutras write SetIPIOutras;
  end;

  // Serviços do Cliente
  IServicosCliente = interface;

  // Clientes
  ICliente = interface(IDBEditActions)
  ['{D264BE57-F398-4646-B553-4F6E3F1ECDC4}']
    function  Find(CNPJCPF: String): Boolean;
    function  FindCodigo(Codigo: String): Boolean;
    function  FindIdentificador(Identificador: String): Boolean;
    function  VencimentosEmAberto: String;
    function  VencimentosBoletosEmAberto: String;
    function VencimentosGeral(ConsideraCancelados: Boolean = False): String;
    procedure CancelamentoTodosServicosAtivos(DtCancelamento: TDateTime; ObsCancel: String);
    //
    procedure Post(CriticaCPFCNPJ: Boolean = False);
    procedure Close;
    //
    function  GetCodigo: String;
    procedure SetCodigo(const Value: String);
    function  GetNome: String;
    procedure SetNome(const Value: String);
    function  GetNomeFantasia: String;
    procedure SetNomeFantasia(const Value: String);
    procedure SetSenhaPortal(const Value: String);
    function  GetSenhaPortal: String;
    function  GetCNPJCPF: String;
    procedure SetCNPJCPF(const Value: String);
    function  GetCEP: String;
    procedure SetCEP(const Value: String);
    function  GetLogradouro: String;
    procedure SetLogradouro(const Value: String);
    function  GetBairro: String;
    procedure SetBairro(const Value: String);
    function  GetNumero: String;
    procedure SetNumero(const Value: String);
    function  GetComplemento: String;
    procedure SetComplemento(const Value: String);
    function  GetUF: String;
    procedure SetUF(const Value: String);
    function  GetCidade: String;
    procedure SetCidade(const Value: String);
    function  GetDDD: String;
    procedure SetDDD(const Value: String);
    function  GetFone: String;
    procedure SetFone(const Value: String);
    function  GetFax: String;
    procedure SetFax(const Value: String);
    function  GetEmail: String;
    procedure SetEmail(const Value: String);
    function  GetContato: String;
    procedure SetContato(const Value: String);
    function  GetSite: String;
    procedure SetSite(const Value: String);
    function  GetRG: String;
    procedure SetRG(const Value: String);
    function  GetIE: String;
    procedure SetIE(const Value: String);
    function  GetGrupo: String;
    procedure SetGrupo(const Value: String);
    function  GetAgenteCobrador: String;
    procedure SetAgenteCobrador(const Value: String);
    function  GetReceita: String;
    procedure SetReceita(const Value: String);
    function  GetContaContabil: String;
    procedure SetContaContabil(const Value: String);
    function  GetExterior: Integer;
    procedure SetExterior(const Value: Integer);
    function  GetReferencia: String;
    procedure SetReferencia(const Value: String);
    function  GetVendedorRepresentante: String;
    procedure SetVendedorRepresentante(const Value: String);
    function  GetDiaVencimento: Integer;
    procedure SetDiaVencimento(const Value: Integer);
    function  GetEtiqueta: Integer;
    procedure SetEtiqueta(const Value: Integer);
    function  GetGeraNFAuto: Integer;
    procedure SetGeraNFAuto(const Value: Integer);
    function  GetRetemISS: Integer;
    procedure SetRetemISS(const Value: Integer);
    function  GetRetemINSS: Integer;
    procedure SetRetemINSS(const Value: Integer);
    function  GetIM: String;
    procedure SetIM(const Value: String);
    function  GetAliquotaISS: Double;
    procedure SetAliquotaISS(const Value: Double);
    function  GetCentroResultado: String;
    procedure SetCentroResultado(const Value: String);
    function GetIdentificador: String;
    procedure SetIdentificador(const Value: String);
    function GetCelular: String;
    procedure SetCelular(const Value: String);
    function GetDtNascimento: TDateTime;
    procedure SetDtNascimento(const Value: TDateTime);
    function GetSexo: String;
    procedure SetSexo(const Value: String);
    function GetRepresentante: String;
    procedure SetRepresentante(const Value: String);
    function  GetCampoExtra1: String;
    procedure SetCampoExtra1(const Value: String);
    function  GetCampoExtra2: String;
    procedure SetCampoExtra2(const Value: String);
    function  GetCampoExtra3: String;
    procedure SetCampoExtra3(const Value: String);
    function  GetCampoExtra4: String;
    procedure SetCampoExtra4(const Value: String);
    function  GetCampoExtra5: String;
    procedure SetCampoExtra5(const Value: String);
    function  GetCampoExtra6: String;
    procedure SetCampoExtra6(const Value: String);
    function  GetCampoExtra7: String;
    procedure SetCampoExtra7(const Value: String);
    function  GetCampoExtra8: String;
    procedure SetCampoExtra8(const Value: String);
    function  GetCampoExtra9: String;
    procedure SetCampoExtra9(const Value: String);
    function  GetCampoExtra10: String;
    procedure SetCampoExtra10(const Value: String);
    function  GetServicosCliente: IServicosCliente;
    //
    property  Codigo: String read GetCodigo write SetCodigo;
    property  Nome: String read GetNome write SetNome;
    property  NomeFantasia: String read GetNomeFantasia write SetNomeFantasia;
    property  SenhaPortal: String read GetSenhaPortal write SetSenhaPortal;
    property  CNPJCPF: String read GetCNPJCPF write SetCNPJCPF;
    property  CEP: String read GetCEP write SetCEP;
    property  Logradouro: String read GetLogradouro write SetLogradouro;
    property  Bairro: String read GetBairro write SetBairro;
    property  Numero: String read GetNumero write SetNumero;
    property  Complemento: String read GetComplemento write SetComplemento;
    property  UF: String read GetUF write SetUF;
    property  Cidade: String read GetCidade write SetCidade;
    property  DDD: String read GetDDD write SetDDD;
    property  Fone: String read GetFone write SetFone;
    property  Fax: String read GetFax write SetFax;
    property  Email: String read GetEmail write SetEmail;
    property  Contato: String read GetContato write SetContato;
    property  Site: String read GetSite write SetSite;
    property  RG: String read GetRG write SetRG;
    property  IE: String read GetIE write SetIE;
    property  Grupo: String read GetGrupo write SetGrupo;
    property  AgenteCobrador: String read GetAgenteCobrador write SetAgenteCobrador;
    property  Receita: String read GetReceita write SetReceita;
    property  ContaContabil: String read GetContaContabil write SetContaContabil;
    property  Representante: String read GetRepresentante write SetRepresentante;
    property  Exterior: Integer read GetExterior write SetExterior;
    property  Referencia: String read GetReferencia write SetReferencia;
    property  VendedorRepresentante: String read GetVendedorRepresentante write SetVendedorRepresentante;
    property  Vencimento: Integer read GetDiaVencimento write SetDiaVencimento;
    property  Etiqueta: Integer read GetEtiqueta write SetEtiqueta;
    property  GeraNFAuto: Integer read GetGeraNFAuto write SetGeraNFAuto;
    property  RetemISS: Integer read GetRetemISS write SetRetemISS;
    property  RetemINSS: Integer read GetRetemINSS write SetRetemINSS;
    property  IM: String read GetIM write SetIM;
    property  AliquotaISS: Double read GetAliquotaISS write SetAliquotaISS;
    property  CentroResultado: String read GetCentroResultado write SetCentroResultado;
    property  Identificador: String read GetIdentificador write SetIdentificador;
    property  Celular: String read GetCelular write SetCelular;
    property  DtNascimento: TDateTime read GetDtNascimento write SetDtNascimento;
    property  Sexo: String read GetSexo write SetSexo;
    property  CampoExtra1: String read GetCampoExtra1 write SetCampoExtra1;
    property  CampoExtra2: String read GetCampoExtra2 write SetCampoExtra2;
    property  CampoExtra3: String read GetCampoExtra3 write SetCampoExtra3;
    property  CampoExtra4: String read GetCampoExtra4 write SetCampoExtra4;
    property  CampoExtra5: String read GetCampoExtra5 write SetCampoExtra5;
    property  CampoExtra6: String read GetCampoExtra6 write SetCampoExtra6;
    property  CampoExtra7: String read GetCampoExtra7 write SetCampoExtra7;
    property  CampoExtra8: String read GetCampoExtra8 write SetCampoExtra8;
    property  CampoExtra9: String read GetCampoExtra9 write SetCampoExtra9;
    property  CampoExtra10: String read GetCampoExtra10 write SetCampoExtra10;
    property  ServicosCliente: IServicosCliente read GetServicosCliente;
  end;

  // Serviços do Cliente
  IServicosCliente = interface(IDBEditAndNavigateActions)
  ['{340E99A9-7853-42A4-8D9A-5A94E4E6B308}']
    function  Find(Codigo, SER_Codigo: String; Sequencial: Integer): Boolean;
    function  Open: Boolean;
    //
    function  GetProximoSequencial: Integer;
    function  GetServico: String;
    procedure SetServico(Value: String);
    procedure SetSequencial(Value: Integer);
    function  GetSequencial: Integer;
    function  GetEstabelecimento: String;
    procedure SetEstabelecimento(Value: String);
    function  GetModalidade: String;
    procedure SetModalidade(Value: String);
    function  GetIndexador: String;
    procedure SetIndexador(Value: String);
    function  GetQtdIndexador: Double;
    procedure SetQtdIndexador(Value: Double);
    function  GetAnoMesPrimeiraCobranca: String;
    procedure SetAnoMesPrimeiraCobranca(Value: String);
    function  GetAquisicao: TDateTime;
    procedure SetAquisicao(Value: TDateTime);
    function  GetAnoMesReajuste: String;
    procedure SetAnoMesReajuste(Value: String);
    function  GetObservacao: String;
    procedure SetObservacao(Value: String);
    function  GetDescricaoNota: String;
    procedure SetDescricaoNota(Value: String);
    function  GetComplementoDescricaoNota: String;
    procedure SetComplementoDescricaoNota(Value: String);
    function  GetContrato: String;
    procedure SetContrato(Value: String);
    function  GetDtCancelamento: TDateTime;
    procedure SetDtCancelamento(Value: TDateTime);
    function  GetObsCancelamento: String;
    procedure SetObsCancelamento(Value: String);
    function  GetCRS_Codigo: String;
    procedure SetCRS_Codigo(Value: String);
    function  GetDescPrevisto: Double;
    procedure SetDescPrevisto(Value: Double);
    //
    property  Servico: String read GetServico write SetServico;
    property  Sequencial: Integer read GetSequencial write SetSequencial;
    property  Estabelecimento: String read GetEstabelecimento write SetEstabelecimento;
    property  Modalidade: String read GetModalidade write SetModalidade;
    property  Indexador: String read GetIndexador write SetIndexador;
    property  QtdIndexador: Double read GetQtdIndexador write SetQtdIndexador;
    property  AnoMesPrimeiraCobranca: String read GetAnoMesPrimeiraCobranca write SetAnoMesPrimeiraCobranca;
    property  Aquisicao: TDateTime read GetAquisicao write SetAquisicao;
    property  AnoMesReajuste: String read GetAnoMesReajuste write SetAnoMesReajuste;
    property  Observacao: String read GetObservacao write SetObservacao;
    property  DescricaoNota: String read GetDescricaoNota write SetDescricaoNota;
    property  ComplementoDescricaoNota: String read GetComplementoDescricaoNota write SetComplementoDescricaoNota;
    property  Contrato: String read GetContrato write SetContrato;
    property  DtCancelamento: TDateTime read GetDtCancelamento write SetDtCancelamento;
    property  ObsCancelamento: String read GetObsCancelamento write SetObsCancelamento;
    property  CRS_Codigo: String read GetCRS_Codigo write SetCRS_Codigo;
    property  DescPrevisto: Double read GetDescPrevisto write SetDescPrevisto;
  end;

  IVendedorRepresentante = interface(IDBEditActions)
  ['{DC0BC1C7-B15E-4F6A-86AD-91DF84AEF96F}']
    function  Find(Codigo: String): Boolean;
    function GetCodigo: String;
    procedure SetCodigo(Value: String);
    function GetNome: String;
    procedure SetNome(Value: String);
    function GetTVE_Codigo: String;
    procedure SetTVE_Codigo(Value: String);
    function GetTipoComiss: String;
    procedure SetTipoComiss(Value: String);
    function GetEndCEP: String;
    procedure SetEndCEP(Value: String);
    function GetEndLogradouro: String;
    procedure SetEndLogradouro(Value: String);
    function GetEndNumero: String;
    procedure SetEndNumero(Value: String);
    function GetEndComplemento: String;
    procedure SetEndComplemento(Value: String);
    function GetEndBairro: String;
    procedure SetEndBairro(Value: String);
    function GetMUN_UFD_Sigla: String;
    procedure SetMUN_UFD_Sigla(Value: String);
    function GetMUN_Codigo: String;
    procedure SetMUN_Codigo(Value: String);
    function GetDDD: String;
    procedure SetDDD(Value: String);
    function GetFone: String;
    procedure SetFone(Value: String);
    function GetCelular: String;
    procedure SetCelular(Value: String);
    function GetFax: String;
    procedure SetFax(Value: String);
    function GetContato: String;
    procedure SetContato(Value: String);
    function GetOBS: String;
    procedure SetOBS(Value: String);
    function GetCNPJCPF: String;
    procedure SetCNPJCPF(Value: String);
    function GetUSU_Codigo: String;
    procedure SetUSU_Codigo(Value: String);
    function GetEmail: String;
    procedure SetEmail(Value: String);
    function GetFRN_Codigo: String;
    procedure SetFRN_Codigo(Value: String);
    function GetVencimento: Integer;
    procedure SetVencimento(Value: Integer);
    function GetRetemIRRF: Integer;
    procedure SetRetemIRRF(Value: Integer);
    function GetReferencia: String;
    procedure SetReferencia(Value: String);
    //
    property Codigo     : string  read GetCodigo         write SetCodigo;
    property Nome       : string  read GetNome           write SetNome;
    property TabelaVenda: string  read GetTVE_Codigo     write SetTVE_Codigo;
    property TipoComiss : string  read GetTipoComiss     write SetTipoComiss;
    property Cep        : string  read GetEndCep         write SetEndCep;
    property Logradouro : string  read GetEndLogradouro  write SetEndLogradouro;
    property Numero     : string  read GetEndNumero      write SetEndNumero;
    property Complemento: string  read GetEndComplemento write SetEndComplemento;
    property Bairro     : string  read GetEndBairro      write SetEndBairro;
    property UF         : string  read GetMUN_UFD_Sigla  write SetMUN_UFD_Sigla;
    property Cidade     : string  read GetMUN_Codigo     write SetMUN_Codigo;
    property DDD        : string  read GetDDD            write SetDDD;
    property Fone       : string  read GetFone           write SetFone;
    property Celular    : string  read GetCelular        write SetCelular;
    property Fax        : string  read GetFax            write SetFax;
    property Contato    : string  read GetContato        write SetContato;
    property OBS        : string  read GetOBS            write SetOBS;
    property CNPJCPF    : string  read GetCNPJCPF        write SetCNPJCPF;
    property USU_Codigo : string  read GetUSU_Codigo     write SetUSU_Codigo;
    property Email      : string  read GetEmail          write SetEmail;
    property FRN_Codigo : string  read GetFRN_Codigo     write SetFRN_Codigo;
    property Vencimento : Integer read GetVencimento     write SetVencimento;
    property RetemIRRF  : Integer read GetRetemIRRF      write SetRetemIRRF ;
    property Referencia : string  read GetReferencia     write SetReferencia;
  end;

  ITransportadora = interface(IDBEditActions)
  ['{4E54FE1D-D26E-41DA-ADA9-97A648B6A383}']
    function  Find(Codigo: String): Boolean;
    function GetCODIGO: String;
    procedure SetCODIGO(Value: String);
    function GetNOME: String;
    procedure SetNOME(Value: String);
    function GetCNPJCPF: String;
    procedure SetCNPJCPF(Value: String);
    function GetENDERECO: String;
    procedure SetENDERECO(Value: String);
    function GetMUN_UFD_SIGLA: String;
    procedure SetMUN_UFD_SIGLA(Value: String);
    function GetMUN_CODIGO: String;
    procedure SetMUN_CODIGO(Value: String);
    function GetIE: String;
    procedure SetIE(Value: String);
    function GetCONTATO: String;
    procedure SetCONTATO(Value: String);
    function GetDDD: String;
    procedure SetDDD(Value: String);
    function GetFONE: String;
    procedure SetFONE(Value: String);
    function GetEMAIL: String;
    procedure SetEMAIL(Value: String);
    function GetFRN_CODIGO: String;
    procedure SetFRN_CODIGO(Value: String);
    function GetRNTC: String;
    procedure SetRNTC(Value: String);
    function GetPLACA: String;
    procedure SetPLACA(Value: String);
    function GetUFPLACA: String;
    procedure SetUFPLACA(Value: String);
    //
    property Codigo       : string read GetCODIGO        write SetCODIGO;
    property Nome         : string read GetNOME          write SetNOME;
    property CNPJCPF      : string read GetCNPJCPF       write SetCNPJCPF;
    property Endereco     : string read GetENDERECO      write SetENDERECO;
    property UF           : string read GetMUN_UFD_SIGLA write SetMUN_UFD_SIGLA;
    property Cidade       : string read GetMUN_CODIGO    write SetMUN_CODIGO;
    property IE           : string read GetIE            write SetIE;
    property Contato      : string read GetCONTATO       write SetCONTATO;
    property DDD          : string read GetDDD           write SetDDD;
    property Fone         : string read GetFONE          write SetFONE;
    property Email        : string read GetEmail         write SetEmail;
    property FRN_Codigo   : string read GetFRN_Codigo    write SetFRN_Codigo;
    property RNTC         : string read GetRNTC          write SetRNTC;
    property Placa        : string read GetPlaca         write SetPlaca;
    property UFPlaca      : string read GetUFPlaca       write SetUFPlaca;
  end;

  IPrazoDePagamento = interface(IDBEditActions)
  ['{1F76883E-F75D-43EE-9078-6EDABB184E4D}']
    function  Find(Codigo: String): Boolean;
    procedure SetCodigo(Value: String);
    function GetCodigo: String;
    procedure SetNome(Value: String);
    function GetNome: String;
    procedure SetTipoData(Value: Integer);
    function GetTipoData: Integer;
    function  GetParcelas: IParcelasDoPrazoDePagamento;
    //
    property Codigo: String read GetCodigo write SetCodigo;
    property Nome: String   read GetNome write SetNome;
    property TipoData: Integer read GetTipoData write SetTipoData;
    property Parcelas: IParcelasDoPrazoDePagamento read GetParcelas;
  end;

  IParcelasDoPrazoDePagamento = interface(IDBEditActions)
  ['{4F277A12-CF59-4F42-9628-F75F8A381905}']
    function  Find(TPP_Codigo: String; Prazo: Integer): Boolean;
    procedure SetTPP_Codigo(Value: String);
    function GetTPP_Codigo: String;
    procedure SetPrazo(Value: Integer);
    function GetPrazo: Integer;
    //
    property TPP_Codigo: String read GetTPP_Codigo write SetTPP_Codigo;
    property Prazo: Integer read GetPrazo write SetPrazo;
  end;

  // Municípios
  IMunicipio = interface
  ['{B5B6C619-820F-4A89-8A57-4BAE24833B10}']
    function  GetListaMunicipios(UF: String): TDataSet;
    function  GetListaMunicipiosArray(UF: String = ''): IListaMunicipios;
    function  GetListaMunicipiosJSON(UF:String): String;
    //
  end;

  // Agentes Cobradores
  IAgenteCobrador = interface(IDBEditActions)
  ['{B75A8CF0-810A-4EE9-A675-5B7FC5334011}']
    function  Find(Codigo: String): Boolean;
    //
    function  GetCodigo: String;
    function  GetNome: String;
    procedure SetNome(const Value: String);
    //
    property  Codigo: String read GetCodigo;
    property  Nome: String read GetNome write SetNome;
  end;

  // Receitas/Despesas
  IReceitasDespesas = interface(IDBEditActions)
  ['{0F7FBF6A-90C8-4A4B-817B-2B04619B395A}']
    function  Find(Codigo: String): Boolean;
    function  GetLista(Natureza, ContaMae: String): IListaCRD;
    procedure Open;
    //
    function GetCodigo: String;
    function GetNome: String;
    function GetTipo: String;
    function GetNatureza: String;
    function GetInativo: Integer;
    function GetCodigoMae: String;
    function GetContaContabil: String;
    function GetGrupo: String;
    function GetInvestimento: Integer;
    function GetRetemISS: Integer;
    function GetRetemINSS: Integer;
    function GetRetemIRRF: Integer;
    function GetRetemPISCOFINSCSL: Integer;
    function GetContaFinanceira: String;
    function GetContaContabilEstoque: String;
    function GetGeraSPR: Integer;
    function GetRetemICMS: Integer;
    function GetObs: String;
    procedure SetCodigo(const Value: String);
    procedure SetNome(const Value: String);
    procedure SetTipo(const Value: String);
    procedure SetNatureza(const Value: String);
    procedure SetInativo(const Value: Integer);
    procedure SetCodigoMae(const Value: String);
    procedure SetContaContabil(const Value: String);
    procedure SetGrupo(const Value: String);
    procedure SetInvestimento(const Value: Integer);
    procedure SetRetemISS(const Value: Integer);
    procedure SetRetemINSS(const Value: Integer);
    procedure SetRetemIRRF(const Value: Integer);
    procedure SetRetemPISCOFINSCSL(const Value: Integer);
    procedure SetContaFinanceira(const Value: String);
    procedure SetContaContabilEstoque(const Value: String);
    procedure SetGeraSPR(const Value: Integer);
    procedure SetRetemICMS(const Value: Integer);
    procedure SetObs(const Value: String);

    property Codigo: String read GetCodigo write SetCodigo; 
    property Nome: String read GetNome write SetNome;
    property Tipo: String read GetTipo write SetTipo;
    property Natureza: String read GetNatureza write SetNatureza;
    property Inativo: Integer read GetInativo write SetInativo;
    property CodigoMae: String read GetCodigoMae write SetCodigoMae;
    property ContaContabil: String read GetContaContabil write SetContaContabil;
    property Grupo: String read GetGrupo write SetGrupo;
    property Investimento: Integer read GetInvestimento write SetInvestimento;
    property RetemISS: Integer read GetRetemISS write SetRetemISS;
    property RetemINSS: Integer read GetRetemINSS write SetRetemINSS;
    property RetemIRRF: Integer read GetRetemIRRF write SetRetemIRRF;
    property RetemPISCOFINSCSL: Integer read GetRetemPISCOFINSCSL write SetRetemPISCOFINSCSL;
    property ContaFinanceira: String read GetContaFinanceira write SetContaFinanceira;
    property ContaContabilEstoque: String read GetContaContabilEstoque write SetContaContabilEstoque;
    property GeraSPR: Integer read GetGeraSPR write SetGeraSPR;
    property RetemICMS: Integer read GetRetemICMS write SetRetemICMS;
    property Obs: String read GetObs write SetObs;

  end;

  IVencimentosaPagar = interface(IDBEditAndNavigateActions)
  ['{719EC176-1997-4926-ACD1-F2CD63606513}']
    function  Find(Codigo: String; Data: TDateTime; Seq: Integer): Boolean;
    function  FindByValue(CNPJForn: String; Data: TDateTime; Valor: Real): Boolean;
    function  Open: Boolean;
    //
    procedure CancelarVencimento(aData: TDateTime; aMotivo: String);
    function  ExisteBaixas: Boolean;
    //
    procedure AutorizaPagamento(CPG_Codigo, USU_Codigo: String; DataVencimento, DataAutorizacao: TDateTime; Sequencial: Integer);
    procedure AutorizaCPGRetroativos(USU_Codigo: String; Data: TDateTime);
    procedure DesautorizaPagamento(CPG_Codigo, USU_Codigo: String; DataVencimento: TDateTime; Sequencial: Integer);
    function GetQtdAutorizacoesNecessarias: Integer;
    function GetQtdAutorizacoesEfetuadas(VCP_CPG_Codigo: String; VCP_Data: TDateTime; VCP_Sequencial: Integer): Integer;
    function GetAutorizantes(VCP_CPG_Codigo: String; VCP_Data: TDateTime; VCP_Sequencial: Integer): TDataSet;
    function VencimentoAutorizado(CPG_Codigo: String; Data: TDateTime; Sequencial: Integer): Boolean;
    function UtilizaAutorizacaoPagamento: Boolean;
    //
    function  GetCodigo: String;
    function  GetSequencial: Integer;
    function  GetVencimento: TDateTime;
    procedure SetVencimento(Value: TDateTime);
    function  GetValor: Double;
    procedure SetValor(Value: Double);
    function  GetTitulo: String;
    procedure SetTitulo(const Value: String);
    function  GetDtCancel: TDateTime;
    //
    property Codigo: String read GetCodigo;
    property Sequencial: Integer read GetSequencial;
    property Vencimento: TDateTime read GetVencimento write SetVencimento;
    property Valor: Double read GetValor write SetValor;
    property Titulo: String read GetTitulo write SetTitulo;
    property DtCancel: TDateTime read GetDtCancel;
  end;

  IDespesasaPagar = interface(IDBEditAndNavigateActions)
  ['{C7497A82-545D-49E0-A7B6-002CB9DFFC55}']
    function  Find(Codigo: String; Despesa, Estabelecimento, CentroResultados: String): Boolean;
    function  Open: Boolean;
    //
    function  GetCodigo: String;
    function  GetEstabelecimento: String;
    procedure SetEstabelecimento(const Value: String);
    function  GetCentroResultados: String;
    procedure SetCentroResultados(const Value: String);
    function  GetDespesa: String;
    procedure SetDespesa(const Value: String);
    function  GetValor: Double;
    procedure SetValor(Value: Double);
    function  GetObs: String;
    procedure SetObs(const Value: String);
    //
    property  Codigo: String read GetCodigo;
    property  Estabelecimento: String read GetEstabelecimento write SetEstabelecimento;
    property  CentroResultados: String read GetCentroResultados write SetCentroResultados;
    property  Despesa: String read GetDespesa write SetDespesa;
    property  Valor: Double read GetValor write SetValor;
    property  Obs: String read GetObs write SetObs;
  end;

  IDocContasaPagar = interface (IDBEditAndNavigateActions)
  ['{F262C71B-0E26-4862-A99D-B55FC51D2548}']
    function  Find(Codigo: String; Seq: Integer): Boolean;
    function  Open: Boolean;
    //
    function  GetCodigo: String;
    function  GetSequencial: Integer;
    function  GetData: TDateTime;
    procedure SetData(Value: TDateTime);
    function  GetTipoDocumento: String;
    procedure SetTipoDocumento(const Value: String);
    function  GetPath: String;
    procedure SetPath(const Value: String);
    function  GetObservacao: String;
    procedure SetObservacao(const Value: String);
    //
    property Codigo: String read GetCodigo;
    property Sequencial: Integer read GetSequencial;
    property TipoDocumento: String read GetTipoDocumento write SetTipoDocumento;
    property Path: String read GetPath write SetPath;
    property Data: TDateTime read GetData write SetData;
    property Observacao: String read GetObservacao write SetObservacao;
  end;

    // Fornecedores
  IFornecedor
   = interface(IDBEditActions)
  ['{3CB20978-5879-4634-93C3-FA1B1783A5BC}']
    function  Find(CNPJCPF: String): Boolean;
    function  FindCodigo(Codigo: String): Boolean;
    //
    function  GetCodigo: String;
    procedure SetCodigo(const Value: String);
    function  GetNome: String;
    procedure SetNome(const Value: String);
    function  GetCNPJCPF: String;
    procedure SetCNPJCPF(const Value: String);
    function  GetCEP: String;
    procedure SetCEP(const Value: String);
    function  GetLogradouro: String;
    procedure SetLogradouro(const Value: String);
    function  GetBairro: String;
    procedure SetBairro(const Value: String);
    function  GetNumero: String;
    procedure SetNumero(const Value: String);
    function  GetComplemento: String;
    procedure SetComplemento(const Value: String);
    function  GetUF: String;
    procedure SetUF(const Value: String);
    function  GetCidade: String;
    procedure SetCidade(const Value: String);
    function  GetDDD: String;
    procedure SetDDD(const Value: String);
    function  GetFone: String;
    procedure SetFone(const Value: String);
    function  GetFax: String;
    procedure SetFax(const Value: String);
    function  GetEmail: String;
    procedure SetEmail(const Value: String);
    function  GetContato: String;
    procedure SetContato(const Value: String);
    function  GetSite: String;
    procedure SetSite(const Value: String);
    function  GetRG: String;
    procedure SetRG(const Value: String);
    function  GetIE: String;
    procedure SetIE(const Value: String);
    function  GetGrupo: String;
    procedure SetGrupo(const Value: String);
    function  GetReceita: String;
    procedure SetReceita(const Value: String);
    function  GetIM: String;
    procedure SetIM(const Value: String);
    function  GetReferencia: String;
    procedure SetReferencia(const Value: String);
    function  GetFinalidadeTED: String;
    procedure SetFinalidadeTED(const Value: String);
    function  GetFinalidadeDOC: String;
    procedure SetFinalidadeDOC(const Value: String);
    function  GetCelular: String;
    procedure SetCelular(const Value: String);
    function  GetServicoPublico: Integer;
    procedure SetServicoPublico(const Value: Integer);
    function  GetLeiaute: String;
    procedure SetLeiaute(const Value: String);
    function  GetBanco: String;
    procedure SetBanco(const Value: String);
    function  GetBancoNumero: String;
    procedure SetBancoNumero(const Value: String);
    function  GetAgencia: String;
    procedure SetAgencia(const Value: String);
    function  GetCC: String;
    procedure SetCC(const Value: String);
    function  GetDvAG: String;
    procedure SetDvAG(const Value: String);
    function  GetDvConta: String;
    procedure SetDvConta(const Value: String);
    function  GetIPI: Integer;
    procedure SetIPI(const Value: Integer);
    function  GetICMS: Integer;
    procedure SetICMS(const Value: Integer);
    //
    property  Codigo: String read GetCodigo write SetCodigo;
    property  Nome: String read GetNome write SetNome;
    property  CNPJCPF: String read GetCNPJCPF write SetCNPJCPF;
    property  CEP: String read GetCEP write SetCEP;
    property  Logradouro: String read GetLogradouro write SetLogradouro;
    property  Bairro: String read GetBairro write SetBairro;
    property  Numero: String read GetNumero write SetNumero;
    property  Complemento: String read GetComplemento write SetComplemento;
    property  UF: String read GetUF write SetUF;
    property  Cidade: String read GetCidade write SetCidade;
    property  DDD: String read GetDDD write SetDDD;
    property  Fone: String read GetFone write SetFone;
    property  Fax: String read GetFax write SetFax;
    property  Email: String read GetEmail write SetEmail;
    property  Contato: String read GetContato write SetContato;
    property  Site: String read GetSite write SetSite;
    property  RG: String read GetRG write SetRG;
    property  IE: String read GetIE write SetIE;
    property  Grupo: String read GetGrupo write SetGrupo;
    property  Receita: String read GetReceita write SetReceita;
    property  IM: String read GetIM write SetIM;
    property  Referencia: String read GetReferencia write SetReferencia;
    property  FinalidadeTED: String read GetFinalidadeTED write SetFinalidadeTED;
    property  FinalidadeDOC: String read GetFinalidadeDOC write SetFinalidadeDOC;
    property  Celular: String read GetCelular write SetCelular;
    property  ServicoPublico: Integer read GetServicoPublico write SetServicoPublico;
    property  Leiaute: String read GetLeiaute write SetLeiaute;

    property  Banco: String read GetBanco write SetBanco;
    property  BancoNumero: String read GetBancoNumero write SetBancoNumero;
    property  Agencia: String read GetAgencia write SetAgencia;
    property  CC: String read GetCC write SetCC;
    property  DVAg: String read GetDvAG write SetDVAg;
    property  DVCC: String read GetDvConta write SetDvConta;
    property  ICMS: Integer read GetICMS write SetICMS;
    property  IPI: Integer read GetIPI write SetIPI;
  end;

    // Serviços
  IServicos = interface(IDBEditActions)
  ['{4920EC4F-0DF4-48B9-B82C-883BC6CDA425}']
    function  FindCodigo(Codigo: String): Boolean;
    function  FindNome(Nome: String): Boolean;
    procedure Open;
    function  GetListaServicosFull: IListaServicos;
    function GetCODIGO: String;
    procedure SetCODIGO(const Value: String);
    function GetNOME: String;
    procedure SetNome(const Value: String);
    function GetNomeApresentar: String;
    procedure SetNomeApresentar(const Value: String);
    function GetVALOR: Double;
    procedure SetVALOR(Value: Double);
    function GetISS: Integer;
    procedure SetISS(Value: Integer);
    function GetINSS: Integer;
    procedure SetINSS(Value: Integer);
    function GetIRRF: Integer;
    procedure SetIRRF(Value: Integer);
    function GetPISCOFINSCSLL: Integer;
    procedure SetPISCOFINSCSLL(Value: Integer);
    function GetAliqISS: Double;
    procedure SetAliqISS(Value: Double);
    function GetAliqINSS: Double;
    procedure SetAliqINSS(Value: Double);
    function GetAliqIRRF: Double;
    procedure SetAliqIRRF(Value: Double);
    function GetAliqPIS: Double;
    procedure SetAliqPIS(Value: Double);
    function GetAliqCOFINS: Double;
    procedure SetAliqCOFINS(Value: Double);
    function GetAliqCSL: Double;
    procedure SetAliqCSL(Value: Double);

    property Codigo: string read GetCodigo write SetCodigo;
    property Nome: string read GetNome write SetNome;
    property NomeApresentar: string read GetNomeApresentar write SetNomeApresentar;
    property Valor: Double read GetValor write SetValor;
    property ISS: Integer read GetISS write SetISS;
    property INSS: Integer read GetINSS write SetINSS;
    property IRRF: Integer read GetIRRF write SetIRRF;
    property PISCOFINSCSLL: Integer read GetPISCOFINSCSLL write SetPISCOFINSCSLL;
    property AliqISS: Double read GetAliqISS write SetAliqISS;
    property AliqINSS: Double read GetAliqINSS write SetAliqINSS;
    property AliqIRRF: Double read GetAliqIRRF write SetAliqIRRF;
    property AliqPIS: Double read GetAliqPIS write SetAliqPIS;
    property AliqCOFINS: Double read GetAliqCOFINS write SetAliqCOFINS;
    property AliqCSL: Double read GetAliqCSL write SetAliqCSL;
  end;
    // Itens
  IItens = interface(IDBEditActions)
  ['{EB5FF9B1-18A0-4D84-BD94-E080010176E8}']
    procedure Close;
    function  FindCodigo(Codigo: String): Boolean;
    function  FindCODUTILIZADOESTFISCAL(CODUTILIZADOESTFISCAL: String): String;
    function  GetListaItens: IListaItens;
    function  GetListaItensPorCentroEstoque(CES_Codigo: String): IListaItens;
    //
    function  GetCodigo: String;
    procedure SetCodigo(const Value: String);
    function  GetNome: String;
    procedure SetNome(const Value: String);
    function  GetValor: Double;
    procedure SetValor(Value: Double);
    function  GetUnidade: String;
    procedure SetUnidade(const Value: String);
    function  GetICMSSUBSTTIPO: String;
    procedure SetICMSSUBSTTIPO(const Value: String);
    function  GetCOMPDESCRICAO: String;
    procedure SetCOMPDESCRICAO(const Value: String);
    function  GetCODUTILIZADOESTFISCAL: String;
    procedure SetCODUTILIZADOESTFISCAL(const Value: String);
    function  GetCODIGONCM: String;
    procedure SetCODIGONCM(const Value: String);
    function  GetCODIGO_BARRA: String;
    procedure SetCODIGO_BARRA(const Value: String);
    function  GetCODIGO_BARRA_UT: String;
    procedure SetCODIGO_BARRA_UT(const Value: String);
    function  GetCODIGONVE: String;
    procedure SetCODIGONVE(const Value: String);
    function  GetANP_CODIGO: String;
    procedure SetANP_CODIGO(const Value: String);
    function  GetCODPROFISCAL: Integer;
    procedure SetCODPROFISCAL(const Value: Integer);
    function  GetREGISTROANVISA: String;
    procedure SetREGISTROANVISA(const Value: String);
    function  GetCRD_CODIGO: String;
    procedure SetCRD_CODIGO(const Value: String);
    function  GetREFERENCIA: String;
    procedure SetREFERENCIA(const Value: String);
    function  GetUTILIZARALIQUOTANCM: Integer;
    procedure SetUTILIZARALIQUOTANCM(const Value: Integer);
    function  GetCLASSIFICACAOFISCAL: String;
    procedure SetCLASSIFICACAOFISCAL(const Value: String);
    function  GetDESCRICAOUNIDADE: String;
    procedure SetDESCRICAOUNIDADE(const Value: String);
    function  GetICMS: Integer;
    procedure SetICMS(const Value: Integer);
    function  GetDEDUCAOICMS: Integer;
    procedure SetDEDUCAOICMS(const Value: Integer);
    function  GetIRRF: Integer;
    procedure SetIRRF(const Value: Integer);
    function  GetPIS: Integer;
    procedure SetPIS(const Value: Integer);
    function  GetCOFINS: Integer;
    procedure SetCOFINS(const Value: Integer);
    function  GetCSL: Integer;
    procedure SetCSL(const Value: Integer);
    function  GetALIQUOTAIPI: Double;
    procedure SetALIQUOTAIPI(const Value: Double);
    function  GetSTI_Codigo: String;
    procedure SetSTI_Codigo(const Value: String);
    function  GetSTF_Codigo: String;
    procedure SetSTF_Codigo(const Value: String);
    function  GetSTS_Codigo: String;
    procedure SetSTS_Codigo(const Value: String);
    function  GetNAR_SEQCOFINS: Integer;
    procedure SetNAR_SEQCOFINS(const Value: Integer);
    function  GetNAR_SEQPIS: Integer;
    procedure SetNAR_SEQPIS(const Value: Integer);
    function  GetICMSSUBSTITUICAO: Integer;
    procedure SetICMSSUBSTITUICAO(const Value: Integer);
    function  GetICMSSUBSTAGREGACAO: Double;
    procedure SetICMSSUBSTAGREGACAO(const Value: Double);
    function  GetICMSSUBSTVALORPAUTA: Double;
    procedure SetICMSSUBSTVALORPAUTA(const Value: Double);
    function  GetIPIFIXO: Integer;
    procedure SetIPIFIXO(const Value: Integer);
    function  GetVALORIPIFIXO: Double;
    procedure SetVALORIPIFIXO(const Value: Double);
    function  GetCIT_CODIGO: String;
    procedure SetCIT_CODIGO(const Value: String);
    function  GetAIT_CODIGO: String;
    procedure SetAIT_CODIGO(const Value: String);
    function  GetMIT_CODIGO: String;
    procedure SetMIT_CODIGO(const Value: String);
    function  GetCFOP_CODIGODENTROESTADO: String;
    procedure SetCFOP_CODIGODENTROESTADO(const Value: String);
    function  GetSTA_CODIGO: String;
    procedure SetSTA_CODIGO(const Value: String);
    function  GetSTB_CODIGO: String;
    procedure SetSTB_CODIGO(const Value: String);
    //
    property Codigo:                     String  read GetCodigo                write SetCodigo;
    property Nome:                       String  read GetNome                  write SetNome;
    property Valor:                      Double  read GetValor                 write SetValor;
    property Unidade:                    String  read GetUnidade               write SetUnidade;
    property ICMSSubstTipo:              String  read GetICMSSUBSTTIPO         write SetICMSSUBSTTIPO;
    property CompDescricao:              String  read GetCOMPDESCRICAO         write SetCOMPDESCRICAO;
    property CodUtilizadoESTFiscal:      String  read GetCODUTILIZADOESTFISCAL write SetCODUTILIZADOESTFISCAL;
    property CodigoNCM:                  String  read GetCODIGONCM             write SetCODIGONCM;
    property CodigoBarra:                String  read GetCODIGO_BARRA          write SetCODIGO_BARRA;
    property CodigoBarraUnidadeTribut:   String  read GetCODIGO_BARRA_UT       write SetCODIGO_BARRA_UT;
    property CodigoNVE:                  String  read GetCODIGONVE             write SetCODIGONVE;
    property CodigoANP:                  String  read GetANP_CODIGO            write SetANP_CODIGO;
    property CodProFortesFiscal:         Integer read GetCODPROFISCAL          write SetCODPROFISCAL;
    property RegistroAnvisa:             String  read GetREGISTROANVISA        write SetREGISTROANVISA;
    property Despesa:                    String  read GetCRD_CODIGO            write SetCRD_CODIGO;
    property Referencia:                 String  read GetREFERENCIA            write SetREFERENCIA;
    property UtilizarAliquotaNCM:        Integer read GetUTILIZARALIQUOTANCM   write SetUTILIZARALIQUOTANCM;
    property ClassificacaoFiscal:        String  read GetCLASSIFICACAOFISCAL   write SetCLASSIFICACAOFISCAL;
    property DescricaoUnidade:           String  read GetDESCRICAOUNIDADE      write SetDESCRICAOUNIDADE;
    property CalculaICMS:                Integer read GetICMS                  write SetICMS;
    property DeducaoICMS:                Integer read GetDEDUCAOICMS           write SetDEDUCAOICMS;
    property CalculaIRRF:                Integer read GetIRRF                  write SetIRRF;
    property CalculaPIS:                 Integer read GetPIS                   write SetPIS;
    property CalculaCOFINS:              Integer read GetCOFINS                write SetCOFINS;
    property CalculaCSL:                 Integer read GetCSL                   write SetCSL;
    property AliquotaIPI:                Double  read GetALIQUOTAIPI           write SetALIQUOTAIPI;
    property SitTribIPISaida:            String  read GetSTI_Codigo            write SetSTI_Codigo;
    property SitTribCOFINSSaida:         String  read GetSTF_Codigo            write SetSTF_Codigo;
    property SitTribPISSaida:            String  read GetSTS_Codigo            write SetSTS_Codigo;
    property NaturezaReceitaCOFINS:      Integer read GetNAR_SEQCOFINS         write SetNAR_SEQCOFINS;
    property NaturezaReceitaPIS:         Integer read GetNAR_SEQPIS            write SetNAR_SEQPIS;
    property ICMSSubstituicao:           Integer read GetICMSSUBSTITUICAO      write SetICMSSUBSTITUICAO;
    property AliquotaICMSSubstAgregacao: Double  read GetICMSSUBSTAGREGACAO    write SetICMSSUBSTAGREGACAO;
    property ValorPautaICMSSubst:        Double  read GetICMSSUBSTVALORPAUTA   write SetICMSSUBSTVALORPAUTA;
    property IPIFixo:                    Integer read GetIPIFIXO               write SetIPIFIXO;
    property ValorIPIFixo:               Double  read GetVALORIPIFIXO          write SetVALORIPIFIXO;
    property Categoria:                  String  read GetCIT_CODIGO            write SetCIT_CODIGO;
    property Acabamento:                 String  read GetAIT_CODIGO            write SetAIT_CODIGO;
    property Material:                   String  read GetMIT_CODIGO            write SetMIT_CODIGO;
    property CFOP_CODIGODENTROESTADO:    String  read GetCFOP_CODIGODENTROESTADO write SetCFOP_CODIGODENTROESTADO;
    property STA_CODIGO:                 String  read GetSTA_CODIGO            write SetSTA_CODIGO;
    property STB_CODIGO:                 String  read GetSTB_CODIGO            write SetSTB_CODIGO;
  end;

  // Contas a Pagar
  IContasaPagar = interface(IDBEditActions)
  ['{007780F7-E710-4374-965F-52537B1C734C}']
    procedure Open;
    function  Find(Codigo: String): Boolean;
    function  FindContasaPagarEmAberto(aFRN_Codigo: String; aDtEmissao: TDateTime): String;
    Function FindIDWS(IDWS: String): Boolean; 
    procedure Edit(PermiteMesmoComBaixas: Boolean = False);
    //
    function  GetCodigo: String;
    function  GetEstabelecimento: String;
    procedure SetEstabelecimento(const Value: String);
    function  GetCentroResultados: String;
    procedure SetCentroResultados(const Value: String);
    function  GetFornecedor: String;
    procedure SetFornecedor(const Value: String);
    function  GetCodigoFornecedor: String;
    procedure SetCodigoFornecedor(const Value: String);
    function  GetDespesa: String;
    procedure SetDespesa(const Value: String);
    function  GetDocumento: String;
    procedure SetDocumento(const Value: String);
    function  GetTipoDocumento: String;
    procedure SetTipoDocumento(const Value: String);
    function  GetEmissao: TDateTime;
    procedure SetEmissao(Value: TDateTime);
    function  GetMesAnoComp: String;
    procedure SetMesAnoComp(Value: String);
    function  GetDtEntrada: TDateTime;
    procedure SetDtEntrada(Value: TDateTime);
    function  GetValor: Double;
    function  GetValorBruto: Double;
    function  GetContaFinanceira: String;
    procedure SetContaFinanceira(const Value: String);
    function  GetExportaAC: Integer;
    procedure SetExportaAC(Value: Integer);
    function  GetOBS: String;
    procedure SetOBS(const Value: String);
    function  GetISSValor: Double;
    procedure SetISSValor(Value: Double);
    function  GetISSBase: Double;
    procedure SetISSBase(Value: Double);
    function  GetIRRFBase: Double;
    procedure SetIRRFBase(Value: Double);
    function  GetIRRFValorCPF: Double;
    procedure SetIRRFValorCPF(Value: Double);
    function  GetIRRFValorCNPJ: Double;
    procedure SetIRRFValorCNPJ(Value: Double);
    function  GetINSSValorCPF: Double;
    procedure SetINSSValorCPF(Value: Double);
    function  GetINSSValorCNPJ: Double;
    procedure SetINSSValorCNPJ(Value: Double);
    function  GetINSSBase: Double;
    procedure SetINSSBase(Value: Double);
    function  GetPISCOFINSCSLLValor: Double;
    procedure SetPISCOFINSCSLLValor(Value: Double);
    function  GetPISCOFINSCSLLBase: Double;
    procedure SetPISCOFINSCSLLBase(Value: Double);
    function  GetOrigem: String;
    procedure SetOrigem(const Value: String);
    function  GetVencimentosaPagar: IVencimentosaPagar;
    function  GetDespesasaPagar: IDespesasaPagar;
    function  GetSituacaoLegislacao(Campo: String; dData: TDateTime): Double;
    function  GetDocContasaPagar: IDocContasaPagar;
    function  GetUSU_Vistoriador: String;
    procedure SetUSU_Vistoriador(const Value: String);
    procedure SetIDWS(const Value: String);
    function GetIDWS: String;
    //
    property  Codigo: String read GetCodigo;
    property  Estabelecimento: String read GetEstabelecimento write SetEstabelecimento;
    property  CentroResultados: String read GetCentroResultados write SetCentroResultados;
    property  Fornecedor: String read GetFornecedor write SetFornecedor;
    property  CodigoFornecedor: String read GetCodigoFornecedor write SetCodigoFornecedor;
    property  Despesa: String read GetDespesa write SetDespesa;
    property  Documento: String read GetDocumento write SetDocumento;
    property  TipoDocumento: String read GetTipoDocumento write SetTipoDocumento;
    property  Emissao: TDateTime read GetEmissao write SetEmissao;
    property  MesAnoComp: String read GetMesAnoComp write SetMesAnoComp;
    property  DtEntrada: TDateTime read GetDtEntrada write SetDtEntrada;
    property  Valor: Double read GetValor;
    property  ValorBruto: Double read GetValorBruto;
    property  ContaFinanceira: String read GetContaFinanceira write SetContaFinanceira;
    property  ExportaAC: Integer read GetExportaAC write SetExportaAC;
    property  Obs: String read GetObs write SetObs;
    property  ISSValor: Double read GetISSValor write SetISSValor;
    property  ISSBase: Double read GetISSBase write SetISSBase;
    property  IRRFBase: Double read GetIRRFBase write SetIRRFBase;
    property  IRRFValorCPF: Double read GetIRRFValorCPF write SetIRRFValorCPF;
    property  IRRFValorCNPJ: Double read GetIRRFValorCNPJ write SetIRRFValorCNPJ;
    property  INSSValorCPF: Double read GetINSSValorCPF write SetINSSValorCPF;
    property  INSSValorCNPJ: Double read GetINSSValorCNPJ write SetINSSValorCNPJ;
    property  INSSBase: Double read GetINSSBase write SetINSSBase;
    property  PISCOFINSCSLLBase: Double read GetPISCOFINSCSLLBase write SetPISCOFINSCSLLBase;
    property  PISCOFINSCSLLValor: Double read GetPISCOFINSCSLLValor write SetPISCOFINSCSLLValor;
    property  Origem: String read GetOrigem write SetOrigem;
    property  VencimentosaPagar: IVencimentosaPagar read GetVencimentosaPagar;
    property  DespesasaPagar: IDespesasaPagar read GetDespesasaPagar;
    property  DocContasaPagar: IDocContasaPagar read GetDocContasaPagar;
    property  USU_Vistoriador: String read GetUSU_Vistoriador write SetUSU_Vistoriador;
    property  IDWS: String read GetIDWS write SetIDWS;
  end;

  // Vencimentos do Contas a Pagar
  //IVencimentosaPagar=interface;
  // Despesas do Contas a Pagar
  //IDespesasaPagar=interface;

  // Baixas dos Vencimentos do Contas a Pagar
  IBaixaVencimentoaPagar = interface(IDBEditActions)
  ['{13E0230C-9F5A-47EE-912B-C19ED8850B0E}']
    procedure Open;
    function  Find(CPG_Codigo: String; VCP_Sequencial: Integer; DataVencimento: TDateTime; Sequencial: Integer): Boolean;
    //
    procedure CancelarBaixa(aData: TDateTime; aMotivo: String);
    //
    function  GetCPG_Codigo: String;
    procedure SetCPG_Codigo(Value: String);
    function  GetDataVencimento: TDateTime;
    procedure SetDataVencimento(Value: TDateTime);
    function  GetSequencialVencimento: Integer;
    procedure SetSequencialVencimento(Value: Integer);
    function  GetSequencial: Integer;
    procedure SetSequencial(Value: Integer);
    function  GetData: TDateTime;
    procedure SetData(Value: TDateTime);
    function  GetValor: Double;
    procedure SetValor(Value: Double);
    function  GetDesconto: Double;
    procedure SetDesconto(Value: Double);
    function  GetJuros: Double;
    procedure SetJuros(Value: Double);
    function  GetDtCancel: TDateTime;
    function  GetMotivoCancel: String;
    function  GetHistorico: String;
    procedure SetHistorico(Value: String);
    // Necessários para a geração do lançamento
    procedure SetLAN_ContaFinanceira(const Value: String);
    procedure SetLAN_Historico(const Value: String);
    procedure SetLAN_CRD_Desconto(const Value: String);
    procedure SetLAN_CRD_Juros(const Value: String);
    //
    property  CPG_Codigo: String read GetCPG_Codigo write SetCPG_Codigo;
    property  DataVencimento: TDateTime read GetDataVencimento write SetDataVencimento;
    property  SequencialVencimento: Integer read GetSequencialVencimento write SetSequencialVencimento;
    property  Sequencial: Integer read GetSequencial write SetSequencial;
    property  Data: TDateTime read GetData write SetData;
    property  Valor: Double read GetValor write SetValor;
    property  Desconto: Double read GetDesconto write SetDesconto;
    property  Juros: Double read GetJuros write SetJuros;
    property  DtCancel: TDateTime read GetDtCancel;
    property  MotivoCancel: String read GetMotivoCancel;
    property  Historico: String read GetHistorico write SetHistorico;
    // Necessários para a geração do lançamento
    property  LAN_ContaFinanceira: String write SetLAN_ContaFinanceira;
    property  LAN_Historico      : String write SetLAN_Historico;
    property  LAN_CRD_Desconto   : String write SetLAN_CRD_Desconto;
    property  LAN_CRD_Juros      : String write SetLAN_CRD_Juros;
  end;

  // Rateio dos lançamentos
  IRateioLancamentos = interface;

  // Lançamentos Avulsos
  ILancamentos = interface(IDBEditActions)
  ['{0DAEC335-0E0B-4EA1-BD6E-A818245B13DF}']
    procedure Open;
    function  Find(Codigo: String): Boolean;
    function FindIDWS(IDWS: String): Boolean; 
    //
    function  GetCodigo: String;
    function  GetEstabelecimento: String;
    procedure SetEstabelecimento(const Value: String);
    function  GetConta: String;
    procedure SetConta(const Value: String);
    function  GetData: TDateTime;
    procedure SetData(Value: TDateTime);
    function  GetSequencial: Integer;
    function  GetCentroResultados: String;
    procedure SetCentroResultados(const Value: String);
    function  GetReceitaDespesa: String;
    procedure SetReceitaDespesa(const Value: String);
    function  GetValor: Double;
    procedure SetValor(Value: Double);
    function  GetNatureza: String;
    procedure SetNatureza(const Value: String);
    function  GetExportaAC: Integer;
    procedure SetExportaAC(Value: Integer);
    function  GetHistorico: String;
    procedure SetHistorico(const Value: String);
    function  GetRateioLancamentos: IRateioLancamentos;
    function  GetOrigem: String;
    procedure SetOrigem(const Value: String);
    procedure SetIDWS(const Value: String);
    function GetIDWS: String;
    //
    property  Codigo: String read GetCodigo;
    property  Estabelecimento: String read GetEstabelecimento write SetEstabelecimento;
    property  Conta: String read GetConta write SetConta;
    property  Data: TDateTime read GetData write SetData;
    property  Sequencial: Integer read GetSequencial;
    property  CentroResultados: String read GetCentroResultados write SetCentroResultados;
    property  ReceitaDespesa: String read GetReceitaDespesa write SetReceitaDespesa;
    property  Valor: Double read GetValor write SetValor;
    property  Natureza: String read GetNatureza write SetNatureza;
    property  ExportaAC: Integer read GetExportaAC write SetExportaAC;
    property  Historico: String read GetHistorico write SetHistorico;
    property  RateioLancamento: IRateioLancamentos read GetRateioLancamentos;
    property  Origem: String read GetOrigem write SetOrigem;
    property IDWS: String read GetIDWS write SetIDWS;
  end;

  IRateioLancamentos = interface(IDBEditAndNavigateActions)
  ['{E797B3AE-8A3C-45FE-8A75-6E8421BCA76C}']
    function  Find(Codigo: String; Sequencial: Integer): Boolean;
    function  Open: Boolean;
    //
    function  GetCodigo: String;
    function  GetSequencial: Integer;
    function  GetEstabelecimento: String;
    procedure SetEstabelecimento(const Value: String);
    function  GetCentroResultados: String;
    procedure SetCentroResultados(const Value: String);
    function  GetReceitaDespesa: String;
    procedure SetReceitaDespesa(const Value: String);
    function  GetNatureza: String;
    procedure SetNatureza(const Value: String);
    function  GetValor: Double;
    procedure SetValor(Value: Double);
    function  GetHistorico: String;
    procedure SetHistorico(const Value: String);
    //
    property  Codigo: String read GetCodigo;
    property  Sequencial: Integer read GetSequencial;
    property  Estabelecimento: String read GetEstabelecimento write SetEstabelecimento;
    property  CentroResultados: String read GetCentroResultados write SetCentroResultados;
    property  ReceitaDespesa: String read GetReceitaDespesa write SetReceitaDespesa;
    property  Natureza: String read GetNatureza write SetNatureza;
    property  Valor: Double read GetValor write SetValor;
    property  Historico: String read GetHistorico write SetHistorico;
  end;

  // Notas Fiscais de saida
  INotasFiscaisSaida = interface(IDBEditActions)
  ['{7E00B463-49D7-401B-8681-DD71674E9DB8}']
    procedure Open;
    procedure Close;
    function  Find(Codigo: String): Boolean;
    function FindIDWS(IDWS: String): Boolean;
    //
    function GetCODIGO: String;
    procedure SetCODIGO(const Value: String);
    function GetEST_CODIGO: String;
    procedure SetEST_CODIGO(const Value: String);
    function GetCLI_CODIGO: String;
    procedure SetCLI_CODIGO(const Value: String);
    function GetFORMULARIO: String;
    procedure SetFORMULARIO(const Value: String);
    function GetNUMERO: String;
    procedure SetNUMERO(const Value: String);
    function GetSERIE: String;
    procedure SetSERIE(const Value: String);
    function GetSUBSERIE: String;
    procedure SetSUBSERIE(const Value: String);
    function GetAIDF: String;
    procedure SetAIDF(const Value: String);
    function GetAMIDF: String;
    procedure SetAMIDF(const Value: String);
    function GetDTEMISSAO: TDateTime;
    procedure SetDTEMISSAO(Value: TDateTime);
    function GetDTSAIDA: TDateTime;
    procedure SetDTSAIDA(Value: TDateTime);
    function GetCFOP_CODIGO: String;
    procedure SetCFOP_CODIGO(const Value: String);
    function GetCANCELADA: Integer;
    procedure SetCANCELADA(Value: Integer);
    function GetVALORFRETE: Double;
    procedure SetVALORFRETE(Value: Double);
    function GetVALORSEGURO: Double;
    procedure SetVALORSEGURO(Value: Double);
    function GetVALOROUTRASDESPESAS: Double;
    procedure SetVALOROUTRASDESPESAS(Value: Double);
    function GetVALORIPI: Double;
    procedure SetVALORIPI(Value: Double);
    function GetBASEICMS: Double;
    procedure SetBASEICMS(Value: Double);
    function GetVALORICMS: Double;
    procedure SetVALORICMS(Value: Double);
    function GetVALORPRODUTOS: Double;
    procedure SetVALORPRODUTOS(Value: Double);
    function GetVALORTOTAL: Double;
    procedure SetVALORTOTAL(Value: Double);
    function GetOBSERVACAO: String;
    procedure SetOBSERVACAO(const Value: String);
    function GetOBSCORPONF: String;
    procedure SetOBSCORPONF(const Value: String);
    function GetICMSSOBREIPI: Integer;
    procedure SetICMSSOBREIPI(Value: Integer);
    function GetSELONUMERO: String;
    procedure SetSELONUMERO(const Value: String);
    function GetSELOSERIE: String;
    procedure SetSELOSERIE(const Value: String);
    function GetESPECIE: String;
    procedure SetESPECIE(const Value: String);
    function GetBASEICMSSUBST: Double;
    procedure SetBASEICMSSUBST(Value: Double);
    function GetVALORICMSSUBST: Double;
    procedure SetVALORICMSSUBST(Value: Double);
    function  GetItensNotaFiscalSaida: IItensNotaFiscalSaida;
    function GetIDWS: String;
    procedure SetIDWS(const Value: String);
    //
    property CODIGO: String read GetCODIGO write SetCODIGO ;
    property EST_CODIGO: String read GetEST_CODIGO write SetEST_CODIGO;
    property CLI_CODIGO: String read GetCLI_CODIGO write SetCLI_CODIGO;
    property FORMULARIO: String read GetFORMULARIO write SetFORMULARIO;
    property NUMERO: String read GetNUMERO write SetNUMERO;
    property SERIE: String read GetSERIE write SetSERIE;
    property SUBSERIE: String read GetSUBSERIE write SetSUBSERIE;
    property AIDF: String read GetAIDF write SetAIDF;
    property AMIDF: String read GetAMIDF write SetAMIDF;
    property DTEMISSAO: TDateTime read GetDTEMISSAO write SetDTEMISSAO;
    property DTSAIDA: TDateTime read GetDTSAIDA write SetDTSAIDA;
    property CFOP_CODIGO: String read GetCFOP_CODIGO write SetCFOP_CODIGO;
    property CANCELADA: Integer read GetCANCELADA write SetCANCELADA;
    property VALORFRETE: Double read GetVALORFRETE write SetVALORFRETE;
    property VALORSEGURO: Double read GetVALORSEGURO write SetVALORSEGURO;
    property VALOROUTRASDESPESAS: Double read GetVALOROUTRASDESPESAS write SetVALOROUTRASDESPESAS;
    property VALORIPI: Double read GetVALORIPI write SetVALORIPI;
    property BASEICMS: Double read GetBASEICMS write SetBASEICMS;
    property VALORICMS: Double read GetVALORICMS write SetVALORICMS;
    property VALORPRODUTOS: Double read GetVALORPRODUTOS write SetVALORPRODUTOS;
    property VALORTOTAL: Double read GetVALORTOTAL write SetVALORTOTAL;
    property OBSERVACAO: String read GetOBSERVACAO write SetOBSERVACAO;
    property OBSCORPONF: String read GetOBSCORPONF write SetOBSCORPONF;
    property ICMSSOBREIPI: Integer read GetICMSSOBREIPI write SetICMSSOBREIPI;
    property SELONUMERO: String read GetSELONUMERO write SetSELONUMERO;
    property SELOSERIE: String read GetSELOSERIE write SetSELOSERIE;
    property ESPECIE: String read GetESPECIE write SetESPECIE;
    property BASEICMSSUBST: Double read GetBASEICMSSUBST write SetBASEICMSSUBST;
    property VALORICMSSUBST: Double read GetVALORICMSSUBST write SetVALORICMSSUBST;
    property ItensNotaFiscalSaida: IItensNotaFiscalSaida read GetItensNotaFiscalSaida;
    property IDWS: String read GetIDWS write SetIDWS;
  end;

  IItensNotaFiscalSaida = interface(IDBEditAndNavigateActions)
  ['{97554B8E-C70E-4881-A8EB-FBDB4B4F3CAC}']
    function  Find(Codigo: String; Sequencial: Integer): Boolean;
    function  Open: Boolean;
    procedure Close;
    //
    function  GetNFS_Codigo: String;
    procedure SetNFS_Codigo(const Value: String);
    function  GetSequencial: Integer;
    procedure SetSequencial(const Value: Integer);
    function  GetItem: String;
    procedure SetItem(const Value: String);
    function GetCFOP_CODIGO: String;
    procedure SetCFOP_CODIGO(const Value: String);
    function GetSTA_CODIGO: String;
    procedure SetSTA_CODIGO(const Value: String);
    function GetSTB_CODIGO: String;
    procedure SetSTB_CODIGO(const Value: String);
    function GetALIQUOTAICMS: Double;
    procedure SetALIQUOTAICMS(Value: Double);
    function GetALIQUOTAIPI: Double;
    procedure SetALIQUOTAIPI(Value: Double);
    function GetUNIDADE: String;
    procedure SetUNIDADE(const Value: String);
    function GetQUANTIDADE: Double;
    procedure SetQUANTIDADE(Value: Double);
    function  GetValor: Double;
    procedure SetValor(Value: Double);
    //
    property NFS_Codigo: String read GetNFS_Codigo write SetNFS_Codigo;
    property Sequencial: Integer read GetSequencial write SetSequencial;
    property Item: String read GetItem write SetItem;
    property CFOP_CODIGO: String read GetCFOP_CODIGO write SetCFOP_CODIGO;
    property STA_CODIGO: String read GetSTA_CODIGO write SetSTA_CODIGO;
    property STB_CODIGO: String read GetSTB_CODIGO write SetSTB_CODIGO;
    property ALIQUOTAICMS: Double read GetALIQUOTAICMS write SetALIQUOTAICMS;
    property ALIQUOTAIPI: Double read GetALIQUOTAIPI write SetALIQUOTAIPI;
    property UNIDADE: String read GetUNIDADE write SetUNIDADE;
    property QUANTIDADE: Double read GetQUANTIDADE write SetQUANTIDADE;
    property Valor: Double read GetValor write SetValor;
  end;

  //Pedido de Venda
  IPedidoDeVenda = interface(IDBEditActions)
  ['{465C9BBA-6614-438D-B953-DF60C93824C6}']
    procedure Open;
    function  Find(Codigo: String): Boolean;

    function GetPEV_Codigo: String;
    procedure SetPEV_Codigo(const Value: String);
    function GetEST_Codigo: String;
    procedure SetEST_Codigo(const Value: String);
    function GetCLI_Codigo: String;
    procedure SetCLI_Codigo(const Value: String);
    function GetData: TDatetime;
    procedure SetData(const Value: TDatetime);
    function GetDATAPREVENTREGA: TDatetime;
    procedure SetDATAPREVENTREGA(const Value: TDatetime);
    function GetCONDICAOPAGAMENTO: String;
    procedure SetCONDICAOPAGAMENTO(const Value: String);
    function GetOBSERVACAO: String;
    procedure SetOBSERVACAO(const Value: String);
    function GetRejeitado: Integer;
    procedure SetRejeitado(const Value: Integer);
    function GetTPP_Codigo: String;
    procedure SetTPP_Codigo(const Value: String);
    function GetTDC_Codigo: String;
    procedure SetTDC_Codigo(const Value: String);
    function GetCOB_Codigo: String;
    procedure SetCOB_Codigo(const Value: String);
    function GetDocumento: String;
    procedure SetDocumento(const Value: String);
    function GetBaseICMSSubst: Double;
    procedure SetBaseICMSSubst(const Value: Double);
    function GetValorICMSSubst: Double;
    procedure SetValorICMSSubst(const Value: Double);
    function GetUSU_CODIGO: String;
    procedure SetUSU_CODIGO(const Value: String);
    function GetIAG_CODIGO: Integer;
    procedure SetIAG_CODIGO(const Value: Integer);
    function GetHIS_CODIGO: String;
    procedure SetHIS_CODIGO(const Value: String);
    function GetItensPedidoDeVenda: IItensPedidoDeVenda;
    function GetServicosPedidoDeVenda: IServicosPedidoDeVenda;
    procedure ReplicaPedidoDeVenda(QtdPeriodo, Periodicidade: Integer; TipoPeriodo: String; BaseICMSSubst: Double = 0; ValorICMSSubst: Double = 0);
    property PEV_Codigo: String read GetPEV_Codigo write SetPEV_Codigo;
    property EST_CODIGO: String read GetEST_Codigo write SetEST_Codigo;
    property CLI_Codigo: String read GetCLI_Codigo write SetCLI_Codigo;
    property Data: TDatetime read GetData write SetData;
    property DATAPREVENTREGA: TDatetime read GetDATAPREVENTREGA write SetDATAPREVENTREGA;
    property CONDICAOPAGAMENTO: String read GetCONDICAOPAGAMENTO write SetCONDICAOPAGAMENTO;
    property OBSERVACAO: String read GetOBSERVACAO write SetOBSERVACAO;
    property Rejeitado: Integer read GetRejeitado write SetRejeitado;
    property TPP_Codigo: String read GetTPP_Codigo write SetTPP_Codigo;
    property TDC_Codigo: String read GetTDC_Codigo write SetTDC_Codigo;
    property COB_Codigo: String read GetCOB_Codigo write SetCOB_Codigo;
    property Documento: String read GetDocumento write SetDocumento;
    property BaseICMSSubst : Double read GetBaseICMSSubst  write SetBaseICMSSubst ;
    property ValorICMSSubst: Double read GetValorICMSSubst write SetValorICMSSubst;
    property USU_CODIGO: String read GetUSU_CODIGO write SetUSU_CODIGO;
    property IAG_CODIGO: Integer read GetIAG_CODIGO write SetIAG_CODIGO;
    property HIS_CODIGO: String read GetHIS_CODIGO write SetHIS_CODIGO;
    property ItensPedidoDeVenda: IItensPedidoDeVenda read GetItensPedidoDeVenda;
    property ServicosPedidoDeVenda: IServicosPedidoDeVenda read GetServicosPedidoDeVenda;
  end;

  //Itens do Pedido de Venda
  IItensPedidoDeVenda = interface(IDBEditAndNavigateActions)
  ['{747E57E1-5E65-41A8-9732-3C26CE80CF01}']
    function  Find(Codigo: String; Sequencial: Integer): Boolean;
    function  Open: Boolean;

    function GetPEV_CODIGO     : String;
    function GetPRO_CODIGO     : String;
    procedure SetPRO_Codigo(Value: String);
    function GetSEQUENCIAL     : Integer;
    procedure SetSequencial(Value: Integer);
    function GetQTDE           : Double;
    procedure SetQTDE(Value: Double);
    function GetVALOR          : Double;
    procedure SetValor(Value: Double);
    function GetAliquotaICMS   : Double;
    procedure SetAliquotaICMS(Value: Double);
    function GetAliquotaIPI    : Double;
    procedure SetAliquotaIPI(Value: Double);
    function GetCFOP_Codigo    : String;
    procedure SetCFOP_Codigo(Value: String);
    function GetSTA_Codigo     : String;
    procedure SetSTA_Codigo(Value: String);
    function GetSTB_Codigo     : String;
    procedure SetSTB_Codigo(Value: String);
    function GetUnidade        : String;
    procedure SetUnidade(Value: String);
    function GetFrete          : Double;
    procedure SetFrete(Value: Double);
    function GetCOMPDESCRICAO  : String;
    procedure SetCOMPDESCRICAO(Value: String);
    function GetComprimento    : Double;
    procedure SetComprimento(Value: Double);
    function GetAltura         : Double;
    procedure SetAltura(Value: Double);
    function GetLargura        : Double;
    procedure SetLargura(Value: Double);
    function GetDesconto       : Double;
    procedure SetDesconto(Value: Double);
    function GetSTBSN_Codigo   : String;
    procedure SetSTBSN_Codigo(Value: String);
    function GetAliqICMSSubst  : Double;
    procedure SetAliqICMSSubst(Value: Double);
    function GetBaseICMSSubst  : Double;
    procedure SetBaseICMSSubst(Value: Double);
    function GetValorICMSSubst : Double;
    procedure SetValorICMSSubst(Value: Double);
    property PEV_CODIGO    : String  read GetPEV_CODIGO;
    property PRO_CODIGO    : String  read GetPRO_CODIGO     write SetPRO_CODIGO;
    property SEQUENCIAL    : Integer read GetSEQUENCIAL     write SetSEQUENCIAL;
    property QTDE          : Double  read GetQTDE           write SetQTDE;
    property VALOR         : Double  read GetVALOR          write SetVALOR;
    property AliquotaICMS  : Double  read GetAliquotaICMS   write SetAliquotaICMS;
    property AliquotaIPI   : Double  read GetAliquotaIPI    write SetAliquotaIPI;
    property CFOP_Codigo   : String  read GetCFOP_Codigo    write SetCFOP_Codigo;
    property STA_Codigo    : String  read GetSTA_Codigo     write SetSTA_Codigo;
    property STB_Codigo    : String  read GetSTB_Codigo     write SetSTB_Codigo;
    property Unidade       : String  read GetUnidade        write SetUnidade;
    property Frete         : Double  read GetFrete          write SetFrete;
    property COMPDESCRICAO : String  read GetCOMPDESCRICAO  write SetCOMPDESCRICAO;
    property Comprimento   : Double  read GetComprimento    write SetComprimento;
    property Altura        : Double  read GetAltura         write SetAltura;
    property Largura       : Double  read GetLargura        write SetLargura;
    property Desconto      : Double  read GetDesconto       write SetDesconto;
    property STBSN_Codigo  : String  read GetSTBSN_Codigo   write SetSTBSN_Codigo;
    property AliqICMSSubst : Double  read GetAliqICMSSubst  write SetAliqICMSSubst;
    property BaseICMSSubst : Double  read GetBaseICMSSubst  write SetBaseICMSSubst;
    property ValorICMSSubst: Double  read GetValorICMSSubst write SetValorICMSSubst;
  end;

  //Serviços do Pedido de Venda
  IServicosPedidoDeVenda = interface(IDBEditAndNavigateActions)
  ['{21967E69-B096-48E0-BFFB-CE3D46C0E7D1}']
    function  Find(Codigo: String; Sequencial: Integer): Boolean;
    function  Open: Boolean;

    function GetPEV_Codigo: String;
    function GetSequencial: Integer;
    procedure SetSequencial(Value: Integer);
    function GetSER_Codigo: String;
    procedure SetSER_Codigo(Value: String);
    function GetMDS_Codigo: String;
    procedure SetMDS_Codigo(Value: String);
    function GetValor: Double;
    procedure SetValor(Value: Double);
    function GetObservacao: String;
    procedure SetObservacao(Value: String);
    function GetQTDSERVICOS: Double;
    procedure SetQTDSERVICOS(Value: Double);
    function GetDESCONTO: Double;
    procedure SetDESCONTO(Value: Double);
    property PEV_Codigo : String  read GetPEV_Codigo;
    property Sequencial : Integer read GetSequencial  write SetSequencial;
    property SER_Codigo : String  read GetSER_Codigo  write SetSER_Codigo;
    property MDS_Codigo : String  read GetMDS_Codigo  write SetMDS_Codigo;
    property Valor	    : Double  read GetValor	      write SetValor;
    property Observacao : String  read GetObservacao  write SetObservacao;
    property QTDSERVICOS: Double  read GetQTDSERVICOS write SetQTDSERVICOS;
    property DESCONTO   : Double  read GetDESCONTO    write SetDESCONTO;
  end;

  IOrcamentoFisicoFinanceiro = interface;
  IProdutosDoOrcamento = interface;
  IContasDeOrcamento = interface;
  
  IOrcamentoFisicoFinanceiro = interface(IDBEditActions)
  ['{698F0CE5-9A21-44FB-89FA-D8281CC576C8}']
    procedure Open;
    function  Find(Codigo: Integer): Boolean;
    function  FindItem(DataInicial: TDateTime; PRO_Codigo, CRS_Codigo: string): Boolean;

    function GetEMP_Codigo : String;
    function GetCodigo     : Integer;
    function GetDataInicial: TDateTime;
    function GetDataFinal  : TDateTime;
    function GetEST_Codigo : String;
    function GetFechado    : Integer;
    function GetCRS_Codigo : String;
    function GetDinamico   : Integer;
    function GetDataCalculo: TDateTime;
    function GetObs        : String;
    function GetContasDeOrcamento: IContasDeOrcamento;
    function GetProdutosDoOrcamento: IProdutosDoOrcamento;

    procedure SetEMP_Codigo(Value: String);
    procedure SetCodigo(Value: Integer);
    procedure SetDataInicial(Value: TDateTime);
    procedure SetDataFinal(Value: TDateTime);
    procedure SetEST_Codigo(Value: String);
    procedure SetFechado(Value: Integer);
    procedure SetCRS_Codigo(Value: String);
    procedure SetDinamico(Value: Integer);
    procedure SetDataCalculo(Value: TDateTime);
    procedure SetObs(Value: string);

    property EMP_Codigo  : String    read GetEMP_Codigo  write SetEMP_Codigo;
    property Codigo      : Integer   read GetCodigo      write SetCodigo;
    property DataInicial : TDateTime read GetDataInicial write SetDataInicial;
    property DataFinal   : TDateTime read GetDataFinal   write SetDataFinal;
    property EST_Codigo  : String    read GetEST_Codigo  write SetEST_Codigo;
    property Fechado     : Integer   read GetFechado     write SetFechado;
    property CRS_Codigo  : String    read GetCRS_Codigo  write SetCRS_Codigo;
    property Dinamico    : Integer   read GetDinamico    write SetDinamico;
    property DataCalculo : TDateTime read GetDataCalculo write SetDataCalculo;
    property Obs         : String    read GetObs         write SetObs;
    property ContasDeOrcamento: IContasDeOrcamento read GetContasDeOrcamento;
    property ProdutosDoOrcamento: IProdutosDoOrcamento read GetProdutosDoOrcamento;
  end;

  IContasDeOrcamento = interface(IDBEditAndNavigateActions)
  ['{66219C6D-EF12-4934-8B05-74A0F01FD958}']
    function  Find(ORF_Codigo: Integer; Codigo: String): Boolean;
    function  Open(PRO_Codigo: string):Boolean;

    function GetEMP_Codigo: String;
    function GetORF_Codigo: Integer;
    function GetCodigo:     String;
    function GetNome:       String;
    function GetQtdOrcado:  Double;

    procedure SetEMP_Codigo(Value: String);
    procedure SetORF_Codigo(Value: Integer);
    procedure SetCodigo(Value: String);
    procedure SetNome(Value: String);
    procedure SetQtdOrcado(Value: Double);

    property EMP_Codigo: String  read GetEMP_Codigo write SetEMP_Codigo;
    property ORF_Codigo: Integer read GetORF_Codigo write SetORF_Codigo;
    property Codigo    : String  read GetCodigo     write SetCodigo;
    property Nome      : String  read GetNome       write SetNome;
    property QtdOrcado : Double  read GetQtdOrcado  write SetQtdOrcado;
  end;

  IProdutosDoOrcamento = interface (IDBEditAndNavigateActions)
  ['{05BCE9C5-D9B6-4CC1-939B-889F2285F7C8}']
    function  Find(ORF_Codigo: Integer; COF_Codigo, PRO_Codigo: String; Sequencial: Integer): Boolean;
    function  Open:Boolean;

    function GetEMP_Codigo: String;
    function GetORF_Codigo: Integer;
    function GetCOF_Codigo: String;
    function GetPRO_Codigo: String;
    function GetSequencial: Integer;
    function GetCRS_Codigo: String;

    procedure SetEMP_Codigo(Value: String);
    procedure SetORF_Codigo(Value: Integer);
    procedure SetCOF_Codigo(Value: String);
    procedure SetPRO_Codigo(Value: String);
    procedure SetSequencial(Value: Integer);
    procedure SetCRS_Codigo(Value: String);

    property EMP_Codigo: String  read GetEMP_Codigo write SetEMP_Codigo;
    property ORF_Codigo: Integer read GetORF_Codigo write SetORF_Codigo;
    property COF_Codigo: String  read GetCOF_Codigo write SetCOF_Codigo;
    property PRO_Codigo: String  read GetPRO_Codigo write SetPRO_Codigo;
    property Sequencial: Integer read GetSequencial write SetSequencial;
    property CRS_Codigo: String  read GetCRS_Codigo write SetCRS_Codigo;
  end;

  ICentroDeResultado = interface(IDBEditActions)
  ['{F0C18B2C-ED0D-4947-8FBB-213BEA6FE9CA}']
    function  FindCodigo(Codigo: String): Boolean;
    function  FindNome(Nome: String): Boolean;
    procedure Open;
    function  GetListaCentroDeResultado: IListaCentroDeResultado;
    function  GetCodigo: String;
    procedure SetCodigo(const Value: String);
    function  GetNome: String;
    procedure SetNome(const Value: String);
    function  GetCRS_Codigo_Mae: String;
    procedure SetCRS_Codigo_Mae(const Value: String);
    function  GetContaContabil: String;
    procedure SetContaContabil(const Value: String);
    function  GetGCR_Codigo: String;
    procedure SetGCR_Codigo(const Value: String);
    function  GetInativo: Integer;
    procedure SetInativo(const Value: Integer);
    property Codigo         : string  read GetCodigo         write SetCodigo;
    property Nome           : string  read GetNome           write SetNome;
    property CRS_Codigo_Mae : string  read GetCRS_Codigo_Mae write SetCRS_Codigo_Mae;
    property ContaContabil  : string  read GetContaContabil  write SetContaContabil;
    property GCR_Codigo     : string  read GetGCR_Codigo     write SetGCR_Codigo;
    property Inativo        : integer read GetInativo        write SetInativo;
  end;
  
  // Almoxarifado
  IAlmoxarifado = interface
  ['{2D39AD12-F01B-4947-840C-371AB3D65F8D}']
    function GetSaldoEstoque(ces_codigo, pro_codigo: String; aData: TDateTime; lot_sequencial: Integer): Double;
    function GetListaRequisitantes(SQLComplementar: String): IListaRequisitantes;
    function GetSaldoEstoqueGeral(CES_Codigo: String; aData: TDateTime): IListaEstoquesPRO_CES_LOTE;
    function GetSaldoEstoqueAtivoComLote(CES_Codigo: String; aData: TDateTime): IListaEstoqueAtivoComLote;
    //
  end;

  IDanfe = interface
  ['{2079B2D2-766C-4E3F-A108-CBCC377D3C21}']
    function GetDanfeStream(EMP_Codigo, NFS_Codigo: String; var Retorno): Integer;
  end;

  ITransferenciaEntreContas = interface(IDBEditActions)
  ['{DDAA5060-E899-4520-8DCF-3E7C0BEE0893}']
    procedure Open;
    function  Find(Data: TDateTime; Sequencial: Integer): Boolean;
    function FindIDWS(IDWS: String): Boolean;
    //
    function GetData: TDateTime;
    procedure SetData(Value: TDateTime);
    function GetSequencial: Integer;
    procedure SetSequencial(Value: Integer);
    function GetEstOrigem: string;
    procedure SetEstOrigem(Value: string);
    function GetEstDestino: string;
    procedure SetEstDestino(Value: string);
    function GetConOrigem: string;
    procedure SetConOrigem(Value: string);
    function GetConDestino: string;
    procedure SetConDestino(Value: string);
    function GetValor: Double;
    procedure SetValor(Value: Double);
    function GetHistorico: string;
    procedure SetHistorico(Value: string);
    function GetExportaAC: Boolean;
    procedure SetExportaAC(Value: Boolean);
    function GetHisCodigo: string;
    procedure SetHisCodigo(Value: string);
    function GetUsuCodigo: string;
    procedure SetUsuCodigo(Value: string);
    function GetIDWS: string;
    procedure SetIDWS(const Value: String);
    //
    property Data: TDateTime read GetData write SetData;
    property Sequencial: Integer read GetSequencial write SetSequencial;
    property EstOrigem: string read GetEstOrigem write SetEstOrigem;
    property EstDestino: string read GetEstDestino write SetEstDestino;
    property ConOrigem: string read GetConOrigem write SetConOrigem;
    property ConDestino: string read GetConDestino write SetConDestino;
    property Valor: Double read GetValor write SetValor;
    property Historico: string read GetHistorico write SetHistorico;
    property ExportaAC: Boolean read GetExportaac write SetExportaac;
    property HisCodigo: string read GetHisCodigo write SetHisCodigo;
    property UsuCodigo: string read GetUsuCodigo write SetUsuCodigo;
    property IDWS: String read GetIDWS write SetIDWS;
  end;

  IMapaResumo = interface(IDBEditActions)
  ['{DFFC50C1-C874-4BA0-A6E9-812947E6A0F6}']
    procedure Open;
    function Find(Codigo: String): Boolean;
    function FindIDWS(IDWS: String): Boolean;
    function GetAIDF: String;
    function GetCancelado: Integer;
    function GetDataEmissao: TDateTime;
    function GetEstabelecimento: String;
    function GetFormulario: Integer;
    function GetNumero: Integer;
    function GetObservacao: String;
    function GetSerie: String;
    function GetSubserie: String;
    function GetCodigo: String;
    procedure SetAIDF(const Value: String);
    procedure SetCancelado(const Value: Integer);
    procedure SetDataEmissao(const Value: TDateTime);
    procedure SetEstabelecimento(const Value: String);
    procedure SetFormulario(const Value: Integer);
    procedure SetNumero(const Value: Integer);
    procedure SetObservacao(const Value: String);
    procedure SetSerie(const Value: String);
    procedure SetSubserie(const Value: String);
    procedure SetCodigo(const Value: String);
    procedure SetIDWS(const Value: String);
    function GetIDWS: String;
    //
    property Estabelecimento: String read GetEstabelecimento write SetEstabelecimento;
    property AIDF: String            read GetAIDF            write SetAIDF;
    property Serie: String           read GetSerie           write SetSerie;
    property Subserie: String        read GetSubserie        write SetSubserie;
    property Numero: Integer         read GetNumero          write SetNumero;
    property Formulario: Integer     read GetFormulario      write SetFormulario;
    property DataEmissao: TDateTime  read GetDataEmissao     write SetDataEmissao;
    property Cancelado: Integer      read GetCancelado       write SetCancelado;
    property Observacao: String      read GetObservacao      write SetObservacao;
    property Codigo: String          read GetCodigo          write SetCodigo;
    property IDWS: String read GetIDWS write SetIDWS;
  end;

  ICupomFiscal = interface(IDBEditActions)
  ['{E3E6FC76-EE77-4193-963D-9778732BE439}']
    function Find(Codigo: String): Boolean;
    function FindIDWS(IDWS: String): Boolean;
    function GetCodigo: String;
    function GetAcrescimo: Double;
    function GetCancelamentos: Double;
    function GetContadorReducao: Integer;
    function GetCOOFinal: Integer;
    function GetCOOInicial: Integer;
    function GetCOOReducao: Integer;
    function GetData: TDateTime;
    function GetDescontos: Double;
    function GetEstabelecimento: String;
    function GetEstabEquipamento: String;
    function GetFatura: String;
    function GetFaturaCupom: IFaturasCupomFiscal;
    function GetIsentas: Double;
    function GetMapaResumoECF: Integer;
    function GetMRE_AIDF: String;
    function GetNaoIncidencia: Double;
    function GetNumero: Integer;
    function GetNumeroCRO: Integer;
    function GetObservacao: String;
    function GetReceitaTributCOFINS: Double;
    function GetReceitaTributCSL1: Double;
    function GetReceitaTributCSL2: Double;
    function GetReceitaTributIRPJ1: Double;
    function GetReceitaTributIRPJ2: Double;
    function GetReceitaTributIRPJ3: Double;
    function GetReceitaTributIRPJ4: Double;
    function GetReceitaTributPIS: Double;
    function GetServico: Integer;
    function GetServicosISS: Double;
    function GetSubstituicao: Double;
    function GetTotalizacaoGeral: Double;
    function GetVendaBruta: Double;
    procedure SetCodigo(const Value: String);
    procedure SetAcrescimo(const Value: Double);
    procedure SetCancelamentos(const Value: Double);
    procedure SetContadorReducao(const Value: Integer);
    procedure SetCOOFinal(const Value: Integer);
    procedure SetCOOInicial(const Value: Integer);
    procedure SetCOOReducao(const Value: Integer);
    procedure SetData(const Value: TDateTime);
    procedure SetDescontos(const Value: Double);
    procedure SetEstabelecimento(const Value: String);
    procedure SetEstabEquipamento(const Value: String);
    procedure SetFatura(const Value: String);
    procedure SetIsentas(const Value: Double);
    procedure SetMapaResumoECF(const Value: Integer);
    procedure SetMRE_AIDF(const Value: String);
    procedure SetNaoIncidencia(const Value: Double);
    procedure SetNumero(const Value: Integer);
    procedure SetNumeroCRO(const Value: Integer);
    procedure SetObservacao(const Value: String);
    procedure SetReceitaTributCOFINS(const Value: Double);
    procedure SetReceitaTributCSL1(const Value: Double);
    procedure SetReceitaTributCSL2(const Value: Double);
    procedure SetReceitaTributIRPJ1(const Value: Double);
    procedure SetReceitaTributIRPJ2(const Value: Double);
    procedure SetReceitaTributIRPJ3(const Value: Double);
    procedure SetReceitaTributIRPJ4(const Value: Double);
    procedure SetReceitaTributPIS(const Value: Double);
    procedure SetServico(const Value: Integer);
    procedure SetServicosISS(const Value: Double);
    procedure SetSubstituicao(const Value: Double);
    procedure SetTotalizacaoGeral(const Value: Double);
    procedure SetVendaBruta(const Value: Double);
    function GetCuponsDoCupom: ICupomDoCupom;
    function GetICMSCupom: IICMSCupomFiscal;
    function GetISSCupom: IISSCupomFiscal;
    function GetOutrosValores: IOutrosValoresCupomFiscal;
    procedure SetIDWS(const Value: String);
    function GetIDWS: String;
    //
    property Estabelecimento: String                  read GetEstabelecimento     write SetEstabelecimento;
    property Data: TDateTime                          read GetData                write SetData;
    property Numero: Integer                          read GetNumero              write SetNumero;
    property COOReducao: Integer                      read GetCOOReducao          write SetCOOReducao;
    property COOInicial: Integer                      read GetCOOInicial          write SetCOOInicial;
    property COOFinal: Integer                        read GetCOOFinal            write SetCOOFinal;
    property ContadorReducao: Integer                 read GetContadorReducao     write SetContadorReducao;
    property NumeroCRO: Integer                       read GetNumeroCRO           write SetNumeroCRO;
    property VendaBruta: Double                       read GetVendaBruta          write SetVendaBruta;
    property TotalizacaoGeral: Double                 read GetTotalizacaoGeral    write SetTotalizacaoGeral;
    property Cancelamentos: Double                    read GetCancelamentos       write SetCancelamentos;
    property Descontos: Double                        read GetDescontos           write SetDescontos;
    property Substituicao: Double                     read GetSubstituicao        write SetSubstituicao;
    property Isentas: Double                          read GetIsentas             write SetIsentas;
    property NaoIncidencia: Double                    read GetNaoIncidencia       write SetNaoIncidencia;
    property ServicosISS: Double                      read GetServicosISS         write SetServicosISS;
    property MapaResumoECF: Integer                   read GetMapaResumoECF       write SetMapaResumoECF;
    property MRE_AIDF: String                         read GetMRE_AIDF            write SetMRE_AIDF;
    property Servico: Integer                         read GetServico             write SetServico;
    property ReceitaTributCOFINS: Double              read GetReceitaTributCOFINS write SetReceitaTributCOFINS;
    property ReceitaTributPIS: Double                 read GetReceitaTributPIS    write SetReceitaTributPIS;
    property ReceitaTributCSL1: Double                read GetReceitaTributCSL1   write SetReceitaTributCSL1;
    property ReceitaTributCSL2: Double                read GetReceitaTributCSL2   write SetReceitaTributCSL2;
    property ReceitaTributIRPJ1: Double               read GetReceitaTributIRPJ1  write SetReceitaTributIRPJ1;
    property ReceitaTributIRPJ2: Double               read GetReceitaTributIRPJ2  write SetReceitaTributIRPJ2;
    property ReceitaTributIRPJ3: Double               read GetReceitaTributIRPJ3  write SetReceitaTributIRPJ3;
    property ReceitaTributIRPJ4: Double               read GetReceitaTributIRPJ4  write SetReceitaTributIRPJ4;
    property Observacao: String                       read GetObservacao          write SetObservacao;
    property Fatura: String                           read GetFatura              write SetFatura;
    property Acrescimo: Double                        read GetAcrescimo           write SetAcrescimo;
    property EstabEquipamento: String                 read GetEstabEquipamento    write SetEstabEquipamento;
    property Codigo: String                           read GetCodigo              write SetCodigo;
    property FaturaCupom: IFaturasCupomFiscal         read GetFaturaCupom;
    property CuponsDoCupom: ICupomDoCupom             read GetCuponsDoCupom;
    property ICMSCupom: IICMSCupomFiscal              read GetICMSCupom;
    property ISSCupom: IISSCupomFiscal                read GetISSCupom;
    property OutrosValores: IOutrosValoresCupomFiscal read GetOutrosValores;
    property IDWS: String read GetIDWS write SetIDWS;
  end;

  ICupomdoCupom = interface(IDBEditAndNavigateActions)
  ['{BE720421-DA49-421D-A44E-908412A99088}']
    function GetAcrescimo: Double;
    function GetCodParticipante: Integer;
    function GetCOO: Integer;
    function GetDescontoGlobal: Double;
    function GetProdutosCupom: IProdutoCupom;
    function GetSituacaoCOO: Integer;
    function GetValorServicos: Double;
    procedure SetAcrescimo(const Value: Double);
    procedure SetCodParticipante(const Value: Integer);
    procedure SetCOO(const Value: Integer);
    procedure SetDescontoGlobal(const Value: Double);
    procedure SetSituacaoCOO(const Value: Integer);
    procedure SetValorServicos(const Value: Double);
    //
    property COO: Integer                 read GetCOO             write SetCOO;
    property ValorServicos: Double        read GetValorServicos   write SetValorServicos;
    property DescontoGlobal: Double       read GetDescontoGlobal  write SetDescontoGlobal;
    property CodParticipante: Integer     read GetCodParticipante write SetCodParticipante;
    property SituacaoCOO: Integer         read GetSituacaoCOO     write SetSituacaoCOO;
    property Acrescimo: Double            read GetAcrescimo       write SetAcrescimo;
    property ProdutosCupom: IProdutoCupom read GetProdutosCupom;
  end;

  IProdutoCupom = interface(IDBEditAndNavigateActions)
  ['{8B94F306-35B3-4EE3-BF54-565B9CB93BEF}']
    function GetAcrescimo: Double;
    function GetAliquotaCOFINSPerc: Double;
    function GetAliquotaCOFINSReais: Double;
    function GetAliquotaICMS: Double;
    function GetAliquotaPISPerc: Double;
    function GetAliquotaPISReais: Double;
    function GetBaseCalculoCOFINS: Double;
    function GetBaseCalculoICMS: Double;
    function GetBaseCalculoPIS: Double;
    function GetCFOP: String;
    function GetCSOSN: String;
    function GetCST_COFINS: String;
    function GetCST_PIS: String;
    function GetCSTA: String;
    function GetCSTB: String;
    function GetNaturezaReceitaCOFINS: String;
    function GetNaturezaReceitaPIS: String;
    function GetProduto: String;
    function GetQuantidade: Double;
    function GetSituacaoTributCSOSN: String;
    function GetTipoCalculoCOFINS: String;
    function GetTipoCalculoPIS: String;
    function GetTributacaoICMS: String;
    function GetUnidadeMedida: String;
    function GetValorBruto: Double;
    function GetValorCancelamento: Double;
    function GetValorCOFINS: Double;
    function GetValorDesconto: Double;
    function GetValorPIS: Double;
    function GetValorTotal: Double;
    procedure SetAcrescimo(const Value: Double);
    procedure SetAliquotaCOFINSPerc(const Value: Double);
    procedure SetAliquotaCOFINSReais(const Value: Double);
    procedure SetAliquotaICMS(const Value: Double);
    procedure SetAliquotaPISPerc(const Value: Double);
    procedure SetAliquotaPISReais(const Value: Double);
    procedure SetBaseCalculoCOFINS(const Value: Double);
    procedure SetBaseCalculoICMS(const Value: Double);
    procedure SetBaseCalculoPIS(const Value: Double);
    procedure SetCFOP(const Value: String);
    procedure SetCSOSN(const Value: String);
    procedure SetCST_COFINS(const Value: String);
    procedure SetCST_PIS(const Value: String);
    procedure SetCSTA(const Value: String);
    procedure SetCSTB(const Value: String);
    procedure SetNaturezaReceitaCOFINS(const Value: String);
    procedure SetNaturezaReceitaPIS(const Value: String);
    procedure SetProduto(const Value: String);
    procedure SetQuantidade(const Value: Double);
    procedure SetSituacaoTributCSOSN(const Value: String);
    procedure SetTipoCalculoCOFINS(const Value: String);
    procedure SetTipoCalculoPIS(const Value: String);
    procedure SetTributacaoICMS(const Value: String);
    procedure SetUnidadeMedida(const Value: String);
    procedure SetValorBruto(const Value: Double);
    procedure SetValorCancelamento(const Value: Double);
    procedure SetValorCOFINS(const Value: Double);
    procedure SetValorDesconto(const Value: Double);
    procedure SetValorPIS(const Value: Double);
    procedure SetValorTotal(const Value: Double);
    //
    property Produto: String read GetProduto write SetProduto;
    property Quantidade: Double read GetQuantidade write SetQuantidade;
    property UnidadeMedida: String read GetUnidadeMedida write SetUnidadeMedida;
    property ValorBruto: Double read GetValorBruto write SetValorBruto;
    property CFOP: String read GetCFOP write SetCFOP;
    property TributacaoICMS: String read GetTributacaoICMS write SetTributacaoICMS;
    property BaseCalculoICMS: Double read GetBaseCalculoICMS write SetBaseCalculoICMS;
    property AliquotaICMS: Double read GetAliquotaICMS write SetAliquotaICMS;
    property BaseCalculoCOFINS: Double read GetBaseCalculoCOFINS write SetBaseCalculoCOFINS;
    property BaseCalculoPIS: Double read GetBaseCalculoPIS write SetBaseCalculoPIS;
    property CSTA: String read GetCSTA write SetCSTA;
    property CSTB: String read GetCSTB write SetCSTB;
    property CST_PIS: String read GetCST_PIS write SetCST_PIS;
    property CST_COFINS: String read GetCST_COFINS write SetCST_COFINS;
    property NaturezaReceitaCOFINS: String read GetNaturezaReceitaCOFINS write SetNaturezaReceitaCOFINS;
    property NaturezaReceitaPIS: String read GetNaturezaReceitaPIS write SetNaturezaReceitaPIS;
    property ValorCancelamento: Double read GetValorCancelamento write SetValorCancelamento;
    property ValorDesconto: Double read GetValorDesconto write SetValorDesconto;
    property ValorTotal: Double read GetValorTotal write SetValorTotal;
    property TipoCalculoCOFINS: String read GetTipoCalculoCOFINS write SetTipoCalculoCOFINS;
    property AliquotaCOFINSPerc: Double read GetAliquotaCOFINSPerc write SetAliquotaCOFINSPerc;
    property AliquotaCOFINSReais: Double read GetAliquotaCOFINSReais write SetAliquotaCOFINSReais;
    property ValorCOFINS: Double read GetValorCOFINS write SetValorCOFINS;
    property TipoCalculoPIS: String read GetTipoCalculoPIS write SetTipoCalculoPIS;
    property AliquotaPISPerc: Double read GetAliquotaPISPerc write SetAliquotaPISPerc;
    property AliquotaPISReais: Double read GetAliquotaPISReais write SetAliquotaPISReais;
    property ValorPIS: Double read GetValorPIS write SetValorPIS;
    property Acrescimo: Double read GetAcrescimo write SetAcrescimo;
    property SituacaoTributCSOSN: String read GetSituacaoTributCSOSN write SetSituacaoTributCSOSN;
    property CSOSN: String read GetCSOSN write SetCSOSN;
  end;

  IICMSCupomFiscal = interface(IDBEditAndNavigateActions)
  ['{CC6B29E9-F4DD-4994-8EEC-87B4E3048E0A}']
    function GetAliquotaICMS: Double;
    function GetBaseCalculoICMS: Double;
    function GetCFOP: String;
    function GetCOFINSMonofasico: Integer;
    function GetCSOSN: String;
    function GetCSTA: String;
    function GetCSTB: String;
    function GetPISMonofasico: Integer;
    function GetSitTribCSOSN: String;
    function GetSubstituicaoCOFINS: Integer;
    function GetSubstituicaoICMS: Integer;
    function GetSubstituicaoPISPASEP: Integer;
    function GetUF: String;
    function GetValor: Double;
    function GetValorICMSDebitado: Double;
    function GetValorIsentasICMS: Double;
    function GetValorOutrasICMS: Double;
    procedure SetAliquotaICMS(const Value: Double);
    procedure SetBaseCalculoICMS(const Value: Double);
    procedure SetCFOP(const Value: String);
    procedure SetCOFINSMonofasico(const Value: Integer);
    procedure SetCSOSN(const Value: String);
    procedure SetCSTA(const Value: String);
    procedure SetCSTB(const Value: String);
    procedure SetPISMonofasico(const Value: Integer);
    procedure SetSitTribCSOSN(const Value: String);
    procedure SetSubstituicaoCOFINS(const Value: Integer);
    procedure SetSubstituicaoICMS(const Value: Integer);
    procedure SetSubstituicaoPISPASEP(const Value: Integer);
    procedure SetUF(const Value: String);
    procedure SetValor(const Value: Double);
    procedure SetValorICMSDebitado(const Value: Double);
    procedure SetValorIsentasICMS(const Value: Double);
    procedure SetValorOutrasICMS(const Value: Double);
    //
    property Valor: Double                 read GetValor write SetValor;
    property UF: String                    read GetUF write SetUF;
    property CFOP: String                  read GetCFOP write SetCFOP;
    property BaseCalculoICMS: Double       read GetBaseCalculoICMS write SetBaseCalculoICMS;
    property AliquotaICMS: Double          read GetAliquotaICMS write SetAliquotaICMS;
    property ValorICMSDebitado: Double     read GetValorICMSDebitado write SetValorICMSDebitado;
    property ValorIsentasICMS: Double      read GetValorIsentasICMS write SetValorIsentasICMS;
    property ValorOutrasICMS: Double       read GetValorOutrasICMS write SetValorOutrasICMS;
    property SubstituicaoICMS: Integer     read GetSubstituicaoICMS write SetSubstituicaoICMS;
    property SubstituicaoCOFINS: Integer   read GetSubstituicaoCOFINS write SetSubstituicaoCOFINS;
    property SubstituicaoPISPASEP: Integer read GetSubstituicaoPISPASEP write SetSubstituicaoPISPASEP;
    property CSTA: String                  read GetCSTA write SetCSTA;
    property CSTB: String                  read GetCSTB write SetCSTB;
    property SitTribCSOSN: String          read GetSitTribCSOSN write SetSitTribCSOSN;
    property CSOSN: String                 read GetCSOSN write SetCSOSN;
    property COFINSMonofasico: Integer     read GetCOFINSMonofasico write SetCOFINSMonofasico;
    property PISMonofasico: Integer        read GetPISMonofasico write SetPISMonofasico;
  end;

  IISSCupomFiscal = interface(IDBEditAndNavigateActions)
  ['{A7AEB98D-37FD-44DF-B7D2-7BBAAFAFAD37}']
    function GetAliquota: Double;
    function GetAtividade: String;
    function GetBaseCalculoCOFINS: Double;
    function GetBaseCalculoPIS: Double;
    function GetCST_COFINS: String;
    function GetCST_PIS: String;
    function GetMunicipio: String;
    function GetNaturezaReceitaCOFINS: String;
    function GetNaturezaReceitaPIS: String;
    function GetNaturezaServicos: String;
    function GetServicos: Double;
    function GetSubtotal: Double;
    function GetTributacao: String;
    function GetUF: String;
    procedure SetAliquota(const Value: Double);
    procedure SetAtividade(const Value: String);
    procedure SetBaseCalculoCOFINS(const Value: Double);
    procedure SetBaseCalculoPIS(const Value: Double);
    procedure SetCST_COFINS(const Value: String);
    procedure SetCST_PIS(const Value: String);
    procedure SetMunicipio(const Value: String);
    procedure SetNaturezaReceitaCOFINS(const Value: String);
    procedure SetNaturezaReceitaPIS(const Value: String);
    procedure SetNaturezaServicos(const Value: String);
    procedure SetServicos(const Value: Double);
    procedure SetSubtotal(const Value: Double);
    procedure SetTributacao(const Value: String);
    procedure SetUF(const Value: String);
    //
    property Subtotal: Double              read GetSubtotal write SetSubtotal;
    property Atividade: String             read GetAtividade write SetAtividade;
    property Tributacao: String            read GetTributacao write SetTributacao;
    property Servicos: Double              read GetServicos write SetServicos;
    property Aliquota: Double              read GetAliquota write SetAliquota;
    property UF: String                    read GetUF write SetUF;
    property Municipio: String             read GetMunicipio write SetMunicipio;
    property NaturezaServicos: String      read GetNaturezaServicos write SetNaturezaServicos;
    property CST_COFINS: String            read GetCST_COFINS write SetCST_COFINS;
    property BaseCalculoCOFINS: Double     read GetBaseCalculoCOFINS write SetBaseCalculoCOFINS;
    property CST_PIS: String               read GetCST_PIS write SetCST_PIS;
    property BaseCalculoPIS: Double        read GetBaseCalculoPIS write SetBaseCalculoPIS;
    property NaturezaReceitaCOFINS: String read GetNaturezaReceitaCOFINS write SetNaturezaReceitaCOFINS;
    property NaturezaReceitaPIS: String    read GetNaturezaReceitaPIS write SetNaturezaReceitaPIS;
  end;

  IOutrosValoresCupomFiscal = interface(IDBEditAndNavigateActions)
  ['{DEAF0501-A229-4908-AE97-5A99D3EBEECE}']
    function GetCodigo: String;
    function GetValor: Double;
    procedure SetCodigo(const Value: String);
    procedure SetValor(const Value: Double);
    //
    property Codigo: String read GetCodigo write SetCodigo;
    property Valor: Double  read GetValor write SetValor;
  end;

  IFaturasCupomFiscal = interface(IDBEditActions)
  ['{920D97F9-09D9-4FCC-A8A7-F35329AC8B22}']
    function GetCodigo: String;
    function GetNumero: String;
    function GetTipoDocumento: String;
    function GetTipoOperacao: Integer;
    function GetTitulosCupom: ITitulosCupomFiscal;
    function GetValorDesconto: Double;
    function GetValorTotal: Double;
    procedure SetNumero(const Value: String);
    procedure SetTipoDocumento(const Value: String);
    procedure SetTipoOperacao(const Value: Integer);
    procedure SetValorDesconto(const Value: Double);
    procedure SetValorTotal(const Value: Double);
    //
    property Codigo: String              read GetCodigo;
    property Numero: String              read GetNumero write SetNumero;
    property TipoOperacao: Integer       read GetTipoOperacao write SetTipoOperacao;
    property TipoDocumento: String       read GetTipoDocumento write SetTipoDocumento;
    property ValorTotal: Double          read GetValorTotal write SetValorTotal;
    property ValorDesconto: Double       read GetValorDesconto write SetValorDesconto;
    property TitulosCupom: ITitulosCupomFiscal read GetTitulosCupom;
  end;

  ITitulosCupomFiscal = interface(IDBEditAndNavigateActions)
  ['{CC64B9A8-8F6C-4A77-905A-ABF356733E8F}']
    function GetCodigo: String;
    function GetBaixasCupom: IBaixasCupomFiscal;
    function GetDataVencimento: TDateTime;
    function GetTitulo: String;
    function GetValorCOFINSRetido: Double;
    function GetValorCSLRetido: Double;
    function GetValorPISRetido: Double;
    function GetValorTitulo: Double;
    procedure SetDataVencimento(const Value: TDateTime);
    procedure SetTitulo(const Value: String);
    procedure SetValorCOFINSRetido(const Value: Double);
    procedure SetValorCSLRetido(const Value: Double);
    procedure SetValorPISRetido(const Value: Double);
    procedure SetValorTitulo(const Value: Double);
    //
    property Codigo: String read GetCodigo;
    property Titulo: String read GetTitulo write SetTitulo;
    property DataVencimento: TDateTime read GetDataVencimento write SetDataVencimento;
    property ValorTitulo: Double read GetValorTitulo write SetValorTitulo;
    property ValorCOFINSRetido: Double read GetValorCOFINSRetido write SetValorCOFINSRetido;
    property ValorPISRetido: Double read GetValorPISRetido write SetValorPISRetido;
    property ValorCSLRetido: Double read GetValorCSLRetido write SetValorCSLRetido;
    property BaixasCupom: IBaixasCupomFiscal read GetBaixasCupom;
  end;

  IBaixasCupomFiscal = interface(IDBEditAndNavigateActions)
  ['{72F19937-4792-4A77-A5FE-9BE42C094455}']
    function GetCodigo: String;
    function GetData: TDateTime;
    function GetValor: Double;
    function GetValorCOFINSRetido: Double;
    function GetValorCSLRetido: Double;
    function GetValorDesconto: Double;
    function GetValorJuros: Double;
    function GetValorMulta: Double;
    function GetValorPISRetido: Double;
    function GetValorTotal: Double;
    procedure SetData(const Value: TDateTime);
    procedure SetValor(const Value: Double);
    procedure SetValorCOFINSRetido(const Value: Double);
    procedure SetValorCSLRetido(const Value: Double);
    procedure SetValorDesconto(const Value: Double);
    procedure SetValorJuros(const Value: Double);
    procedure SetValorMulta(const Value: Double);
    procedure SetValorPISRetido(const Value: Double);
    procedure SetValorTotal(const Value: Double);
    function GetApuracoesCupom: IApuracaoCupomFiscal;
    function GetDetalhamentosCupom: IDetalhamentoSNCupomFiscal;
    //
    property Codigo: String read GetCodigo;
    property Data: TDateTime read GetData write SetData;
    property Valor: Double read GetValor write SetValor;
    property ValorMulta: Double read GetValorMulta write SetValorMulta;
    property ValorJuros: Double read GetValorJuros write SetValorJuros;
    property ValorCOFINSRetido: Double read GetValorCOFINSRetido write SetValorCOFINSRetido;
    property ValorPISRetido: Double read GetValorPISRetido write SetValorPISRetido;
    property ValorCSLRetido: Double read GetValorCSLRetido write SetValorCSLRetido;
    property ValorTotal: Double read GetValorTotal write SetValorTotal;
    property ValorDesconto: Double read GetValorDesconto write SetValorDesconto;
    property ApuracoesCupom: IApuracaoCupomFiscal read GetApuracoesCupom;
    property DetalhamentosCupom: IDetalhamentoSNCupomFiscal read GetDetalhamentosCupom;
  end;

  IApuracaoCupomFiscal = interface(IDBEditAndNavigateActions)
  ['{55BCC7D2-D8C5-41AC-BF47-8EF8E873AE11}']
    function GetAliquotaCOFINSPerc: Double;
    function GetAliquotaCOFINSReais: Double;
    function GetAliquotaPISPerc: Double;
    function GetAliquotaPISReais: Double;
    function GetBaseCalculoCOFINS: Double;
    function GetBaseCalculoPIS: Double;
    function GetCFOP: String;
    function GetCST_COFINS: String;
    function GetCST_PIS: String;
    function GetDescricaoCOFINS: String;
    function GetDescricaoPIS: String;
    function GetNaturezaCOFINS: String;
    function GetNaturezaPIS: String;
    function GetQuantidadeEmReais: Double;
    function GetTipoCalculoCOFINS: String;
    function GetTipoCalculoPIS: String;
    function GetValorCOFINS: Double;
    function GetValorPIS: Double;
    function GetValorReceitaCOFINS: Double;
    function GetValorReceitaPIS: Double;
    procedure SetAliquotaCOFINSPerc(const Value: Double);
    procedure SetAliquotaCOFINSReais(const Value: Double);
    procedure SetAliquotaPISPerc(const Value: Double);
    procedure SetAliquotaPISReais(const Value: Double);
    procedure SetBaseCalculoCOFINS(const Value: Double);
    procedure SetBaseCalculoPIS(const Value: Double);
    procedure SetCFOP(const Value: String);
    procedure SetCST_COFINS(const Value: String);
    procedure SetCST_PIS(const Value: String);
    procedure SetDescricaoCOFINS(const Value: String);
    procedure SetDescricaoPIS(const Value: String);
    procedure SetNaturezaCOFINS(const Value: String);
    procedure SetNaturezaPIS(const Value: String);
    procedure SetQuantidadeEmReais(const Value: Double);
    procedure SetTipoCalculoCOFINS(const Value: String);
    procedure SetTipoCalculoPIS(const Value: String);
    procedure SetValorCOFINS(const Value: Double);
    procedure SetValorPIS(const Value: Double);
    procedure SetValorReceitaCOFINS(const Value: Double);
    procedure SetValorReceitaPIS(const Value: Double);
    //
    property CFOP: String read GetCFOP write SetCFOP;
    property QuantidadeEmReais: Double read GetQuantidadeEmReais write SetQuantidadeEmReais;
    property CST_COFINS: String read GetCST_COFINS write SetCST_COFINS;
    property ValorReceitaCOFINS: Double read GetValorReceitaCOFINS write SetValorReceitaCOFINS;
    property TipoCalculoCOFINS: String read GetTipoCalculoCOFINS write SetTipoCalculoCOFINS;
    property BaseCalculoCOFINS: Double read GetBaseCalculoCOFINS write SetBaseCalculoCOFINS;
    property AliquotaCOFINSPerc: Double read GetAliquotaCOFINSPerc write SetAliquotaCOFINSPerc;
    property AliquotaCOFINSReais: Double read GetAliquotaCOFINSReais write SetAliquotaCOFINSReais;
    property ValorCOFINS: Double read GetValorCOFINS write SetValorCOFINS;
    property CST_PIS: String read GetCST_PIS write SetCST_PIS;
    property ValorReceitaPIS: Double read GetValorReceitaPIS write SetValorReceitaPIS;
    property TipoCalculoPIS: String read GetTipoCalculoPIS write SetTipoCalculoPIS;
    property BaseCalculoPIS: Double read GetBaseCalculoPIS write SetBaseCalculoPIS;
    property AliquotaPISPerc: Double read GetAliquotaPISPerc write SetAliquotaPISPerc;
    property AliquotaPISReais: Double read GetAliquotaPISReais write SetAliquotaPISReais;
    property ValorPIS: Double read GetValorPIS write SetValorPIS;
    property DescricaoCOFINS: String read GetDescricaoCOFINS write SetDescricaoCOFINS;
    property DescricaoPIS: String read GetDescricaoPIS write SetDescricaoPIS;
    property NaturezaCOFINS: String read GetNaturezaCOFINS write SetNaturezaCOFINS;
    property NaturezaPIS: String read GetNaturezaPIS write SetNaturezaPIS;
  end;

  IDetalhamentoSNCupomFiscal = interface(IDBEditAndNavigateActions)
  ['{AD0EB97F-A747-4744-96B2-3426757A0A7B}']
    function GetAtividade: String;
    function GetCFOP: String;
    function GetCOFINSMonofasico: Integer;
    function GetEstabelecimento: String;
    function GetExterior: Integer;
    function GetISSRetido: Integer;
    function GetMunFavorecido: String;
    function GetPISMonofasico: Integer;
    function GetSubstituicaoCOFINS: Integer;
    function GetSubstituicaoICMS: Integer;
    function GetSubstituicaoIPI: Integer;
    function GetSubstituicaoPIS_PASEP: Integer;
    function GetTipoInformacao: String;
    function GetUFFavorecida: String;
    function GetValorIsentasICMS: Double;
    function GetValorReceita: Double;
    procedure SetAtividade(const Value: String);
    procedure SetCFOP(const Value: String);
    procedure SetCOFINSMonofasico(const Value: Integer);
    procedure SetEstabelecimento(const Value: String);
    procedure SetExterior(const Value: Integer);
    procedure SetISSRetido(const Value: Integer);
    procedure SetMunFavorecido(const Value: String);
    procedure SetPISMonofasico(const Value: Integer);
    procedure SetSubstituicaoCOFINS(const Value: Integer);
    procedure SetSubstituicaoICMS(const Value: Integer);
    procedure SetSubstituicaoIPI(const Value: Integer);
    procedure SetSubstituicaoPIS_PASEP(const Value: Integer);
    procedure SetTipoInformacao(const Value: String);
    procedure SetUFFavorecida(const Value: String);
    procedure SetValorIsentasICMS(const Value: Double);
    procedure SetValorReceita(const Value: Double);
    //
    property TipoInformacao        : String  read GetTipoInformacao        write SetTipoInformacao;
    property Estabelecimento       : String  read GetEstabelecimento       write SetEstabelecimento;
    property CFOP                  : String  read GetCFOP                  write SetCFOP;
    property SubstituicaoICMS      : Integer read GetSubstituicaoICMS      write SetSubstituicaoICMS;
    property SubstituicaoIPI       : Integer read GetSubstituicaoIPI       write SetSubstituicaoIPI;
    property SubstituicaoCOFINS    : Integer read GetSubstituicaoCOFINS    write SetSubstituicaoCOFINS;
    property SubstituicaoPIS_PASEP : Integer read GetSubstituicaoPIS_PASEP write SetSubstituicaoPIS_PASEP;
    property COFINSMonofasico      : Integer read GetCOFINSMonofasico      write SetCOFINSMonofasico;
    property PISMonofasico         : Integer read GetPISMonofasico         write SetPISMonofasico;
    property ValorIsentasICMS      : Double  read GetValorIsentasICMS      write SetValorIsentasICMS;
    property Exterior              : Integer read GetExterior              write SetExterior;
    property ISSRetido             : Integer read GetISSRetido             write SetISSRetido;
    property Atividade             : String  read GetAtividade             write SetAtividade;
    property UFFavorecida          : String  read GetUFFavorecida          write SetUFFavorecida;
    property MunFavorecido         : String  read GetMunFavorecido         write SetMunFavorecido;
    property ValorReceita          : Double  read GetValorReceita          write SetValorReceita;
  end;

  IConhecimentoTransporte = interface(IDBEditActions)
  ['{4A774871-D17E-45D6-929C-38E7F2F90AF6}']
    function Find(Codigo: String): Boolean;
    function FindIDWS(IDWS: String): Boolean;
    function GetAIDF: String;
    function GetAIDF_RMD: String;
    function GetALIQUOTAICMS: Double;
    function GetALIQUOTAINTERNA: Double;
    function GetALIQUOTAORIGEM: Double;
    function GetBASECALCDIFERENCIALALIQ: Double;
    function GetBASECALCULOCOFINS_PISNAOCUMULA: Double;
    function GetBASECALCULOICMS: Double;
    function GetCFOP: String;
    function GetCHAVEELETRONICA: String;
    function GetCODIGO: String;
    function GetCODIGOCONTACONTABIL: String;
    function GetCODIGOINFORMACAOCOMPLEMENTAR: String;
    function GetCONSIGNATARIO: String;
    function GetCSOSN: String;
    function GetCST_COFINS: String;
    function GetCST_PIS: String;
    function GetCSTB: String;
    function GetCSTCREDCOFINS_PIS: String;
    function GetDATAEMISSAO: TDateTime;
    function GetDATAENTRADA: TDateTime;
    function GetDESTINATARIO: String;
    function GetDIFERENCIALALIQUOTAS: Integer;
    function GetDISTANCIA: String;
    function GetESPECIE: String;
    function GetESTABELECIMENTO: String;
    function GetFATURA: String;
    function GetFORMULARIO: String;
    function GetFRETECALCULADO: String;
    function GetINDICADORCONTRIBUICAOPREVIDENC: String;
    function GetMUNCOLETA: String;
    function GetMUNENTREGA: String;
    function GetNATUREZACREDITO: String;
    function GetNATUREZAFRETE: String;
    function GetNATUREZARECEITACOFINS: String;
    function GetNATUREZARECEITAPIS: String;
    function GetNUMERO: String;
    function GetNUMERORMD: String;
    function GetOBSERVACAO: String;
    function GetOPERACAO: String;
    function GetPLACAVEICULO: String;
    function GetQUANTIDADEMERCADORIAS: Double;
    function GetRECEITATRIBUTCOFINS: Double;
    function GetRECEITATRIBUTCSL1: Double;
    function GetRECEITATRIBUTCSL2: Double;
    function GetRECEITATRIBUTIRPJ1: Double;
    function GetRECEITATRIBUTIRPJ2: Double;
    function GetRECEITATRIBUTIRPJ3: Double;
    function GetRECEITATRIBUTIRPJ4: Double;
    function GetRECEITATRIBUTPIS: Double;
    function GetREDESPACHANTE: String;
    function GetREMETENTEPRESTADOR: String;
    function GetSERIE: String;
    function GetSERIERMD: String;
    function GetSITUACAODOCUMENTO: String;
    function GetSUBSERIE: String;
    function GetSUBSERIERMD: String;
    function GetTIPOFRETE: String;
    function GetTIPOFRETEOPERACAOREDESPACHO: String;
    function GetUFCOLETA: String;
    function GetUFENTREGA: String;
    function GetUFVEICULO: String;
    function GetUNIDADEMEDIDA: String;
    function GetVALORCOFINSRETIDO: Double;
    function GetVALORCSLRETIDO: Double;
    function GetVALORICMS: Double;
    function GetVALORIRPJRETIDO: Double;
    function GetVALORISENTASICMS: Double;
    function GetVALOROUTRASICMS: Double;
    function GetVALORPISRETIDO: Double;
    function GetVALORTOTAL: Double;
    function GetNotaFiscal: INotasFiscaisConhecimento;
    function GetOutrosValores: IOutrosValoresConhecimento;
    function GetFaturaConhecimento: IFaturaConhecimento;
    procedure SetAIDF(const Value: String);
    procedure SetAIDF_RMD(const Value: String);
    procedure SetALIQUOTAICMS(const Value: Double);
    procedure SetALIQUOTAINTERNA(const Value: Double);
    procedure SetALIQUOTAORIGEM(const Value: Double);
    procedure SetBASECALCDIFERENCIALALIQ(const Value: Double);
    procedure SetBASECALCULOCOFINS_PISNAOCUMULA(const Value: Double);
    procedure SetBASECALCULOICMS(const Value: Double);
    procedure SetCFOP(const Value: String);
    procedure SetCHAVEELETRONICA(const Value: String);
    procedure SetCODIGO(const Value: String);
    procedure SetCODIGOCONTACONTABIL(const Value: String);
    procedure SetCODIGOINFORMACAOCOMPLEMENTAR(const Value: String);
    procedure SetCONSIGNATARIO(const Value: String);
    procedure SetCSOSN(const Value: String);
    procedure SetCST_COFINS(const Value: String);
    procedure SetCST_PIS(const Value: String);
    procedure SetCSTB(const Value: String);
    procedure SetCSTCREDCOFINS_PIS(const Value: String);
    procedure SetDATAEMISSAO(const Value: TDateTime);
    procedure SetDATAENTRADA(const Value: TDateTime);
    procedure SetDESTINATARIO(const Value: String);
    procedure SetDIFERENCIALALIQUOTAS(const Value: Integer);
    procedure SetDISTANCIA(const Value: String);
    procedure SetESPECIE(const Value: String);
    procedure SetESTABELECIMENTO(const Value: String);
    procedure SetFATURA(const Value: String);
    procedure SetFORMULARIO(const Value: String);
    procedure SetFRETECALCULADO(const Value: String);
    procedure SetINDICADORCONTRIBUICAOPREVIDENC(const Value: String);
    procedure SetMUNCOLETA(const Value: String);
    procedure SetMUNENTREGA(const Value: String);
    procedure SetNATUREZACREDITO(const Value: String);
    procedure SetNATUREZAFRETE(const Value: String);
    procedure SetNATUREZARECEITACOFINS(const Value: String);
    procedure SetNATUREZARECEITAPIS(const Value: String);
    procedure SetNUMERO(const Value: String);
    procedure SetNUMERORMD(const Value: String);
    procedure SetOBSERVACAO(const Value: String);
    procedure SetOPERACAO(const Value: String);
    procedure SetPLACAVEICULO(const Value: String);
    procedure SetQUANTIDADEMERCADORIAS(const Value: Double);
    procedure SetRECEITATRIBUTCOFINS(const Value: Double);
    procedure SetRECEITATRIBUTCSL1(const Value: Double);
    procedure SetRECEITATRIBUTCSL2(const Value: Double);
    procedure SetRECEITATRIBUTIRPJ1(const Value: Double);
    procedure SetRECEITATRIBUTIRPJ2(const Value: Double);
    procedure SetRECEITATRIBUTIRPJ3(const Value: Double);
    procedure SetRECEITATRIBUTIRPJ4(const Value: Double);
    procedure SetRECEITATRIBUTPIS(const Value: Double);
    procedure SetREDESPACHANTE(const Value: String);
    procedure SetREMETENTEPRESTADOR(const Value: String);
    procedure SetSERIE(const Value: String);
    procedure SetSERIERMD(const Value: String);
    procedure SetSITUACAODOCUMENTO(const Value: String);
    procedure SetSUBSERIE(const Value: String);
    procedure SetSUBSERIERMD(const Value: String);
    procedure SetTIPOFRETE(const Value: String);
    procedure SetTIPOFRETEOPERACAOREDESPACHO(const Value: String);
    procedure SetUFCOLETA(const Value: String);
    procedure SetUFENTREGA(const Value: String);
    procedure SetUFVEICULO(const Value: String);
    procedure SetUNIDADEMEDIDA(const Value: String);
    procedure SetVALORCOFINSRETIDO(const Value: Double);
    procedure SetVALORCSLRETIDO(const Value: Double);
    procedure SetVALORICMS(const Value: Double);
    procedure SetVALORIRPJRETIDO(const Value: Double);
    procedure SetVALORISENTASICMS(const Value: Double);
    procedure SetVALOROUTRASICMS(const Value: Double);
    procedure SetVALORPISRETIDO(const Value: Double);
    procedure SetVALORTOTAL(const Value: Double);
    procedure SetNotaFiscal(const Value: INotasFiscaisConhecimento);
    procedure SetOutrosValores(const Value: IOutrosValoresConhecimento);
    procedure SetFaturaConhecimento(const Value: IFaturaConhecimento);
    procedure SetIDWS(const Value: String);
    function GetIDWS: String;
    //
    property CODIGO                        : String read GetCODIGO write SetCODIGO;
    property ESTABELECIMENTO               : String read GetESTABELECIMENTO write SetESTABELECIMENTO;
    property OPERACAO                      : String read GetOPERACAO write SetOPERACAO;
    property ESPECIE                       : String read GetESPECIE write SetESPECIE;
    property AIDF                          : String read GetAIDF write SetAIDF;
    property SERIE                         : String read GetSERIE write SetSERIE;
    property SUBSERIE                      : String read GetSUBSERIE write SetSUBSERIE;
    property NUMERO                        : String read GetNUMERO write SetNUMERO;
    property FORMULARIO                    : String read GetFORMULARIO write SetFORMULARIO;
    property DATAEMISSAO                   : TDateTime read GetDATAEMISSAO write SetDATAEMISSAO;
    property SITUACAODOCUMENTO             : String read GetSITUACAODOCUMENTO write SetSITUACAODOCUMENTO;
    property DATAENTRADA                   : TDateTime read GetDATAENTRADA write SetDATAENTRADA;
    property TIPOFRETE                     : String read GetTIPOFRETE write SetTIPOFRETE;
    property REMETENTEPRESTADOR            : String read GetREMETENTEPRESTADOR write SetREMETENTEPRESTADOR;
    property DESTINATARIO                  : String read GetDESTINATARIO write SetDESTINATARIO;
    property CFOP                          : String read GetCFOP write SetCFOP;
    property VALORTOTAL                    : Double read GetVALORTOTAL write SetVALORTOTAL;
    property BASECALCULOICMS               : Double read GetBASECALCULOICMS write SetBASECALCULOICMS;
    property ALIQUOTAICMS                  : Double read GetALIQUOTAICMS write SetALIQUOTAICMS;
    property VALORICMS                     : Double read GetVALORICMS write SetVALORICMS;
    property VALORISENTASICMS              : Double read GetVALORISENTASICMS write SetVALORISENTASICMS;
    property VALOROUTRASICMS               : Double read GetVALOROUTRASICMS write SetVALOROUTRASICMS;
    property UFCOLETA                      : String read GetUFCOLETA write SetUFCOLETA;
    property MUNCOLETA                     : String read GetMUNCOLETA write SetMUNCOLETA;
    property UFENTREGA                     : String read GetUFENTREGA write SetUFENTREGA;
    property MUNENTREGA                    : String read GetMUNENTREGA write SetMUNENTREGA;
    property DISTANCIA                     : String read GetDISTANCIA write SetDISTANCIA;
    property QUANTIDADEMERCADORIAS         : Double read GetQUANTIDADEMERCADORIAS write SetQUANTIDADEMERCADORIAS;
    property UNIDADEMEDIDA                 : String read GetUNIDADEMEDIDA write SetUNIDADEMEDIDA;
    property FRETECALCULADO                : String read GetFRETECALCULADO write SetFRETECALCULADO;
    property PLACAVEICULO                  : String read GetPLACAVEICULO write SetPLACAVEICULO;
    property UFVEICULO                     : String read GetUFVEICULO write SetUFVEICULO;
    property AIDF_RMD                      : String read GetAIDF_RMD write SetAIDF_RMD;
    property SERIERMD                      : String read GetSERIERMD write SetSERIERMD;
    property SUBSERIERMD                   : String read GetSUBSERIERMD write SetSUBSERIERMD;
    property NUMERORMD                     : String read GetNUMERORMD write SetNUMERORMD;
    property DIFERENCIALALIQUOTAS          : Integer read GetDIFERENCIALALIQUOTAS write SetDIFERENCIALALIQUOTAS;
    property BASECALCDIFERENCIALALIQ       : Double read GetBASECALCDIFERENCIALALIQ write SetBASECALCDIFERENCIALALIQ;
    property ALIQUOTAORIGEM                : Double read GetALIQUOTAORIGEM write SetALIQUOTAORIGEM;
    property ALIQUOTAINTERNA               : Double read GetALIQUOTAINTERNA write SetALIQUOTAINTERNA;
    property RECEITATRIBUTCOFINS           : Double read GetRECEITATRIBUTCOFINS write SetRECEITATRIBUTCOFINS;
    property RECEITATRIBUTPIS              : Double read GetRECEITATRIBUTPIS write SetRECEITATRIBUTPIS;
    property RECEITATRIBUTCSL1             : Double read GetRECEITATRIBUTCSL1 write SetRECEITATRIBUTCSL1;
    property RECEITATRIBUTCSL2             : Double read GetRECEITATRIBUTCSL2 write SetRECEITATRIBUTCSL2;
    property RECEITATRIBUTIRPJ1            : Double read GetRECEITATRIBUTIRPJ1 write SetRECEITATRIBUTIRPJ1;
    property RECEITATRIBUTIRPJ2            : Double read GetRECEITATRIBUTIRPJ2 write SetRECEITATRIBUTIRPJ2;
    property RECEITATRIBUTIRPJ3            : Double read GetRECEITATRIBUTIRPJ3 write SetRECEITATRIBUTIRPJ3;
    property RECEITATRIBUTIRPJ4            : Double read GetRECEITATRIBUTIRPJ4 write SetRECEITATRIBUTIRPJ4;
    property VALORCOFINSRETIDO             : Double read GetVALORCOFINSRETIDO write SetVALORCOFINSRETIDO;
    property VALORPISRETIDO                : Double read GetVALORPISRETIDO write SetVALORPISRETIDO;
    property VALORCSLRETIDO                : Double read GetVALORCSLRETIDO write SetVALORCSLRETIDO;
    property VALORIRPJRETIDO               : Double read GetVALORIRPJRETIDO write SetVALORIRPJRETIDO;
    property OBSERVACAO                    : String read GetOBSERVACAO write SetOBSERVACAO;
    property FATURA                        : String read GetFATURA write SetFATURA;
    property CSTB                          : String read GetCSTB write SetCSTB;
    property CHAVEELETRONICA               : String read GetCHAVEELETRONICA write SetCHAVEELETRONICA;
    property CODIGOINFORMACAOCOMPLEMENTAR  : String read GetCODIGOINFORMACAOCOMPLEMENTAR write SetCODIGOINFORMACAOCOMPLEMENTAR;
    property CST_PIS                       : String read GetCST_PIS write SetCST_PIS;
    property CST_COFINS                    : String read GetCST_COFINS write SetCST_COFINS;
    property CSTCREDCOFINS_PIS             : String read GetCSTCREDCOFINS_PIS write SetCSTCREDCOFINS_PIS;
    property NATUREZAFRETE                 : String read GetNATUREZAFRETE write SetNATUREZAFRETE;
    property NATUREZACREDITO               : String read GetNATUREZACREDITO write SetNATUREZACREDITO;
    property BASECALCULOCOFINS_PISNAOCUMULA: Double read GetBASECALCULOCOFINS_PISNAOCUMULA write SetBASECALCULOCOFINS_PISNAOCUMULA;
    property CODIGOCONTACONTABIL           : String read GetCODIGOCONTACONTABIL write SetCODIGOCONTACONTABIL;
    property NATUREZARECEITACOFINS         : String read GetNATUREZARECEITACOFINS write SetNATUREZARECEITACOFINS;
    property NATUREZARECEITAPIS            : String read GetNATUREZARECEITAPIS write SetNATUREZARECEITAPIS;
    property CONSIGNATARIO                 : String read GetCONSIGNATARIO write SetCONSIGNATARIO;
    property REDESPACHANTE                 : String read GetREDESPACHANTE write SetREDESPACHANTE;
    property TIPOFRETEOPERACAOREDESPACHO   : String read GetTIPOFRETEOPERACAOREDESPACHO write SetTIPOFRETEOPERACAOREDESPACHO;
    property INDICADORCONTRIBUICAOPREVIDENC: String read GetINDICADORCONTRIBUICAOPREVIDENC write SetINDICADORCONTRIBUICAOPREVIDENC;
    property CSOSN                         : String read GetCSOSN write SetCSOSN;
    property NotaFiscal                    : INotasFiscaisConhecimento read GetNotaFiscal write SetNotaFiscal;
    property OutrosValores                 : IOutrosValoresConhecimento read GetOutrosValores write SetOutrosValores;
    property FaturaConhecimento            : IFaturaConhecimento read GetFaturaConhecimento write SetFaturaConhecimento;
    property IDWS: String read GetIDWS write SetIDWS;
  end;

  INotasFiscaisConhecimento = interface(IDBEditAndNavigateActions)
  ['{16E17FDD-FFC6-4705-83E4-2774B1644D8E}']
    function GetCHAVEELETRONICA: String;
    function GetCODIGO: String;
    function GetDATAEMISSAO: TDateTime;
    function GetESPECIE: String;
    function GetNUMERO: String;
    function GetSERIE: String;
    function GetSUBSERIE: String;
    function GetVALORTOTAL: Double;
    procedure SetCHAVEELETRONICA(const Value: String);
    procedure SetCODIGO(const Value: String);
    procedure SetDATAEMISSAO(const Value: TDateTime);
    procedure SetESPECIE(const Value: String);
    procedure SetNUMERO(const Value: String);
    procedure SetSERIE(const Value: String);
    procedure SetSUBSERIE(const Value: String);
    procedure SetVALORTOTAL(const Value: Double);
    //
    property Codigo         : String    read GetCODIGO          write SetCODIGO;
    property Especie        : String    read GetESPECIE         write SetESPECIE;
    property Serie          : String    read GetSERIE           write SetSERIE;
    property SubSerie       : String    read GetSUBSERIE        write SetSUBSERIE;
    property Numero         : String    read GetNUMERO          write SetNUMERO;
    property DataEmissao    : TDateTime read GetDATAEMISSAO     write SetDATAEMISSAO;
    property ValorTotal     : Double    read GetVALORTOTAL      write SetVALORTOTAL;
    property ChaveEletronica: String    read GetCHAVEELETRONICA write SetCHAVEELETRONICA;
  end;

  IOutrosValoresConhecimento = interface(IDBEditAndNavigateActions)
  ['{11612EE3-19A6-47BB-8E17-C4845A1B241F}']
    function GetCodigo: String;
    function GetCodigoFiscal: String;
    function GetValor: Double;
    procedure SetCodigo(const Value: String);
    procedure SetCodigoFiscal(const Value: String);
    procedure SetValor(const Value: Double);
    //
    property Codigo      : String read GetCodigo write SetCodigo;
    property CodigoFiscal: String read GetCodigoFiscal write SetCodigoFiscal;
    property Valor       : Double read GetValor write SetValor;
  end;

  IFaturaConhecimento = interface (IDBEditActions)
  ['{5B57B154-6EA9-40C6-BC17-4CF00AB0CA48}']
    function GetCodigo: String;
    function GetNumero: String;
    function GetTipoDocumento: String;
    function GetTipoOperacao: String;
    function GetValorDesconto: Double;
    function GetValorTotal: Double;
    function GetTitulo: ITitulosConhecimento;
    procedure SetCodigo(const Value: String);
    procedure SetNumero(const Value: String);
    procedure SetTipoDocumento(const Value: String);
    procedure SetTipoOperacao(const Value: String);
    procedure SetValorDesconto(const Value: Double);
    procedure SetValorTotal(const Value: Double);
    procedure SetTitulo(const Value: ITitulosConhecimento);
    //
    property Codigo       : String read GetCodigo write SetCodigo;
    property Numero       : String read GetNumero write SetNumero;
    property TipoOperacao : String read GetTipoOperacao write SetTipoOperacao;
    property TipoDocumento: String read GetTipoDocumento write SetTipoDocumento;
    property ValorTotal   : Double read GetValorTotal write SetValorTotal;
    property ValorDesconto: Double read GetValorDesconto write SetValorDesconto;
    property Titulos      : ITitulosConhecimento read GetTitulo write SetTitulo;
  end;

  ITitulosConhecimento = interface(IDBEditAndNavigateActions)
  ['{D917CD16-E7A4-428A-90BB-3F593CA58F48}']
    function GetCodigo: String;
    function GetDataVencimento: TDateTime;
    function GetTitulo: String;
    function GetValor: Double;
    function GetValorCOFINSRetido: Double;
    function GetValorCSLRetido: Double;
    function GetValorIRPJRetido: Double;
    function GetValorPISRetido: Double;
    function GetBaixas: IBaixasConhecimento;
    procedure SetCodigo(const Value: String);
    procedure SetDataVencimento(const Value: TDateTime);
    procedure SetTitulo(const Value: String);
    procedure SetValor(const Value: Double);
    procedure SetValorCOFINSRetido(const Value: Double);
    procedure SetValorCSLRetido(const Value: Double);
    procedure SetValorIRPJRetido(const Value: Double);
    procedure SetValorPISRetido(const Value: Double);
    procedure SetBaixas(const Value: IBaixasConhecimento);
    //
    property Codigo           : String read GetCodigo write SetCodigo;
    property Titulo           : String read GetTitulo write SetTitulo;
    property DataVencimento   : TDateTime read GetDataVencimento    write SetDataVencimento;
    property Valor            : Double    read GetValor             write SetValor;
    property ValorCOFINSRetido: Double    read GetValorCOFINSRetido write SetValorCOFINSRetido;
    property ValorPISRetido   : Double    read GetValorPISRetido    write SetValorPISRetido;
    property ValorCSLRetido   : Double    read GetValorCSLRetido    write SetValorCSLRetido;
    property ValorIRPJRetido  : Double    read GetValorIRPJRetido   write SetValorIRPJRetido;
    property Baixas : IBaixasConhecimento read GetBaixas            write SetBaixas;
  end;

  IBaixasConhecimento = interface(IDBEditAndNavigateActions)
  ['{557CBD83-4B21-40DC-91D3-106DEB73017E}']
    function GetCodigo: String;
    function GetData: TDateTime;
    function GetValor: Double;
    function GetValorCOFINSRetido: Double;
    function GetValorCSLRetido: Double;
    function GetValorDesconto: Double;
    function GetValorJuros: Double;
    function GetValorMulta: Double;
    function GetValorPISRetido: Double;
    function GetValorTotalNota: Double;
    function GetApuracoes: IApuracoesConhecimento;
    function GetDetalhamentos: IDetalhamentosConhecimento;
    procedure SetCodigo(const Value: String);
    procedure SetData(const Value: TDateTime);
    procedure SetValor(const Value: Double);
    procedure SetValorCOFINSRetido(const Value: Double);
    procedure SetValorCSLRetido(const Value: Double);
    procedure SetValorDesconto(const Value: Double);
    procedure SetValorJuros(const Value: Double);
    procedure SetValorMulta(const Value: Double);
    procedure SetValorPISRetido(const Value: Double);
    procedure SetValorTotalNota(const Value: Double);
    procedure SetApuracoes(const Value: IApuracoesConhecimento);
    procedure SetDetalhamentos(const Value: IDetalhamentosConhecimento);
    //
    property Codigo           : String    read GetCodigo            write SetCodigo;
    property Data             : TDateTime read GetData              write SetData;
    property Valor            : Double    read GetValor             write SetValor;
    property ValorMulta       : Double    read GetValorMulta        write SetValorMulta;
    property ValorJuros       : Double    read GetValorJuros        write SetValorJuros;
    property ValorCOFINSRetido: Double    read GetValorCOFINSRetido write SetValorCOFINSRetido;
    property ValorPISRetido   : Double    read GetValorPISRetido    write SetValorPISRetido;
    property ValorCSLRetido   : Double    read GetValorCSLRetido    write SetValorCSLRetido;
    property ValorTotalNota   : Double    read GetValorTotalNota    write SetValorTotalNota;
    property ValorDesconto    : Double    read GetValorDesconto     write SetValorDesconto;
    property Apuracoes: IApuracoesConhecimento read GetApuracoes    write SetApuracoes;
    property Detalhamentos: IDetalhamentosConhecimento read GetDetalhamentos write SetDetalhamentos;
  end;

  IApuracoesConhecimento = interface(IDBEditAndNavigateActions)
  ['{5C41DA1D-4659-4587-BC78-AEC7E7409ADB}']
    function GetAliquotaPISPerc: Double;
    function GetAliquotaCOFINSPerc: Double;
    function GetAliquotaCOFINSReais: Double;
    function GetAliquotaPISReais: Double;
    function GetBaseCalculoCOFINS: Double;
    function GetBaseCalculoPIS: Double;
    function GetCFOP: String;
    function GetCodigo: String;
    function GetCST_COFINS: String;
    function GetCST_PIS: String;
    function GetDescricaoCOFINS: String;
    function GetDescricaoPIS: String;
    function GetNaturezaCOFINS: String;
    function GetNaturezaPIS: String;
    function GetQuantidadeEmReais: Double;
    function GetTipoCalculoCOFINS: String;
    function GetTipoCalculoPIS: String;
    function GetValorCOFINS: Double;
    function GetValorPIS: Double;
    function GetValorReceitaCOFINS: Double;
    function GetValorReceitaPIS: Double;
    procedure SetAliquotaPISPerc(const Value: Double);
    procedure SetAliquotaCOFINSPerc(const Value: Double);
    procedure SetAliquotaCOFINSReais(const Value: Double);
    procedure SetAliquotaPISReais(const Value: Double);
    procedure SetBaseCalculoCOFINS(const Value: Double);
    procedure SetBaseCalculoPIS(const Value: Double);
    procedure SetCFOP(const Value: String);
    procedure SetCodigo(const Value: String);
    procedure SetCST_COFINS(const Value: String);
    procedure SetCST_PIS(const Value: String);
    procedure SetDescricaoCOFINS(const Value: String);
    procedure SetDescricaoPIS(const Value: String);
    procedure SetNaturezaCOFINS(const Value: String);
    procedure SetNaturezaPIS(const Value: String);
    procedure SetQuantidadeEmReais(const Value: Double);
    procedure SetTipoCalculoCOFINS(const Value: String);
    procedure SetTipoCalculoPIS(const Value: String);
    procedure SetValorCOFINS(const Value: Double);
    procedure SetValorPIS(const Value: Double);
    procedure SetValorReceitaCOFINS(const Value: Double);
    procedure SetValorReceitaPIS(const Value: Double);
    //
    property Codigo             : String read GetCodigo              write SetCodigo;
    property CFOP               : String read GetCFOP                write SetCFOP;
    property QuantidadeEmReais  : Double read GetQuantidadeEmReais   write SetQuantidadeEmReais;
    property CST_COFINS         : String read GetCST_COFINS          write SetCST_COFINS;
    property ValorReceitaCOFINS : Double read GetValorReceitaCOFINS  write SetValorReceitaCOFINS;
    property TipoCalculoCOFINS  : String read GetTipoCalculoCOFINS   write SetTipoCalculoCOFINS;
    property BaseCalculoCOFINS  : Double read GetBaseCalculoCOFINS   write SetBaseCalculoCOFINS;
    property AliquotaCOFINSPerc : Double read GetAliquotaCOFINSPerc  write SetAliquotaCOFINSPerc;
    property AliquotaCOFINSReais: Double read GetAliquotaCOFINSReais write SetAliquotaCOFINSReais;
    property ValorCOFINS        : Double read GetValorCOFINS         write SetValorCOFINS;
    property CST_PIS            : String read GetCST_PIS             write SetCST_PIS;
    property ValorReceitaPIS    : Double read GetValorReceitaPIS     write SetValorReceitaPIS;
    property TipoCalculoPIS     : String read GetTipoCalculoPIS      write SetTipoCalculoPIS;
    property BaseCalculoPIS     : Double read GetBaseCalculoPIS      write SetBaseCalculoPIS;
    property AliquotaPISPerc    : Double read GetAliquotaPISPerc      write SetAliquotaPISPerc;
    property AliquotaPISReais   : Double read GetAliquotaPISReais    write SetAliquotaPISReais;
    property ValorPIS           : Double read GetValorPIS            write SetValorPIS;
    property DescricaoCOFINS    : String read GetDescricaoCOFINS     write SetDescricaoCOFINS;
    property DescricaoPIS       : String read GetDescricaoPIS        write SetDescricaoPIS;
    property NaturezaCOFINS     : String read GetNaturezaCOFINS      write SetNaturezaCOFINS;
    property NaturezaPIS        : String read GetNaturezaPIS         write SetNaturezaPIS;
  end;

  IDetalhamentosConhecimento = interface(IDBEditAndNavigateActions)
  ['{ED28D597-63C8-4662-9241-B905A3F0B564}']
    function GetAtividade: String;
    function GetCFOP: String;
    function GetCodigo: String;
    function GetCodigoMunFavorecido: String;
    function GetCOFINSMonofasico: Integer;
    function GetEstabelecimento: String;
    function GetExterior: Integer;
    function GetISSRetido: Integer;
    function GetPISMonofasico: Integer;
    function GetSubstituicaoCOFINS: Integer;
    function GetSubstituicaoICMS: Integer;
    function GetSubstituicaoIPI: Integer;
    function GetSubstituicaoPISPASEP: Integer;
    function GetTipoInformacao: Integer;
    function GetUFFavorecida: String;
    function GetValorIsentasICMS: Double;
    function GetValorReceita: Double;
    procedure SetAtividade(const Value: String);
    procedure SetCFOP(const Value: String);
    procedure SetCodigo(const Value: String);
    procedure SetCodigoMunFavorecido(const Value: String);
    procedure SetCOFINSMonofasico(const Value: Integer);
    procedure SetEstabelecimento(const Value: String);
    procedure SetExterior(const Value: Integer);
    procedure SetISSRetido(const Value: Integer);
    procedure SetPISMonofasico(const Value: Integer);
    procedure SetSubstituicaoCOFINS(const Value: Integer);
    procedure SetSubstituicaoICMS(const Value: Integer);
    procedure SetSubstituicaoIPI(const Value: Integer);
    procedure SetSubstituicaoPISPASEP(const Value: Integer);
    procedure SetTipoInformacao(const Value: Integer);
    procedure SetUFFavorecida(const Value: String);
    procedure SetValorIsentasICMS(const Value: Double);
    procedure SetValorReceita(const Value: Double);
    //
    property Codigo              : String  read GetCodigo               write SetCodigo;
    property TipoInformacao      : Integer read GetTipoInformacao       write SetTipoInformacao;
    property Estabelecimento     : String  read GetEstabelecimento      write SetEstabelecimento;
    property CFOP                : String  read GetCFOP                 write SetCFOP;
    property SubstituicaoICMS    : Integer read GetSubstituicaoICMS     write SetSubstituicaoICMS;
    property SubstituicaoIPI     : Integer read GetSubstituicaoIPI      write SetSubstituicaoIPI;
    property SubstituicaoCOFINS  : Integer read GetSubstituicaoCOFINS   write SetSubstituicaoCOFINS;
    property SubstituicaoPISPASEP: Integer read GetSubstituicaoPISPASEP write SetSubstituicaoPISPASEP;
    property COFINSMonofasico    : Integer read GetCOFINSMonofasico     write SetCOFINSMonofasico;
    property PISMonofasico       : Integer read GetPISMonofasico        write SetPISMonofasico;
    property ValorIsentasICMS    : Double  read GetValorIsentasICMS     write SetValorIsentasICMS;
    property Exterior            : Integer read GetExterior             write SetExterior;
    property ISSRetido           : Integer read GetISSRetido            write SetISSRetido;
    property Atividade           : String  read GetAtividade            write SetAtividade;
    property UFFavorecida        : String  read GetUFFavorecida         write SetUFFavorecida;
    property CodigoMunFavorecido : String  read GetCodigoMunFavorecido  write SetCodigoMunFavorecido;
    property ValorReceita        : Double  read GetValorReceita         write SetValorReceita;
  end;

  INotaFiscalMercadoria = interface(IDBEditActions)
  ['{FCD91CB2-1AFC-4312-8FFE-1ECB444C5080}']
    function Find(Codigo: String): Boolean;
    function FindIDWS(IDWS: String): Boolean;
    function GetAIDF: String;
    function GetAliquotaSubstTrib: Double;
    function GetBaseCalcPISCOFINSnc: Double;
    function GetBaseCalculoSubstTribut: Double;
    function GetChaveEletronica: String;
    function GetChavenfeReferencia: String;
    function GetCodigo: String;
    function GetCodigoContabil: String;
    function GetCodigoInformacaoComp: String;
    function GetCodigoServico: String;
    function GetComplementoInformacaoComp: String;
    function GetDataContingencia: TDateTime;
    function GetDataEmissao: TDateTime;
    function GetDataEntradaEstado: TDateTime;
    function GetDataMovimento: TDateTime;
    function GetDataRetencao: TDateTime;
    function GetDocumentoProprio: Integer;
    function GetEspecie: String;
    function GetEstabelecimento: String;
    function GetFatura: String;
    function GetFormularioFinal: String;
    function GetFormularioInicial: String;
    function GetFretePorConta: String;
    function GetGeraTransferencia: Integer;
    function GetGNREAgencia: String;
    function GetGNREAutenticado: String;
    function GetGNREBanco: String;
    function GetGNREConvenio: String;
    function GetGNREDataRecolhimento: TDateTime;
    function GetGNREDataVencimento: TDateTime;
    function GetGNREDVAgencia: String;
    function GetGNREICMS: Integer;
    function GetGNREMesAno: String;
    function GetGNREVinculada: Integer;
    function GetHoraContingencia: String;
    function GetHorasaida: String;
    function GetICMSAntecipadoRecolher: Integer;
    function GetICMSDiferencialAliquota: Integer;
    function GetICMSimportacaoDiferido: Integer;
    function GetICMSSubstRecolher: Integer;
    function GetIndPresencaComprador: Integer;
    function GetInfAdicFisco: String;
    function GetIssRetido: Integer;
    function GetLocalEmbarque: String;
    function GetMotivoCancel: String;
    function GetNaturezaOperacao: String;
    function GetNfeInformadaContribuinte: Integer;
    function GetNumero: String;
    function GetNumeroCupom: String;
    function GetNumeroECF: String;
    function GetObservacao: String;
    function GetOperacao: String;
    function GetOperacaoConsumidorFinal: Integer;
    function GetQuantidadeProdutos: Double;
    function GetReconheceNFe: String;
    function GetRemetenteDestinatario: String;
    function GetSerie: String;
    function GetSituacaoDocumento: String;
    function GetSubserie: String;
    function GetUfembarque: String;
    function GetValorCOFINSRetido: Double;
    function GetValorcontabilantecipado: Double;
    function GetValorContabilSubstTribut: Double;
    function GetValorCSLRetido: Double;
    function GetValorDesconTototal: Double;
    function GetValorFrete: Double;
    function GetValorICMSImportacao: Double;
    function GetValorICMSSubstRetido: Double;
    function GetValorINSSRetido: Double;
    function GetValorIPI: Double;
    function GetValorIRPJRetido: Double;
    function GetValoroutrasDespesas: Double;
    function GetValorPISRetido: Double;
    function GetValorProdutos: Double;
    function GetValorReceitaTributCOFINS: Double;
    function GetValorReceitaTributCSL1: Double;
    function GetValorReceitaTributCSL2: Double;
    function GetValorReceitaTributIRPJ1: Double;
    function GetValorReceitaTributIRPJ2: Double;
    function GetValorReceitaTributIRPJ3: Double;
    function GetValorReceitaTributIRPJ4: Double;
    function GetValorReceitaTributPIS: Double;
    function GetValorSeguro: Double;
    function GetValorServicos: Double;
    function GetValorTotal: Double;
    function GetValorTotalIcmsDeson: Double;
    function GetFaturaNota: IFaturaNotaMercadoria;
    function GetProdutosNota: IProdutoNotaMercadoria;
    function GetICMSIPINota: IICMSIPINotaMercadoria;
    function GetICMSAntecipadoNota: IICMSAntecipadoNotaMercadoria;
    function GetICMSSubstNota: IICMSSubstNotaMercadoria;
    function GetICMSDiferencialNota: IICMSDiferencialNotaMercadoria;
    function GetOutrosValoresNota: IOutrosValoresNotaMercadoria;
    function GetDetalheTransporteNota: IDetalheTransporteNotaMercadoria;
    procedure SetAIDF(const Value: String);
    procedure SetAliquotaSubstTrib(const Value: Double);
    procedure SetBaseCalcPISCOFINSnc(const Value: Double);
    procedure SetBaseCalculoSubstTribut(const Value: Double);
    procedure SetChaveEletronica(const Value: String);
    procedure SetChavenfeReferencia(const Value: String);
    procedure SetCodigo(const Value: String);
    procedure SetCodigoContabil(const Value: String);
    procedure SetCodigoInformacaoComp(const Value: String);
    procedure SetCodigoServico(const Value: String);
    procedure SetComplementoInformacaoComp(const Value: String);
    procedure SetDataContingencia(const Value: TDateTime);
    procedure SetDataEmissao(const Value: TDateTime);
    procedure SetDataEntradaEstado(const Value: TDateTime);
    procedure SetDataMovimento(const Value: TDateTime);
    procedure SetDataRetencao(const Value: TDateTime);
    procedure SetDocumentoProprio(const Value: Integer);
    procedure SetEspecie(const Value: String);
    procedure SetEstabelecimento(const Value: String);
    procedure SetFatura(const Value: String);
    procedure SetFormularioFinal(const Value: String);
    procedure SetFormularioInicial(const Value: String);
    procedure SetFretePorConta(const Value: String);
    procedure SetGeraTransferencia(const Value: Integer);
    procedure SetGNREAgencia(const Value: String);
    procedure SetGNREAutenticado(const Value: String);
    procedure SetGNREBanco(const Value: String);
    procedure SetGNREConvenio(const Value: String);
    procedure SetGNREDataRecolhimento(const Value: TDateTime);
    procedure SetGNREDataVencimento(const Value: TDateTime);
    procedure SetGNREDVAgencia(const Value: String);
    procedure SetGNREICMS(const Value: Integer);
    procedure SetGNREMesAno(const Value: String);
    procedure SetGNREVinculada(const Value: Integer);
    procedure SetHoraContingencia(const Value: String);
    procedure SetHorasaida(const Value: String);
    procedure SetICMSAntecipadoRecolher(const Value: Integer);
    procedure SetICMSDiferencialAliquota(const Value: Integer);
    procedure SetICMSimportacaoDiferido(const Value: Integer);
    procedure SetICMSSubstRecolher(const Value: Integer);
    procedure SetIndPresencaComprador(const Value: Integer);
    procedure SetInfAdicFisco(const Value: String);
    procedure SetIssRetido(const Value: Integer);
    procedure SetLocalEmbarque(const Value: String);
    procedure SetMotivoCancel(const Value: String);
    procedure SetNaturezaOperacao(const Value: String);
    procedure SetNfeInformadaContribuinte(const Value: Integer);
    procedure SetNumero(const Value: String);
    procedure SetNumeroCupom(const Value: String);
    procedure SetNumeroECF(const Value: String);
    procedure SetObservacao(const Value: String);
    procedure SetOperacao(const Value: String);
    procedure SetOperacaoConsumidorFinal(const Value: Integer);
    procedure SetQuantidadeProdutos(const Value: Double);
    procedure SetReconheceNFe(const Value: String);
    procedure SetRemetenteDestinatario(const Value: String);
    procedure SetSerie(const Value: String);
    procedure SetSituacaoDocumento(const Value: String);
    procedure SetSubserie(const Value: String);
    procedure SetUfembarque(const Value: String);
    procedure SetValorCOFINSRetido(const Value: Double);
    procedure SetValorcontabilantecipado(const Value: Double);
    procedure SetValorContabilSubstTribut(const Value: Double);
    procedure SetValorCSLRetido(const Value: Double);
    procedure SetValorDesconTototal(const Value: Double);
    procedure SetValorFrete(const Value: Double);
    procedure SetValorICMSImportacao(const Value: Double);
    procedure SetValorICMSSubstRetido(const Value: Double);
    procedure SetValorINSSRetido(const Value: Double);
    procedure SetValorIPI(const Value: Double);
    procedure SetValorIRPJRetido(const Value: Double);
    procedure SetValoroutrasDespesas(const Value: Double);
    procedure SetValorPISRetido(const Value: Double);
    procedure SetValorProdutos(const Value: Double);
    procedure SetValorReceitaTributCOFINS(const Value: Double);
    procedure SetValorReceitaTributCSL1(const Value: Double);
    procedure SetValorReceitaTributCSL2(const Value: Double);
    procedure SetValorReceitaTributIRPJ1(const Value: Double);
    procedure SetValorReceitaTributIRPJ2(const Value: Double);
    procedure SetValorReceitaTributIRPJ3(const Value: Double);
    procedure SetValorReceitaTributIRPJ4(const Value: Double);
    procedure SetValorReceitaTributPIS(const Value: Double);
    procedure SetValorSeguro(const Value: Double);
    procedure SetValorServicos(const Value: Double);
    procedure SetValorTotal(const Value: Double);
    procedure SetValorTotalIcmsDeson(const Value: Double);
    procedure SetFaturaNota(const Value: IFaturaNotaMercadoria);
    procedure SetProdutosNota(const Value: IProdutoNotaMercadoria);
    procedure SetICMSIPINota(const Value: IICMSIPINotaMercadoria);
    procedure SetICMSAntecipadoNota(const Value: IICMSAntecipadoNotaMercadoria);
    procedure SetICMSSubstNota(const Value: IICMSSubstNotaMercadoria);
    procedure SetICMSDiferencialNota(const Value: IICMSDiferencialNotaMercadoria);
    procedure SetOutrosValoresNota(const Value: IOutrosValoresNotaMercadoria);
    procedure SetDetalheTransporteNota(const Value: IDetalheTransporteNotaMercadoria);
    procedure SetIDWS(const Value: String);
    function GetIDWS: String;
    //
    property Codigo                     : String    read GetCodigo                      write SetCodigo;
    property Estabelecimento            : String    read GetEstabelecimento             write SetEstabelecimento;
    property Operacao                   : String    read GetOperacao                    write SetOperacao;
    property Especie                    : String    read GetEspecie                     write SetEspecie;
    property DocumentoProprio           : Integer   read GetDocumentoProprio            write SetDocumentoProprio;
    property AIDF                       : String    read GetAIDF                        write SetAIDF;
    property Serie                      : String    read GetSerie                       write SetSerie;
    property Subserie                   : String    read GetSubserie                    write SetSubserie;
    property Numero                     : String    read GetNumero                      write SetNumero;
    property FormularioInicial          : String    read GetFormularioInicial           write SetFormularioInicial;
    property FormularioFinal            : String    read GetFormularioFinal             write SetFormularioFinal;
    property DataEmissao                : TDateTime read GetDataEmissao                 write SetDataEmissao;
    property SituacaoDocumento          : String    read GetSituacaoDocumento           write SetSituacaoDocumento;
    property DataMovimento              : TDateTime read GetDataMovimento               write SetDataMovimento;
    property RemetenteDestinatario      : String    read GetRemetenteDestinatario       write SetRemetenteDestinatario;
    property GNREVinculada              : Integer   read GetGNREVinculada               write SetGNREVinculada;
    property GNREICMS                   : Integer   read GetGNREICMS                    write SetGNREICMS;
    property GNREMesAno                 : String    read GetGNREMesAno                  write SetGNREMesAno;
    property GNREConvenio               : String    read GetGNREConvenio                write SetGNREConvenio;
    property GNREDataVencimento         : TDateTime read GetGNREDataVencimento          write SetGNREDataVencimento;
    property GNREDataRecolhimento       : TDateTime read GetGNREDataRecolhimento        write SetGNREDataRecolhimento;
    property GNREBanco                  : String    read GetGNREBanco                   write SetGNREBanco;
    property GNREAgencia                : String    read GetGNREAgencia                 write SetGNREAgencia;
    property GNREDVAgencia              : String    read GetGNREDVAgencia               write SetGNREDVAgencia;
    property GNREAutenticado            : String    read GetGNREAutenticado             write SetGNREAutenticado;
    property ValorProdutos              : Double    read GetValorProdutos               write SetValorProdutos;
    property ValorFrete                 : Double    read GetValorFrete                  write SetValorFrete;
    property ValorSeguro                : Double    read GetValorSeguro                 write SetValorSeguro;
    property ValoroutrasDespesas        : Double    read GetValoroutrasDespesas         write SetValoroutrasDespesas;
    property ValorICMSImportacao        : Double    read GetValorICMSImportacao         write SetValorICMSImportacao;
    property ICMSimportacaoDiferido     : Integer   read GetICMSimportacaoDiferido      write SetICMSimportacaoDiferido;
    property ValorIPI                   : Double    read GetValorIPI                    write SetValorIPI;
    property ValorICMSSubstRetido       : Double    read GetValorICMSSubstRetido        write SetValorICMSSubstRetido;
    property ValorServicos              : Double    read GetValorServicos               write SetValorServicos;
    property ValorDesconTototal         : Double    read GetValorDesconTototal          write SetValorDesconTototal;
    property ValorTotal                 : Double    read GetValorTotal                  write SetValorTotal;
    property QuantidadeProdutos         : Double    read GetQuantidadeProdutos          write SetQuantidadeProdutos;
    property ICMSSubstRecolher          : Integer   read GetICMSSubstRecolher           write SetICMSSubstRecolher;
    property ICMSAntecipadoRecolher     : Integer   read GetICMSAntecipadoRecolher      write SetICMSAntecipadoRecolher;
    property ICMSDiferencialAliquota    : Integer   read GetICMSDiferencialAliquota     write SetICMSDiferencialAliquota;
    property ValorContabilSubstTribut   : Double    read GetValorContabilSubstTribut    write SetValorContabilSubstTribut;
    property BaseCalculoSubstTribut     : Double    read GetBaseCalculoSubstTribut      write SetBaseCalculoSubstTribut;
    property Valorcontabilantecipado    : Double    read GetValorcontabilantecipado     write SetValorcontabilantecipado;
    property IssRetido                  : Integer   read GetIssRetido                   write SetIssRetido;
    property DataRetencao               : TDateTime read GetDataRetencao                write SetDataRetencao;
    property CodigoServico              : String    read GetCodigoServico               write SetCodigoServico;
    property DataEntradaEstado          : TDateTime read GetDataEntradaEstado           write SetDataEntradaEstado;
    property FretePorConta              : String    read GetFretePorConta               write SetFretePorConta;
    property Fatura                     : String    read GetFatura                      write SetFatura;
    property NumeroECF                  : String    read GetNumeroECF                   write SetNumeroECF;
    property NumeroCupom                : String    read GetNumeroCupom                 write SetNumeroCupom;
    property ValorReceitaTributCOFINS   : Double    read GetValorReceitaTributCOFINS    write SetValorReceitaTributCOFINS;
    property ValorReceitaTributPIS      : Double    read GetValorReceitaTributPIS       write SetValorReceitaTributPIS;
    property ValorReceitaTributCSL1     : Double    read GetValorReceitaTributCSL1      write SetValorReceitaTributCSL1;
    property ValorReceitaTributCSL2     : Double    read GetValorReceitaTributCSL2      write SetValorReceitaTributCSL2;
    property ValorReceitaTributIRPJ1    : Double    read GetValorReceitaTributIRPJ1     write SetValorReceitaTributIRPJ1;
    property ValorReceitaTributIRPJ2    : Double    read GetValorReceitaTributIRPJ2     write SetValorReceitaTributIRPJ2;
    property ValorReceitaTributIRPJ3    : Double    read GetValorReceitaTributIRPJ3     write SetValorReceitaTributIRPJ3;
    property ValorReceitaTributIRPJ4    : Double    read GetValorReceitaTributIRPJ4     write SetValorReceitaTributIRPJ4;
    property ValorCOFINSRetido          : Double    read GetValorCOFINSRetido           write SetValorCOFINSRetido;
    property ValorPISRetido             : Double    read GetValorPISRetido              write SetValorPISRetido;
    property ValorCSLRetido             : Double    read GetValorCSLRetido              write SetValorCSLRetido;
    property ValorIRPJRetido            : Double    read GetValorIRPJRetido             write SetValorIRPJRetido;
    property GeraTransferencia          : Integer   read GetGeraTransferencia           write SetGeraTransferencia;
    property Observacao                 : String    read GetObservacao                  write SetObservacao;
    property AliquotaSubstTrib          : Double    read GetAliquotaSubstTrib           write SetAliquotaSubstTrib;
    property ChaveEletronica            : String    read GetChaveEletronica             write SetChaveEletronica;
    property ValorINSSRetido            : Double    read GetValorINSSRetido             write SetValorINSSRetido;
    property BaseCalcPISCOFINSnc        : Double    read GetBaseCalcPISCOFINSnc         write SetBaseCalcPISCOFINSnc;
    property MotivoCancel               : String    read GetMotivoCancel                write SetMotivoCancel;
    property NaturezaOperacao           : String    read GetNaturezaOperacao            write SetNaturezaOperacao;
    property CodigoInformacaoComp       : String    read GetCodigoInformacaoComp        write SetCodigoInformacaoComp;
    property ComplementoInformacaoComp  : String    read GetComplementoInformacaoComp   write SetComplementoInformacaoComp;
    property Horasaida                  : String    read GetHorasaida                   write SetHorasaida;
    property Ufembarque                 : String    read GetUfembarque                  write SetUfembarque;
    property LocalEmbarque              : String    read GetLocalEmbarque               write SetLocalEmbarque;
    property CodigoContabil             : String   read GetCodigoContabil              write SetCodigoContabil;
    property ChavenfeReferencia         : String    read GetChavenfeReferencia          write SetChavenfeReferencia;
    property InfAdicFisco               : String    read GetInfAdicFisco                write SetInfAdicFisco;
    property OperacaoConsumidorFinal    : Integer   read GetOperacaoConsumidorFinal     write SetOperacaoConsumidorFinal;
    property IndPresencaComprador       : Integer   read GetIndPresencaComprador        write SetIndPresencaComprador;
    property DataContingencia           : TDateTime read GetDataContingencia            write SetDataContingencia;
    property HoraContingencia           : String    read GetHoraContingencia            write SetHoraContingencia;
    property ReconheceNFe               : String    read GetReconheceNFe                write SetReconheceNFe;
    property NfeInformadaContribuinte   : Integer   read GetNfeInformadaContribuinte    write SetNfeInformadaContribuinte;
    property ValorTotalIcmsDeson        : Double    read GetValorTotalIcmsDeson         write SetValorTotalIcmsDeson;
    property FaturaNota                 : IFaturaNotaMercadoria           read GetFaturaNota            write SetFaturaNota;
    property ProdutosNota               : IProdutoNotaMercadoria          read GetProdutosNota          write SetProdutosNota;
    property ICMSIPINota                : IICMSIPINotaMercadoria           read GetICMSIPINota           write SetICMSIPINota;
    property ICMSAntecipadoNota         : IICMSAntecipadoNotaMercadoria    read GetICMSAntecipadoNota    write SetICMSAntecipadoNota;
    property ICMSSubstNota              : IICMSSubstNotaMercadoria         read GetICMSSubstNota         write SetICMSSubstNota;
    property ICMSDiferencialNota        : IICMSDiferencialNotaMercadoria   read GetICMSDiferencialNota   write SetICMSDiferencialNota;
    property OutrosValoresNota          : IOutrosValoresNotaMercadoria     read GetOutrosValoresNota     write SetOutrosValoresNota;
    property DetalheTransporteNota      : IDetalheTransporteNotaMercadoria read GetDetalheTransporteNota write SetDetalheTransporteNota;
    property IDWS: String read GetIDWS write SetIDWS;
  end;

  IProdutoNotaMercadoria = interface(IDBEditAndNavigateActions)
  ['{F1B5CFC8-AA70-4A91-B8D4-D665A3792304}']
    function GetALIQSUBSTTRIBUT: Double;
    function GetALIQUOTACOFINSPERC: Double;
    function GetALIQUOTACOFINSREAIS: Double;
    function GetALIQUOTAICMS: Double;
    function GetALIQUOTAINTERNAANTECIP: Double;
    function GetALIQUOTAINTERNADIF: Double;
    function GetALIQUOTAIPI: Double;
    function GetALIQUOTAORIGEM: Double;
    function GetALIQUOTAPISPERC: Double;
    function GetALIQUOTAPISREAIS: Double;
    function GetANTECIPJARECOLHIDO: Double;
    function GetBASECALCDIFALIQUOTA: Double;
    function GetBASECALCIPI: Double;
    function GetBASECALCSUBSTTRIB: Double;
    function GetBASECALCULOCOFINS: Double;
    function GetBASECALCULOICMS: Double;
    function GetBASECALCULOPIS: Double;
    function GetCFOP: String;
    function GetCFOPTRANSF: String;
    function GetCODAJUSTEFISCAL: String;
    function GetCODAPURACAOPRODEPE: String;
    function GetCODIGO: String;
    function GetCODIGOCONTABIL: String;
    function GetCREDITOORIGEMANTECIP: Double;
    function GetCREDITOORIGEMSUBST: Double;
    function GetCSOSN: String;
    function GetCST_COFINS: String;
    function GetCST_IPI: String;
    function GetCST_PIS: String;
    function GetCSTA: String;
    function GetCSTB: String;
    function GetCUSTODEAQUISICAOANTECIP: Double;
    function GetFCI: String;
    function GetINDESPINCENTIVO: String;
    function GetINDESPPRODEPE: String;
    function GetITEMDERIVADOPETROLEO: Integer;
    function GetITEMPEDIDOCOMPRA: String;
    function GetMOTIVDEVOLIPI: String;
    function GetMOTIVODESONICMS: String;
    function GetNAOCOMPOEVALORTOTAL: Integer;
    function GetNATCONTRIBESTORNOCOFINS: String;
    function GetNATCONTRIBESTORNOPIS: String;
    function GetNATCREDESTORNOCOFINS: String;
    function GetNATCREDESTORNOPIS: String;
    function GetNATUREZARECEITACOFINS: String;
    function GetNATUREZARECEITAPIS: String;
    function GetOUTRASDESPESAS: Double;
    function GetPEDIDOCOMPRA: String;
    function GetPERCAGREGACAOANTECIP: Double;
    function GetPERCAGREGSUBST: Double;
    function GetPERCIPIDEVOLVIDO: Double;
    function GetPRODUTO: String;
    function GetQUANTIDADE: Double;
    function GetRECOPI: String;
    function GetSITTRIBCSOSN: String;
    function GetTIPOCALCULOCOFINS: String;
    function GetTIPOCALCULOPIS: String;
    function GetTIPORECOLHIMENTO: String;
    function GetTIPOSUBSTITUICAO: String;
    function GetTIPOTRIBUTICMS: String;
    function GetTIPOTRIBUTIPI: String;
    function GetUNIDADEMEDIDA: String;
    function GetVALORBRUTO: Double;
    function GetVALORCOFINS: Double;
    function GetVALORCUSTOAQUISICAO: Double;
    function GetVALORDESCONTO: Double;
    function GetVALORFRETE: Double;
    function GetVALORICMSDESON: Double;
    function GetVALORICMSSUBST: Double;
    function GetVALORIPICONTRIB: Double;
    function GetVALORIPINAOCONTRIB: Double;
    function GetVALORPIS: Double;
    function GetVALORSEGURO: Double;
    function GetVALORSUBSTJARECOLHIDO: Double;
    function GetVALORTOTAL: Double;
    procedure SetALIQSUBSTTRIBUT(const Value: Double);
    procedure SetALIQUOTACOFINSPERC(const Value: Double);
    procedure SetALIQUOTACOFINSREAIS(const Value: Double);
    procedure SetALIQUOTAICMS(const Value: Double);
    procedure SetALIQUOTAINTERNAANTECIP(const Value: Double);
    procedure SetALIQUOTAINTERNADIF(const Value: Double);
    procedure SetALIQUOTAIPI(const Value: Double);
    procedure SetALIQUOTAORIGEM(const Value: Double);
    procedure SetALIQUOTAPISPERC(const Value: Double);
    procedure SetALIQUOTAPISREAIS(const Value: Double);
    procedure SetANTECIPJARECOLHIDO(const Value: Double);
    procedure SetBASECALCDIFALIQUOTA(const Value: Double);
    procedure SetBASECALCIPI(const Value: Double);
    procedure SetBASECALCSUBSTTRIB(const Value: Double);
    procedure SetBASECALCULOCOFINS(const Value: Double);
    procedure SetBASECALCULOICMS(const Value: Double);
    procedure SetBASECALCULOPIS(const Value: Double);
    procedure SetCFOP(const Value: String);
    procedure SetCFOPTRANSF(const Value: String);
    procedure SetCODAJUSTEFISCAL(const Value: String);
    procedure SetCODAPURACAOPRODEPE(const Value: String);
    procedure SetCODIGO(const Value: String);
    procedure SetCODIGOCONTABIL(const Value: String);
    procedure SetCREDITOORIGEMANTECIP(const Value: Double);
    procedure SetCREDITOORIGEMSUBST(const Value: Double);
    procedure SetCSOSN(const Value: String);
    procedure SetCST_COFINS(const Value: String);
    procedure SetCST_IPI(const Value: String);
    procedure SetCST_PIS(const Value: String);
    procedure SetCSTA(const Value: String);
    procedure SetCSTB(const Value: String);
    procedure SetFCI(const Value: String);
    procedure SetINDESPINCENTIVO(const Value: String);
    procedure SetINDESPPRODEPE(const Value: String);
    procedure SetITEMDERIVADOPETROLEO(const Value: Integer);
    procedure SetITEMPEDIDOCOMPRA(const Value: String);
    procedure SetMOTIVDEVOLIPI(const Value: String);
    procedure SetMOTIVODESONICMS(const Value: String);  
    procedure SetNAOCOMPOEVALORTOTAL(const Value: Integer);
    procedure SetNATCONTRIBESTORNOCOFINS(const Value: String);
    procedure SetNATCONTRIBESTORNOPIS(const Value: String);
    procedure SetNATCREDESTORNOCOFINS(const Value: String);
    procedure SetNATCREDESTORNOPIS(const Value: String);
    procedure SetNATUREZARECEITACOFINS(const Value: String);
    procedure SetNATUREZARECEITAPIS(const Value: String);
    procedure SetOUTRASDESPESAS(const Value: Double);
    procedure SetPEDIDOCOMPRA(const Value: String);
    procedure SetPERCAGREGACAOANTECIP(const Value: Double);
    procedure SetPERCAGREGSUBST(const Value: Double);
    procedure SetPERCIPIDEVOLVIDO(const Value: Double);
    procedure SetPRODUTO(const Value: String);
    procedure SetQUANTIDADE(const Value: Double);
    procedure SetRECOPI(const Value: String);
    procedure SetSITTRIBCSOSN(const Value: String);
    procedure SetTIPOCALCULOCOFINS(const Value: String);
    procedure SetTIPOCALCULOPIS(const Value: String);
    procedure SetTIPORECOLHIMENTO(const Value: String);
    procedure SetTIPOSUBSTITUICAO(const Value: String);
    procedure SetTIPOTRIBUTICMS(const Value: String);
    procedure SetTIPOTRIBUTIPI(const Value: String);
    procedure SetUNIDADEMEDIDA(const Value: String);
    procedure SetVALORBRUTO(const Value: Double);
    procedure SetVALORCOFINS(const Value: Double);
    procedure SetVALORCUSTOAQUISICAO(const Value: Double);
    procedure SetVALORDESCONTO(const Value: Double);
    procedure SetVALORFRETE(const Value: Double);
    procedure SetVALORICMSDESON(const Value: Double);
    procedure SetVALORICMSSUBST(const Value: Double);
    procedure SetVALORIPICONTRIB(const Value: Double);
    procedure SetVALORIPINAOCONTRIB(const Value: Double);
    procedure SetVALORPIS(const Value: Double);
    procedure SetVALORSEGURO(const Value: Double);
    procedure SetVALORSUBSTJARECOLHIDO(const Value: Double);
    procedure SetCUSTODEAQUISICAOANTECIP(const Value: Double);
    procedure SetVALORTOTAL(const Value: Double);
    //
    property Codigo                 : String read GetCODIGO                 write SetCODIGO;
    property Produto                : String read GetPRODUTO                write SetPRODUTO;
    property CFOP                   : String read GetCFOP                   write SetCFOP;
    property CFOPTransf             : String read GetCFOPTRANSF             write SetCFOPTRANSF;
    property CSTA                   : String read GetCSTA                   write SetCSTA;
    property CSTB                   : String read GetCSTB                   write SetCSTB;
    property UnidadeMedida          : String read GetUNIDADEMEDIDA          write SetUNIDADEMEDIDA;
    property Quantidade             : Double read GetQUANTIDADE             write SetQUANTIDADE;
    property ValorBruto             : Double read GetVALORBRUTO             write SetVALORBRUTO;
    property ValorIPINaoContrib     : Double read GetVALORIPINAOCONTRIB     write SetVALORIPINAOCONTRIB;
    property TipoTributICMS         : String read GetTIPOTRIBUTICMS         write SetTIPOTRIBUTICMS;
    property BaseCalculoICMS        : Double read GetBASECALCULOICMS        write SetBASECALCULOICMS;
    property AliquotaICMS           : Double read GetALIQUOTAICMS           write SetALIQUOTAICMS;
    property ValorICMSSubst         : Double read GetVALORICMSSUBST         write SetVALORICMSSUBST;
    property TipoRecolhimento       : String read GetTIPORECOLHIMENTO       write SetTIPORECOLHIMENTO;
    property TipoSubstituicao       : String read GetTIPOSUBSTITUICAO       write SetTIPOSUBSTITUICAO;
    property ValorCustoAquisicao    : Double read GetVALORCUSTOAQUISICAO    write SetVALORCUSTOAQUISICAO;
    property PercAgregSubst         : Double read GetPERCAGREGSUBST         write SetPERCAGREGSUBST;
    property BaseCalcSubstTrib      : Double read GetBASECALCSUBSTTRIB      write SetBASECALCSUBSTTRIB;
    property AliqSubstTribut        : Double read GetALIQSUBSTTRIBUT        write SetALIQSUBSTTRIBUT;
    property CreditoOrigemSubst     : Double read GetCREDITOORIGEMSUBST     write SetCREDITOORIGEMSUBST;
    property ValorSubstJaRecolhido  : Double read GetVALORSUBSTJARECOLHIDO  write SetVALORSUBSTJARECOLHIDO;
    property CustodeAquisicaoAntecip: Double read GetCUSTODEAQUISICAOANTECIP write SetCUSTODEAQUISICAOANTECIP;
    property PercAgregacaoAntecip   : Double read GetPERCAGREGACAOANTECIP   write SetPERCAGREGACAOANTECIP;
    property AliquotaInternaAntecip : Double read GetALIQUOTAINTERNAANTECIP write SetALIQUOTAINTERNAANTECIP;
    property CreditoOrigemAntecip   : Double read GetCREDITOORIGEMANTECIP   write SetCREDITOORIGEMANTECIP;
    property AntecipJaRecolhido     : Double read GetANTECIPJARECOLHIDO     write SetANTECIPJARECOLHIDO;
    property BaseCalcDifAliquota    : Double read GetBASECALCDIFALIQUOTA    write SetBASECALCDIFALIQUOTA;
    property AliquotaOrigem         : Double read GetALIQUOTAORIGEM         write SetALIQUOTAORIGEM;
    property AliquotaInternaDif     : Double read GetALIQUOTAINTERNADIF     write SetALIQUOTAINTERNADIF;
    property TipoTributIPI          : String read GetTIPOTRIBUTIPI          write SetTIPOTRIBUTIPI;
    property BaseCalcIPI            : Double read GetBASECALCIPI            write SetBASECALCIPI;
    property AliquotaIPI            : Double read GetALIQUOTAIPI            write SetALIQUOTAIPI;
    property Valoripicontrib        : Double read GetVALORIPICONTRIB        write SetVALORIPICONTRIB;
    property CST_IPI                : String read GetCST_IPI                write SetCST_IPI;
    property CST_COFINS             : String read GetCST_COFINS             write SetCST_COFINS;
    property CST_PIS                : String read GetCST_PIS                write SetCST_PIS;
    property BaseCalculoCOFINS      : Double read GetBASECALCULOCOFINS      write SetBASECALCULOCOFINS;
    property BaseCalculoPIS         : Double read GetBASECALCULOPIS         write SetBASECALCULOPIS;
    property ValorFrete             : Double read GetVALORFRETE             write SetVALORFRETE;
    property ValorSeguro            : Double read GetVALORSEGURO            write SetVALORSEGURO;
    property ValorDesconto          : Double read GetVALORDESCONTO          write SetVALORDESCONTO;
    property ValorTotal             : Double read GetVALORTOTAL             write SetVALORTOTAL;
    property NaturezaReceitaCOFINS  : String read GetNATUREZARECEITACOFINS  write SetNATUREZARECEITACOFINS;
    property NaturezaReceitaPIS     : String read GetNATUREZARECEITAPIS     write SetNATUREZARECEITAPIS;
    property IndespProdepe          : String read GetINDESPPRODEPE          write SetINDESPPRODEPE;
    property CodApuracaoProdepe     : String read GetCODAPURACAOPRODEPE     write SetCODAPURACAOPRODEPE;
    property SitTribCSOSN           : String read GetSITTRIBCSOSN           write SetSITTRIBCSOSN;
    property CSOSN                  : String read GetCSOSN                  write SetCSOSN;
    property TipoCalculoCofins      : String read GetTIPOCALCULOCOFINS      write SetTIPOCALCULOCOFINS;
    property AliquotaCofinsPerc     : Double read GetALIQUOTACOFINSPERC     write SetALIQUOTACOFINSPERC;
    property AliquotaCOFINSReais    : Double read GetALIQUOTACOFINSREAIS    write SetALIQUOTACOFINSREAIS;
    property ValorCofins            : Double read GetVALORCOFINS            write SetVALORCOFINS;
    property TipoCalculoPIS         : String read GetTIPOCALCULOPIS         write SetTIPOCALCULOPIS;
    property AliquotaPISPerc        : Double read GetALIQUOTAPISPERC        write SetALIQUOTAPISPERC;
    property AliquotaPISReais       : Double read GetALIQUOTAPISREAIS       write SetALIQUOTAPISREAIS;
    property ValorPIS               : Double read GetVALORPIS               write SetVALORPIS;
    property CodAjusteFiscal        : String read GetCODAJUSTEFISCAL        write SetCODAJUSTEFISCAL;
    property PedidoCompra           : String read GetPEDIDOCOMPRA           write SetPEDIDOCOMPRA;
    property ItemPedidoCompra       : String read GetITEMPEDIDOCOMPRA       write SetITEMPEDIDOCOMPRA;
    property OutrasDespesas         : Double read GetOUTRASDESPESAS         write SetOUTRASDESPESAS;
    property CodigoContabil         : String read GetCODIGOCONTABIL         write SetCODIGOCONTABIL;
    property NaoCompoeValorTotal    : Integer read GetNAOCOMPOEVALORTOTAL    write SetNAOCOMPOEVALORTOTAL;
    property NatContribEstornoCOFINS: String read GetNATCONTRIBESTORNOCOFINS write SetNATCONTRIBESTORNOCOFINS;
    property NatContribEstornoPIS   : String read GetNATCONTRIBESTORNOPIS   write SetNATCONTRIBESTORNOPIS;
    property NatCredEstornoCOFINS   : String read GetNATCREDESTORNOCOFINS   write SetNATCREDESTORNOCOFINS;
    property NatCredEstornoPIS      : String read GetNATCREDESTORNOPIS      write SetNATCREDESTORNOPIS;
    property FCI                    : String read GetFCI                    write SetFCI;
    property ItemDerivadoPetroleo   : Integer read GetITEMDERIVADOPETROLEO   write SetITEMDERIVADOPETROLEO;
    property Recopi                 : String read GetRECOPI                 write SetRECOPI;
    property PercIPIDevolvido       : Double read GetPERCIPIDEVOLVIDO       write SetPERCIPIDEVOLVIDO;
    property Motivdevolipi          : String read GetMOTIVDEVOLIPI          write SetMOTIVDEVOLIPI;
    property IndEspIncentivo        : String read GetINDESPINCENTIVO        write SetINDESPINCENTIVO;
    property ValorICMSDeson         : Double read GetVALORICMSDESON         write SetVALORICMSDESON;
    property MotivoDesonICMS        : String read GetMOTIVODESONICMS        write SetMOTIVODESONICMS;
  end;

  IICMSIPINotaMercadoria = Interface(IDBEditAndNavigateActions)
  ['{6A38D42C-CF6E-4DD7-AC5B-288F40A022FD}']
    function GetALIQUOTAICMS: Double;
    function GetBASECALCICMS: Double;
    function GetCFOP: String;
    function GetCFOPTRANSF: String;
    function GetCODIGO: String;
    function GetCODSITTRIBCSOSN: String;
    function GetCOFINSMONOFASICO: Integer;
    function GetCSOSN: String;
    function GetCST_IPI: String;
    function GetCSTA: String;
    function GetCSTB: String;
    function GetPISMONOFASICO: Integer;
    function GetSUBSTCOFINS: Integer;
    function GetSUBSTICMS: Integer;
    function GetSUBSTIPI: Integer;
    function GetSUBSTPIS_PASEP: Integer;
    function GetUF: String;
    function GetVALOR: Double;
    function GetVALORICMS: Double;
    function GetVALORISENTASICMS: Double;
    function GetVALOROUTRASICMS: Double;
    function GetBaseCalcIPI: Double;
    function GetValorIPI: Double;
    function GetValorIsentasIPI: Double;
    function GetValorOutrasIPI: Double;
    procedure SetALIQUOTAICMS(const Value: Double);
    procedure SetBASECALCICMS(const Value: Double);
    procedure SetCFOP(const Value: String);
    procedure SetCFOPTRANSF(const Value: String);
    procedure SetCODIGO(const Value: String);
    procedure SetCODSITTRIBCSOSN(const Value: String);
    procedure SetCOFINSMONOFASICO(const Value: Integer);
    procedure SetCSOSN(const Value: String);
    procedure SetCST_IPI(const Value: String);
    procedure SetCSTA(const Value: String);
    procedure SetCSTB(const Value: String);
    procedure SetPISMONOFASICO(const Value: Integer);
    procedure SetSUBSTCOFINS(const Value: Integer);
    procedure SetSUBSTICMS(const Value: Integer);
    procedure SetSUBSTIPI(const Value: Integer);
    procedure SetSUBSTPIS_PASEP(const Value: Integer);
    procedure SetUF(const Value: String);
    procedure SetVALOR(const Value: Double);
    procedure SetVALORICMS(const Value: Double);
    procedure SetVALORISENTASICMS(const Value: Double);
    procedure SetVALOROUTRASICMS(const Value: Double);
    procedure SetBaseCalcIPI(const Value: Double);
    procedure SetValorIPI(const Value: Double);
    procedure SetValorIsentasIPI(const Value: Double);
    procedure SetValorOutrasIPI(const Value: Double);
    //
    property Codigo          : String  read GetCODIGO           write SetCODIGO;
    property Valor           : Double  read GetVALOR            write SetVALOR;
    property UF              : String  read GetUF               write SetUF;
    property CFOP            : String  read GetCFOP             write SetCFOP;
    property CFOPTransf      : String  read GetCFOPTRANSF       write SetCFOPTRANSF;
    property BaseCalcICMS    : Double  read GetBASECALCICMS     write SetBASECALCICMS;
    property AliquotaICMS    : Double  read GetALIQUOTAICMS     write SetALIQUOTAICMS;
    property ValorICMS       : Double  read GetVALORICMS        write SetVALORICMS;
    property ValorIsentasICMS: Double  read GetVALORISENTASICMS write SetVALORISENTASICMS;
    property ValorOutrasICMS : Double  read GetVALOROUTRASICMS  write SetVALOROUTRASICMS;
    property BaseCalcIPI     : Double  read GetBaseCalcIPI      write SetBaseCalcIPI;
    property ValorIPI        : Double  read GetValorIPI         write SetValorIPI;
    property ValorIsentasIPI : Double  read GetValorIsentasIPI  write SetValorIsentasIPI;
    property ValorOutrasIPI  : Double  read GetValorOutrasIPI   write SetValorOutrasIPI;
    property SubstICMS       : Integer read GetSUBSTICMS        write SetSUBSTICMS;
    property SubstIPI        : Integer read GetSUBSTIPI         write SetSUBSTIPI;
    property SubstCOFINS     : Integer read GetSUBSTCOFINS      write SetSUBSTCOFINS;
    property SubstPIS_PASEP  : Integer read GetSUBSTPIS_PASEP   write SetSUBSTPIS_PASEP;
    property CSTA            : String  read GetCSTA             write SetCSTA;
    property CSTB            : String  read GetCSTB             write SetCSTB;
    property CodSitTribCSOSN : String  read GetCODSITTRIBCSOSN  write SetCODSITTRIBCSOSN;
    property CSOSN           : String  read GetCSOSN            write SetCSOSN;
    property CST_IPI         : String  read GetCST_IPI          write SetCST_IPI;
    property COFINSMonofasico: Integer read GetCOFINSMONOFASICO write SetCOFINSMONOFASICO;
    property PISMonofasico   : Integer read GetPISMONOFASICO    write SetPISMONOFASICO;
  end;

  IICMSAntecipadoNotaMercadoria = interface(IDBEditAndNavigateActions)
  ['{0BC5C8A8-F4F8-41F4-A6BE-C6E0948274EB}']
    function GetAliquota: Double;
    function GetBaseCalculo: Double;
    function GetCodigo: string;
    function GetCustoAquisicao: Double;
    function GetPercAgregacao: Double;
    function GetValorCreditoOrigem: Double;
    function GetValorJaRecolhido: Double;
    procedure SetAliquota(const Value: Double);
    procedure SetBaseCalculo(const Value: Double);
    procedure SetCodigo(const Value: string);
    procedure SetCustoAquisicao(const Value: Double);
    procedure SetPercAgregacao(const Value: Double);
    procedure SetValorCreditoOrigem(const Value: Double);
    procedure SetValorJaRecolhido(const Value: Double);
    //
    property Codigo            : string  read GetCodigo             write SetCodigo;
    property CustoAquisicao    : Double  read GetCustoAquisicao     write SetCustoAquisicao;
    property PercAgregacao     : Double  read GetPercAgregacao      write SetPercAgregacao;
    property BaseCalculo       : Double  read GetBaseCalculo        write SetBaseCalculo;
    property Aliquota          : Double  read GetAliquota           write SetAliquota;
    property ValorCreditoOrigem: Double  read GetValorCreditoOrigem write SetValorCreditoOrigem;
    property ValorJaRecolhido  : Double  read GetValorJaRecolhido   write SetValorJaRecolhido;
  end;
  
  IICMSSubstNotaMercadoria = interface(IDBEditAndNavigateActions)
  ['{647A6EE2-400A-4479-8BF4-D4E1F326CD27}']
    function GetAliquota: Double;
    function GetBaseCalculo: Double;
    function GetCodigo: String;
    function GetCustoAquisicao: Double;
    function GetPercAgregacao: Double;
    function GetTipo: String;
    function GetValorCreditoOrigem: Double;
    function GetValorJaRecolhido: Double;
    procedure SetAliquota(const Value: Double);
    procedure SetBaseCalculo(const Value: Double);
    procedure SetCodigo(const Value: String);
    procedure SetCustoAquisicao(const Value: Double);
    procedure SetPercAgregacao(const Value: Double);
    procedure SetTipo(const Value: String);
    procedure SetValorCreditoOrigem(const Value: Double);
    procedure SetValorJaRecolhido(const Value: Double);
    //
    property Codigo            : String read GetCodigo             write SetCodigo;
    property Tipo              : String read GetTipo               write SetTipo;
    property CustoAquisicao    : Double read GetCustoAquisicao     write SetCustoAquisicao;
    property PercAgregacao     : Double read GetPercAgregacao      write SetPercAgregacao;
    property BaseCalculo       : Double read GetBaseCalculo        write SetBaseCalculo;
    property Aliquota          : Double read GetAliquota           write SetAliquota;
    property ValorCreditoOrigem: Double read GetValorCreditoOrigem write SetValorCreditoOrigem;
    property ValorJaRecolhido  : Double read GetValorJaRecolhido   write SetValorJaRecolhido;
  end;

  IICMSDiferencialNotaMercadoria = interface(IDBEditAndNavigateActions)
  ['{A6C0C8F6-5EA5-4FE9-AF4E-794703A7A3FA}']
    function GetAliquotaInterna: Double;
    function GetAliquotaOrigem: Double;
    function GetBaseCalculo: Double;
    function GetCodigo: String;
    procedure SetAliquotaInterna(const Value: Double);
    procedure SetAliquotaOrigem(const Value: Double);
    procedure SetBaseCalculo(const Value: Double);
    procedure SetCodigo(const Value: String);
    //
    property Codigo         : String read GetCodigo          write SetCodigo;
    property BaseCalculo    : Double read GetBaseCalculo     write SetBaseCalculo;
    property AliquotaOrigem : Double read GetAliquotaOrigem  write SetAliquotaOrigem;
    property AliquotaInterna: Double read GetAliquotaInterna write SetAliquotaInterna;
  end;

  IOutrosValoresNotaMercadoria = interface(IDBEditAndNavigateActions)
  ['{BFE923F7-3682-4260-9E32-19D7D2FE6015}']
    function GetCodigo: String;
    function GetCodigo_Fiscal: String;
    function GetValor: Double;
    procedure SetCodigo(const Value: String);
    procedure SetCodigo_Fiscal(const Value: String);
    procedure SetValor(const Value: Double);
    //
    property Codigo       : String read GetCodigo        write SetCodigo;
    property Codigo_Fiscal: String read GetCodigo_Fiscal write SetCodigo_Fiscal;
    property Valor        : Double read GetValor         write SetValor;
  end;

  IDetalheTransporteNotaMercadoria = interface(IDBEditAndNavigateActions)
  ['{47716C8C-2DB8-49C5-9936-CD47DECD8D93}']
    function GetCodigo: String;
    function GetCodigoAutorizacao: String;
    function GetCodigoParticipante: String;
    function GetCodigoRNTC: String;
    function GetCPFMotorista: String;
    function GetEspecie: String;
    function GetMarca: String;
    function GetNomeMotorista: String;
    function GetNumeracao: String;
    function GetNumeroPasseFiscal: String;
    function GetPesoBruto: Double;
    function GetPesoLiquido: Double;
    function GetPlacaVeiculo: String;
    function GetQuantidade: Double;
    function GetTemperatura: Double;
    function GetUFPlacaVeiculo: String;
    procedure SetCodigo(const Value: String);
    procedure SetCodigoAutorizacao(const Value: String);
    procedure SetCodigoParticipante(const Value: String);
    procedure SetCodigoRNTC(const Value: String);
    procedure SetCPFMotorista(const Value: String);
    procedure SetEspecie(const Value: String);
    procedure SetMarca(const Value: String);
    procedure SetNomeMotorista(const Value: String);
    procedure SetNumeracao(const Value: String);
    procedure SetNumeroPasseFiscal(const Value: String);
    procedure SetPesoBruto(const Value: Double);
    procedure SetPesoLiquido(const Value: Double);
    procedure SetPlacaVeiculo(const Value: String);
    procedure SetQuantidade(const Value: Double);
    procedure SetTemperatura(const Value: Double);
    procedure SetUFPlacaVeiculo(const Value: String);
    //
    property Codigo            : String read GetCodigo             write SetCodigo;
    property CodigoParticipante: String read GetCodigoParticipante write SetCodigoParticipante;
    property CodigoRNTC        : String read GetCodigoRNTC         write SetCodigoRNTC;
    property PlacaVeiculo      : String read GetPlacaVeiculo       write SetPlacaVeiculo;
    property UFPlacaVeiculo    : String read GetUFPlacaVeiculo     write SetUFPlacaVeiculo;
    property Quantidade        : Double read GetQuantidade         write SetQuantidade;
    property Especie           : String read GetEspecie            write SetEspecie;
    property Marca             : String read GetMarca              write SetMarca;
    property Numeracao         : String read GetNumeracao          write SetNumeracao;
    property PesoBruto         : Double read GetPesoBruto          write SetPesoBruto;
    property PesoLiquido       : Double read GetPesoLiquido        write SetPesoLiquido;
    property CodigoAutorizacao : String read GetCodigoAutorizacao  write SetCodigoAutorizacao;
    property NumeroPasseFiscal : String read GetNumeroPasseFiscal  write SetNumeroPasseFiscal;
    property Temperatura       : Double read GetTemperatura        write SetTemperatura;
    property NomeMotorista     : String read GetNomeMotorista      write SetNomeMotorista;
    property CPFMotorista      : String read GetCPFMotorista       write SetCPFMotorista;
  end;

  IFaturaNotaMercadoria = interface(IDBEditActions)
  ['{6507E917-5CD2-4B71-A745-EA0474A6CC22}']
    function GetCodigo: String;
    function GetNumero: String;
    function GetTipoDocumento: String;
    function GetTipoOperacao: Integer;
    function GetValorDesconto: Double;
    function GetValorTotal: Double;
    function GetTitulosNota: ITitulosNotaMercadoria;
    procedure SetCodigo(const Value: String);
    procedure SetNumero(const Value: String);
    procedure SetTipoDocumento(const Value: String);
    procedure SetTipoOperacao(const Value: Integer);
    procedure SetValorDesconto(const Value: Double);
    procedure SetValorTotal(const Value: Double);
    procedure SetTitulosNota(const Value: ITitulosNotaMercadoria);
    //
    property Codigo       : String  read GetCodigo        write SetCodigo;
    property Numero       : String  read GetNumero        write SetNumero;
    property TipoOperacao : Integer read GetTipoOperacao  write SetTipoOperacao;
    property TipoDocumento: String  read GetTipoDocumento write SetTipoDocumento;
    property ValorTotal   : Double  read GetValorTotal    write SetValorTotal;
    property ValorDesconto: Double  read GetValorDesconto write SetValorDesconto;
    property TitulosNota  : ITitulosNotaMercadoria read GetTitulosNota write SetTitulosNota;
  end;

  ITitulosNotaMercadoria = interface(IDBEditAndNavigateActions)
  ['{FED4CF02-D407-418E-B2EA-1BCD4E3196B3}']
    function GetCodigo: String;
    function GetDataVencimento: TDateTime;
    function GetTitulo: String;
    function GetValorCOFINSREtido: Double;
    function GetValorCSLREtido: Double;
    function GetValorIRPJRetido: Double;
    function GetValorPISRetido: Double;
    function GetValorTitulo: Double;
    function GetBaixasnota: IBaixasNotaMercadoria;
    procedure SetCodigo(const Value: String);
    procedure SetDataVencimento(const Value: TDateTime);
    procedure SetTitulo(const Value: String);
    procedure SetValorCOFINSREtido(const Value: Double);
    procedure SetValorCSLREtido(const Value: Double);
    procedure SetValorIRPJRetido(const Value: Double);
    procedure SetValorPISRetido(const Value: Double);
    procedure SetValorTitulo(const Value: Double);
    procedure SetBaixasnota(const Value: IBaixasNotaMercadoria);
    //
    property Codigo           : String    read GetCodigo            write SetCodigo;
    property Titulo           : String    read GetTitulo            write SetTitulo;
    property DataVencimento   : TDateTime read GetDataVencimento    write SetDataVencimento;
    property ValorTitulo      : Double    read GetValorTitulo       write SetValorTitulo;
    property ValorCOFINSREtido: Double    read GetValorCOFINSREtido write SetValorCOFINSREtido;
    property ValorPISRetido   : Double    read GetValorPISRetido    write SetValorPISRetido;
    property ValorCSLREtido   : Double    read GetValorCSLREtido    write SetValorCSLREtido;
    property ValorIRPJRetido  : Double    read GetValorIRPJRetido   write SetValorIRPJRetido;
    property BaixasNota       : IBaixasNotaMercadoria read GetBaixasNota write SetBaixasNota;
  end;

  IBaixasNotaMercadoria = interface(IDBEditAndNavigateActions)
  ['{75CE5AA6-1836-47B8-8353-EE394E963365}']
    function GetCodigo: String;
    function GetData: TDateTime;
    function GetValor: Double;
    function GetValorCOFINSRetido: Double;
    function GetValorCSLRetido: Double;
    function GetValorDesconto: Double;
    function GetValorIRPJRetido: Double;
    function GetValorJuros: Double;
    function GetValorMulta: Double;
    function GetValorPISRetido: Double;
    function GetValorReceitaTributCSL1: Double;
    function GetValorReceitaTributCSL2: Double;
    function GetValorReceitaTributIRPJ1: Double;
    function GetValorReceitaTributIRPJ2: Double;
    function GetValorReceitaTributIRPJ3: Double;
    function GetValorReceitaTributIRPJ4: Double;
    function GetValorTotal: Double;
    function GetApuracoesNota: IApuracoesNotaMercadoria;
    function GetDetalhamentoNota: IDetalhamentoNotaMercadoria;
    procedure SetCodigo(const Value: String);
    procedure SetData(const Value: TDateTime);
    procedure SetValor(const Value: Double);
    procedure SetValorCOFINSRetido(const Value: Double);
    procedure SetValorCSLRetido(const Value: Double);
    procedure SetValorDesconto(const Value: Double);
    procedure SetValorIRPJRetido(const Value: Double);
    procedure SetValorJuros(const Value: Double);
    procedure SetValorMulta(const Value: Double);
    procedure SetValorPISRetido(const Value: Double);
    procedure SetValorReceitaTributCSL1(const Value: Double);
    procedure SetValorReceitaTributCSL2(const Value: Double);
    procedure SetValorReceitaTributIRPJ1(const Value: Double);
    procedure SetValorReceitaTributIRPJ2(const Value: Double);
    procedure SetValorReceitaTributIRPJ3(const Value: Double);
    procedure SetValorReceitaTributIRPJ4(const Value: Double);
    procedure SetValorTotal(const Value: Double);
    procedure SetApuracoesNota(const Value: IApuracoesNotaMercadoria);
    procedure SetDetalhamentoNota(const Value: IDetalhamentoNotaMercadoria);
    //
    property Codigo                 : String read GetCodigo                  write SetCodigo;
    property Data                   : TDateTime read GetData                    write SetData;
    property Valor                  : Double read GetValor                   write SetValor;
    property ValorMulta             : Double read GetValorMulta              write SetValorMulta;
    property ValorJuros             : Double read GetValorJuros              write SetValorJuros;
    property ValorCOFINSRetido      : Double read GetValorCOFINSRetido       write SetValorCOFINSRetido;
    property ValorPISRetido         : Double read GetValorPISRetido          write SetValorPISRetido;
    property ValorCSLRetido         : Double read GetValorCSLRetido          write SetValorCSLRetido;
    property ValorTotal             : Double read GetValorTotal              write SetValorTotal;
    property ValorDesconto          : Double read GetValorDesconto           write SetValorDesconto;
    property ValorIRPJRetido        : Double read GetValorIRPJRetido         write SetValorIRPJRetido;
    property ValorReceitaTributCSL1 : Double read GetValorReceitaTributCSL1  write SetValorReceitaTributCSL1;
    property ValorReceitaTributCSL2 : Double read GetValorReceitaTributCSL2  write SetValorReceitaTributCSL2;
    property ValorReceitaTributIRPJ1: Double read GetValorReceitaTributIRPJ1 write SetValorReceitaTributIRPJ1;
    property ValorReceitaTributIRPJ2: Double read GetValorReceitaTributIRPJ2 write SetValorReceitaTributIRPJ2;
    property ValorReceitaTributIRPJ3: Double read GetValorReceitaTributIRPJ3 write SetValorReceitaTributIRPJ3;
    property ValorReceitaTributIRPJ4: Double read GetValorReceitaTributIRPJ4 write SetValorReceitaTributIRPJ4;
    property ApuracoesNota          : IApuracoesNotaMercadoria    read GetApuracoesNota    write SetApuracoesNota;
    property DetalhamentoNota       : IDetalhamentoNotaMercadoria read GetDetalhamentoNota write SetDetalhamentoNota;
  end;

  IApuracoesNotaMercadoria = interface(IDBEditAndNavigateActions)
  ['{E38D6DEE-34B3-4A88-B225-9D73A735048D}']
    function GetAliqCOFINSPerc: Double;
    function GetAliqCOFINSReais: Double;
    function GetAliqPISPerc: Double;
    function GetAliqPISReais: Double;
    function GetBaseCalculoCOFINS: Double;
    function GetBaseCalculopis: Double;
    function GetCFOP: String;
    function GetCodigo: String;
    function GetCST_COFINS: String;
    function GetCST_PIS: String;
    function GetDescricaoCOFINS: String;
    function GetDescricaoPIS: String;
    function GetNaturezaCOFINS: String;
    function GetNaturezaPIS: String;
    function GetQuantidadeEmReais: Double;
    function GetTipoCalculoCOFINS: String;
    function GetTipoCalculopis: String;
    function GetValorCOFINS: Double;
    function GetValorPIS: Double;
    function GetValorReceitaCOFINS: Double;
    function GetValorReceitaPIS: Double;
    procedure SetAliqCOFINSPerc(const Value: Double);
    procedure SetAliqCOFINSReais(const Value: Double);
    procedure SetAliqPISPerc(const Value: Double);
    procedure SetAliqPISReais(const Value: Double);
    procedure SetBaseCalculoCOFINS(const Value: Double);
    procedure SetBaseCalculopis(const Value: Double);
    procedure SetCFOP(const Value: String);
    procedure SetCodigo(const Value: String);
    procedure SetCST_COFINS(const Value: String);
    procedure SetCST_PIS(const Value: String);
    procedure SetDescricaoCOFINS(const Value: String);
    procedure SetDescricaoPIS(const Value: String);
    procedure SetNaturezaCOFINS(const Value: String);
    procedure SetNaturezaPIS(const Value: String);
    procedure SetQuantidadeEmReais(const Value: Double);
    procedure SetTipoCalculoCOFINS(const Value: String);
    procedure SetTipoCalculopis(const Value: String);
    procedure SetValorCOFINS(const Value: Double);
    procedure SetValorPIS(const Value: Double);
    procedure SetValorReceitaCOFINS(const Value: Double);
    procedure SetValorReceitaPIS(const Value: Double);
    //
    property Codigo            : String read GetCodigo             write SetCodigo;
    property CFOP              : String read GetCFOP               write SetCFOP;
    property QuantidadeEmReais : Double read GetQuantidadeEmReais  write SetQuantidadeEmReais;
    property CST_COFINS        : String read GetCST_COFINS         write SetCST_COFINS;
    property ValorReceitaCOFINS: Double read GetValorReceitaCOFINS write SetValorReceitaCOFINS;
    property TipoCalculoCOFINS : String read GetTipoCalculoCOFINS  write SetTipoCalculoCOFINS;
    property BaseCalculoCOFINS : Double read GetBaseCalculoCOFINS  write SetBaseCalculoCOFINS;
    property AliqCOFINSPerc    : Double read GetAliqCOFINSPerc     write SetAliqCOFINSPerc;
    property AliqCOFINSReais   : Double read GetAliqCOFINSReais    write SetAliqCOFINSReais;
    property ValorCOFINS       : Double read GetValorCOFINS        write SetValorCOFINS;
    property CST_PIS           : String read GetCST_PIS            write SetCST_PIS;
    property ValorReceitaPIS   : Double read GetValorReceitaPIS    write SetValorReceitaPIS;
    property TipoCalculopis    : String read GetTipoCalculopis     write SetTipoCalculopis;
    property BaseCalculopis    : Double read GetBaseCalculopis     write SetBaseCalculopis;
    property AliqPISPerc       : Double read GetAliqPISPerc        write SetAliqPISPerc;
    property AliqPISReais      : Double read GetAliqPISReais       write SetAliqPISReais;
    property ValorPIS          : Double read GetValorPIS           write SetValorPIS;
    property DescricaoCOFINS   : String read GetDescricaoCOFINS    write SetDescricaoCOFINS;
    property DescricaoPIS      : String read GetDescricaoPIS       write SetDescricaoPIS;
    property NaturezaCOFINS    : String read GetNaturezaCOFINS     write SetNaturezaCOFINS;
    property NaturezaPIS       : String read GetNaturezaPIS        write SetNaturezaPIS;
  end;

  IDetalhamentoNotaMercadoria = interface(IDBEditAndNavigateActions)
  ['{91D8C479-355D-4057-94BA-81A31B22B9F3}']
    function GetATIVIDADE: String;
    function GetCFOP: String;
    function GetCODIGO: String;
    function GetCODIGOMUNFAVORECIDO: String;
    function GetCOFINSMONOFASICO: Integer;
    function GetESTABELECIMENTO: String;
    function GetEXTERIOR: Integer;
    function GetISSRETIDO: Integer;
    function GetPISMONOFASICO: Integer;
    function GetSUBSTCOFINS: Integer;
    function GetSUBSTIICMS: Integer;
    function GetSUBSTIPI: Integer;
    function GetSUBSTPIS_PASEP: Integer;
    function GetTIPOINFORMACAO: Integer;
    function GetUFFAVORECIDA: String;
    function GetVALORISENTAS: Double;
    function GetVALORRECEITA: Double;
    procedure SetATIVIDADE(const Value: String);
    procedure SetCFOP(const Value: String);
    procedure SetCODIGO(const Value: String);
    procedure SetCODIGOMUNFAVORECIDO(const Value: String);
    procedure SetCOFINSMONOFASICO(const Value: Integer);
    procedure SetESTABELECIMENTO(const Value: String);
    procedure SetEXTERIOR(const Value: Integer);
    procedure SetISSRETIDO(const Value: Integer);
    procedure SetPISMONOFASICO(const Value: Integer);
    procedure SetSUBSTCOFINS(const Value: Integer);
    procedure SetSUBSTIICMS(const Value: Integer);
    procedure SetSUBSTIPI(const Value: Integer);
    procedure SetSUBSTPIS_PASEP(const Value: Integer);
    procedure SetTIPOINFORMACAO(const Value: Integer);
    procedure SetUFFAVORECIDA(const Value: String);
    procedure SetVALORISENTAS(const Value: Double);
    procedure SetVALORRECEITA(const Value: Double);
    //
    property Codigo             : String  read GetCODIGO              write SetCODIGO;
    property TipoInformacao     : Integer read GetTIPOINFORMACAO      write SetTIPOINFORMACAO;
    property Estabelecimento    : String  read GetESTABELECIMENTO     write SetESTABELECIMENTO;
    property CFOP               : String  read GetCFOP                write SetCFOP;
    property SubstICMS          : Integer read GetSUBSTIICMS          write SetSUBSTIICMS;
    property SubstIPI           : Integer read GetSUBSTIPI            write SetSUBSTIPI;
    property SubstCOFINS        : Integer read GetSUBSTCOFINS         write SetSUBSTCOFINS;
    property SubstPIS_PASEP     : Integer read GetSUBSTPIS_PASEP      write SetSUBSTPIS_PASEP;
    property CofinsMonofasico   : Integer read GetCOFINSMONOFASICO    write SetCOFINSMONOFASICO;
    property PisMonofasico      : Integer read GetPISMONOFASICO       write SetPISMONOFASICO;
    property ValorIsentas       : Double  read GetVALORISENTAS        write SetVALORISENTAS;
    property Exterior           : Integer read GetEXTERIOR            write SetEXTERIOR;
    property ISSRetido          : Integer read GetISSRETIDO           write SetISSRETIDO;
    property Atividade          : String  read GetATIVIDADE           write SetATIVIDADE;
    property UFFavorecida       : String  read GetUFFAVORECIDA        write SetUFFAVORECIDA;
    property CodigoMunFavorecido: String  read GetCODIGOMUNFAVORECIDO write SetCODIGOMUNFAVORECIDO;
    property ValorReceita       : Double  read GetVALORRECEITA        write SetVALORRECEITA;
  end;

  IComplementoDoInventario = interface(IDBEditAndNavigateActions)
  ['{7F0FFCF6-60C2-440D-8167-B5172EF2E51E}']
    function Find(Codigo: String):Boolean;
    function Open:Boolean;
    procedure SetFSC_CIVEMP_CODIGO(Value: String);
    procedure SetFSC_CIVFSC_IIV_CODIGO(Value: String);
    procedure SetFSC_CIVCODIGO(Value: String);
    procedure SetFSC_CIVINDICADORPROPRIEDADE(Value: Integer);
    procedure SetFSC_CIVQUANTIDADE(Value: Double);
    procedure SetFSC_CIVUNIDADE(Value: String);
    procedure SetFSC_CIVVALORUNITARIO(Value: Double);
    procedure SetFSC_CIVPARTICIPANTE(Value: String);
    procedure SetFSC_CIVCSTA(Value: String);
    procedure SetFSC_CIVCSTB(Value: String);
    procedure SetFSC_CIVBASECALCULOICMS(Value: Double);
    procedure SetFSC_CIVALIQUOTAICMS(Value: Double);
    procedure SetFSC_CIVVALORICMS(Value: Double);
    procedure SetFSC_CIVVALORIMPOSTORENDA(Value: Double);
    function GetFSC_CIVEMP_CODIGO: String;
    function GetFSC_CIVFSC_IIV_CODIGO: String;
    function GetFSC_CIVCODIGO: String;
    function GetFSC_CIVINDICADORPROPRIEDADE: Integer;
    function GetFSC_CIVQUANTIDADE: Double;
    function GetFSC_CIVUNIDADE: String;
    function GetFSC_CIVVALORUNITARIO: Double;
    function GetFSC_CIVPARTICIPANTE: String;
    function GetFSC_CIVCSTA: String;
    function GetFSC_CIVCSTB: String;
    function GetFSC_CIVBASECALCULOICMS: Double;
    function GetFSC_CIVALIQUOTAICMS: Double;
    function GetFSC_CIVVALORICMS: Double;
    function GetFSC_CIVVALORIMPOSTORENDA: Double;

    property FSC_CIVEMP_CODIGO: String read GetFSC_CIVEMP_CODIGO write SetFSC_CIVEMP_CODIGO;
    property FSC_CIVFSC_IIV_CODIGO: String read GetFSC_CIVFSC_IIV_CODIGO write SetFSC_CIVFSC_IIV_CODIGO;
    property FSC_CIVCODIGO: String read GetFSC_CIVCODIGO write SetFSC_CIVCODIGO;
    property FSC_CIVINDICADORPROPRIEDADE: Integer read GetFSC_CIVINDICADORPROPRIEDADE write SetFSC_CIVINDICADORPROPRIEDADE;
    property FSC_CIVQUANTIDADE: Double read GetFSC_CIVQUANTIDADE write SetFSC_CIVQUANTIDADE;
    property FSC_CIVUNIDADE: String read GetFSC_CIVUNIDADE write SetFSC_CIVUNIDADE;
    property FSC_CIVVALORUNITARIO: Double read GetFSC_CIVVALORUNITARIO write SetFSC_CIVVALORUNITARIO;
    property FSC_CIVPARTICIPANTE: String read GetFSC_CIVPARTICIPANTE write SetFSC_CIVPARTICIPANTE;
    property FSC_CIVCSTA: String read GetFSC_CIVCSTA write SetFSC_CIVCSTA;
    property FSC_CIVCSTB: String read GetFSC_CIVCSTB write SetFSC_CIVCSTB;
    property FSC_CIVBASECALCULOICMS: Double read GetFSC_CIVBASECALCULOICMS write SetFSC_CIVBASECALCULOICMS;
    property FSC_CIVALIQUOTAICMS: Double read GetFSC_CIVALIQUOTAICMS write SetFSC_CIVALIQUOTAICMS;
    property FSC_CIVVALORICMS: Double read GetFSC_CIVVALORICMS write SetFSC_CIVVALORICMS;
    property FSC_CIVVALORIMPOSTORENDA: Double read GetFSC_CIVVALORIMPOSTORENDA write SetFSC_CIVVALORIMPOSTORENDA;

  end;

  IInventario = interface(IDBEditActions)
  ['{B8B9F0F4-490C-477D-AEEF-C44EDC09E54E}']
    function Find(Codigo: String):Boolean;
    function FindIDWS(IDWS: String): Boolean;
    procedure Open;
    function GetFSC_IIVEMP_CODIGO: String;
    function GetFSC_IIVCODIGO: String;
    function GetFSC_IIVESTABELECIMENTO: String;
    function GetFSC_IIVDATA: TDateTime;
    function GetFSC_IIVPRODUTO: String;
    function GetFSC_IIVUNIDADE: String;
    function GetFSC_IIVQUANTIDADE: Double;
    function GetFSC_IIVVALORUNITARIO: Double;
    function GetFSC_IIVMOTIVO: String;
    function GetFSC_IIVCSTA: String;
    function GetFSC_IIVCSTB: String;
    function GetFSC_IIVBASECALCULOICMS: Double;
    function GetFSC_IIVALIQUOTAICMS: Double;
    function GetFSC_IIVVALORIMPOSTORENDA: Double;
    function GetComplementoDoInventario: IComplementoDoInventario;
    procedure SetFSC_IIVEMP_CODIGO(const value: String);
    procedure SetFSC_IIVCODIGO(const value: String);
    procedure SetFSC_IIVESTABELECIMENTO(const value: String);
    procedure SetFSC_IIVDATA(const value: TDateTime);
    procedure SetFSC_IIVPRODUTO(const value: String);
    procedure SetFSC_IIVQUANTIDADE(const value: Double);
    procedure SetFSC_IIVUNIDADE(const value: String);
    procedure SetFSC_IIVVALORUNITARIO(const value: Double);
    procedure SetFSC_IIVMOTIVO(const value: String);
    procedure SetFSC_IIVCSTA(const value: String);
    procedure SetFSC_IIVCSTB(const value: String);
    procedure SetFSC_IIVBASECALCULOICMS(const value: Double);
    procedure SetFSC_IIVALIQUOTAICMS(const value: Double);
    function GetFSC_IIVVALORICMS: Double;
    procedure SetFSC_IIVVALORICMS(const value: Double);
    procedure SetFSC_IIVVALORIMPOSTORENDA(const value: Double);
    procedure SetComplementoDoInventario(const Value: IComplementoDoInventario);
    procedure SetIDWS(const Value: String);
    function GetIDWS: String;

    property FSC_IIVEMP_CODIGO: String read GetFSC_IIVEMP_CODIGO write SetFSC_IIVEMP_CODIGO;
    property FSC_IIVCODIGO: String read GetFSC_IIVCODIGO write SetFSC_IIVCODIGO;
    property FSC_IIVESTABELECIMENTO: String read GetFSC_IIVESTABELECIMENTO write SetFSC_IIVESTABELECIMENTO;
    property FSC_IIVDATA: TDateTime read GetFSC_IIVDATA write SetFSC_IIVDATA;
    property FSC_IIVPRODUTO: String read GetFSC_IIVPRODUTO write SetFSC_IIVPRODUTO;
    property FSC_IIVUNIDADE: String read GetFSC_IIVUNIDADE write SetFSC_IIVUNIDADE;
    property FSC_IIVQUANTIDADE: Double read GetFSC_IIVQUANTIDADE write SetFSC_IIVQUANTIDADE;
    property FSC_IIVVALORUNITARIO: Double read GetFSC_IIVVALORUNITARIO write SetFSC_IIVVALORUNITARIO;
    property FSC_IIVMOTIVO: String read GetFSC_IIVMOTIVO write SetFSC_IIVMOTIVO;
    property FSC_IIVCSTA: String read GetFSC_IIVCSTA write SetFSC_IIVCSTA;
    property FSC_IIVCSTB: String read GetFSC_IIVCSTB write SetFSC_IIVCSTB;
    property FSC_IIVBASECALCULOICMS: Double read GetFSC_IIVBASECALCULOICMS write SetFSC_IIVBASECALCULOICMS;
    property FSC_IIVALIQUOTAICMS: Double read GetFSC_IIVALIQUOTAICMS write SetFSC_IIVALIQUOTAICMS;
    property FSC_IIVVALORICMS: DOUBLE read GetFSC_IIVVALORICMS write SetFSC_IIVVALORICMS;
    property FSC_IIVVALORIMPOSTORENDA: Double read GetFSC_IIVVALORIMPOSTORENDA write SetFSC_IIVVALORIMPOSTORENDA;
    property ComplementoDoInventario: IComplementoDoInventario read GetComplementoDoInventario write SetComplementoDoInventario;
    property IDWS: String read GetIDWS write SetIDWS;
  end;

  IFinanceiro = interface
  ['{A3035B5B-0647-47CB-B82F-EE441BC1C662}']
    procedure Open(const URL:string);
    function IsOpen: Boolean;
    procedure Close;
    procedure StartTransaction;
    procedure Commit;
    procedure Rollback;
    function GetEmpresa:string;
    procedure SetEmpresa(const Codigo:string);
    function GetDriverNameBanco:string;
    procedure SetDriverNameBanco(const Codigo:string);
    function GetUsuarioBanco:string;
    procedure SetUsuarioBanco(const Codigo:string);
    function GetSenhaBanco:string;
    procedure SetSenhaBanco(const Codigo:string);
    function EncontraUsuario(const Usuario: String; var _Senha: String): Boolean;
    function GetContasaReceber: IContasaReceber;
    function GetBaixaVencimentoaReceber: IBaixaVencimentoaReceber;
    function GetBaixaVencimentoChequeaReceber: IBaixaVencimentoChequeaReceber;
    function GetBaixaVencimentoCartaoaReceber: IBaixaVencimentoCartaoaReceber;
    function GetCliente: ICliente;
    function GetLancamento: ILancamentos;
    function GetRateioLancamento: IRateioLancamentos;
    function GetAgenteCobrador: IAgenteCobrador;
    function GetContasaPagar: IContasaPagar;
    function GetFornecedor: IFornecedor;
    function GetVencimentosaPagar: IVencimentosaPagar;
    function GetBaixaVencimentoaPagar: IBaixaVencimentoaPagar;
    function GetDespesasaPagar: IDespesasaPagar;
    function GetDocContasaPagar: IDocContasaPagar;
    function GetReceitasDespesas: IReceitasDespesas;
    function GetNotasFiscaisEntrada: INotasFiscaisEntrada;
    function GetVendedorRepresentante: IVendedorRepresentante;
    function GetTransportadora: ITransportadora;
    function GetPrazoDePagamento: IPrazoDePagamento;
    function GetParcelasDoPrazoDePagamento: IParcelasDoPrazoDepagamento;
    function GetAdiantamentoCliente: IAdiantamentoCliente;
    function GetMunicipio:IMunicipio;
    function GetVencimentosEmAbertoCRE(CNPJCPF: String; Data:TDateTime; RetornaDadosCliente: Boolean = False; EscreveCabecalho: Boolean = False): String;
    function RenegociarCRE(const EMP_Codigo: String; const CRE_Codigo: String; const DataVencimento: TDateTime; const SequencialVencimento: Integer; Juros, Multa, Desconto: Double): String;
    function GetBoletoPDFStream(EMP: String; DtInicialEmi, DtFinalEmi: TDateTime; Juros, Multa: Double; ListaBOL: TStringList; var retorno: String): Integer; stdcall;
    function GetVersion: string;
    function GetVersionDB: Integer;
    function GetNotasFiscaisSaida: INotasFiscaisSaida;
    function GetCentrosEstoque: ICentroEstoque;
    function GetItens: IItens;
    function GetAlmoxarifado: IAlmoxarifado;
    function GetSaidas: ISaidas;
    function GetItensSaida: IItensSaida;
    function GetTransferenciaEstoque: ITransferenciaEstoque;
    function GetItensTransferenciaEstoque: IItensTransferenciaEstoque;
    function GetDevolucoesEntrada: IDevolucoesEntrada;
    function GetItensDevolucao: IItensDevolucoesEntrada;
    function GetDevolucoesSaida: IDevolucoesSaida;
    function GetItensDevolucaoSaida: IItensDevolucoesSaida;
    function GetRequisicoes: IRequisicoes;
    function GetItensRequisicao :iItensRequisicao;
    function GetEntradas: IEntradas;
    function GetItensEntrada: IItensEntrada;
    function GetListaEmpresas: IListaEmpresas;
    function GetDanfe: IDanfe;
    function GetListaEstabelecimentos(const EMP_Codigo: String): IListaEstabelecimentos;
    function GetListaCentrosDeResultados(const EMP_Codigo: String): IListaCentrosDeResultados;
    function GetListaServicos(const EMP_Codigo: String): IListaServicos;
    function GetListaModalidades(const EMP_Codigo: String): IListaModalidades;
    function GetListaBancos(const EMP_Codigo: String): IListaBancos;
    function GetListaAdministradorasDeCartoes(const EMP_Codigo: String): IListaAdministradorasDeCartoes;
    function GetListaAgentesCobradores(const EMP_Codigo: String): IListaAgentesCobradores;
    function GetListaGrupoClientes(const EMP_Codigo: String): IListaGrupoClientes;
    function GetListaClientes(ConsiderarCancelados: Boolean = True; CPFCNPJ: string = ''; DetalhaContatosEServicos: Boolean = False): String;
    function GetListaFornecedores: String;
    function GetPedidoDeVenda: IPedidoDeVenda;
    function GetColetas(Emp_Codigo, Est_Codigo: string; DataInicial, DataFinal: TDateTime; Ces_Codigo, Rit_Codigo, Pro_Codigo, Frn_Codigo: string): TArrayDadosColeta;
    function GetPedidosDaColeta(EMP_Codigo, CLT_Codigo: string;Pro_Codigo:String = ''): TArrayDadosPedidoDeCompra;
    function GetNFPDFStream(Emp_Codigo, Nfs_Codigo: string; var Retorno: string; var NumeroNF: string): Integer; stdcall;
    function GetNFPDFStreamDeContasAReceber(Emp_Codigo, Cre_Codigo: string; var Retorno: string; var NumeroNF: string): Integer; stdcall;
    function GetListaCFOP: String;
    function GetListaSTA: String;
    function GetListaSTB: String;
    function GetListaSTBSN: String;
    function GetServicos: IServicos;
    function GetCentroDeResultado: ICentroDeResultado;
    function BloqueiaClientesInadimplentesFortes: string;
    function GetTransferenciaEntreContas: ITransferenciaEntreContas;
    function GetListaTipoDocumentoJson(EMP_CODIGO: string): string;
    function GetListaPrazosPagamentoJson(EMP_CODIGO: string): string;
    function GetListaUnidadeMedidaJson(EMP_CODIGO: string): string;
    function GetOrcamentoFisicoFinanceiro: IOrcamentoFisicoFinanceiro;
    function GetMapaResumo: IMapaResumo;
    function GetCupomFiscal: ICupomFiscal;
    function GetConhecimentoTransporte: IConhecimentoTransporte;
    function GetNotaFiscalMercadoria: INotaFiscalMercadoria;
    function GetSaldoDisponivelOrcamento(EMP_Codigo, CRD_Codigo: String; Data: TDateTime; var ValorOrcado: Double): Double;
    function GetInventario: IInventario;
    property Empresa:string read GetEmpresa write SetEmpresa;
    property DriverNameBanco:string read GetDriverNameBanco write SetDriverNameBanco;
    property UsuarioBanco:string read GetUsuarioBanco write SetUsuarioBanco;
    property SenhaBanco:string read GetSenhaBanco write SetSenhaBanco;
  end;

function GetFinanceiro(aPath: String): IFinanceiro;

implementation

var
  FinanceiroHandle:THandle=0;

function GetFinanceiro(aPath: String):IFinanceiro;
var
  Proc:TGetFinanceiroProc;
begin
  if FinanceiroHandle<>0 then
    FreeLibrary(FinanceiroHandle);
  FinanceiroHandle := LoadLibrary(Pchar(IncludeTrailingBackslash(aPath)+'AGLib.dll'));
  if FinanceiroHandle=0 then
    raise Exception.Create('DLL AGLib.dll não encontrada.');
  Proc:=TGetFinanceiroProc(GetProcAddress(FinanceiroHandle,'GetFinanceiro'));
  Result:=Proc;
end;

initialization

finalization
  //TODO: Ver com Ronaldo problemas de access violation (Teresina)
  try
    if FinanceiroHandle<>0 then
      FreeLibrary(FinanceiroHandle);
  except
    on E: Exception do
      Raise Exception.Create('Erro na destruição da instância da DLL.');
  end;
end.
