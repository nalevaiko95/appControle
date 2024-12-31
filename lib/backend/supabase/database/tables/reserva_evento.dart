import '../database.dart';

class ReservaEventoTable extends SupabaseTable<ReservaEventoRow> {
  @override
  String get tableName => 'reserva_evento';

  @override
  ReservaEventoRow createRow(Map<String, dynamic> data) =>
      ReservaEventoRow(data);
}

class ReservaEventoRow extends SupabaseDataRow {
  ReservaEventoRow(super.data);

  @override
  SupabaseTable get table => ReservaEventoTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get nomeEvento => getField<String>('nome_evento');
  set nomeEvento(String? value) => setField<String>('nome_evento', value);

  String? get dataEvento => getField<String>('data_evento');
  set dataEvento(String? value) => setField<String>('data_evento', value);
}
