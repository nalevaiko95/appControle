import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'carrinho3_model.dart';
export 'carrinho3_model.dart';

class Carrinho3Widget extends StatefulWidget {
  const Carrinho3Widget({super.key});

  @override
  State<Carrinho3Widget> createState() => _Carrinho3WidgetState();
}

class _Carrinho3WidgetState extends State<Carrinho3Widget> {
  late Carrinho3Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => Carrinho3Model());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Title(
        title: 'carrinho3',
        color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: const SafeArea(
              top: true,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [],
              ),
            ),
          ),
        ));
  }
}
