unit uAtualizaBanco;

interface

const VERSAO_APP : integer = 2;


type
  TAtualizaBanco = class
  private
    { private declarations }
    procedure CriarEstruturaDeAtualizacao;
    function GetVersaoBanco: Integer;
    function ExecutaComando(aSql: WideString): Boolean;
  protected
    { protected declarations }
  public
    { public declarations }
    procedure AtualizarBanco;
  end;

implementation

uses
  FireDAC.Comp.Client, uInterfaceQuery, udmConnect, System.SysUtils, Data.DB;


{ TAtualizaBanco }

procedure TAtualizaBanco.AtualizarBanco;
var
  Versao_Atual, Versao_Banco: Integer;

begin
  Versao_Banco := GetVersaoBanco;
  Versao_Atual := Versao_Banco;
  if Versao_Banco < 1 then
  begin
    // Scripts de cria��o do banco de dados.
    Versao_Atual := 1;
  end;

  if Versao_Banco < 2 then
  begin
    ExecutaComando('ALTER TABLE GRP ADD SITUACAO_DIEF INTEGER');
    ExecutaComando('ALTER TABLE PRO ADD UNIDADE_DIEF INTEGER');
    Versao_Atual := 2;
  end;

  if Versao_Banco < 3 then
  begin
    ExecutaComando('CREATE TABLE VUD ( '+
                   ' VUD_ISN INTEGER NOT NULL, '+
                   ' UNIDADE VARCHAR(20), '+
                   ' UNIDADE_DIEF INTEGER);');

    ExecutaComando('ALTER TABLE VUD ADD CONSTRAINT PK_VUD PRIMARY KEY (VUD_ISN);');
    ExecutaComando('CREATE SEQUENCE GEN_VUD_ID;');
    ExecutaComando('create trigger vud_bi for vud active before insert position 0 as begin if (new.vud_isn is null) then new.vud_isn = gen_id(gen_vud_id,1); end ');
    ExecutaComando('create procedure sp_gen_vud_id returns (id integer) as begin id = gen_id(gen_vud_id, 1); suspend; end');
    Versao_Atual := 3;
  end;

  if Versao_Banco < 4 then
  begin
    ExecutaComando('ALTER TABLE EMP ADD UTILIZADIEF INTEGER');
    ExecutaComando('ALTER TABLE VUD ADD EMP_ISN INTEGER');
    ExecutaComando('ALTER TABLE VUD ADD CONSTRAINT FK_VUD_EMP FOREIGN KEY (emp_isn) REFERENCES EMP(EMP_ISN)');
    Versao_Atual := 4;
  end;

  if Versao_Banco < 5 then
  begin
    ExecutaComando('CREATE TABLE VSD ( '+
                   ' VSD_ISN INTEGER NOT NULL, '+
                   ' GRUPO VARCHAR(255),       '+
                   ' SITUACAODIEF INTEGER,     '+
                   ' EMP_ISN INTEGER);         ');

    ExecutaComando('ALTER TABLE VSD ADD CONSTRAINT PK_VSD PRIMARY KEY (VSD_ISN);');
    ExecutaComando('CREATE SEQUENCE GEN_VSD_ID;');
    ExecutaComando('create trigger vsd_bi for vsd active before insert position 0 as begin if (new.vsd_isn is null) then new.vsd_isn = gen_id(gen_vsd_id,1); end');
    ExecutaComando('create procedure sp_gen_vsd_id returns (id integer) as begin id = gen_id(gen_vsd_id, 1); suspend; end');
    ExecutaComando('ALTER TABLE VSD ADD CONSTRAINT FK_VSD_EMP FOREIGN KEY (EMP_ISN) REFERENCES EMP(EMP_ISN); ');
    Versao_Atual := 5;
  end;

  ExecutaComando('update dtb set versaobanco = '+ IntToStr(Versao_Atual));
end;

procedure TAtualizaBanco.CriarEstruturaDeAtualizacao;
var
  Qry: TFDQuery;
begin
  Qry := AutoQuery.NewQuery('SELECT COUNT(*) QTDE FROM RDB$RELATIONS WHERE RDB$FLAGS=1 and RDB$RELATION_NAME= '+QuotedStr('DTB'));
  Qry.Open;

  if (Qry.IsEmpty) or (Qry.Fields[0].AsInteger = 0) then
  begin
    ExecutaComando('CREATE TABLE DTB ( VERSAOBANCO INTEGER, VERSAOAPP INTEGER)');
    ExecutaComando('Insert into DTB(VERSAOBANCO, VERSAOAPP) values(1, 2) ');
  end;
end;

function TAtualizaBanco.ExecutaComando(aSql: WideString): Boolean;
begin
  try
    dmConnect.fdConn.ExecSQL(aSql);
    Result := True;
  except
    Result := False;
  end;
end;

function TAtualizaBanco.GetVersaoBanco: Integer;
var
  Qry: TFDQuery;
begin
  CriarEstruturaDeAtualizacao;
  Qry := AutoQuery.NewQuery('Select VERSAOBANCO from dtb');
  qry.Open;
  Result := Qry.Fields[0].AsInteger;
end;

end.
