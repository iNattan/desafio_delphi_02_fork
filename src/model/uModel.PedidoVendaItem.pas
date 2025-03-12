unit uModel.PedidoVendaItem;

interface

uses
  uModel.PedidoVendaItem.Interfaces;

type

  TModelPedidoVendaItem = class (TInterfacedObject, iPedidoVendaItem)
  private
    FId: Integer;
    FIdPedidoVenda: Integer;
    FIdProduto: Integer;
    FQuantidade: Currency;
    FValorUnitario: Currency;
    FValorTotal: Currency;

    function Id(Value: Integer): iPedidoVendaItem; overload;
    function Id: Integer; overload;
    function IdPedidoVenda(Value: Integer): iPedidoVendaItem; overload;
    function IdPedidoVenda: Integer; overload;
    function IdProduto(Value: Integer): iPedidoVendaItem; overload;
    function IdProduto: Integer; overload;
    function Quantidade(Value: Currency): iPedidoVendaItem; overload;
    function Quantidade: Currency; overload;
    function ValorUnitario(Value: Currency): iPedidoVendaItem; overload;
    function ValorUnitario: Currency; overload;
    function ValorTotal(Value: Currency): iPedidoVendaItem; overload;
    function ValorTotal: Currency; overload;
  public
    class function New: iPedidoVendaItem;
  end;

implementation

function TModelPedidoVendaItem.Id(Value: Integer): iPedidoVendaItem;
begin
  Result := Self;
  FId := Value;
end;

function TModelPedidoVendaItem.Id: Integer;
begin
  Result := FId;
end;

function TModelPedidoVendaItem.IdPedidoVenda(Value: Integer): iPedidoVendaItem;
begin
  Result := Self;
  FIdPedidoVenda := Value;
end;

function TModelPedidoVendaItem.IdPedidoVenda: Integer;
begin
  Result := FIdPedidoVenda;
end;

function TModelPedidoVendaItem.IdProduto(Value: Integer): iPedidoVendaItem;
begin
  Result := Self;
  FIdProduto := Value;
end;

function TModelPedidoVendaItem.IdProduto: Integer;
begin
  Result := FIdProduto;
end;

function TModelPedidoVendaItem.Quantidade(Value: Currency): iPedidoVendaItem;
begin
  Result := Self;
  FQuantidade := Value;
end;

function TModelPedidoVendaItem.Quantidade: Currency;
begin
  Result := FQuantidade;
end;

function TModelPedidoVendaItem.ValorUnitario(Value: Currency): iPedidoVendaItem;
begin
  Result := Self;
  FValorUnitario := Value;
end;

function TModelPedidoVendaItem.ValorUnitario: Currency;
begin
  Result := FValorUnitario;
end;

function TModelPedidoVendaItem.ValorTotal(Value: Currency): iPedidoVendaItem;
begin
  Result := Self;
  FValorTotal := Value;
end;

function TModelPedidoVendaItem.ValorTotal: Currency;
begin
  Result := FValorTotal;
end;

class function TModelPedidoVendaItem.New: iPedidoVendaItem;
begin
  Result := Self.Create;
end;

end.
