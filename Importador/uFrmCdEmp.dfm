inherited frmCdEmp: TfrmCdEmp
  Caption = 'Cadastro de Empresas'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pgCrud: TPageControl
    ActivePage = tsCad
    inherited tsCad: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 609
      ExplicitHeight = 259
      inherited lblCodigo: TLabel
        Width = 37
        Caption = 'C'#243'digo:'
        ExplicitWidth = 37
      end
      object lblNome: TLabel [1]
        Left = 55
        Top = 7
        Width = 31
        Height = 13
        Caption = 'Nome:'
      end
      inherited edtID: TDBEdit
        DataField = 'CODIGO'
      end
      object edtNome: TDBEdit
        Left = 55
        Top = 22
        Width = 311
        Height = 21
        DataField = 'NOME'
        DataSource = dsDados
        TabOrder = 1
      end
    end
  end
  inherited qryMain: TFDQuery
    Connection = dmConnect.fdConn
    SQL.Strings = (
      'SELECT * FROM EMP')
    Left = 552
    Top = 288
    object qryMainCODIGO: TStringField
      FieldName = 'CODIGO'
      Size = 4
    end
    object qryMainNOME: TStringField
      FieldName = 'NOME'
      Size = 100
    end
  end
  inherited dsDados: TDataSource
    Left = 552
    Top = 240
  end
end