import '/flutter_flow/flutter_flow_util.dart';
import 'novo_pedido_widget.dart' show NovoPedidoWidget;
import 'package:flutter/material.dart';

class NovoPedidoModel extends FlutterFlowModel<NovoPedidoWidget> {
  ///  Local state fields for this page.

  String? cliente;

  String? telefone;

  ///  State fields for stateful widgets in this page.

  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    tabBarController?.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
