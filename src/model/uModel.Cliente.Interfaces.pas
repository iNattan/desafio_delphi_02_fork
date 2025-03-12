unit uModel.Cliente.Interfaces;

interface

type

  iCliente = interface
    function Id(Value: Integer): iCliente; overload;
    function Id: Integer; overload;
    function Nome(Value: String): iCliente; overload;
    function Nome: String; overload;
    function CPF(Value: String): iCliente; overload;
    function CPF: String; overload;
    function Excluido(Value: String): iCliente; overload;
    function Excluido: String; overload;
  end;

implementation

end.
