unit uController.Cliente.Interfaces;

interface

uses
  uModel.Cliente.Interfaces, Data.DB;

type
  iClienteController = interface
    function NovoCliente: iCliente;
    function Inserir: Boolean;
    function Atualizar: Boolean;
    function Deletar(Id: Integer): Boolean;
    function Listar(DataSource: TDataSource): Boolean;
    function BuscarPorId(Id: Integer): iCliente;
    procedure ValidaCPF(CPF: String);
  end;

implementation

end.

