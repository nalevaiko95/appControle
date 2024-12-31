import '/flutter_flow/flutter_flow_util.dart';
import 'b_cadastro_campanha2_widget.dart' show BCadastroCampanha2Widget;
import 'package:flutter/material.dart';

class BCadastroCampanha2Model
    extends FlutterFlowModel<BCadastroCampanha2Widget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for txtNome widget.
  FocusNode? txtNomeFocusNode1;
  TextEditingController? txtNomeTextController1;
  String? Function(BuildContext, String?)? txtNomeTextController1Validator;
  String? _txtNomeTextController1Validator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Campo obrigatório!';
    }

    return null;
  }

  // State field(s) for txtNome widget.
  FocusNode? txtNomeFocusNode2;
  TextEditingController? txtNomeTextController2;
  String? Function(BuildContext, String?)? txtNomeTextController2Validator;
  // State field(s) for Checkbox widget.
  bool? checkboxValue1;
  // State field(s) for Checkbox widget.
  bool? checkboxValue2;
  // State field(s) for Checkbox widget.
  bool? checkboxValue3;
  // State field(s) for Checkbox widget.
  bool? checkboxValue4;

  @override
  void initState(BuildContext context) {
    txtNomeTextController1Validator = _txtNomeTextController1Validator;
  }

  @override
  void dispose() {
    txtNomeFocusNode1?.dispose();
    txtNomeTextController1?.dispose();

    txtNomeFocusNode2?.dispose();
    txtNomeTextController2?.dispose();
  }
}
