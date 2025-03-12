unit frmView.TelaPadrao.Cadastro;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls;

type
  TAcao = (aInserir, aEditar);

  TfrmViewTelaPadraoCadastro = class(TForm)
    Pnl_Superior: TPanel;
    Pnl_Inferior: TPanel;
    Pnl_Central: TPanel;
    Lbl_Titulo: TLabel;
    Btn_Inserir: TButton;
    Btn_Editar: TButton;
    Btn_Deletar: TButton;
    Btn_Gravar: TButton;
    Btn_Limpar: TButton;
    Btn_Consultar: TButton;
  private
    { Private declarations }
    FAcao: TAcao;
  public
    { Public declarations }
    procedure SetAcao(Acao: TAcao);
    function GetAcao: TAcao;
    procedure HabilitaEdicao(bHabilita: Boolean);
    procedure HabilitaBotoesEnquantoEdita(bHabilita: Boolean);
    procedure HabilitaBotoesEnquantoConsulta(bHabilita: Boolean);
  end;

var
  frmViewTelaPadraoCadastro: TfrmViewTelaPadraoCadastro;

implementation

procedure TfrmViewTelaPadraoCadastro.SetAcao(Acao: TAcao);
begin
  FAcao := Acao;
end;

function TfrmViewTelaPadraoCadastro.GetAcao: TAcao;
begin
  Result := FAcao;
end;

procedure TfrmViewTelaPadraoCadastro.HabilitaEdicao(bHabilita: Boolean);
begin
  Pnl_Central.Enabled := bHabilita;
end;

procedure TfrmViewTelaPadraoCadastro.HabilitaBotoesEnquantoEdita(bHabilita: Boolean);
begin
  Btn_Limpar.Enabled := bHabilita;
  Btn_Gravar.Enabled := bHabilita;

  Btn_Consultar.Enabled := not(bHabilita);
  Btn_Inserir.Enabled := not(bHabilita);
end;

procedure TfrmViewTelaPadraoCadastro.HabilitaBotoesEnquantoConsulta(bHabilita: Boolean);
begin
  Btn_Editar.Enabled := bHabilita;
  Btn_Deletar.Enabled := bHabilita;
  Btn_Limpar.Enabled := bHabilita;

  Btn_Consultar.Enabled := not(bHabilita);
  Btn_Inserir.Enabled := not(bHabilita);
end;

{$R *.dfm}

end.
