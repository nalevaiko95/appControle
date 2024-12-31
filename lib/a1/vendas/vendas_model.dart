import '/flutter_flow/flutter_flow_util.dart';
import 'vendas_widget.dart' show VendasWidget;
import 'package:flutter/material.dart';

class VendasModel extends FlutterFlowModel<VendasWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    tabBarController?.dispose();
  }
}
