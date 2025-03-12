unit uModel.TecnicoAgricola.Interfaces;

interface

type

  iTecnicoAgricola = interface
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
  end;

implementation

end.
