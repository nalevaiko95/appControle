import '../database.dart';

class ViewReservasTable extends SupabaseTable<ViewReservasRow> {
  @override
  String get tableName => 'view_reservas';

  @override
  ViewReservasRow createRow(Map<String, dynamic> data) => ViewReservasRow(data);
}

class ViewReservasRow extends SupabaseDataRow {
  ViewReservasRow(super.data);

  @override
  SupabaseTable get table => ViewReservasTable();

  int? get totalMesas => getField<int>('total_mesas');
  set totalMesas(int? value) => setField<int>('total_mesas', value);

  int? get totalReservado => getField<int>('total_reservado');
  set totalReservado(int? value) => setField<int>('total_reservado', value);

  int? get totalDisponivel => getField<int>('total_disponivel');
  set totalDisponivel(int? value) => setField<int>('total_disponivel', value);
}
