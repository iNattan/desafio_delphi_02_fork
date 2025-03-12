unit uController.PedidoVenda.Interfaces;

interface

uses
  uDTO.PedidoVenda.Interfaces, Data.DB;

type
  iPedidoVendaController = interface
    function NovoPedidoVenda: iDTOPedidoVenda;
    function Inserir: Boolean;
    function Listar(DataSource: TDataSource): Boolean;
    function ListarPedidosAguardandoReceita(DataSource: TDataSource;
      Filtro: String): Boolean;
    function BuscarPorId(Id: Integer): iDTOPedidoVenda;
    procedure ValidaStatusPedido;
    function Assinar(Id, IdTecnico: Integer): Boolean;
  end;

implementation

end.

