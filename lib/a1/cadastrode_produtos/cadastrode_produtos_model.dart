import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'cadastrode_produtos_widget.dart' show CadastrodeProdutosWidget;
import 'package:flutter/material.dart';

class CadastrodeProdutosModel
    extends FlutterFlowModel<CadastrodeProdutosWidget> {
  ///  Local state fields for this component.

  List<String> listaCategorias = [];
  void addToListaCategorias(String item) => listaCategorias.add(item);
  void removeFromListaCategorias(String item) => listaCategorias.remove(item);
  void removeAtIndexFromListaCategorias(int index) =>
      listaCategorias.removeAt(index);
  void insertAtIndexInListaCategorias(int index, String item) =>
      listaCategorias.insert(index, item);
  void updateListaCategoriasAtIndex(int index, Function(String) updateFn) =>
      listaCategorias[index] = updateFn(listaCategorias[index]);

  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for txtNome widget.
  FocusNode? txtNomeFocusNode;
  TextEditingController? txtNomeTextController;
  String? Function(BuildContext, String?)? txtNomeTextControllerValidator;
  // State field(s) for txtVenda widget.
  FocusNode? txtVendaFocusNode;
  TextEditingController? txtVendaTextController;
  String? Function(BuildContext, String?)? txtVendaTextControllerValidator;
  // State field(s) for txtCusto widget.
  FocusNode? txtCustoFocusNode;
  TextEditingController? txtCustoTextController;
  String? Function(BuildContext, String?)? txtCustoTextControllerValidator;
  // State field(s) for txtEstoque widget.
  FocusNode? txtEstoqueFocusNode;
  TextEditingController? txtEstoqueTextController;
  String? Function(BuildContext, String?)? txtEstoqueTextControllerValidator;
  // State field(s) for dropCategoria widget.
  String? dropCategoriaValue;
  FormFieldController<String>? dropCategoriaValueController;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    txtNomeFocusNode?.dispose();
    txtNomeTextController?.dispose();

    txtVendaFocusNode?.dispose();
    txtVendaTextController?.dispose();

    txtCustoFocusNode?.dispose();
    txtCustoTextController?.dispose();

    txtEstoqueFocusNode?.dispose();
    txtEstoqueTextController?.dispose();
  }
}
