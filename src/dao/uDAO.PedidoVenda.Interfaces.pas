unit uDAO.PedidoVenda.Interfaces;

interface

uses
  uModel.PedidoVenda.Interfaces, Data.DB;

type

  iPedidoVendaDAO = interface
    function Inserir(PedidoVenda: iPedidoVenda): Integer;
    function Listar(DataSource: TDataSource): Boolean;
    function ListarPedidosAguardandoReceita(DataSource: TDataSource; Filtro: String): Boolean;
    function BuscarPorId(Id: Integer): iPedidoVenda;
    function Assinar(Id, IdTecnico: Integer): Boolean;
  end;

implementation

end.
