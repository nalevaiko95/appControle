import '../database.dart';

class ControleClientesObsTable extends SupabaseTable<ControleClientesObsRow> {
  @override
  String get tableName => 'controle_clientes_obs';

  @override
  ControleClientesObsRow createRow(Map<String, dynamic> data) =>
      ControleClientesObsRow(data);
}

class ControleClientesObsRow extends SupabaseDataRow {
  ControleClientesObsRow(super.data);

  @override
  SupabaseTable get table => ControleClientesObsTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get nome => getField<String>('nome');
  set nome(String? value) => setField<String>('nome', value);

  String? get usuario => getField<String>('usuario');
  set usuario(String? value) => setField<String>('usuario', value);
}
