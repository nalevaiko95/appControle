import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'controle_times_widget.dart' show ControleTimesWidget;
import 'package:flutter/material.dart';

class ControleTimesModel extends FlutterFlowModel<ControleTimesWidget> {
  ///  Local state fields for this page.

  String? nomeTime;

  ///  State fields for stateful widgets in this page.

  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // Stores action output result for [Backend Call - Query Rows] action in ListTile widget.
  List<AppControleTimesRow>? timeSelecionado;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    tabBarController?.dispose();
  }
}
