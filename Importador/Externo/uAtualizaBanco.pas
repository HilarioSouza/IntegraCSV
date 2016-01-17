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
    ExecutaComando('CREATE TABLE CFG ( '+
    'EMP_CODIGO  VARCHAR(4) NOT NULL,  '+
    'ID          INTEGER NOT NULL,     '+
    'CONFIG      VARCHAR(30),          '+
    'VALOR       VARCHAR(100),         '+
    'TIPO        VARCHAR(1));          ');

    ExecutaComando(' CREATE TABLE EMP (           '+
                   ' CODIGO  VARCHAR(4) NOT NULL, '+
                   ' NOME    VARCHAR(50));        ');

    ExecutaComando(' CREATE TABLE IMP (               '+
                   ' EMP_CODIGO  VARCHAR(4) NOT NULL, '+
                   ' ID          INTEGER NOT NULL,    '+
                   ' DATA        DATE);               ');

    ExecutaComando(' CREATE TABLE REG (               '+
                   ' EMP_CODIGO  VARCHAR(4) NOT NULL, '+
                   ' ID          INTEGER NOT NULL);   ');

    ExecutaComando(' ALTER TABLE CFG ADD CONSTRAINT PK_CFG PRIMARY KEY (EMP_CODIGO, ID);');
    ExecutaComando(' ALTER TABLE EMP ADD CONSTRAINT PK_EMP PRIMARY KEY (CODIGO);');
    ExecutaComando(' ALTER TABLE IMP ADD CONSTRAINT PK_IMP PRIMARY KEY (EMP_CODIGO, ID);');
    ExecutaComando(' ALTER TABLE IMP ADD CONSTRAINT FK_IMP_EMP FOREIGN KEY (EMP_CODIGO) REFERENCES EMP(CODIGO);');
    ExecutaComando(' ALTER TABLE REG ADD CONSTRAINT PK_REG PRIMARY KEY (EMP_CODIGO, ID);');
    ExecutaComando(' ALTER TABLE REG ADD CONSTRAINT FK_REG_EMP FOREIGN KEY (EMP_CODIGO) REFERENCES EMP(CODIGO);');
    Versao_Atual := 1;
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
