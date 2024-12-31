import '../database.dart';

class AppControleTimesTable extends SupabaseTable<AppControleTimesRow> {
  @override
  String get tableName => 'app_controle_times';

  @override
  AppControleTimesRow createRow(Map<String, dynamic> data) =>
      AppControleTimesRow(data);
}

class AppControleTimesRow extends SupabaseDataRow {
  AppControleTimesRow(super.data);

  @override
  SupabaseTable get table => AppControleTimesTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get nomeTime => getField<String>('nome_time');
  set nomeTime(String? value) => setField<String>('nome_time', value);

  String? get usuario => getField<String>('usuario');
  set usuario(String? value) => setField<String>('usuario', value);

  DateTime? get dataCriacao => getField<DateTime>('data_criacao');
  set dataCriacao(DateTime? value) => setField<DateTime>('data_criacao', value);

  String? get cidade => getField<String>('cidade');
  set cidade(String? value) => setField<String>('cidade', value);

  String? get estado => getField<String>('estado');
  set estado(String? value) => setField<String>('estado', value);

  String? get contato => getField<String>('contato');
  set contato(String? value) => setField<String>('contato', value);

  String? get escudo => getField<String>('escudo');
  set escudo(String? value) => setField<String>('escudo', value);
}
