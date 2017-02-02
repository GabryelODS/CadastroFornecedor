unit uFornecedorService;

interface
uses
  uFornecedorDao, uFornecedorModel, Dialogs,SysUtils, Generics.Collections,uDmDados;
type
  TFornecedorService = class
    private
      FFornecedorDAO : TFornecedorDao;
    public
      procedure EditarFornecedor(pCodFornec : integer; pNome : string; pEndereco : string; pCGC : integer);
      procedure salvarFornecedor(pNome: string; pCGC : integer; pEndereco : string);
      procedure DeletarFornecedor(pCodigo : Integer);
      procedure validarDados(pFornecedor : TFornecedor);

      function ConsultarFornecedor(pCodigo : integer): TFornecedor;
      function ConsultarFornec(pNome : String): TList<TFornecedor>;
      function ConsultarFornecCGC(pCGC : Double) : TFornecedor;
      function ConsultarTodos () : TList<TFornecedor>;
      function ConsultarFornecEnd(pEndereco : string) : TFornecedor;
      function ConsultarFornecDat (pData : TDateTime) : TFornecedor;

      constructor create;
  end;
implementation

{ TFornecedorService }


function TFornecedorService.ConsultarFornec(pNome: String): TList<TFornecedor>;
begin
  Result := FFornecedorDAO.ConsultarFornec(pNome);
end;

function TFornecedorService.ConsultarFornecCGC(pCGC: Double): TFornecedor;
begin
  Result := FFornecedorDAO.ConsultarFornecCgc(pCgc);
end;

function TFornecedorService.ConsultarFornecDat(pData: TDateTime): TFornecedor;
begin
  Result := FFornecedorDAO.ConsultarFornecDat(pDATA);
end;

function TFornecedorService.ConsultarFornecedor(pCodigo: integer): TFornecedor;
begin
  Result := FFornecedorDAO.Consultar(pCodigo);
end;

function TFornecedorService.ConsultarFornecEnd(pEndereco: string): TFornecedor;
begin
  Result := FFornecedorDAO.ConsultarFornecEnde(pEndereco);
end;

function TFornecedorService.ConsultarTodos: TList<TFornecedor>;
begin
  Result := FFornecedorDAO.ConsultarTodos;
end;

constructor TFornecedorService.create;
begin
  FFornecedorDAO := TFornecedorDao.create;
end;


procedure TFornecedorService.DeletarFornecedor(pCodigo: Integer);
var
  fornecedor : TFornecedor;
begin
  fornecedor := TFornecedor.Create;

  FFornecedorDAO.Deletar(dmDados.cdsFornecedorCodFornec.Value);

end;



procedure TFornecedorService.EditarFornecedor(pCodFornec: integer; pNome,
  pEndereco: string; pCGC: integer);
var
  fornecedor : TFornecedor;
begin
  fornecedor := TFornecedor.Create;

  fornecedor.Nome := pNome;
  fornecedor.endereco := pEndereco;
  fornecedor.cgc := pCGC;
  fornecedor.CodFornec := pCodFornec;

  validarDados(fornecedor);

  FFornecedorDAO.Update(fornecedor);

  FreeAndNil(fornecedor);
end;

procedure TFornecedorService.salvarFornecedor(pNome: string; pCGC: integer; pEndereco: string);
var
  gFornecedor : TFornecedor;
begin
  gFornecedor := TFornecedor.Create;

  gFornecedor.Nome := pNome;
  gFornecedor.cgc := pCGC;
  gFornecedor.Endereco := pEndereco;

  validarDados(gFornecedor);

  FFornecedorDAO.Salvar(gFornecedor);

  FreeAndNil(gFornecedor);

end;

procedure TFornecedorService.validarDados(pFornecedor: TFornecedor);
begin
  if pFornecedor.Nome = EmptyStr then
  begin
    showMessage ('O nome deve ser informado!');
    Abort;
  end;
  if pFornecedor.cgc = 0 then
  begin
    ShowMessage('o CGC deve ser informado!');
    Abort;
  end;
  if pFornecedor.Endereco = EmptyStr then
  begin
    ShowMessage('O Endereço deve ser informado!');
    Abort;
  end;
end;
end.
