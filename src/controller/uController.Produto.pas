unit uController.Produto;

interface

uses
  uModel.Produto.Interfaces, uDAO.Produto.Interfaces, uDAO.Produto,
  uController.Produto.Interfaces, Data.DB;

type
  TProdutoController = class (TInterfacedObject, iProdutoController)
  private
    FProduto: iProduto;
    FProdutoDAO: iProdutoDAO;
  public
    constructor Create;
    destructor Destroy; override;
    class function New: iProdutoController;
    function NovoProduto: iProduto;
    function Inserir: Boolean;
    function Atualizar: Boolean;
    function Deletar(Id: Integer): Boolean;
    function Listar(DataSource: TDataSource): Boolean;
    function BuscarPorId(Id: Integer): iProduto;
  end;

implementation

uses
  uModel.Produto, System.SysUtils;

constructor TProdutoController.Create;
begin
  FProduto := TModelProduto.New;
  FProdutoDAO := TProdutoDAO.New;
end;

destructor TProdutoController.Destroy;
begin
  inherited;
end;

class function TProdutoController.New: iProdutoController;
begin
  Result := Self.Create;
end;

function TProdutoController.NovoProduto: iProduto;
begin
  Result := FProduto;
end;

function TProdutoController.Inserir: Boolean;
begin
  Result := FProdutoDAO.Inserir(FProduto);
end;

function TProdutoController.Atualizar: Boolean;
begin
  Result := FProdutoDAO.Atualizar(FProduto);
end;

function TProdutoController.Deletar(Id: Integer): Boolean;
begin
  Result := FProdutoDAO.Deletar(Id);
end;

function TProdutoController.Listar(DataSource: TDataSource): Boolean;
begin
  Result := FProdutoDAO.Listar(DataSource);
end;

function TProdutoController.BuscarPorId(Id: Integer): iProduto;
begin
  Result := FProdutoDAO.BuscarPorId(Id);
end;

end.

