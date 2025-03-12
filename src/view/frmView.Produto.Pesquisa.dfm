inherited frmViewProdutoPesquisa: TfrmViewProdutoPesquisa
  Caption = 'Consulta de Produtos'
  StyleElements = [seFont, seClient, seBorder]
  OnCreate = FormCreate
  TextHeight = 15
  inherited Pnl_Superior: TPanel
    StyleElements = [seFont, seClient, seBorder]
    inherited Lbl_Titulo: TLabel
      Width = 452
      Caption = 'Consulta de Produtos'
      StyleElements = [seFont, seClient, seBorder]
      ExplicitWidth = 163
    end
  end
  inherited Pnl_Inferior: TPanel
    StyleElements = [seFont, seClient, seBorder]
  end
  inherited Pnl_Central: TPanel
    StyleElements = [seFont, seClient, seBorder]
  end
end
