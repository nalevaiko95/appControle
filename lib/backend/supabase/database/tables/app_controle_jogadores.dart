import '../database.dart';

class AppControleJogadoresTable extends SupabaseTable<AppControleJogadoresRow> {
  @override
  String get tableName => 'app_controle_jogadores';

  @override
  AppControleJogadoresRow createRow(Map<String, dynamic> data) =>
      AppControleJogadoresRow(data);
}

class AppControleJogadoresRow extends SupabaseDataRow {
  AppControleJogadoresRow(super.data);

  @override
  SupabaseTable get table => AppControleJogadoresTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get nomeJogador => getField<String>('nome_jogador');
  set nomeJogador(String? value) => setField<String>('nome_jogador', value);

  String? get posicao => getField<String>('posicao');
  set posicao(String? value) => setField<String>('posicao', value);

  String? get contato => getField<String>('contato');
  set contato(String? value) => setField<String>('contato', value);

  String? get foto => getField<String>('foto');
  set foto(String? value) => setField<String>('foto', value);

  int? get timeId => getField<int>('time_id');
  set timeId(int? value) => setField<int>('time_id', value);
}
