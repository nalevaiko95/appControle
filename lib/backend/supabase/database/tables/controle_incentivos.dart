import '../database.dart';

class ControleIncentivosTable extends SupabaseTable<ControleIncentivosRow> {
  @override
  String get tableName => 'controle_incentivos';

  @override
  ControleIncentivosRow createRow(Map<String, dynamic> data) =>
      ControleIncentivosRow(data);
}

class ControleIncentivosRow extends SupabaseDataRow {
  ControleIncentivosRow(super.data);

  @override
  SupabaseTable get table => ControleIncentivosTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get nomeCampanha => getField<String>('nome_campanha');
  set nomeCampanha(String? value) => setField<String>('nome_campanha', value);

  String? get usuario => getField<String>('usuario');
  set usuario(String? value) => setField<String>('usuario', value);
}
