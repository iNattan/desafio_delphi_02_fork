inherited frmViewTecnicoAgricolaPesquisa: TfrmViewTecnicoAgricolaPesquisa
  Caption = 'Consulta de T'#233'cnicos(as) Agr'#237'colas'
  StyleElements = [seFont, seClient, seBorder]
  OnCreate = FormCreate
  TextHeight = 15
  inherited Pnl_Superior: TPanel
    StyleElements = [seFont, seClient, seBorder]
    inherited Lbl_Titulo: TLabel
      Width = 452
      Caption = 'Consulta de T'#233'cnicos(as) Agr'#237'colas'
      StyleElements = [seFont, seClient, seBorder]
      ExplicitWidth = 262
    end
  end
  inherited Pnl_Inferior: TPanel
    StyleElements = [seFont, seClient, seBorder]
  end
  inherited Pnl_Central: TPanel
    StyleElements = [seFont, seClient, seBorder]
  end
end
