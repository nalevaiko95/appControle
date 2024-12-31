import '/flutter_flow/flutter_flow_util.dart';
import 'add_carrinho_widget.dart' show AddCarrinhoWidget;
import 'package:flutter/material.dart';

class AddCarrinhoModel extends FlutterFlowModel<AddCarrinhoWidget> {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for txtNomeItem widget.
  FocusNode? txtNomeItemFocusNode;
  TextEditingController? txtNomeItemTextController;
  String? Function(BuildContext, String?)? txtNomeItemTextControllerValidator;
  String? _txtNomeItemTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Campo Obrigatório!';
    }

    return null;
  }

  // State field(s) for txtUnidadeItem widget.
  FocusNode? txtUnidadeItemFocusNode;
  TextEditingController? txtUnidadeItemTextController;
  String? Function(BuildContext, String?)?
      txtUnidadeItemTextControllerValidator;
  String? _txtUnidadeItemTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Campo Obrigatório!';
    }

    return null;
  }

  // State field(s) for txtQuantidade widget.
  FocusNode? txtQuantidadeFocusNode;
  TextEditingController? txtQuantidadeTextController;
  String? Function(BuildContext, String?)? txtQuantidadeTextControllerValidator;
  String? _txtQuantidadeTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Campo Obrigatório!';
    }

    return null;
  }

  // State field(s) for txtValorItem widget.
  FocusNode? txtValorItemFocusNode;
  TextEditingController? txtValorItemTextController;
  String? Function(BuildContext, String?)? txtValorItemTextControllerValidator;
  String? _txtValorItemTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Campo Obrigatório!';
    }

    return null;
  }

  @override
  void initState(BuildContext context) {
    txtNomeItemTextControllerValidator = _txtNomeItemTextControllerValidator;
    txtUnidadeItemTextControllerValidator =
        _txtUnidadeItemTextControllerValidator;
    txtQuantidadeTextControllerValidator =
        _txtQuantidadeTextControllerValidator;
    txtValorItemTextControllerValidator = _txtValorItemTextControllerValidator;
  }

  @override
  void dispose() {
    txtNomeItemFocusNode?.dispose();
    txtNomeItemTextController?.dispose();

    txtUnidadeItemFocusNode?.dispose();
    txtUnidadeItemTextController?.dispose();

    txtQuantidadeFocusNode?.dispose();
    txtQuantidadeTextController?.dispose();

    txtValorItemFocusNode?.dispose();
    txtValorItemTextController?.dispose();
  }
}
