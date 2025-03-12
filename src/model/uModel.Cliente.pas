unit uModel.Cliente;

interface

uses
  uModel.Cliente.Interfaces;

type

  TModelCliente = class (TInterfacedObject, iCliente)
  private
    FId: Integer;
    FNome: String;
    FCPF: String;
    FExcluido: String;

    function Id(Value: Integer): iCliente; overload;
    function Id: Integer; overload;
    function Nome(Value: String): iCliente; overload;
    function Nome: String; overload;
    function CPF(Value: String): iCliente; overload;
    function CPF: String; overload;
    function Excluido(Value: String): iCliente; overload;
    function Excluido: String; overload;
  public
    class function New: iCliente;
  end;

implementation

function TModelCliente.Id(Value: Integer): iCliente;
begin
  Result := Self;
  FId := Value;
end;

function TModelCliente.Id: Integer;
begin
  Result := FId;
end;

function TModelCliente.Nome(Value: String): iCliente;
begin
  Result := Self;
  FNome := Value;
end;

function TModelCliente.Nome: String;
begin
  Result := FNome;
end;

function TModelCliente.CPF(Value: String): iCliente;
begin
  Result := Self;
  FCPF := Value;
end;

function TModelCliente.CPF: String;
begin
  Result := FCPF;
end;

function TModelCliente.Excluido(Value: string): iCliente;
begin
  Result := Self;
  FExcluido := Value;
end;

function TModelCliente.Excluido: string;
begin
  Result := FExcluido;
end;

class function TModelCliente.New: iCliente;
begin
  Result := Self.Create;
end;

end.
