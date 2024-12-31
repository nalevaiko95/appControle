import '../database.dart';

class ControleProducaoTable extends SupabaseTable<ControleProducaoRow> {
  @override
  String get tableName => 'controle_producao';

  @override
  ControleProducaoRow createRow(Map<String, dynamic> data) =>
      ControleProducaoRow(data);
}

class ControleProducaoRow extends SupabaseDataRow {
  ControleProducaoRow(super.data);

  @override
  SupabaseTable get table => ControleProducaoTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get usuario => getField<String>('usuario');
  set usuario(String? value) => setField<String>('usuario', value);

  DateTime? get dataField => getField<DateTime>('data');
  set dataField(DateTime? value) => setField<DateTime>('data', value);
}
