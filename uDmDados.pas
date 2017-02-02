unit uDmDados;

interface

uses
  SysUtils, Classes, WideStrings, DBXOracle, DB, SqlExpr, FMTBcd, DBClient;

type
  TdmDados = class(TDataModule)
    sqlConexaoFornecedor: TSQLConnection;
    cdsFornecedor: TClientDataSet;
    dtFornecedor: TDataSource;
    cdsFornecedorNome: TStringField;
    cdsFornecedorEndereço: TStringField;
    cdsFornecedorCGC: TIntegerField;
    cdsFornecedorDataCadastro: TDateField;
    cdsFornecedorCodFornec: TIntegerField;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmDados: TdmDados;

implementation

{$R *.dfm}

procedure TdmDados.DataModuleCreate(Sender: TObject);
begin
  cdsFornecedor.CreateDataSet;

end;

end.
