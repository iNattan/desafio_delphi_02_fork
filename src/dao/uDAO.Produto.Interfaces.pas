unit uDAO.Produto.Interfaces;

interface

uses
  uModel.Produto.Interfaces, Data.DB;

type

  iProdutoDAO = interface
    function Inserir(Produto: iProduto): Boolean;
    function Atualizar(Produto: iProduto): Boolean;
    function Deletar(Id: Integer): Boolean;
    function Listar(DataSource: TDataSource): Boolean;
    function BuscarPorId(Id: Integer): iProduto;
  end;

implementation

end.
