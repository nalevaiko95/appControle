import '../database.dart';

class ReservaCadastroTable extends SupabaseTable<ReservaCadastroRow> {
  @override
  String get tableName => 'reserva_cadastro';

  @override
  ReservaCadastroRow createRow(Map<String, dynamic> data) =>
      ReservaCadastroRow(data);
}

class ReservaCadastroRow extends SupabaseDataRow {
  ReservaCadastroRow(super.data);

  @override
  SupabaseTable get table => ReservaCadastroTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  int? get mesaReferencia => getField<int>('mesa_referencia');
  set mesaReferencia(int? value) => setField<int>('mesa_referencia', value);

  int? get cadeiraReferencia => getField<int>('cadeira_referencia');
  set cadeiraReferencia(int? value) =>
      setField<int>('cadeira_referencia', value);

  List<String> get status => getListField<String>('status');
  set status(List<String>? value) => setListField<String>('status', value);
}
