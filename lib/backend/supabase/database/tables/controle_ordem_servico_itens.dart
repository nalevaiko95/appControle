import '../database.dart';

class ControleOrdemServicoItensTable
    extends SupabaseTable<ControleOrdemServicoItensRow> {
  @override
  String get tableName => 'controle_ordem_servico_itens';

  @override
  ControleOrdemServicoItensRow createRow(Map<String, dynamic> data) =>
      ControleOrdemServicoItensRow(data);
}

class ControleOrdemServicoItensRow extends SupabaseDataRow {
  ControleOrdemServicoItensRow(super.data);

  @override
  SupabaseTable get table => ControleOrdemServicoItensTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  int? get referencia => getField<int>('referencia');
  set referencia(int? value) => setField<int>('referencia', value);

  String? get nomeProduto => getField<String>('nome_produto');
  set nomeProduto(String? value) => setField<String>('nome_produto', value);

  double? get quantidade => getField<double>('quantidade');
  set quantidade(double? value) => setField<double>('quantidade', value);

  String? get usuario => getField<String>('usuario');
  set usuario(String? value) => setField<String>('usuario', value);

  double? get valorProduto => getField<double>('valor_produto');
  set valorProduto(double? value) => setField<double>('valor_produto', value);

  double? get valorTotal => getField<double>('valor_total');
  set valorTotal(double? value) => setField<double>('valor_total', value);

  double? get consignadoDevolucao => getField<double>('consignado_devolucao');
  set consignadoDevolucao(double? value) =>
      setField<double>('consignado_devolucao', value);

  int? get numeroItem => getField<int>('numero_item');
  set numeroItem(int? value) => setField<int>('numero_item', value);

  String? get observacao => getField<String>('observacao');
  set observacao(String? value) => setField<String>('observacao', value);

  bool? get status => getField<bool>('status');
  set status(bool? value) => setField<bool>('status', value);

  String? get unidade => getField<String>('unidade');
  set unidade(String? value) => setField<String>('unidade', value);

  double? get desconto => getField<double>('desconto');
  set desconto(double? value) => setField<double>('desconto', value);
}
