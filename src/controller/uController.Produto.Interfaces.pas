unit uController.Produto.Interfaces;

interface

uses
  uModel.Produto.Interfaces, Data.DB;

type
  iProdutoController = interface
    function NovoProduto: iProduto;
    function Inserir: Boolean;
    function Atualizar: Boolean;
    function Deletar(Id: Integer): Boolean;
    function Listar(DataSource: TDataSource): Boolean;
    function BuscarPorId(Id: Integer): iProduto;
  end;

implementation

end.

