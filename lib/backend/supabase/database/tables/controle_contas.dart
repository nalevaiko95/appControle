import '../database.dart';

class ControleContasTable extends SupabaseTable<ControleContasRow> {
  @override
  String get tableName => 'controle_contas';

  @override
  ControleContasRow createRow(Map<String, dynamic> data) =>
      ControleContasRow(data);
}

class ControleContasRow extends SupabaseDataRow {
  ControleContasRow(super.data);

  @override
  SupabaseTable get table => ControleContasTable();

  int get contaId => getField<int>('conta_id')!;
  set contaId(int value) => setField<int>('conta_id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get contaNome => getField<String>('conta_nome');
  set contaNome(String? value) => setField<String>('conta_nome', value);

  double? get contaSaldoInicial => getField<double>('conta_saldo_inicial');
  set contaSaldoInicial(double? value) =>
      setField<double>('conta_saldo_inicial', value);

  int? get negocioId => getField<int>('negocio_id');
  set negocioId(int? value) => setField<int>('negocio_id', value);
}
