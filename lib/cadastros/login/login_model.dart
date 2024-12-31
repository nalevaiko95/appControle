import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'login_widget.dart' show LoginWidget;
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class LoginModel extends FlutterFlowModel<LoginWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // State field(s) for txtNome widget.
  FocusNode? txtNomeFocusNode;
  TextEditingController? txtNomeTextController;
  String? Function(BuildContext, String?)? txtNomeTextControllerValidator;
  // State field(s) for txtEmail widget.
  FocusNode? txtEmailFocusNode1;
  TextEditingController? txtEmailTextController1;
  String? Function(BuildContext, String?)? txtEmailTextController1Validator;
  // State field(s) for txtEmail widget.
  FocusNode? txtEmailFocusNode2;
  TextEditingController? txtEmailTextController2;
  final txtEmailMask2 = MaskTextInputFormatter(mask: '(##)#####-####');
  String? Function(BuildContext, String?)? txtEmailTextController2Validator;
  // State field(s) for txtSenha widget.
  FocusNode? txtSenhaFocusNode;
  TextEditingController? txtSenhaTextController;
  late bool txtSenhaVisibility;
  String? Function(BuildContext, String?)? txtSenhaTextControllerValidator;
  // State field(s) for txtConfirmaSenha widget.
  FocusNode? txtConfirmaSenhaFocusNode;
  TextEditingController? txtConfirmaSenhaTextController;
  late bool txtConfirmaSenhaVisibility;
  String? Function(BuildContext, String?)?
      txtConfirmaSenhaTextControllerValidator;
  // Stores action output result for [Backend Call - Insert Row] action in Button widget.
  ControleUsuariosRow? retorno;
  // State field(s) for txtEmailUsuario widget.
  FocusNode? txtEmailUsuarioFocusNode;
  TextEditingController? txtEmailUsuarioTextController;
  String? Function(BuildContext, String?)?
      txtEmailUsuarioTextControllerValidator;
  // State field(s) for txtSenhaUsuario widget.
  FocusNode? txtSenhaUsuarioFocusNode;
  TextEditingController? txtSenhaUsuarioTextController;
  late bool txtSenhaUsuarioVisibility;
  String? Function(BuildContext, String?)?
      txtSenhaUsuarioTextControllerValidator;

  @override
  void initState(BuildContext context) {
    txtSenhaVisibility = false;
    txtConfirmaSenhaVisibility = false;
    txtSenhaUsuarioVisibility = false;
  }

  @override
  void dispose() {
    tabBarController?.dispose();
    txtNomeFocusNode?.dispose();
    txtNomeTextController?.dispose();

    txtEmailFocusNode1?.dispose();
    txtEmailTextController1?.dispose();

    txtEmailFocusNode2?.dispose();
    txtEmailTextController2?.dispose();

    txtSenhaFocusNode?.dispose();
    txtSenhaTextController?.dispose();

    txtConfirmaSenhaFocusNode?.dispose();
    txtConfirmaSenhaTextController?.dispose();

    txtEmailUsuarioFocusNode?.dispose();
    txtEmailUsuarioTextController?.dispose();

    txtSenhaUsuarioFocusNode?.dispose();
    txtSenhaUsuarioTextController?.dispose();
  }
}
