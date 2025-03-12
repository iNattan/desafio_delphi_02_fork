unit frmView.TecnicoAgricola.Pesquisa;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, frmView.TelaPadrao.Pesquisa, Data.DB,
  Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TfrmViewTecnicoAgricolaPesquisa = class(TfrmViewTelaPadraoPesquisa)
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmViewTecnicoAgricolaPesquisa: TfrmViewTecnicoAgricolaPesquisa;

implementation

uses
  uController.TecnicoAgricola.Interfaces, uController.TecnicoAgricola;

{$R *.dfm}

procedure TfrmViewTecnicoAgricolaPesquisa.FormCreate(Sender: TObject);
var
  TecnicoAgricolaController: iTecnicoAgricolaController;
begin
  inherited;
  TecnicoAgricolaController := TTecnicoAgricolaController.New;
  TecnicoAgricolaController.Listar(DataSource_Padrao);
end;

end.
