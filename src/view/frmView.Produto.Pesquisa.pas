unit frmView.Produto.Pesquisa;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, frmView.TelaPadrao.Pesquisa, Data.DB,
  Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TfrmViewProdutoPesquisa = class(TfrmViewTelaPadraoPesquisa)
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmViewProdutoPesquisa: TfrmViewProdutoPesquisa;

implementation

uses
  uController.Produto.Interfaces, uController.Produto;

{$R *.dfm}

procedure TfrmViewProdutoPesquisa.FormCreate(Sender: TObject);
var
  ProdutoController: iProdutoController;
begin
  inherited;
  ProdutoController := TProdutoController.New;
  ProdutoController.Listar(DataSource_Padrao);
end;

end.
