import '../database.dart';

class ValorTotalPedidosPorClienteTable
    extends SupabaseTable<ValorTotalPedidosPorClienteRow> {
  @override
  String get tableName => 'valor_total_pedidos_por_cliente';

  @override
  ValorTotalPedidosPorClienteRow createRow(Map<String, dynamic> data) =>
      ValorTotalPedidosPorClienteRow(data);
}

class ValorTotalPedidosPorClienteRow extends SupabaseDataRow {
  ValorTotalPedidosPorClienteRow(super.data);

  @override
  SupabaseTable get table => ValorTotalPedidosPorClienteTable();

  int? get idCliente => getField<int>('id_cliente');
  set idCliente(int? value) => setField<int>('id_cliente', value);

  String? get cliente => getField<String>('cliente');
  set cliente(String? value) => setField<String>('cliente', value);

  double? get totalPago => getField<double>('total_pago');
  set totalPago(double? value) => setField<double>('total_pago', value);

  double? get totalPendente => getField<double>('total_pendente');
  set totalPendente(double? value) => setField<double>('total_pendente', value);

  String? get usuario => getField<String>('usuario');
  set usuario(String? value) => setField<String>('usuario', value);
}
