import '../database.dart';

class ControleCategoriasProdutosTable
    extends SupabaseTable<ControleCategoriasProdutosRow> {
  @override
  String get tableName => 'controle_categorias_produtos';

  @override
  ControleCategoriasProdutosRow createRow(Map<String, dynamic> data) =>
      ControleCategoriasProdutosRow(data);
}

class ControleCategoriasProdutosRow extends SupabaseDataRow {
  ControleCategoriasProdutosRow(super.data);

  @override
  SupabaseTable get table => ControleCategoriasProdutosTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get nome => getField<String>('nome');
  set nome(String? value) => setField<String>('nome', value);

  String? get usuario => getField<String>('usuario');
  set usuario(String? value) => setField<String>('usuario', value);
}
