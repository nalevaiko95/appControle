import '../database.dart';

class ViewControlePedidosTable extends SupabaseTable<ViewControlePedidosRow> {
  @override
  String get tableName => 'view_controle_pedidos';

  @override
  ViewControlePedidosRow createRow(Map<String, dynamic> data) =>
      ViewControlePedidosRow(data);
}

class ViewControlePedidosRow extends SupabaseDataRow {
  ViewControlePedidosRow(super.data);

  @override
  SupabaseTable get table => ViewControlePedidosTable();

  String? get usuario => getField<String>('usuario');
  set usuario(String? value) => setField<String>('usuario', value);

  double? get totalPago => getField<double>('total_pago');
  set totalPago(double? value) => setField<double>('total_pago', value);

  double? get totalPendente => getField<double>('total_pendente');
  set totalPendente(double? value) => setField<double>('total_pendente', value);
}
