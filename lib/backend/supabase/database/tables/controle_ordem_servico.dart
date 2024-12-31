import '../database.dart';

class ControleOrdemServicoTable extends SupabaseTable<ControleOrdemServicoRow> {
  @override
  String get tableName => 'controle_ordem_servico';

  @override
  ControleOrdemServicoRow createRow(Map<String, dynamic> data) =>
      ControleOrdemServicoRow(data);
}

class ControleOrdemServicoRow extends SupabaseDataRow {
  ControleOrdemServicoRow(super.data);

  @override
  SupabaseTable get table => ControleOrdemServicoTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get cliente => getField<String>('cliente');
  set cliente(String? value) => setField<String>('cliente', value);

  String? get usuario => getField<String>('usuario');
  set usuario(String? value) => setField<String>('usuario', value);

  DateTime? get dataField => getField<DateTime>('data');
  set dataField(DateTime? value) => setField<DateTime>('data', value);

  String? get statusPagamento => getField<String>('status_pagamento');
  set statusPagamento(String? value) =>
      setField<String>('status_pagamento', value);

  double? get total => getField<double>('total');
  set total(double? value) => setField<double>('total', value);

  int? get numeroPedido => getField<int>('numero_pedido');
  set numeroPedido(int? value) => setField<int>('numero_pedido', value);

  int? get idCliente => getField<int>('id_cliente');
  set idCliente(int? value) => setField<int>('id_cliente', value);

  bool? get servico => getField<bool>('servico');
  set servico(bool? value) => setField<bool>('servico', value);

  double? get desconto => getField<double>('desconto');
  set desconto(double? value) => setField<double>('desconto', value);

  double? get totalLiquido => getField<double>('total_liquido');
  set totalLiquido(double? value) => setField<double>('total_liquido', value);

  int? get idNegocio => getField<int>('id_negocio');
  set idNegocio(int? value) => setField<int>('id_negocio', value);
}
