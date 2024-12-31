import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:flutter/material.dart';
import 'valor_model.dart';
export 'valor_model.dart';

class ValorWidget extends StatefulWidget {
  const ValorWidget({super.key});

  @override
  State<ValorWidget> createState() => _ValorWidgetState();
}

class _ValorWidgetState extends State<ValorWidget> {
  late ValorModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ValorModel());

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
        title: 'valor',
        color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            appBar: AppBar(
              backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
              automaticallyImplyLeading: false,
              leading: FlutterFlowIconButton(
                borderColor: Colors.transparent,
                borderRadius: 30.0,
                borderWidth: 1.0,
                buttonSize: 60.0,
                icon: Icon(
                  Icons.arrow_back_rounded,
                  color: FlutterFlowTheme.of(context).primary,
                  size: 30.0,
                ),
                onPressed: () async {
                  context.pop();
                },
              ),
              title: Text(
                'Informe o valor',
                style: FlutterFlowTheme.of(context).headlineMedium.override(
                      fontFamily: 'Readex Pro',
                      color: FlutterFlowTheme.of(context).primary,
                      fontSize: 22.0,
                      letterSpacing: 0.0,
                    ),
              ),
              actions: const [],
              centerTitle: true,
              elevation: 2.0,
            ),
            body: SafeArea(
              top: true,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                      width: MediaQuery.sizeOf(context).width * 1.0,
                      height: MediaQuery.sizeOf(context).height * 0.85,
                      constraints: const BoxConstraints(
                        maxWidth: 500.0,
                      ),
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).primaryBackground,
                      ),
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            SizedBox(
                              width: 200.0,
                              height: 50.0,
                              child: custom_widgets.MoedaBRField(
                                width: 200.0,
                                height: 50.0,
                                bordercolor:
                                    FlutterFlowTheme.of(context).primary,
                                borderRadius: 0.0,
                                initialValue: '0',
                              ),
                            ),
                            SizedBox(
                              width: MediaQuery.sizeOf(context).width * 0.7,
                              height: 60.0,
                              child: custom_widgets.BrasilTextField(
                                width: MediaQuery.sizeOf(context).width * 0.7,
                                height: 60.0,
                                filledColor: FlutterFlowTheme.of(context)
                                    .primaryBackground,
                                fontSize: 20.0,
                                colorText: FlutterFlowTheme.of(context).primary,
                                borderColor: FlutterFlowTheme.of(context)
                                    .primaryBackground,
                                borderRadius: 0,
                                borderSize: 0,
                              ),
                            ),
                          ]
                              .divide(const SizedBox(height: 10.0))
                              .around(const SizedBox(height: 10.0)),
                        ),
                      ),
                    ),
                  ].divide(const SizedBox(height: 10.0)),
                ),
              ),
            ),
          ),
        ));
  }
}
