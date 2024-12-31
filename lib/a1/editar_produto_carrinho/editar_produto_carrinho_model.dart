import '/flutter_flow/flutter_flow_util.dart';
import 'editar_produto_carrinho_widget.dart' show EditarProdutoCarrinhoWidget;
import 'package:flutter/material.dart';

class EditarProdutoCarrinhoModel
    extends FlutterFlowModel<EditarProdutoCarrinhoWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for txtNome widget.
  FocusNode? txtNomeFocusNode1;
  TextEditingController? txtNomeTextController1;
  String? Function(BuildContext, String?)? txtNomeTextController1Validator;
  // State field(s) for txtNome widget.
  FocusNode? txtNomeFocusNode2;
  TextEditingController? txtNomeTextController2;
  String? Function(BuildContext, String?)? txtNomeTextController2Validator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    txtNomeFocusNode1?.dispose();
    txtNomeTextController1?.dispose();

    txtNomeFocusNode2?.dispose();
    txtNomeTextController2?.dispose();
  }
}
