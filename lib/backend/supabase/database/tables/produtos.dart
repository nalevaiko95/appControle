import '../database.dart';

class ProdutosTable extends SupabaseTable<ProdutosRow> {
  @override
  String get tableName => 'produtos';

  @override
  ProdutosRow createRow(Map<String, dynamic> data) => ProdutosRow(data);
}

class ProdutosRow extends SupabaseDataRow {
  ProdutosRow(super.data);

  @override
  SupabaseTable get table => ProdutosTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  String? get nomeProduto => getField<String>('nome_produto');
  set nomeProduto(String? value) => setField<String>('nome_produto', value);

  String? get descricao => getField<String>('descricao');
  set descricao(String? value) => setField<String>('descricao', value);

  bool? get destaque => getField<bool>('destaque');
  set destaque(bool? value) => setField<bool>('destaque', value);

  String? get categoria => getField<String>('categoria');
  set categoria(String? value) => setField<String>('categoria', value);

  double? get preco => getField<double>('preco');
  set preco(double? value) => setField<double>('preco', value);

  String? get imagem => getField<String>('imagem');
  set imagem(String? value) => setField<String>('imagem', value);

  DateTime? get dataField => getField<DateTime>('data');
  set dataField(DateTime? value) => setField<DateTime>('data', value);
}
