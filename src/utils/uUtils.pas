unit uUtils;

interface

uses
  System.SysUtils;

  function FormatarMoeda(const ValorStr: string): string;
  function StringParaMoeda(const ValorStr: string): Currency;
  procedure ApenasNumerosComPonto(Sender: TObject; var Key: Char);

implementation

function FormatarMoeda(const ValorStr: string): string;
var
  Valor: Currency;
begin
  if TryStrToCurr(ValorStr, Valor) then
    Result := FormatCurr('#,##0.00', Valor)
  else
    Result := '0,00';
end;

function StringParaMoeda(const ValorStr: string): Currency;
var
  ValorSemPontos: string;
begin
  ValorSemPontos := StringReplace(ValorStr, '.', '', [rfReplaceAll]);
  Result := StrToCurr(ValorSemPontos);
end;

procedure ApenasNumerosComPonto(Sender: TObject; var Key: Char);
begin
  if Key in ['0'..'9', #8, #13, ','] then
    Exit
  else if Key = '.' then
    Key := ','
  else
    Key := #0;
end;

end.
