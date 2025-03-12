unit uController.Cliente;

interface

uses
  uModel.Cliente.Interfaces, uDAO.Cliente.Interfaces, uDAO.Cliente,
  uController.Cliente.Interfaces, Data.DB;

type
  TClienteController = class (TInterfacedObject, iClienteController)
  private
    FCliente: iCliente;
    FClienteDAO: iClienteDAO;
  public
    constructor Create;
    destructor Destroy; override;
    class function New: iClienteController;
    function NovoCliente: iCliente;
    function Inserir: Boolean;
    function Atualizar: Boolean;
    function Deletar(Id: Integer): Boolean;
    function Listar(DataSource: TDataSource): Boolean;
    function BuscarPorId(Id: Integer): iCliente;
    procedure ValidaCPF(CPF: String);
  end;

implementation

uses
  uModel.Cliente, System.SysUtils;

constructor TClienteController.Create;
begin
  FCliente := TModelCliente.New;
  FClienteDAO := TClienteDAO.New;
end;

destructor TClienteController.Destroy;
begin
  inherited;
end;

class function TClienteController.New: iClienteController;
begin
  Result := Self.Create;
end;

function TClienteController.NovoCliente: iCliente;
begin
  Result := FCliente;
end;

function TClienteController.Inserir: Boolean;
begin
  ValidaCPF(FCliente.CPF);

  Result := FClienteDAO.Inserir(FCliente);
end;

function TClienteController.Atualizar: Boolean;
begin
  Result := FClienteDAO.Atualizar(FCliente);
end;

function TClienteController.Deletar(Id: Integer): Boolean;
begin
  Result := FClienteDAO.Deletar(Id);
end;

function TClienteController.Listar(DataSource: TDataSource): Boolean;
begin
  Result := FClienteDAO.Listar(DataSource);
end;

function TClienteController.BuscarPorId(Id: Integer): iCliente;
begin
  Result := FClienteDAO.BuscarPorId(Id);
end;

procedure TClienteController.ValidaCPF(CPF: string);
begin
  if Length(CPF) <> 11 then
    raise Exception.Create('CPF inválido! Deve ter 11 dígitos.');
end;

end.

