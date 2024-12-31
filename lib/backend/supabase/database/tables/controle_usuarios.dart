import '../database.dart';

class ControleUsuariosTable extends SupabaseTable<ControleUsuariosRow> {
  @override
  String get tableName => 'controle_usuarios';

  @override
  ControleUsuariosRow createRow(Map<String, dynamic> data) =>
      ControleUsuariosRow(data);
}

class ControleUsuariosRow extends SupabaseDataRow {
  ControleUsuariosRow(super.data);

  @override
  SupabaseTable get table => ControleUsuariosTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String get uid => getField<String>('uid')!;
  set uid(String value) => setField<String>('uid', value);

  String? get nome => getField<String>('nome');
  set nome(String? value) => setField<String>('nome', value);

  String? get senha => getField<String>('senha');
  set senha(String? value) => setField<String>('senha', value);

  String? get email => getField<String>('email');
  set email(String? value) => setField<String>('email', value);

  String? get telefone => getField<String>('telefone');
  set telefone(String? value) => setField<String>('telefone', value);
}
