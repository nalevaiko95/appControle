import '/flutter_flow/flutter_flow_util.dart';
import 'trocar_senha_widget.dart' show TrocarSenhaWidget;
import 'package:flutter/material.dart';

class TrocarSenhaModel extends FlutterFlowModel<TrocarSenhaWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for txtEmail widget.
  FocusNode? txtEmailFocusNode;
  TextEditingController? txtEmailTextController;
  String? Function(BuildContext, String?)? txtEmailTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    txtEmailFocusNode?.dispose();
    txtEmailTextController?.dispose();
  }
}
