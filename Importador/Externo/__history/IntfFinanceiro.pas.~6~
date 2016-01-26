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
    procedure SetEstabelecimento(const Value: String);
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
    function  Find(Codigo: String; Sequencial: Integer): Boolean;
    function  Open: Boolean;
    //
    function  GetCodigo: String;
    function  GetItem: String;
    procedure SetItem(const Value: String);
    function  GetQuantidade: Double;
    procedure SetQuantidade(Value: Double);
    function  GetOBS: String;
    procedure SetOBS(const Value: String);
    procedure ApplyUpdatesIRE;
    //
    property  Codigo: String read GetCodigo;
    property  Item: String read GetItem write SetItem;
    property  Quantidade: Double read GetQuantidade write SetQuantidade;
    property  OBS: String read GetOBS write SetOBS;
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
    function  Find(Codigo: String): Boolean;

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
  IReceitasDespesas = interface
  ['{0F7FBF6A-90C8-4A4B-817B-2B04619B395A}']
    function  Find(Codigo: String): Boolean;
    function  GetLista(Natureza, ContaMae: String): IListaCRD;
    //
    function  GetTipo: String;
    function  GetNatureza: String;
    //
    property  Tipo: String read GetTipo;
    property  Natureza: String read GetNatureza;
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
    property  LAN_Historico: String write SetLAN_Historico;
    property  LAN_CRD_Desconto: String write SetLAN_CRD_Desconto;
    property  LAN_CRD_Juros: String write SetLAN_CRD_Juros;
  end;

  // Rateio dos lançamentos
  IRateioLancamentos = interface;

  // Lançamentos Avulsos
  ILancamentos = interface(IDBEditActions)
  ['{0DAEC335-0E0B-4EA1-BD6E-A818245B13DF}']
    procedure Open;
    function  Find(Codigo: String): Boolean;
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
    function GetNFPDFStream(Emp_Codigo, Nfs_Codigo: string; var Retorno: string; var NumeroNF: string): Integer; stdcall;
    function GetNFPDFStreamDeContasAReceber(Emp_Codigo, Cre_Codigo: string; var Retorno: string; var NumeroNF: string): Integer; stdcall;
    function GetListaCFOP: String;
    function GetListaSTA: String;
    function GetListaSTB: String;
    function GetListaSTBSN: String;
    function GetServicos: IServicos;
    function GetCentroDeResultado: ICentroDeResultado;
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

{ IPedidoDeVenda }

initialization

finalization
  //TODO: Ver com Ronaldo problemas de access violation (Teresina)
  try
    if FinanceiroHandle<>0 then
      FreeLibrary(FinanceiroHandle);
  except
    Raise Exception.Create('Erro na destruição da instância da DLL.');
  end;
end.


