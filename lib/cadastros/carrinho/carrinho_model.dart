import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'carrinho_widget.dart' show CarrinhoWidget;
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class CarrinhoModel extends FlutterFlowModel<CarrinhoWidget> {
  ///  Local state fields for this page.

  int? cliente;

  int? numeroPedido;

  int? indice;

  DateTime? data;

  int? idCliente;

  ///  State fields for stateful widgets in this page.

  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  DateTime? datePicked;
  // State field(s) for DropDownClientes widget.
  int? dropDownClientesValue;
  FormFieldController<int>? dropDownClientesValueController;
  // State field(s) for txtVeiculoEquipamento widget.
  FocusNode? txtVeiculoEquipamentoFocusNode;
  TextEditingController? txtVeiculoEquipamentoTextController;
  String? Function(BuildContext, String?)?
      txtVeiculoEquipamentoTextControllerValidator;
  // State field(s) for txtPlacaIdentificacao widget.
  FocusNode? txtPlacaIdentificacaoFocusNode;
  TextEditingController? txtPlacaIdentificacaoTextController;
  final txtPlacaIdentificacaoMask = MaskTextInputFormatter(mask: '###-####');
  String? Function(BuildContext, String?)?
      txtPlacaIdentificacaoTextControllerValidator;
  // State field(s) for txtKM widget.
  FocusNode? txtKMFocusNode;
  TextEditingController? txtKMTextController;
  String? Function(BuildContext, String?)? txtKMTextControllerValidator;
  // State field(s) for txtObs widget.
  FocusNode? txtObsFocusNode;
  TextEditingController? txtObsTextController;
  String? Function(BuildContext, String?)? txtObsTextControllerValidator;
  // State field(s) for DropDownItens widget.
  int? dropDownItensValue;
  FormFieldController<int>? dropDownItensValueController;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController6;
  String? Function(BuildContext, String?)? textController6Validator;
  // State field(s) for RadioButton widget.
  FormFieldController<String>? radioButtonValueController;
  // Stores action output result for [Backend Call - Insert Row] action in Button widget.
  ControlePedidosRow? ultimo;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    tabBarController?.dispose();
    textFieldFocusNode1?.dispose();
    textController1?.dispose();

    txtVeiculoEquipamentoFocusNode?.dispose();
    txtVeiculoEquipamentoTextController?.dispose();

    txtPlacaIdentificacaoFocusNode?.dispose();
    txtPlacaIdentificacaoTextController?.dispose();

    txtKMFocusNode?.dispose();
    txtKMTextController?.dispose();

    txtObsFocusNode?.dispose();
    txtObsTextController?.dispose();

    textFieldFocusNode2?.dispose();
    textController6?.dispose();
  }

  /// Additional helper methods.
  String? get radioButtonValue => radioButtonValueController?.value;
}
