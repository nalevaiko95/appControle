import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'carrinho2_widget.dart' show Carrinho2Widget;
import 'dart:async';
import 'package:flutter/material.dart';

class Carrinho2Model extends FlutterFlowModel<Carrinho2Widget> {
  ///  Local state fields for this page.

  String? cliente;

  int? numeroPedido;

  int? indice;

  DateTime? data;

  int? idCliente;

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  DateTime? datePicked;
  // State field(s) for DropDownCliente widget.
  String? dropDownClienteValue;
  FormFieldController<String>? dropDownClienteValueController;
  Completer<List<ControleClientesRow>>? requestCompleter;
  // State field(s) for txtNome widget.
  FocusNode? txtNomeFocusNode;
  TextEditingController? txtNomeTextController;
  String? Function(BuildContext, String?)? txtNomeTextControllerValidator;
  String? _txtNomeTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Campo Obrigatório!';
    }

    return null;
  }

  // State field(s) for txtValor widget.
  FocusNode? txtValorFocusNode;
  TextEditingController? txtValorTextController;
  String? Function(BuildContext, String?)? txtValorTextControllerValidator;
  String? _txtValorTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Campo Obrigatório!';
    }

    return null;
  }

  // State field(s) for txtQtd widget.
  FocusNode? txtQtdFocusNode;
  TextEditingController? txtQtdTextController;
  String? Function(BuildContext, String?)? txtQtdTextControllerValidator;
  // State field(s) for txtObs widget.
  FocusNode? txtObsFocusNode;
  TextEditingController? txtObsTextController;
  String? Function(BuildContext, String?)? txtObsTextControllerValidator;
  // State field(s) for RadioButton widget.
  FormFieldController<String>? radioButtonValueController;

  @override
  void initState(BuildContext context) {
    txtNomeTextControllerValidator = _txtNomeTextControllerValidator;
    txtValorTextControllerValidator = _txtValorTextControllerValidator;
  }

  @override
  void dispose() {
    tabBarController?.dispose();
    textFieldFocusNode?.dispose();
    textController1?.dispose();

    txtNomeFocusNode?.dispose();
    txtNomeTextController?.dispose();

    txtValorFocusNode?.dispose();
    txtValorTextController?.dispose();

    txtQtdFocusNode?.dispose();
    txtQtdTextController?.dispose();

    txtObsFocusNode?.dispose();
    txtObsTextController?.dispose();
  }

  /// Additional helper methods.
  Future waitForRequestCompleted({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(const Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = requestCompleter?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }

  String? get radioButtonValue => radioButtonValueController?.value;
}
