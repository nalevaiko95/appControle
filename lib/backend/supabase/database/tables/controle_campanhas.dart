import '../database.dart';

class ControleCampanhasTable extends SupabaseTable<ControleCampanhasRow> {
  @override
  String get tableName => 'controle_campanhas';

  @override
  ControleCampanhasRow createRow(Map<String, dynamic> data) =>
      ControleCampanhasRow(data);
}

class ControleCampanhasRow extends SupabaseDataRow {
  ControleCampanhasRow(super.data);

  @override
  SupabaseTable get table => ControleCampanhasTable();

  int get campanhaId => getField<int>('campanha_id')!;
  set campanhaId(int value) => setField<int>('campanha_id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get nome => getField<String>('nome');
  set nome(String? value) => setField<String>('nome', value);

  String? get status => getField<String>('status');
  set status(String? value) => setField<String>('status', value);

  String? get pagamento => getField<String>('pagamento');
  set pagamento(String? value) => setField<String>('pagamento', value);

  int? get negocioId => getField<int>('negocio_id');
  set negocioId(int? value) => setField<int>('negocio_id', value);
}
