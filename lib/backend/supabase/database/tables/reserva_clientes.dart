import '../database.dart';

class ReservaClientesTable extends SupabaseTable<ReservaClientesRow> {
  @override
  String get tableName => 'reserva_clientes';

  @override
  ReservaClientesRow createRow(Map<String, dynamic> data) =>
      ReservaClientesRow(data);
}

class ReservaClientesRow extends SupabaseDataRow {
  ReservaClientesRow(super.data);

  @override
  SupabaseTable get table => ReservaClientesTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get nomeCliente => getField<String>('nome_cliente');
  set nomeCliente(String? value) => setField<String>('nome_cliente', value);

  String? get contatoCliente => getField<String>('contato_cliente');
  set contatoCliente(String? value) =>
      setField<String>('contato_cliente', value);
}
