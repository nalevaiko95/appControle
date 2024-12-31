import '../database.dart';

class ViewMesasPorLocalTable extends SupabaseTable<ViewMesasPorLocalRow> {
  @override
  String get tableName => 'view_mesas_por_local';

  @override
  ViewMesasPorLocalRow createRow(Map<String, dynamic> data) =>
      ViewMesasPorLocalRow(data);
}

class ViewMesasPorLocalRow extends SupabaseDataRow {
  ViewMesasPorLocalRow(super.data);

  @override
  SupabaseTable get table => ViewMesasPorLocalTable();

  String? get local => getField<String>('local');
  set local(String? value) => setField<String>('local', value);

  int? get totalMesas => getField<int>('total_mesas');
  set totalMesas(int? value) => setField<int>('total_mesas', value);
}
