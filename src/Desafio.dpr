program Desafio;

uses
  Vcl.Forms,
  frmView.Menu in 'view\frmView.Menu.pas' {frmViewMenu},
  uModel.Cliente.Interfaces in 'model\uModel.Cliente.Interfaces.pas',
  uModel.Cliente in 'model\uModel.Cliente.pas',
  uController.Cliente in 'controller\uController.Cliente.pas',
  uController.Cliente.Interfaces in 'controller\uController.Cliente.Interfaces.pas',
  uModel.Produto in 'model\uModel.Produto.pas',
  uModel.Produto.Interfaces in 'model\uModel.Produto.Interfaces.pas',
  uModel.TecnicoAgricola.Interfaces in 'model\uModel.TecnicoAgricola.Interfaces.pas',
  uModel.TecnicoAgricola in 'model\uModel.TecnicoAgricola.pas',
  uModel.PedidoVenda.Interfaces in 'model\uModel.PedidoVenda.Interfaces.pas',
  uModel.PedidoVenda in 'model\uModel.PedidoVenda.pas',
  uModel.PedidoVendaItem.Interfaces in 'model\uModel.PedidoVendaItem.Interfaces.pas',
  uModel.PedidoVendaItem in 'model\uModel.PedidoVendaItem.pas',
  uConexao.Interfaces in 'conexao\uConexao.Interfaces.pas',
  uConexao.Firedac in 'conexao\uConexao.Firedac.pas',
  uConexao.Query.Firedac in 'conexao\uConexao.Query.Firedac.pas',
  uConexao.Query.Interfaces in 'conexao\uConexao.Query.Interfaces.pas',
  uDAO.Cliente.Interfaces in 'dao\uDAO.Cliente.Interfaces.pas',
  uDAO.Cliente in 'dao\uDAO.Cliente.pas',
  frmView.TelaPadrao.Cadastro in 'view\frmView.TelaPadrao.Cadastro.pas' {frmViewTelaPadraoCadastro},
  frmView.Cliente in 'view\frmView.Cliente.pas' {frmViewCliente},
  frmView.TelaPadrao.Pesquisa in 'view\frmView.TelaPadrao.Pesquisa.pas' {frmViewTelaPadraoPesquisa},
  frmView.Cliente.Pesquisa in 'view\frmView.Cliente.Pesquisa.pas' {frmViewClientePesquisa},
  uController.Produto.Interfaces in 'controller\uController.Produto.Interfaces.pas',
  uController.Produto in 'controller\uController.Produto.pas',
  uDAO.Produto.Interfaces in 'dao\uDAO.Produto.Interfaces.pas',
  uDAO.Produto in 'dao\uDAO.Produto.pas',
  frmView.Produto in 'view\frmView.Produto.pas' {frmViewProduto},
  frmView.Produto.Pesquisa in 'view\frmView.Produto.Pesquisa.pas' {frmViewProdutoPesquisa},
  uDAO.PedidoVenda.Interfaces in 'dao\uDAO.PedidoVenda.Interfaces.pas',
  uDAO.PedidoVenda in 'dao\uDAO.PedidoVenda.pas',
  uController.PedidoVenda.Interfaces in 'controller\uController.PedidoVenda.Interfaces.pas',
  uController.PedidoVenda in 'controller\uController.PedidoVenda.pas',
  uDTO.PedidoVenda.Interfaces in 'dto\uDTO.PedidoVenda.Interfaces.pas',
  uDTO.PedidoVenda in 'dto\uDTO.PedidoVenda.pas',
  uDAO.PedidoVendaItem.Interfaces in 'dao\uDAO.PedidoVendaItem.Interfaces.pas',
  uDAO.PedidoVendaItem in 'dao\uDAO.PedidoVendaItem.pas',
  frmView.PedidoVenda in 'view\frmView.PedidoVenda.pas' {frmViewPedidoVenda},
  frmView.PedidoVenda.Pesquisa in 'view\frmView.PedidoVenda.Pesquisa.pas' {frmViewPedidoVendaPesquisa},
  uUtils in 'utils\uUtils.pas',
  frmView.SolicitacaoReceita in 'view\frmView.SolicitacaoReceita.pas' {frmViewSolicitacaoReceita},
  uController.PedidoVendaItem.Interfaces in 'controller\uController.PedidoVendaItem.Interfaces.pas',
  uController.PedidoVendaItem in 'controller\uController.PedidoVendaItem.pas',
  frmView.TecnicoAgricola.Pesquisa in 'view\frmView.TecnicoAgricola.Pesquisa.pas' {frmViewTecnicoAgricolaPesquisa},
  uDAO.TecnicoAgricola.Interfaces in 'dao\uDAO.TecnicoAgricola.Interfaces.pas',
  uDAO.TecnicoAgricola in 'dao\uDAO.TecnicoAgricola.pas',
  uController.TecnicoAgricola.Interfaces in 'controller\uController.TecnicoAgricola.Interfaces.pas',
  uController.TecnicoAgricola in 'controller\uController.TecnicoAgricola.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmViewMenu, frmViewMenu);
  Application.Run;
end.
