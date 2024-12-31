import '/auth/supabase_auth/auth_util.dart';
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'add_carrinho_model.dart';
export 'add_carrinho_model.dart';

class AddCarrinhoWidget extends StatefulWidget {
  const AddCarrinhoWidget({
    super.key,
    this.refresh,
    required this.idProduto,
  });

  final Future Function()? refresh;
  final int? idProduto;

  @override
  State<AddCarrinhoWidget> createState() => _AddCarrinhoWidgetState();
}

class _AddCarrinhoWidgetState extends State<AddCarrinhoWidget>
    with TickerProviderStateMixin {
  late AddCarrinhoModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AddCarrinhoModel());

    _model.txtNomeItemFocusNode ??= FocusNode();

    _model.txtUnidadeItemFocusNode ??= FocusNode();
    _model.txtUnidadeItemFocusNode!.addListener(() => safeSetState(() {}));
    _model.txtQuantidadeTextController ??= TextEditingController();
    _model.txtQuantidadeFocusNode ??= FocusNode();
    _model.txtQuantidadeFocusNode!.addListener(() => safeSetState(() {}));

    _model.txtValorItemFocusNode ??= FocusNode();
    _model.txtValorItemFocusNode!.addListener(() => safeSetState(() {}));
    animationsMap.addAll({
      'containerOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 1.ms),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 400.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 400.0.ms,
            begin: const Offset(0.0, 80.0),
            end: const Offset(0.0, 0.0),
          ),
          ScaleEffect(
            curve: Curves.easeInOut,
            delay: 150.0.ms,
            duration: 400.0.ms,
            begin: const Offset(0.8, 0.8),
            end: const Offset(1.0, 1.0),
          ),
        ],
      ),
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {
          _model.txtQuantidadeTextController?.text = '1';
        }));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: const AlignmentDirectional(0.0, 0.0),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: FutureBuilder<List<ControleCadastroProdutosRow>>(
          future: ControleCadastroProdutosTable().querySingleRow(
            queryFn: (q) => q
                .eqOrNull(
                  'id',
                  widget.idProduto,
                )
                .eqOrNull(
                  'usuario',
                  currentUserUid,
                ),
          ),
          builder: (context, snapshot) {
            // Customize what your widget looks like when it's loading.
            if (!snapshot.hasData) {
              return Center(
                child: SizedBox(
                  width: 50.0,
                  height: 50.0,
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(
                      FlutterFlowTheme.of(context).primary,
                    ),
                  ),
                ),
              );
            }
            List<ControleCadastroProdutosRow>
                containerControleCadastroProdutosRowList = snapshot.data!;

            final containerControleCadastroProdutosRow =
                containerControleCadastroProdutosRowList.isNotEmpty
                    ? containerControleCadastroProdutosRowList.first
                    : null;

            return Container(
              width: double.infinity,
              height: double.infinity,
              constraints: BoxConstraints(
                maxWidth: MediaQuery.sizeOf(context).width * 5.0,
                maxHeight: MediaQuery.sizeOf(context).height * 1.0,
              ),
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
                boxShadow: const [
                  BoxShadow(
                    blurRadius: 4.0,
                    color: Color(0x33000000),
                    offset: Offset(
                      0.0,
                      2.0,
                    ),
                  )
                ],
                borderRadius: BorderRadius.circular(0.0),
                border: Border.all(
                  color: FlutterFlowTheme.of(context).primaryBackground,
                  width: 2.0,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Adicionar item',
                          style:
                              FlutterFlowTheme.of(context).titleLarge.override(
                                    fontFamily: 'Readex Pro',
                                    color: Colors.black,
                                    letterSpacing: 0.0,
                                  ),
                        ),
                        InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            Navigator.pop(context);
                          },
                          child: Icon(
                            Icons.close,
                            color: FlutterFlowTheme.of(context).primaryText,
                            size: 24.0,
                          ),
                        ),
                      ],
                    ),
                    Align(
                      alignment: const AlignmentDirectional(0.0, -1.0),
                      child: Form(
                        key: _model.formKey,
                        autovalidateMode: AutovalidateMode.disabled,
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextFormField(
                              controller: _model.txtNomeItemTextController ??=
                                  TextEditingController(
                                text:
                                    containerControleCadastroProdutosRow?.nome,
                              ),
                              focusNode: _model.txtNomeItemFocusNode,
                              autofocus: true,
                              obscureText: false,
                              decoration: InputDecoration(
                                labelText: 'Descrição ',
                                hintStyle: FlutterFlowTheme.of(context)
                                    .labelLarge
                                    .override(
                                      fontFamily: 'Readex Pro',
                                      letterSpacing: 0.0,
                                    ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color:
                                        FlutterFlowTheme.of(context).alternate,
                                    width: 2.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).primary,
                                    width: 2.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).error,
                                    width: 2.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).error,
                                    width: 2.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                contentPadding: const EdgeInsetsDirectional.fromSTEB(
                                    8.0, 0.0, 0.0, 0.0),
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .labelLarge
                                  .override(
                                    fontFamily: 'Readex Pro',
                                    letterSpacing: 0.0,
                                  ),
                              validator: _model
                                  .txtNomeItemTextControllerValidator
                                  .asValidator(context),
                            ),
                            TextFormField(
                              controller:
                                  _model.txtUnidadeItemTextController ??=
                                      TextEditingController(
                                text: containerControleCadastroProdutosRow
                                    ?.unidadeMedida,
                              ),
                              focusNode: _model.txtUnidadeItemFocusNode,
                              autofocus: true,
                              textCapitalization: TextCapitalization.characters,
                              obscureText: false,
                              decoration: InputDecoration(
                                labelText:
                                    'Unidade de medida: (UN, LT, MT, KG)',
                                hintStyle: FlutterFlowTheme.of(context)
                                    .labelLarge
                                    .override(
                                      fontFamily: 'Readex Pro',
                                      letterSpacing: 0.0,
                                    ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color:
                                        FlutterFlowTheme.of(context).alternate,
                                    width: 2.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).primary,
                                    width: 2.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).error,
                                    width: 2.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).error,
                                    width: 2.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                contentPadding: const EdgeInsetsDirectional.fromSTEB(
                                    8.0, 0.0, 0.0, 0.0),
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .labelLarge
                                  .override(
                                    fontFamily: 'Readex Pro',
                                    letterSpacing: 0.0,
                                  ),
                              validator: _model
                                  .txtUnidadeItemTextControllerValidator
                                  .asValidator(context),
                            ),
                            TextFormField(
                              controller: _model.txtQuantidadeTextController,
                              focusNode: _model.txtQuantidadeFocusNode,
                              autofocus: true,
                              obscureText: false,
                              decoration: InputDecoration(
                                labelText: 'Quantidade',
                                hintStyle: FlutterFlowTheme.of(context)
                                    .labelLarge
                                    .override(
                                      fontFamily: 'Readex Pro',
                                      letterSpacing: 0.0,
                                    ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color:
                                        FlutterFlowTheme.of(context).alternate,
                                    width: 2.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).primary,
                                    width: 2.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).error,
                                    width: 2.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).error,
                                    width: 2.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                contentPadding: const EdgeInsetsDirectional.fromSTEB(
                                    8.0, 0.0, 0.0, 0.0),
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .labelLarge
                                  .override(
                                    fontFamily: 'Readex Pro',
                                    letterSpacing: 0.0,
                                  ),
                              keyboardType: TextInputType.number,
                              validator: _model
                                  .txtQuantidadeTextControllerValidator
                                  .asValidator(context),
                            ),
                            TextFormField(
                              controller: _model.txtValorItemTextController ??=
                                  TextEditingController(
                                text: formatNumber(
                                  containerControleCadastroProdutosRow
                                      ?.valorVenda,
                                  formatType: FormatType.custom,
                                  currency: 'R\$ ',
                                  format: '#,##0.00',
                                  locale: 'pt_br',
                                ),
                              ),
                              focusNode: _model.txtValorItemFocusNode,
                              onChanged: (_) => EasyDebounce.debounce(
                                '_model.txtValorItemTextController',
                                const Duration(milliseconds: 0),
                                () async {
                                  safeSetState(() {
                                    _model.txtValorItemTextController?.text =
                                        functions.converteParaReal(_model
                                            .txtValorItemTextController.text)!;
                                  });
                                },
                              ),
                              autofocus: true,
                              obscureText: false,
                              decoration: InputDecoration(
                                labelText: 'Valor ',
                                hintStyle: FlutterFlowTheme.of(context)
                                    .labelLarge
                                    .override(
                                      fontFamily: 'Readex Pro',
                                      letterSpacing: 0.0,
                                    ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color:
                                        FlutterFlowTheme.of(context).alternate,
                                    width: 2.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).primary,
                                    width: 2.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).error,
                                    width: 2.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).error,
                                    width: 2.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                contentPadding: const EdgeInsetsDirectional.fromSTEB(
                                    8.0, 0.0, 0.0, 0.0),
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .labelLarge
                                  .override(
                                    fontFamily: 'Readex Pro',
                                    letterSpacing: 0.0,
                                  ),
                              keyboardType: TextInputType.number,
                              validator: _model
                                  .txtValorItemTextControllerValidator
                                  .asValidator(context),
                            ),
                            Align(
                              alignment: const AlignmentDirectional(0.0, 0.0),
                              child: FFButtonWidget(
                                onPressed: () async {
                                  if (_model.formKey.currentState == null ||
                                      !_model.formKey.currentState!
                                          .validate()) {
                                    return;
                                  }
                                  FFAppState()
                                      .addToItensCarrinho(CarrinhoStruct(
                                    idProduto: widget.idProduto,
                                    nome: _model.txtNomeItemTextController.text,
                                    preco: functions.converteParaDouble(
                                        _model.txtValorItemTextController.text),
                                    quantidade: double.tryParse(_model
                                        .txtQuantidadeTextController.text),
                                    total: double.parse(_model
                                            .txtQuantidadeTextController.text) *
                                        (functions.converteParaDouble(_model
                                            .txtValorItemTextController.text)!),
                                    unidade: _model
                                        .txtUnidadeItemTextController.text,
                                  ));
                                  safeSetState(() {});
                                  await action_blocks.calculaCarrinho(context);
                                  Navigator.pop(context);
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        'Adicionado!',
                                        style: TextStyle(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                        ),
                                      ),
                                      duration: const Duration(milliseconds: 2000),
                                      backgroundColor:
                                          FlutterFlowTheme.of(context).primary,
                                    ),
                                  );
                                },
                                text: 'Salvar',
                                options: FFButtonOptions(
                                  width: 230.0,
                                  height: 40.0,
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  color: FlutterFlowTheme.of(context).primary,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .override(
                                        fontFamily: 'Readex Pro',
                                        color: Colors.white,
                                        letterSpacing: 0.0,
                                      ),
                                  elevation: 3.0,
                                  borderSide: const BorderSide(
                                    color: Colors.transparent,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                              ),
                            ),
                          ].divide(const SizedBox(height: 16.0)),
                        ),
                      ),
                    ),
                  ].divide(const SizedBox(height: 16.0)),
                ),
              ),
            ).animateOnPageLoad(animationsMap['containerOnPageLoadAnimation']!);
          },
        ),
      ),
    );
  }
}
