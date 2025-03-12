unit uConexao.Firedac;

interface

uses
  uConexao.Interfaces,
  Data.DB, FireDAC.Comp.Client, FireDAC.Phys.FB,
  FireDAC.Phys.FBDef;

type
  TModelConexaoFiredac = class(TInterfacedObject, iConexao)
  private
    FConexao: TFDConnection;
  public
    constructor Create;
    class function New: iConexao;
    function Connection: TCustomConnection;
  end;

implementation

uses
  System.SysUtils;

function TModelConexaoFiredac.Connection: TCustomConnection;
begin
  Result := FConexao;
end;

constructor TModelConexaoFiredac.Create;
var
  ExecutablePath, ParentPath: string;
begin
  ExecutablePath := ExtractFilePath(ParamStr(0));
  ParentPath := ExcludeTrailingPathDelimiter(ExecutablePath);
  ParentPath := ExtractFilePath(ParentPath);

  FConexao := TFDConnection.Create(nil);
  FConexao.DriverName := 'FB';
  FConexao.Params.Database := ParentPath + 'data\DATABASE.FDB';
  FConexao.Params.UserName := 'SYSDBA';
  FConexao.Params.Password := 'masterkey';
  FConexao.Connected := True;
end;

class function TModelConexaoFiredac.New: iConexao;
begin
  Result := Self.Create;
end;

end.

