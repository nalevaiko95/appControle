import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'cadastro_negocio_widget.dart' show CadastroNegocioWidget;
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class CadastroNegocioModel extends FlutterFlowModel<CadastroNegocioWidget> {
  ///  Local state fields for this page.

  String? fotoUrl;

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  bool isDataUploading1 = false;
  FFUploadedFile uploadedLocalFile1 =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  // State field(s) for txtNome widget.
  FocusNode? txtNomeFocusNode;
  TextEditingController? txtNomeTextController;
  String? Function(BuildContext, String?)? txtNomeTextControllerValidator;
  // State field(s) for txtDescricao widget.
  FocusNode? txtDescricaoFocusNode;
  TextEditingController? txtDescricaoTextController;
  String? Function(BuildContext, String?)? txtDescricaoTextControllerValidator;
  // State field(s) for txtTelefone widget.
  FocusNode? txtTelefoneFocusNode;
  TextEditingController? txtTelefoneTextController;
  final txtTelefoneMask = MaskTextInputFormatter(mask: '(##) #-####-####');
  String? Function(BuildContext, String?)? txtTelefoneTextControllerValidator;
  // State field(s) for txtEmail widget.
  FocusNode? txtEmailFocusNode;
  TextEditingController? txtEmailTextController;
  String? Function(BuildContext, String?)? txtEmailTextControllerValidator;
  // State field(s) for txtRua widget.
  FocusNode? txtRuaFocusNode;
  TextEditingController? txtRuaTextController;
  String? Function(BuildContext, String?)? txtRuaTextControllerValidator;
  // State field(s) for txtNumero widget.
  FocusNode? txtNumeroFocusNode;
  TextEditingController? txtNumeroTextController;
  String? Function(BuildContext, String?)? txtNumeroTextControllerValidator;
  // State field(s) for txtBairro widget.
  FocusNode? txtBairroFocusNode;
  TextEditingController? txtBairroTextController;
  String? Function(BuildContext, String?)? txtBairroTextControllerValidator;
  // State field(s) for txtCidade widget.
  FocusNode? txtCidadeFocusNode;
  TextEditingController? txtCidadeTextController;
  String? Function(BuildContext, String?)? txtCidadeTextControllerValidator;
  // State field(s) for txtEstado widget.
  FocusNode? txtEstadoFocusNode;
  TextEditingController? txtEstadoTextController;
  String? Function(BuildContext, String?)? txtEstadoTextControllerValidator;
  // State field(s) for txtRazao widget.
  FocusNode? txtRazaoFocusNode;
  TextEditingController? txtRazaoTextController;
  String? Function(BuildContext, String?)? txtRazaoTextControllerValidator;
  // State field(s) for txtCNPJ widget.
  FocusNode? txtCNPJFocusNode;
  TextEditingController? txtCNPJTextController;
  final txtCNPJMask = MaskTextInputFormatter(mask: '##.###.###/####-##');
  String? Function(BuildContext, String?)? txtCNPJTextControllerValidator;
  // State field(s) for txtIE widget.
  FocusNode? txtIEFocusNode;
  TextEditingController? txtIETextController;
  String? Function(BuildContext, String?)? txtIETextControllerValidator;
  bool isDataUploading2 = false;
  FFUploadedFile uploadedLocalFile2 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl2 = '';

  // Stores action output result for [Backend Call - Insert Row] action in Button widget.
  ControleCadastroNegocioRow? novoNegocio;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    txtNomeFocusNode?.dispose();
    txtNomeTextController?.dispose();

    txtDescricaoFocusNode?.dispose();
    txtDescricaoTextController?.dispose();

    txtTelefoneFocusNode?.dispose();
    txtTelefoneTextController?.dispose();

    txtEmailFocusNode?.dispose();
    txtEmailTextController?.dispose();

    txtRuaFocusNode?.dispose();
    txtRuaTextController?.dispose();

    txtNumeroFocusNode?.dispose();
    txtNumeroTextController?.dispose();

    txtBairroFocusNode?.dispose();
    txtBairroTextController?.dispose();

    txtCidadeFocusNode?.dispose();
    txtCidadeTextController?.dispose();

    txtEstadoFocusNode?.dispose();
    txtEstadoTextController?.dispose();

    txtRazaoFocusNode?.dispose();
    txtRazaoTextController?.dispose();

    txtCNPJFocusNode?.dispose();
    txtCNPJTextController?.dispose();

    txtIEFocusNode?.dispose();
    txtIETextController?.dispose();
  }
}
