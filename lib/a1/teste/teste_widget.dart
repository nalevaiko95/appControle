import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'teste_model.dart';
export 'teste_model.dart';

class TesteWidget extends StatefulWidget {
  const TesteWidget({super.key});

  @override
  State<TesteWidget> createState() => _TesteWidgetState();
}

class _TesteWidgetState extends State<TesteWidget> {
  late TesteModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TesteModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width * 1.0,
      height: MediaQuery.sizeOf(context).height * 1.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: MediaQuery.sizeOf(context).width * 1.0,
            height: MediaQuery.sizeOf(context).height * 0.7,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).accent2,
            ),
          ),
          Container(
            width: MediaQuery.sizeOf(context).width * 1.0,
            height: MediaQuery.sizeOf(context).height * 0.3,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).tertiary,
            ),
          ),
        ],
      ),
    );
  }
}
