object frmPreferencias: TfrmPreferencias
  Left = 0
  Top = 0
  Caption = 'Prefer'#234'ncias'
  ClientHeight = 484
  ClientWidth = 796
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object pnlConfigAGLib: TPanel
    Left = 0
    Top = 0
    Width = 796
    Height = 448
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    ExplicitHeight = 377
    object Label1: TLabel
      Left = 8
      Top = 57
      Width = 98
      Height = 13
      Caption = 'Endere'#231'o banco AG:'
    end
    object DBEdit1: TDBEdit
      Left = 8
      Top = 72
      Width = 409
      Height = 21
      DataField = 'CAMINHOBANCO'
      DataSource = dtsCFG
      TabOrder = 0
    end
    object detUsuarioAG: TDBEdit
      Left = 8
      Top = 168
      Width = 121
      Height = 21
      DataField = 'USUARIO'
      DataSource = dtsCFG
      TabOrder = 1
    end
    object detSenhaAG: TDBEdit
      Left = 135
      Top = 168
      Width = 121
      Height = 21
      DataField = 'SENHA'
      DataSource = dtsCFG
      TabOrder = 2
    end
    object DBRadioGroup1: TDBRadioGroup
      Left = 8
      Top = 104
      Width = 233
      Height = 50
      Caption = 'DBRadioGroup1'
      Columns = 2
      DataField = 'SERVIDOR'
      DataSource = dtsCFG
      Items.Strings = (
        'MS SQL Server'
        'Firebird')
      TabOrder = 3
      Values.Strings = (
        '0'
        '1')
    end
  end
  object detEmpresa: TDBEdit
    Left = 8
    Top = 22
    Width = 121
    Height = 21
    DataField = 'EMP_CODIGO'
    DataSource = dtsCFG
    TabOrder = 1
  end
  object pnlBotoes: TPanel
    Left = 0
    Top = 448
    Width = 796
    Height = 36
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 2
    object btnOk: TButton
      Left = 629
      Top = 6
      Width = 75
      Height = 25
      Caption = 'Ok'
      TabOrder = 0
      OnClick = btnOkClick
    end
    object btnCancelar: TButton
      Left = 710
      Top = 6
      Width = 75
      Height = 25
      Caption = 'Cancelar'
      TabOrder = 1
      OnClick = btnCancelarClick
    end
  end
  object dtsCFG: TDataSource
    DataSet = qryCFG
    Left = 392
    Top = 208
  end
  object qryCFG: TFDQuery
    Connection = dmConnect.fdConn
    SQL.Strings = (
      'select * from cfg')
    Left = 416
    Top = 160
  end
end
