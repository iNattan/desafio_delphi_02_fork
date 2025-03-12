unit uModel.Produto;

interface

uses
  uModel.Produto.Interfaces;

type

  TModelProduto = class (TInterfacedObject, iProduto)
  private
    FId: Integer;
    FNome: String;
    FValor: Currency;
    FControleEspecial: String;
    FExcluido: String;

    function Id(Value: Integer): iProduto; overload;
    function Id: Integer; overload;
    function Nome(Value: String): iProduto; overload;
    function Nome: String; overload;
    function Valor(Value: Currency): iProduto; overload;
    function Valor: Currency; overload;
    function ControleEspecial(Value: String): iProduto; overload;
    function ControleEspecial: String; overload;
    function Excluido(Value: String): iProduto; overload;
    function Excluido: String; overload;
  public
    class function New: iProduto;
  end;

implementation

function TModelProduto.Id(Value: Integer): iProduto;
begin
  Result := Self;
  FId := Value;
end;

function TModelProduto.Id: Integer;
begin
  Result := FId;
end;

function TModelProduto.Nome(Value: String): iProduto;
begin
  Result := Self;
  FNome := Value;
end;

function TModelProduto.Nome: String;
begin
  Result := FNome;
end;

function TModelProduto.Valor(Value: Currency): iProduto;
begin
  Result := Self;
  FValor := Value;
end;

function TModelProduto.Valor: Currency;
begin
  Result := FValor;
end;

function TModelProduto.ControleEspecial(Value: String): iProduto;
begin
  Result := Self;
  FControleEspecial := Value;
end;

function TModelProduto.ControleEspecial: String;
begin
  Result := FControleEspecial;
end;

function TModelProduto.Excluido(Value: string): iProduto;
begin
  Result := Self;
  FExcluido := Value;
end;

function TModelProduto.Excluido: string;
begin
  Result := FExcluido;
end;

class function TModelProduto.New: iProduto;
begin
  Result := Self.Create;
end;

end.
