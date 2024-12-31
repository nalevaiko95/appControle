import '../database.dart';

class ViewSomaProducaoTable extends SupabaseTable<ViewSomaProducaoRow> {
  @override
  String get tableName => 'view_soma_producao';

  @override
  ViewSomaProducaoRow createRow(Map<String, dynamic> data) =>
      ViewSomaProducaoRow(data);
}

class ViewSomaProducaoRow extends SupabaseDataRow {
  ViewSomaProducaoRow(super.data);

  @override
  SupabaseTable get table => ViewSomaProducaoTable();

  int? get referencia => getField<int>('referencia');
  set referencia(int? value) => setField<int>('referencia', value);

  double? get somaQuantidadeProduzida =>
      getField<double>('soma_quantidade_produzida');
  set somaQuantidadeProduzida(double? value) =>
      setField<double>('soma_quantidade_produzida', value);

  double? get somaValorTotal => getField<double>('soma_valor_total');
  set somaValorTotal(double? value) =>
      setField<double>('soma_valor_total', value);
}
