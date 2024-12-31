import '../database.dart';

class ControleCadastroProdutosTable
    extends SupabaseTable<ControleCadastroProdutosRow> {
  @override
  String get tableName => 'controle_cadastro_produtos';

  @override
  ControleCadastroProdutosRow createRow(Map<String, dynamic> data) =>
      ControleCadastroProdutosRow(data);
}

class ControleCadastroProdutosRow extends SupabaseDataRow {
  ControleCadastroProdutosRow(super.data);

  @override
  SupabaseTable get table => ControleCadastroProdutosTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get nome => getField<String>('nome');
  set nome(String? value) => setField<String>('nome', value);

  double? get valorVenda => getField<double>('valor_venda');
  set valorVenda(double? value) => setField<double>('valor_venda', value);

  double? get valorCusto => getField<double>('valor_custo');
  set valorCusto(double? value) => setField<double>('valor_custo', value);

  double? get estoqueAtual => getField<double>('estoque_atual');
  set estoqueAtual(double? value) => setField<double>('estoque_atual', value);

  List<String> get categoria => getListField<String>('categoria');
  set categoria(List<String>? value) =>
      setListField<String>('categoria', value);

  String? get imagem => getField<String>('imagem');
  set imagem(String? value) => setField<String>('imagem', value);

  String? get usuario => getField<String>('usuario');
  set usuario(String? value) => setField<String>('usuario', value);

  bool? get destaque => getField<bool>('destaque');
  set destaque(bool? value) => setField<bool>('destaque', value);

  int? get idNegocio => getField<int>('id_negocio');
  set idNegocio(int? value) => setField<int>('id_negocio', value);

  String? get tipo => getField<String>('tipo');
  set tipo(String? value) => setField<String>('tipo', value);

  String? get unidadeMedida => getField<String>('unidade_medida');
  set unidadeMedida(String? value) => setField<String>('unidade_medida', value);

  double? get margemLucro => getField<double>('margem_lucro');
  set margemLucro(double? value) => setField<double>('margem_lucro', value);

  String? get codigoInterno => getField<String>('codigo_interno');
  set codigoInterno(String? value) => setField<String>('codigo_interno', value);
}
