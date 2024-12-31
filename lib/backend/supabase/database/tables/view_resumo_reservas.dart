import '../database.dart';

class ViewResumoReservasTable extends SupabaseTable<ViewResumoReservasRow> {
  @override
  String get tableName => 'view_resumo_reservas';

  @override
  ViewResumoReservasRow createRow(Map<String, dynamic> data) =>
      ViewResumoReservasRow(data);
}

class ViewResumoReservasRow extends SupabaseDataRow {
  ViewResumoReservasRow(super.data);

  @override
  SupabaseTable get table => ViewResumoReservasTable();

  int? get total => getField<int>('total');
  set total(int? value) => setField<int>('total', value);

  int? get totalReservadas => getField<int>('total_reservadas');
  set totalReservadas(int? value) => setField<int>('total_reservadas', value);

  int? get totalDisponiveis => getField<int>('total_disponiveis');
  set totalDisponiveis(int? value) => setField<int>('total_disponiveis', value);

  double? get percentualReservadas => getField<double>('percentual_reservadas');
  set percentualReservadas(double? value) =>
      setField<double>('percentual_reservadas', value);

  double? get percentualUnitario => getField<double>('percentual_unitario');
  set percentualUnitario(double? value) =>
      setField<double>('percentual_unitario', value);
}
