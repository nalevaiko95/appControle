import '../database.dart';

class AgendamentoCadastroNegocioTable
    extends SupabaseTable<AgendamentoCadastroNegocioRow> {
  @override
  String get tableName => 'agendamento_cadastro_negocio';

  @override
  AgendamentoCadastroNegocioRow createRow(Map<String, dynamic> data) =>
      AgendamentoCadastroNegocioRow(data);
}

class AgendamentoCadastroNegocioRow extends SupabaseDataRow {
  AgendamentoCadastroNegocioRow(super.data);

  @override
  SupabaseTable get table => AgendamentoCadastroNegocioTable();

  int get idNegocio => getField<int>('id_negocio')!;
  set idNegocio(int value) => setField<int>('id_negocio', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String get nome => getField<String>('nome')!;
  set nome(String value) => setField<String>('nome', value);

  String get email => getField<String>('email')!;
  set email(String value) => setField<String>('email', value);

  String? get telefone => getField<String>('telefone');
  set telefone(String? value) => setField<String>('telefone', value);

  String? get endereco => getField<String>('endereco');
  set endereco(String? value) => setField<String>('endereco', value);

  String? get cidade => getField<String>('cidade');
  set cidade(String? value) => setField<String>('cidade', value);

  String? get estado => getField<String>('estado');
  set estado(String? value) => setField<String>('estado', value);

  String? get pais => getField<String>('pais');
  set pais(String? value) => setField<String>('pais', value);

  String? get descricao => getField<String>('descricao');
  set descricao(String? value) => setField<String>('descricao', value);

  List<String> get social => getListField<String>('social');
  set social(List<String>? value) => setListField<String>('social', value);

  String? get nomeUsuario => getField<String>('nome_usuario');
  set nomeUsuario(String? value) => setField<String>('nome_usuario', value);

  int? get usuarioAdministrador => getField<int>('usuario_administrador');
  set usuarioAdministrador(int? value) =>
      setField<int>('usuario_administrador', value);

  String? get linkLocalizacao => getField<String>('link_localização');
  set linkLocalizacao(String? value) =>
      setField<String>('link_localização', value);
}
