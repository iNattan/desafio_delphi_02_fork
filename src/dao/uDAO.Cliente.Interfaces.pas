unit uDAO.Cliente.Interfaces;

interface

uses
  uModel.Cliente.Interfaces, Data.DB;

type

  iClienteDAO = interface
    function Inserir(Cliente: iCliente): Boolean;
    function Atualizar(Cliente: iCliente): Boolean;
    function Deletar(Id: Integer): Boolean;
    function Listar(DataSource: TDataSource): Boolean;
    function BuscarPorId(Id: Integer): iCliente;
  end;

implementation

end.
