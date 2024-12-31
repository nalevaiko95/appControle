import '/flutter_flow/flutter_flow_util.dart';
import 'cadastro_categorias_widget.dart' show CadastroCategoriasWidget;
import 'package:flutter/material.dart';

class CadastroCategoriasModel
    extends FlutterFlowModel<CadastroCategoriasWidget> {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for txtNome widget.
  FocusNode? txtNomeFocusNode;
  TextEditingController? txtNomeTextController;
  String? Function(BuildContext, String?)? txtNomeTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    txtNomeFocusNode?.dispose();
    txtNomeTextController?.dispose();
  }
}
