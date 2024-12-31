import '../database.dart';

class ControleClientesTable extends SupabaseTable<ControleClientesRow> {
  @override
  String get tableName => 'controle_clientes';

  @override
  ControleClientesRow createRow(Map<String, dynamic> data) =>
      ControleClientesRow(data);
}

class ControleClientesRow extends SupabaseDataRow {
  ControleClientesRow(super.data);

  @override
  SupabaseTable get table => ControleClientesTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get nome => getField<String>('nome');
  set nome(String? value) => setField<String>('nome', value);

  String? get contato => getField<String>('contato');
  set contato(String? value) => setField<String>('contato', value);

  String? get usuario => getField<String>('usuario');
  set usuario(String? value) => setField<String>('usuario', value);

  List<String> get obs => getListField<String>('obs');
  set obs(List<String>? value) => setListField<String>('obs', value);

  int? get idNegocio => getField<int>('id_negocio');
  set idNegocio(int? value) => setField<int>('id_negocio', value);

  String? get tipoInscricao => getField<String>('tipoInscricao');
  set tipoInscricao(String? value) => setField<String>('tipoInscricao', value);

  String? get numeroInscricao => getField<String>('numeroInscricao');
  set numeroInscricao(String? value) =>
      setField<String>('numeroInscricao', value);

  String? get logradouro => getField<String>('logradouro');
  set logradouro(String? value) => setField<String>('logradouro', value);

  String? get cep => getField<String>('CEP');
  set cep(String? value) => setField<String>('CEP', value);

  String? get numero => getField<String>('numero');
  set numero(String? value) => setField<String>('numero', value);

  String? get complemento => getField<String>('complemento');
  set complemento(String? value) => setField<String>('complemento', value);

  String? get bairro => getField<String>('bairro');
  set bairro(String? value) => setField<String>('bairro', value);

  String? get cidade => getField<String>('cidade');
  set cidade(String? value) => setField<String>('cidade', value);

  String? get estado => getField<String>('estado');
  set estado(String? value) => setField<String>('estado', value);

  DateTime? get aniversario => getField<DateTime>('aniversario');
  set aniversario(DateTime? value) => setField<DateTime>('aniversario', value);
}
