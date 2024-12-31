import '../database.dart';

class AgendamentoCadastroProfissionaisTable
    extends SupabaseTable<AgendamentoCadastroProfissionaisRow> {
  @override
  String get tableName => 'agendamento_cadastro_profissionais';

  @override
  AgendamentoCadastroProfissionaisRow createRow(Map<String, dynamic> data) =>
      AgendamentoCadastroProfissionaisRow(data);
}

class AgendamentoCadastroProfissionaisRow extends SupabaseDataRow {
  AgendamentoCadastroProfissionaisRow(super.data);

  @override
  SupabaseTable get table => AgendamentoCadastroProfissionaisTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get nome => getField<String>('nome');
  set nome(String? value) => setField<String>('nome', value);

  int? get idNegocio => getField<int>('id_negocio');
  set idNegocio(int? value) => setField<int>('id_negocio', value);
}
