unit uModel.Produto.Interfaces;

interface

type

  iProduto = interface
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
  end;

implementation

end.
