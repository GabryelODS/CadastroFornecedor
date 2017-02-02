program ProjetoFinal;



uses
  Forms,
  uFornecedorMain in 'uFornecedorMain.pas' {frmFornec},
  uFornecedorModel in 'uFornecedorModel.pas',
  uFornecedorDAO in 'uFornecedorDAO.pas',
  uDmDados in 'uDmDados.pas' {dmDados: TDataModule},
  uFornecedorService in 'uFornecedorService.pas',
  uPrincipal in 'uPrincipal.pas' {frmPrincipal},
  uProdutoModel in 'uProdutoModel.pas',
  uProdutoDao in 'uProdutoDao.pas',
  uProdutoService in 'uProdutoService.pas',
  uProdutoMain in 'uProdutoMain.pas' {frmProduto},
  uSalvarCategoria in 'uSalvarCategoria.pas' {frmSalvar};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TfrmFornec, frmFornec);
  Application.CreateForm(TdmDados, dmDados);
  Application.CreateForm(TfrmProduto, frmProduto);
  Application.CreateForm(TfrmSalvar, frmSalvar);
  Application.Run;
end.
