unit frmView.Produto;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, frmView.TelaPadrao.Cadastro,
  Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Mask, uController.Produto.Interfaces,
  System.StrUtils, uUtils;

type
  TfrmViewProduto = class(TfrmViewTelaPadraoCadastro)
    Lbl_ID: TLabel;
    Lbl_Nome: TLabel;
    Edt_ID: TEdit;
    Edt_Nome: TEdit;
    Lbl_Valor: TLabel;
    CheckBox_Controle_Especial: TCheckBox;
    Edt_Valor: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure Btn_ConsultarClick(Sender: TObject);
    procedure Btn_InserirClick(Sender: TObject);
    procedure Btn_EditarClick(Sender: TObject);
    procedure Btn_DeletarClick(Sender: TObject);
    procedure Btn_LimparClick(Sender: TObject);
    procedure Btn_GravarClick(Sender: TObject);
    procedure Edt_ValorKeyPress(Sender: TObject; var Key: Char);
    procedure Edt_ValorExit(Sender: TObject);
  private
    { Private declarations }
    ProdutoController: iProdutoController;

    procedure Inserir;
    procedure Gravar;
    procedure Consultar;
    procedure Editar;
    procedure Deletar;
    procedure ConsultarPorId(Id: Integer);
    function ValidaCamposObrigatorios: Boolean;
    procedure LimpaTela;
  public
    { Public declarations }
  end;

var
  frmViewProduto: TfrmViewProduto;

implementation

uses
  frmView.Produto.Pesquisa, uModel.Produto.Interfaces, uController.Produto;

procedure TfrmViewProduto.Inserir;
begin
  LimpaTela;
  HabilitaEdicao(True);
  HabilitaBotoesEnquantoEdita(True);
  SetAcao(aInserir);

  Edt_Nome.SetFocus;
end;

procedure TfrmViewProduto.Gravar;
begin
  ProdutoController.NovoProduto
    .Nome(Edt_Nome.Text)
    .Valor(StrToCurr(Edt_Valor.Text))
    .ControleEspecial(IfThen(CheckBox_Controle_Especial.Checked, 'S', 'N'));

  try
    if GetAcao = aInserir then
    begin
      ProdutoController.Inserir;
      ShowMessage('Produto cadastrado com sucesso!');
    end
    else
    begin
      ProdutoController.NovoProduto.Id(StrToInt(Edt_ID.Text));
      ProdutoController.Atualizar;
      ShowMessage('Produto editado com sucesso!');
    end;
    LimpaTela;
  except
    on E: Exception do
      ShowMessage('Erro ao gravar: ' + E.Message);
  end;
end;

procedure TfrmViewProduto.Consultar;
var
  frmProdutoPesquisa: TfrmViewProdutoPesquisa;
  IdPesquisado: Integer;
begin
  frmProdutoPesquisa := TfrmViewProdutoPesquisa.Create(Self);
  try
    frmProdutoPesquisa.ShowModal;
    if frmProdutoPesquisa.ModalResult = mrOk then
    begin
      IdPesquisado := frmProdutoPesquisa.GetId;
      ConsultarPorId(IdPesquisado);
    end;
  finally
    frmProdutoPesquisa.Free;
  end;
end;

procedure TfrmViewProduto.ConsultarPorId(Id: Integer);
var
  ProdutoObj: iProduto;
begin
  ProdutoObj := ProdutoController.BuscarPorId(Id);

  Edt_ID.Text := ProdutoObj.Id.ToString;
  Edt_Nome.Text := ProdutoObj.Nome;
  Edt_Valor.Text := CurrToStr(ProdutoObj.Valor);
  if ProdutoObj.ControleEspecial = 'S' then
    CheckBox_Controle_Especial.Checked := True
  else
    CheckBox_Controle_Especial.Checked := False;

  HabilitaBotoesEnquantoConsulta(True);
end;

procedure TfrmViewProduto.Editar;
begin
  HabilitaEdicao(True);
  HabilitaBotoesEnquantoConsulta(False);
  HabilitaBotoesEnquantoEdita(True);
  SetAcao(aEditar);

  Edt_Nome.SetFocus;
end;

procedure TfrmViewProduto.Edt_ValorExit(Sender: TObject);
begin
  inherited;
  Edt_Valor.Text := FormatarMoeda(Edt_Valor.Text);
end;

procedure TfrmViewProduto.Edt_ValorKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  ApenasNumerosComPonto(Sender, Key);
end;

procedure TfrmViewProduto.FormCreate(Sender: TObject);
begin
  inherited;
  ProdutoController := TProdutoController.New;
end;

procedure TfrmViewProduto.Deletar;
var
  Resposta: Integer;
begin
  Resposta := MessageDlg('Deseja realmente excluir este produto?', mtConfirmation, [mbYes, mbNo], 0);

  if Resposta = mrYes then
  begin
    try
      ProdutoController.Deletar(StrToInt(Edt_ID.Text));
      ShowMessage('Produto excluído com sucesso!');
      LimpaTela;
    except
      on E: Exception do
        ShowMessage('Erro ao gravar: ' + E.Message);
    end;
  end;
end;

procedure TfrmViewProduto.Btn_ConsultarClick(Sender: TObject);
begin
  inherited;
  Consultar;
end;

procedure TfrmViewProduto.Btn_DeletarClick(Sender: TObject);
begin
  inherited;
  Deletar;
end;

procedure TfrmViewProduto.Btn_EditarClick(Sender: TObject);
begin
  inherited;
  Editar;
end;

procedure TfrmViewProduto.Btn_GravarClick(Sender: TObject);
begin
  inherited;
  if ValidaCamposObrigatorios then
    Gravar;
end;

procedure TfrmViewProduto.Btn_InserirClick(Sender: TObject);
begin
  inherited;
  Inserir;
end;

procedure TfrmViewProduto.Btn_LimparClick(Sender: TObject);
begin
  inherited;
  LimpaTela;
end;

procedure TfrmViewProduto.LimpaTela;
begin
  Edt_ID.Clear;
  Edt_Nome.Clear;
  Edt_Valor.Clear;
  CheckBox_Controle_Especial.Checked := False;

  HabilitaEdicao(False);
  HabilitaBotoesEnquantoEdita(False);
  HabilitaBotoesEnquantoConsulta(False);
end;

function TfrmViewProduto.ValidaCamposObrigatorios: Boolean;
begin
  Result := True;

  if Edt_Nome.Text  = '' then
  begin
    ShowMessage('Nome é obrigatório!');
    Result := False;
    Exit;
  end;

  if Edt_Valor.Text  = '' then
  begin
    ShowMessage('Valor é obrigatório!');
    Result := False;
    Exit;
  end;
end;

{$R *.dfm}

end.
