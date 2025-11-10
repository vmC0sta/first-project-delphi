object FORM_CONTATOS: TFORM_CONTATOS
  Left = 0
  Top = 0
  Caption = 'GEST'#195'O DE CONTATOS'
  ClientHeight = 691
  ClientWidth = 982
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Touch.ParentTabletOptions = False
  Touch.TabletOptions = [toPressAndHold]
  OnCreate = FormCreate
  TextHeight = 15
  object lbl_ID: TLabel
    Left = 32
    Top = 52
    Width = 18
    Height = 25
    Caption = 'ID'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object lbl_NOME: TLabel
    Left = 32
    Top = 95
    Width = 55
    Height = 25
    Caption = 'NOME'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object lbl_TELEFONE: TLabel
    Left = 30
    Top = 133
    Width = 86
    Height = 25
    Caption = 'TELEFONE'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object lbl_EMAIL: TLabel
    Left = 32
    Top = 173
    Width = 61
    Height = 25
    Caption = 'E-MAIL'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object lbl_OBS: TLabel
    Left = 32
    Top = 206
    Width = 39
    Height = 25
    Caption = 'OBS.'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object status: TLabel
    Left = 26
    Top = 8
    Width = 143
    Height = 15
    Caption = 'STATUS BANCO DE DADOS'
  end
  object txt_ID: TEdit
    Left = 129
    Top = 44
    Width = 48
    Height = 33
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
  end
  object txt_NOME: TEdit
    Left = 129
    Top = 87
    Width = 300
    Height = 33
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
  end
  object txt_TELEFONE: TEdit
    Left = 129
    Top = 125
    Width = 300
    Height = 33
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
  end
  object txt_EMAIL: TEdit
    Left = 129
    Top = 165
    Width = 300
    Height = 33
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
  end
  object txt_OBS: TMemo
    Left = 129
    Top = 224
    Width = 300
    Height = 177
    Enabled = False
    Lines.Strings = (
      'txt_OBS')
    TabOrder = 4
  end
  object BtnNovo: TButton
    Left = 220
    Top = 423
    Width = 85
    Height = 30
    Caption = 'NOVO'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 5
    OnClick = BtnNovoClick
  end
  object BtnSalvar: TButton
    Left = 312
    Top = 423
    Width = 85
    Height = 30
    Caption = 'SALVAR'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 6
    OnClick = BtnSalvarClick
  end
  object btnPos: TButton
    Left = 542
    Top = 423
    Width = 40
    Height = 30
    Caption = '>'
    TabOrder = 7
    OnClick = btnPosClick
  end
  object btnAnt: TButton
    Left = 496
    Top = 423
    Width = 40
    Height = 30
    Caption = '<'
    TabOrder = 8
    OnClick = btnAntClick
  end
  object btnExcluir: TButton
    Left = 128
    Top = 423
    Width = 85
    Height = 30
    Caption = 'EXCLUIR'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 9
    OnClick = BtnExcluirClick
  end
  object btnAlterar: TButton
    Left = 37
    Top = 423
    Width = 85
    Height = 30
    Caption = 'ALTERAR'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 10
    OnClick = BtnAlterarClick
  end
  object btnCancelar: TButton
    Left = 405
    Top = 423
    Width = 85
    Height = 30
    Caption = 'CANCELAR'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 11
    OnClick = BtnCancelarClick
  end
  object txt_PROCURA: TEdit
    Left = 488
    Top = 40
    Width = 121
    Height = 23
    TabOrder = 12
  end
  object btnProcura: TButton
    Left = 615
    Top = 40
    Width = 75
    Height = 23
    Caption = 'PROCURAR'
    TabOrder = 13
    OnClick = btnProcuraClick
  end
  object FDConnection1: TFDConnection
    Params.Strings = (
      
        'Database=C:\Users\Usuario\Documents\Embarcadero\Studio\Projects\' +
        'Win32\Debug\assets\contatos.mdb'
      'DriverID=MSAcc')
    LoginPrompt = False
    Left = 928
    Top = 24
  end
  object FDContatos: TFDTable
    BeforePost = FDContatosBeforePost
    Connection = FDConnection1
    Left = 928
    Top = 152
  end
  object DataSource1: TDataSource
    DataSet = FDContatos
    Left = 928
    Top = 88
  end
end
