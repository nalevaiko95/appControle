import '../database.dart';

class ReservaOrganizadorTable extends SupabaseTable<ReservaOrganizadorRow> {
  @override
  String get tableName => 'reserva_organizador';

  @override
  ReservaOrganizadorRow createRow(Map<String, dynamic> data) =>
      ReservaOrganizadorRow(data);
}

class ReservaOrganizadorRow extends SupabaseDataRow {
  ReservaOrganizadorRow(super.data);

  @override
  SupabaseTable get table => ReservaOrganizadorTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get nomeOrganizador => getField<String>('nome_organizador');
  set nomeOrganizador(String? value) =>
      setField<String>('nome_organizador', value);

  String? get contatoOrganizador => getField<String>('contato_organizador');
  set contatoOrganizador(String? value) =>
      setField<String>('contato_organizador', value);

  DateTime? get dataNascimento => getField<DateTime>('data_nascimento');
  set dataNascimento(DateTime? value) =>
      setField<DateTime>('data_nascimento', value);

  String? get senhaOrganizador => getField<String>('senha_organizador');
  set senhaOrganizador(String? value) =>
      setField<String>('senha_organizador', value);

  String? get tipoOrganizador => getField<String>('tipo_organizador');
  set tipoOrganizador(String? value) =>
      setField<String>('tipo_organizador', value);
}
