import '../database.dart';

class ReservaMesasTable extends SupabaseTable<ReservaMesasRow> {
  @override
  String get tableName => 'reserva_mesas';

  @override
  ReservaMesasRow createRow(Map<String, dynamic> data) => ReservaMesasRow(data);
}

class ReservaMesasRow extends SupabaseDataRow {
  ReservaMesasRow(super.data);

  @override
  SupabaseTable get table => ReservaMesasTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  int? get numeroMesas => getField<int>('numero_mesas');
  set numeroMesas(int? value) => setField<int>('numero_mesas', value);

  double? get valorMesa => getField<double>('valor_mesa');
  set valorMesa(double? value) => setField<double>('valor_mesa', value);

  bool? get statusMesa => getField<bool>('status_mesa');
  set statusMesa(bool? value) => setField<bool>('status_mesa', value);

  int? get eventoReferencia => getField<int>('evento_referencia');
  set eventoReferencia(int? value) => setField<int>('evento_referencia', value);

  String? get local => getField<String>('local');
  set local(String? value) => setField<String>('local', value);

  String? get cliente => getField<String>('cliente');
  set cliente(String? value) => setField<String>('cliente', value);

  String? get pagamento => getField<String>('pagamento');
  set pagamento(String? value) => setField<String>('pagamento', value);

  String? get tag => getField<String>('tag');
  set tag(String? value) => setField<String>('tag', value);
}
