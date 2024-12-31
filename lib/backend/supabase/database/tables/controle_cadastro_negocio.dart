import '../database.dart';

class ControleCadastroNegocioTable
    extends SupabaseTable<ControleCadastroNegocioRow> {
  @override
  String get tableName => 'controle_cadastro_negocio';

  @override
  ControleCadastroNegocioRow createRow(Map<String, dynamic> data) =>
      ControleCadastroNegocioRow(data);
}

class ControleCadastroNegocioRow extends SupabaseDataRow {
  ControleCadastroNegocioRow(super.data);

  @override
  SupabaseTable get table => ControleCadastroNegocioTable();

  int get idNegocio => getField<int>('id_negocio')!;
  set idNegocio(int value) => setField<int>('id_negocio', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String get nomeFantasia => getField<String>('nome_fantasia')!;
  set nomeFantasia(String value) => setField<String>('nome_fantasia', value);

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

  String? get linkLocalizacao => getField<String>('link_localização');
  set linkLocalizacao(String? value) =>
      setField<String>('link_localização', value);

  String? get usuarioAdministrador => getField<String>('usuario_administrador');
  set usuarioAdministrador(String? value) =>
      setField<String>('usuario_administrador', value);

  bool? get status => getField<bool>('status');
  set status(bool? value) => setField<bool>('status', value);

  String? get razaoSocial => getField<String>('razao_social');
  set razaoSocial(String? value) => setField<String>('razao_social', value);

  String? get cnpj => getField<String>('cnpj');
  set cnpj(String? value) => setField<String>('cnpj', value);

  String? get inscricaoEstadual => getField<String>('inscricao_estadual');
  set inscricaoEstadual(String? value) =>
      setField<String>('inscricao_estadual', value);

  String? get rua => getField<String>('rua');
  set rua(String? value) => setField<String>('rua', value);

  double? get numero => getField<double>('numero');
  set numero(double? value) => setField<double>('numero', value);

  String? get bairro => getField<String>('bairro');
  set bairro(String? value) => setField<String>('bairro', value);

  String? get logo => getField<String>('logo');
  set logo(String? value) => setField<String>('logo', value);
}
