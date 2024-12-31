import '../database.dart';

class ReservaCadeirasTable extends SupabaseTable<ReservaCadeirasRow> {
  @override
  String get tableName => 'reserva_cadeiras';

  @override
  ReservaCadeirasRow createRow(Map<String, dynamic> data) =>
      ReservaCadeirasRow(data);
}

class ReservaCadeirasRow extends SupabaseDataRow {
  ReservaCadeirasRow(super.data);

  @override
  SupabaseTable get table => ReservaCadeirasTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  int? get numeroCadeira => getField<int>('numero_cadeira');
  set numeroCadeira(int? value) => setField<int>('numero_cadeira', value);

  double? get valorCadeira => getField<double>('valor_cadeira');
  set valorCadeira(double? value) => setField<double>('valor_cadeira', value);

  bool? get status => getField<bool>('status');
  set status(bool? value) => setField<bool>('status', value);

  int? get mesaReferencia => getField<int>('mesa_referencia');
  set mesaReferencia(int? value) => setField<int>('mesa_referencia', value);
}
