unit uModel.PedidoVenda;

interface

uses
  uModel.PedidoVenda.Interfaces;

type

  TModelPedidoVenda = class (TInterfacedObject, iPedidoVenda)
  private
    FId: Integer;
    FDataPedido: TDateTime;
    FStatus: Integer;
    FIdCliente: Integer;
    FIdTecnicoResponsavel: Integer;
    FValorTotal: Currency;
    FExcluido: String;

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
  public
    class function New: iPedidoVenda;
  end;

implementation

function TModelPedidoVenda.Id(Value: Integer): iPedidoVenda;
begin
  Result := Self;
  FId := Value;
end;

function TModelPedidoVenda.Id: Integer;
begin
  Result := FId;
end;

function TModelPedidoVenda.DataPedido(Value: TDateTime): iPedidoVenda;
begin
  Result := Self;
  FDataPedido := Value;
end;

function TModelPedidoVenda.DataPedido: TDateTime;
begin
  Result := FDataPedido;
end;

function TModelPedidoVenda.Status(Value: Integer): iPedidoVenda;
begin
  Result := Self;
  FStatus := Value;
end;

function TModelPedidoVenda.Status: Integer;
begin
  Result := FStatus;
end;

function TModelPedidoVenda.IdCliente(Value: Integer): iPedidoVenda;
begin
  Result := Self;
  FIdCliente := Value;
end;

function TModelPedidoVenda.IdCliente: Integer;
begin
  Result := FIdCliente;
end;

function TModelPedidoVenda.IdTecnicoResponsavel(Value: Integer): iPedidoVenda;
begin
  Result := Self;
  FIdTecnicoResponsavel := Value;
end;

function TModelPedidoVenda.IdTecnicoResponsavel: Integer;
begin
  Result := FIdTecnicoResponsavel;
end;

function TModelPedidoVenda.ValorTotal(Value: Currency): iPedidoVenda;
begin
  Result := Self;
  FValorTotal := Value;
end;

function TModelPedidoVenda.ValorTotal: Currency;
begin
  Result := FValorTotal;
end;

function TModelPedidoVenda.Excluido(Value: string): iPedidoVenda;
begin
  Result := Self;
  FExcluido := Value;
end;

function TModelPedidoVenda.Excluido: string;
begin
  Result := FExcluido;
end;

class function TModelPedidoVenda.New: iPedidoVenda;
begin
  Result := Self.Create;
end;

end.
