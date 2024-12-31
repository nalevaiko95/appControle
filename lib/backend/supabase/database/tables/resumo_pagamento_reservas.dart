import '../database.dart';

class ResumoPagamentoReservasTable
    extends SupabaseTable<ResumoPagamentoReservasRow> {
  @override
  String get tableName => 'resumo_pagamento_reservas';

  @override
  ResumoPagamentoReservasRow createRow(Map<String, dynamic> data) =>
      ResumoPagamentoReservasRow(data);
}

class ResumoPagamentoReservasRow extends SupabaseDataRow {
  ResumoPagamentoReservasRow(super.data);

  @override
  SupabaseTable get table => ResumoPagamentoReservasTable();

  double? get total => getField<double>('total');
  set total(double? value) => setField<double>('total', value);

  double? get totalPendente => getField<double>('total_pendente');
  set totalPendente(double? value) => setField<double>('total_pendente', value);

  double? get totalPago => getField<double>('total_pago');
  set totalPago(double? value) => setField<double>('total_pago', value);

  double? get totalDisponivel => getField<double>('total_disponivel');
  set totalDisponivel(double? value) =>
      setField<double>('total_disponivel', value);

  double? get percentualPendente => getField<double>('percentual_pendente');
  set percentualPendente(double? value) =>
      setField<double>('percentual_pendente', value);

  double? get percentualPago => getField<double>('percentual_pago');
  set percentualPago(double? value) =>
      setField<double>('percentual_pago', value);

  double? get percentualDisponivel => getField<double>('percentual_disponivel');
  set percentualDisponivel(double? value) =>
      setField<double>('percentual_disponivel', value);
}
