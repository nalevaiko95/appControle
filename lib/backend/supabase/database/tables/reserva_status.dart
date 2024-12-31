import '../database.dart';

class ReservaStatusTable extends SupabaseTable<ReservaStatusRow> {
  @override
  String get tableName => 'reserva_status';

  @override
  ReservaStatusRow createRow(Map<String, dynamic> data) =>
      ReservaStatusRow(data);
}

class ReservaStatusRow extends SupabaseDataRow {
  ReservaStatusRow(super.data);

  @override
  SupabaseTable get table => ReservaStatusTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get nomeStatus => getField<String>('nome_status');
  set nomeStatus(String? value) => setField<String>('nome_status', value);
}
