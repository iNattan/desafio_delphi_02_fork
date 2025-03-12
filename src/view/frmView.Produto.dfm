inherited frmViewProduto: TfrmViewProduto
  Caption = 'Cadastro de Produtos'
  ClientHeight = 277
  StyleElements = [seFont, seClient, seBorder]
  OnCreate = FormCreate
  ExplicitHeight = 316
  TextHeight = 15
  inherited Pnl_Superior: TPanel
    StyleElements = [seFont, seClient, seBorder]
    inherited Lbl_Titulo: TLabel
      Width = 523
      Caption = 'Cadastro de Produtos'
      StyleElements = [seFont, seClient, seBorder]
      ExplicitWidth = 163
    end
  end
  inherited Pnl_Inferior: TPanel
    Top = 228
    StyleElements = [seFont, seClient, seBorder]
    ExplicitTop = 228
    inherited Btn_Inserir: TButton
      OnClick = Btn_InserirClick
    end
    inherited Btn_Editar: TButton
      OnClick = Btn_EditarClick
    end
    inherited Btn_Deletar: TButton
      OnClick = Btn_DeletarClick
    end
    inherited Btn_Gravar: TButton
      OnClick = Btn_GravarClick
    end
    inherited Btn_Limpar: TButton
      OnClick = Btn_LimparClick
    end
    inherited Btn_Consultar: TButton
      OnClick = Btn_ConsultarClick
    end
  end
  inherited Pnl_Central: TPanel
    Height = 185
    StyleElements = [seFont, seClient, seBorder]
    ExplicitHeight = 185
    object Lbl_ID: TLabel
      Left = 11
      Top = 16
      Width = 11
      Height = 15
      Caption = 'ID'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object Lbl_Nome: TLabel
      Left = 11
      Top = 64
      Width = 41
      Height = 15
      Caption = 'Nome *'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object Lbl_Valor: TLabel
      Left = 11
      Top = 123
      Width = 34
      Height = 15
      Caption = 'Valor *'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object Edt_ID: TEdit
      Left = 11
      Top = 34
      Width = 70
      Height = 23
      Enabled = False
      NumbersOnly = True
      TabOrder = 0
    end
    object Edt_Nome: TEdit
      Left = 11
      Top = 85
      Width = 519
      Height = 23
      CharCase = ecUpperCase
      MaxLength = 100
      TabOrder = 1
    end
    object CheckBox_Controle_Especial: TCheckBox
      Left = 416
      Top = 123
      Width = 114
      Height = 44
      Caption = 'Controle Especial'
      TabOrder = 3
    end
    object Edt_Valor: TEdit
      Left = 11
      Top = 144
      Width = 160
      Height = 23
      TabOrder = 2
      OnExit = Edt_ValorExit
      OnKeyPress = Edt_ValorKeyPress
    end
  end
end
