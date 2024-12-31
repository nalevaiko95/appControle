import '../database.dart';

class ControleFormaPagamentoTable
    extends SupabaseTable<ControleFormaPagamentoRow> {
  @override
  String get tableName => 'controle_forma_pagamento';

  @override
  ControleFormaPagamentoRow createRow(Map<String, dynamic> data) =>
      ControleFormaPagamentoRow(data);
}

class ControleFormaPagamentoRow extends SupabaseDataRow {
  ControleFormaPagamentoRow(super.data);

  @override
  SupabaseTable get table => ControleFormaPagamentoTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get forma => getField<String>('forma');
  set forma(String? value) => setField<String>('forma', value);
}
