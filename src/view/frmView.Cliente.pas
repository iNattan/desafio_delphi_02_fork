unit frmView.Cliente;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.StdCtrls, Vcl.ExtCtrls, frmView.TelaPadrao.Cadastro, 
  uController.Cliente.Interfaces, Vcl.Mask;

type
  TfrmViewCliente = class(TfrmViewTelaPadraoCadastro)
    Edt_ID: TEdit;
    Edt_Nome: TEdit;
    Lbl_CPF: TLabel;
    Lbl_ID: TLabel;
    Lbl_Nome: TLabel;
    Edt_CPF: TMaskEdit;
    procedure Btn_InserirClick(Sender: TObject);
    procedure Btn_LimparClick(Sender: TObject);
    procedure Btn_GravarClick(Sender: TObject);
    procedure Btn_ConsultarClick(Sender: TObject);
    procedure Btn_EditarClick(Sender: TObject);
    procedure Btn_DeletarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    ClienteController: iClienteController;

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
  frmViewCliente: TfrmViewCliente;

implementation

uses
  frmView.TelaPadrao.Pesquisa, frmView.Cliente.Pesquisa,
  uModel.Cliente.Interfaces, uController.Cliente;

procedure TfrmViewCliente.Inserir;
begin
  LimpaTela;
  HabilitaEdicao(True);
  HabilitaBotoesEnquantoEdita(True);
  SetAcao(aInserir);

  Edt_Nome.SetFocus;
end;

procedure TfrmViewCliente.Gravar;
begin
  ClienteController.NovoCliente
    .Nome(Edt_Nome.Text)
    .CPF(Edt_CPF.Text);

  try
    if GetAcao = aInserir then
    begin
      ClienteController.Inserir;
      ShowMessage('Cliente cadastrado com sucesso!');
    end
    else
    begin
      ClienteController.NovoCliente.Id(StrToInt(Edt_ID.Text));
      ClienteController.Atualizar;
      ShowMessage('Cliente editado com sucesso!');
    end;
    LimpaTela;
  except
    on E: Exception do
      ShowMessage('Erro ao gravar: ' + E.Message);
  end;
end;

procedure TfrmViewCliente.Consultar;
var
  frmClientePesquisa: TfrmViewClientePesquisa;
  IdPesquisado: Integer;
begin
  frmClientePesquisa := TfrmViewClientePesquisa.Create(Self);
  try
    frmClientePesquisa.ShowModal;
    if frmClientePesquisa.ModalResult = mrOk then
    begin
      IdPesquisado := frmClientePesquisa.GetId;
      ConsultarPorId(IdPesquisado);
    end;
  finally
    frmClientePesquisa.Free;
  end;
end;

procedure TfrmViewCliente.ConsultarPorId(Id: Integer);
var
  ClienteObj: iCliente;
begin
  ClienteObj := ClienteController.BuscarPorId(Id);

  Edt_ID.Text := ClienteObj.Id.ToString;
  Edt_Nome.Text := ClienteObj.Nome;
  Edt_CPF.Text := ClienteObj.CPF;

  HabilitaBotoesEnquantoConsulta(True);
end;

procedure TfrmViewCliente.Editar;
begin
  HabilitaEdicao(True);
  HabilitaBotoesEnquantoConsulta(False);
  HabilitaBotoesEnquantoEdita(True);
  SetAcao(aEditar);

  Edt_Nome.SetFocus;
end;

procedure TfrmViewCliente.FormCreate(Sender: TObject);
begin
  inherited;
  ClienteController := TClienteController.New;  
end;

procedure TfrmViewCliente.Deletar;
var 
  Resposta: Integer;
begin
  Resposta := MessageDlg('Deseja realmente excluir este cliente?', mtConfirmation, [mbYes, mbNo], 0);

  if Resposta = mrYes then  
  begin  
    try
      ClienteController.Deletar(StrToInt(Edt_ID.Text));
      ShowMessage('Cliente excluído com sucesso!');
      LimpaTela;
    except
      on E: Exception do
        ShowMessage('Erro ao gravar: ' + E.Message);
    end;
  end;
end;

procedure TfrmViewCliente.Btn_ConsultarClick(Sender: TObject);
begin
  inherited;
  Consultar;
end;

procedure TfrmViewCliente.Btn_DeletarClick(Sender: TObject);
begin
  inherited;
  Deletar;
end;

procedure TfrmViewCliente.Btn_EditarClick(Sender: TObject);
begin
  inherited;
  Editar;
end;

procedure TfrmViewCliente.Btn_GravarClick(Sender: TObject);
begin
  inherited;
  if ValidaCamposObrigatorios then
    Gravar;
end;

procedure TfrmViewCliente.Btn_InserirClick(Sender: TObject);
begin
  inherited;
  Inserir;
end;

procedure TfrmViewCliente.Btn_LimparClick(Sender: TObject);
begin
  inherited;
  LimpaTela;
end;

procedure TfrmViewCliente.LimpaTela;
begin
  Edt_ID.Clear;
  Edt_Nome.Clear;
  Edt_CPF.Clear;

  HabilitaEdicao(False);
  HabilitaBotoesEnquantoEdita(False);
  HabilitaBotoesEnquantoConsulta(False);
end;

function TfrmViewCliente.ValidaCamposObrigatorios: Boolean;
begin
  Result := True;

  if Edt_Nome.Text  = '' then
  begin
    ShowMessage('Nome é obrigatório!');
    Result := False;
    Exit;
  end;

  if Edt_CPF.Text  = '' then
  begin
    ShowMessage('CPF é obrigatório!');
    Result := False;
    Exit;
  end;
end;

{$R *.dfm}

end.

