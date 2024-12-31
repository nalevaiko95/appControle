import '../database.dart';

class ReservaUsuariosTable extends SupabaseTable<ReservaUsuariosRow> {
  @override
  String get tableName => 'reserva_usuarios';

  @override
  ReservaUsuariosRow createRow(Map<String, dynamic> data) =>
      ReservaUsuariosRow(data);
}

class ReservaUsuariosRow extends SupabaseDataRow {
  ReservaUsuariosRow(super.data);

  @override
  SupabaseTable get table => ReservaUsuariosTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get nomeUsuario => getField<String>('nome_usuario');
  set nomeUsuario(String? value) => setField<String>('nome_usuario', value);

  String? get telefoneUsuario => getField<String>('telefone_usuario');
  set telefoneUsuario(String? value) =>
      setField<String>('telefone_usuario', value);

  DateTime? get dataNascimento => getField<DateTime>('data_nascimento');
  set dataNascimento(DateTime? value) =>
      setField<DateTime>('data_nascimento', value);

  String? get senhaUsuario => getField<String>('senha_usuario');
  set senhaUsuario(String? value) => setField<String>('senha_usuario', value);

  String? get tipoUsuario => getField<String>('tipo_usuario');
  set tipoUsuario(String? value) => setField<String>('tipo_usuario', value);
}
