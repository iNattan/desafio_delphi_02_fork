unit uModel.PedidoVenda.Interfaces;

interface

type

  iPedidoVenda = interface
    function Id(Value: Integer): iPedidoVenda; overload;
    function Id: Integer; overload;
    function DataPedido(Value: TDateTime): iPedidoVenda; overload;
    function DataPedido: TDateTime; overload;
    function Status(Value: Integer): iPedidoVenda; overload;
    function Status: Integer; overload;
    function IdCliente(Value: Integer): iPedidoVenda; overload;
    function IdCliente: Integer; overload;
    function IdTecnicoResponsavel(Value: Integer): iPedidoVenda; overload;
    function IdTecnicoResponsavel: Integer; overload;
    function ValorTotal(Value: Currency): iPedidoVenda; overload;
    function ValorTotal: Currency; overload;
    function Excluido(Value: String): iPedidoVenda; overload;
    function Excluido: String; overload;
  end;

implementation

end.
