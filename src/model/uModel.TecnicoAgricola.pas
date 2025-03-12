unit uModel.TecnicoAgricola;

interface

uses
  uModel.TecnicoAgricola.Interfaces;

type

  TModelTecnicoAgricola = class (TInterfacedObject, iTecnicoAgricola)
  private
    FId: Integer;
    FNome: String;
    FCPF: String;
    FNumeroRegistro: String;
    FExcluido: string;

    function Id(Value: Integer): iTecnicoAgricola; overload;
    function Id: Integer; overload;
    function Nome(Value: String): iTecnicoAgricola; overload;
    function Nome: String; overload;
    function CPF(Value: String): iTecnicoAgricola; overload;
    function CPF: String; overload;
    function NumeroRegistro(Value: String): iTecnicoAgricola; overload;
    function NumeroRegistro: String; overload;
    function Excluido(Value: String): iTecnicoAgricola; overload;
    function Excluido: String; overload;
  public
    class function New: iTecnicoAgricola;
  end;

implementation

function TModelTecnicoAgricola.Id(Value: Integer): iTecnicoAgricola;
begin
  Result := Self;
  FId := Value;
end;

function TModelTecnicoAgricola.Id: Integer;
begin
  Result := FId;
end;

function TModelTecnicoAgricola.Nome(Value: String): iTecnicoAgricola;
begin
  Result := Self;
  FNome := Value;
end;

function TModelTecnicoAgricola.Nome: String;
begin
  Result := FNome;
end;

function TModelTecnicoAgricola.CPF(Value: String): iTecnicoAgricola;
begin
  Result := Self;
  FCPF := Value;
end;

function TModelTecnicoAgricola.CPF: String;
begin
  Result := FCPF;
end;

function TModelTecnicoAgricola.NumeroRegistro(Value: String): iTecnicoAgricola;
begin
  Result := Self;
  FNumeroRegistro := Value;
end;

function TModelTecnicoAgricola.NumeroRegistro: String;
begin
  Result := FNumeroRegistro;
end;

function TModelTecnicoAgricola.Excluido(Value: string): iTecnicoAgricola;
begin
  Result := Self;
  FExcluido := Value;
end;

function TModelTecnicoAgricola.Excluido: string;
begin
  Result := FExcluido;
end;

class function TModelTecnicoAgricola.New: iTecnicoAgricola;
begin
  Result := Self.Create;
end;

end.
