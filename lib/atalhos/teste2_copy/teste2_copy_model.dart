import '/flutter_flow/flutter_flow_util.dart';
import 'teste2_copy_widget.dart' show Teste2CopyWidget;
import 'package:flutter/material.dart';

class Teste2CopyModel extends FlutterFlowModel<Teste2CopyWidget> {
  ///  Local state fields for this page.

  List<double> lista = [];
  void addToLista(double item) => lista.add(item);
  void removeFromLista(double item) => lista.remove(item);
  void removeAtIndexFromLista(int index) => lista.removeAt(index);
  void insertAtIndexInLista(int index, double item) =>
      lista.insert(index, item);
  void updateListaAtIndex(int index, Function(double) updateFn) =>
      lista[index] = updateFn(lista[index]);

  int? contador;

  int? limite = 0;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}