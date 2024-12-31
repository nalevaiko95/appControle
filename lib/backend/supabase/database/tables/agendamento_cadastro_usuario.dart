import '../database.dart';

class AgendamentoCadastroUsuarioTable
    extends SupabaseTable<AgendamentoCadastroUsuarioRow> {
  @override
  String get tableName => 'agendamento_cadastro_usuario';

  @override
  AgendamentoCadastroUsuarioRow createRow(Map<String, dynamic> data) =>
      AgendamentoCadastroUsuarioRow(data);
}

class AgendamentoCadastroUsuarioRow extends SupabaseDataRow {
  AgendamentoCadastroUsuarioRow(super.data);

  @override
  SupabaseTable get table => AgendamentoCadastroUsuarioTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String get nome => getField<String>('nome')!;
  set nome(String value) => setField<String>('nome', value);

  String get email => getField<String>('email')!;
  set email(String value) => setField<String>('email', value);

  String get senha => getField<String>('senha')!;
  set senha(String value) => setField<String>('senha', value);

  String? get telefone => getField<String>('telefone');
  set telefone(String? value) => setField<String>('telefone', value);

  DateTime? get dataNascimento => getField<DateTime>('data_nascimento');
  set dataNascimento(DateTime? value) =>
      setField<DateTime>('data_nascimento', value);

  String? get endereco => getField<String>('endereco');
  set endereco(String? value) => setField<String>('endereco', value);

  String? get cidade => getField<String>('cidade');
  set cidade(String? value) => setField<String>('cidade', value);

  String? get estado => getField<String>('estado');
  set estado(String? value) => setField<String>('estado', value);

  String? get pais => getField<String>('pais');
  set pais(String? value) => setField<String>('pais', value);
}
