import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'cadastro_clientes_widget.dart' show CadastroClientesWidget;
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class CadastroClientesModel extends FlutterFlowModel<CadastroClientesWidget> {
  ///  Local state fields for this page.

  String? numeroInscricao;

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for txtNome widget.
  FocusNode? txtNomeFocusNode;
  TextEditingController? txtNomeTextController;
  String? Function(BuildContext, String?)? txtNomeTextControllerValidator;
  String? _txtNomeTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Campo obrigatório!';
    }

    return null;
  }

  // State field(s) for txtTelefone widget.
  FocusNode? txtTelefoneFocusNode;
  TextEditingController? txtTelefoneTextController;
  final txtTelefoneMask = MaskTextInputFormatter(mask: '(##)#-####-####');
  String? Function(BuildContext, String?)? txtTelefoneTextControllerValidator;
  String? _txtTelefoneTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Campo obrigatório!';
    }

    return null;
  }

  // State field(s) for Expandable widget.
  late ExpandableController expandableExpandableController;

  // State field(s) for ChoiceChips widget.
  FormFieldController<List<String>>? choiceChipsValueController;
  String? get choiceChipsValue =>
      choiceChipsValueController?.value?.firstOrNull;
  set choiceChipsValue(String? val) =>
      choiceChipsValueController?.value = val != null ? [val] : [];
  // State field(s) for txtNumeroInscricao widget.
  FocusNode? txtNumeroInscricaoFocusNode;
  TextEditingController? txtNumeroInscricaoTextController;
  final txtNumeroInscricaoMask = MaskTextInputFormatter(mask: '###.###.###-##');
  String? Function(BuildContext, String?)?
      txtNumeroInscricaoTextControllerValidator;
  // State field(s) for txtCEP widget.
  FocusNode? txtCEPFocusNode;
  TextEditingController? txtCEPTextController;
  final txtCEPMask = MaskTextInputFormatter(mask: '##.###-###');
  String? Function(BuildContext, String?)? txtCEPTextControllerValidator;
  // State field(s) for txtLogradouro widget.
  FocusNode? txtLogradouroFocusNode;
  TextEditingController? txtLogradouroTextController;
  String? Function(BuildContext, String?)? txtLogradouroTextControllerValidator;
  // State field(s) for txtNumero widget.
  FocusNode? txtNumeroFocusNode;
  TextEditingController? txtNumeroTextController;
  String? Function(BuildContext, String?)? txtNumeroTextControllerValidator;
  // State field(s) for txtComplemento widget.
  FocusNode? txtComplementoFocusNode;
  TextEditingController? txtComplementoTextController;
  String? Function(BuildContext, String?)?
      txtComplementoTextControllerValidator;
  // State field(s) for txtBairro widget.
  FocusNode? txtBairroFocusNode;
  TextEditingController? txtBairroTextController;
  String? Function(BuildContext, String?)? txtBairroTextControllerValidator;
  // State field(s) for txtCidade widget.
  FocusNode? txtCidadeFocusNode;
  TextEditingController? txtCidadeTextController;
  String? Function(BuildContext, String?)? txtCidadeTextControllerValidator;
  // State field(s) for txtEstado widget.
  FocusNode? txtEstadoFocusNode1;
  TextEditingController? txtEstadoTextController1;
  String? Function(BuildContext, String?)? txtEstadoTextController1Validator;
  // State field(s) for txtEstado widget.
  FocusNode? txtEstadoFocusNode2;
  TextEditingController? txtEstadoTextController2;
  final txtEstadoMask2 = MaskTextInputFormatter(mask: '##/##/####');
  String? Function(BuildContext, String?)? txtEstadoTextController2Validator;

  @override
  void initState(BuildContext context) {
    txtNomeTextControllerValidator = _txtNomeTextControllerValidator;
    txtTelefoneTextControllerValidator = _txtTelefoneTextControllerValidator;
  }

  @override
  void dispose() {
    txtNomeFocusNode?.dispose();
    txtNomeTextController?.dispose();

    txtTelefoneFocusNode?.dispose();
    txtTelefoneTextController?.dispose();

    expandableExpandableController.dispose();
    txtNumeroInscricaoFocusNode?.dispose();
    txtNumeroInscricaoTextController?.dispose();

    txtCEPFocusNode?.dispose();
    txtCEPTextController?.dispose();

    txtLogradouroFocusNode?.dispose();
    txtLogradouroTextController?.dispose();

    txtNumeroFocusNode?.dispose();
    txtNumeroTextController?.dispose();

    txtComplementoFocusNode?.dispose();
    txtComplementoTextController?.dispose();

    txtBairroFocusNode?.dispose();
    txtBairroTextController?.dispose();

    txtCidadeFocusNode?.dispose();
    txtCidadeTextController?.dispose();

    txtEstadoFocusNode1?.dispose();
    txtEstadoTextController1?.dispose();

    txtEstadoFocusNode2?.dispose();
    txtEstadoTextController2?.dispose();
  }
}
