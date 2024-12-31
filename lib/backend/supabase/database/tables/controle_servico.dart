import '../database.dart';

class ControleServicoTable extends SupabaseTable<ControleServicoRow> {
  @override
  String get tableName => 'controle_servico';

  @override
  ControleServicoRow createRow(Map<String, dynamic> data) =>
      ControleServicoRow(data);
}

class ControleServicoRow extends SupabaseDataRow {
  ControleServicoRow(super.data);

  @override
  SupabaseTable get table => ControleServicoTable();

  String? get usuario => getField<String>('usuario');
  set usuario(String? value) => setField<String>('usuario', value);

  double? get totalPago => getField<double>('total_pago');
  set totalPago(double? value) => setField<double>('total_pago', value);

  double? get totalPendente => getField<double>('total_pendente');
  set totalPendente(double? value) => setField<double>('total_pendente', value);
}
