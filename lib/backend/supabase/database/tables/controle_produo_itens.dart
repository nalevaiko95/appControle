import '../database.dart';

class ControleProduoItensTable extends SupabaseTable<ControleProduoItensRow> {
  @override
  String get tableName => 'controle_produção_itens';

  @override
  ControleProduoItensRow createRow(Map<String, dynamic> data) =>
      ControleProduoItensRow(data);
}

class ControleProduoItensRow extends SupabaseDataRow {
  ControleProduoItensRow(super.data);

  @override
  SupabaseTable get table => ControleProduoItensTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  int? get referencia => getField<int>('referencia');
  set referencia(int? value) => setField<int>('referencia', value);

  String? get nomeProduto => getField<String>('nome_produto');
  set nomeProduto(String? value) => setField<String>('nome_produto', value);

  double? get quantidadeProduzida => getField<double>('quantidade_produzida');
  set quantidadeProduzida(double? value) =>
      setField<double>('quantidade_produzida', value);

  String? get usuario => getField<String>('usuario');
  set usuario(String? value) => setField<String>('usuario', value);

  double? get valorProduto => getField<double>('valor_produto');
  set valorProduto(double? value) => setField<double>('valor_produto', value);

  double? get valorTotal => getField<double>('valor_total');
  set valorTotal(double? value) => setField<double>('valor_total', value);
}
