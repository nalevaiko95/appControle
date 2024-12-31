import '/a1/editar_produtos/editar_produtos_widget.dart';
import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'controle_producao_model.dart';
export 'controle_producao_model.dart';

class ControleProducaoWidget extends StatefulWidget {
  const ControleProducaoWidget({
    super.key,
    this.idProducao,
  });

  final int? idProducao;

  @override
  State<ControleProducaoWidget> createState() => _ControleProducaoWidgetState();
}

class _ControleProducaoWidgetState extends State<ControleProducaoWidget>
    with TickerProviderStateMixin {
  late ControleProducaoModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ControleProducaoModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.quantidade = 1.0;
      _model.produto = 'Selecione um produto!';
      _model.valor = 0.0;
      _model.total = 0.0;
      safeSetState(() {});
      safeSetState(() {
        _model.textController?.text = valueOrDefault<String>(
          _model.quantidade.toString(),
          '-',
        );
      });
      _model.total = _model.quantidade * (_model.valor!);
      safeSetState(() {});
    });

    _model.tabBarController = TabController(
      vsync: this,
      length: 2,
      initialIndex: 0,
    )..addListener(() => safeSetState(() {}));
    _model.textController ??= TextEditingController(
        text: valueOrDefault<String>(
      _model.quantidade.toString(),
      '1',
    ));
    _model.textFieldFocusNode ??= FocusNode();

    animationsMap.addAll({
      'containerOnPageLoadAnimation1': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 200.ms),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 200.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'containerOnPageLoadAnimation2': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 250.ms),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 250.0.ms,
            duration: 600.0.ms,
            begin: const Offset(0.0, 70.0),
            end: const Offset(0.0, 0.0),
          ),
        ],
      ),
    });
    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );

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
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).accent4,
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Container(
                width: double.infinity,
                constraints: const BoxConstraints(
                  maxWidth: 670.0,
                ),
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                  boxShadow: const [
                    BoxShadow(
                      blurRadius: 3.0,
                      color: Color(0x33000000),
                      offset: Offset(
                        0.0,
                        1.0,
                      ),
                    )
                  ],
                  borderRadius: BorderRadius.circular(0.0),
                  border: Border.all(
                    color: FlutterFlowTheme.of(context).alternate,
                    width: 1.0,
                  ),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Form(
                      key: _model.formKey,
                      autovalidateMode: AutovalidateMode.always,
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                16.0, 0.0, 0.0, 0.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 4.0),
                                  child: Text(
                                    'Cadastro de produção',
                                    style: FlutterFlowTheme.of(context)
                                        .headlineSmall
                                        .override(
                                          fontFamily: 'Readex Pro',
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                ),
                                FlutterFlowIconButton(
                                  borderColor: Colors.transparent,
                                  borderRadius: 30.0,
                                  borderWidth: 1.0,
                                  buttonSize: 60.0,
                                  icon: Icon(
                                    Icons.close_rounded,
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    size: 30.0,
                                  ),
                                  onPressed: () async {
                                    Navigator.pop(context);
                                  },
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: MediaQuery.sizeOf(context).height * 1.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).primaryBackground,
                      ),
                      child: Column(
                        children: [
                          Align(
                            alignment: const Alignment(0.0, 0),
                            child: TabBar(
                              isScrollable: true,
                              labelColor:
                                  FlutterFlowTheme.of(context).primaryText,
                              unselectedLabelColor:
                                  FlutterFlowTheme.of(context).secondaryText,
                              labelPadding: const EdgeInsetsDirectional.fromSTEB(
                                  32.0, 0.0, 32.0, 0.0),
                              labelStyle: FlutterFlowTheme.of(context)
                                  .titleMedium
                                  .override(
                                    fontFamily: 'Readex Pro',
                                    letterSpacing: 0.0,
                                  ),
                              unselectedLabelStyle: const TextStyle(),
                              indicatorColor:
                                  FlutterFlowTheme.of(context).primary,
                              indicatorWeight: 5.0,
                              tabs: const [
                                Tab(
                                  text: 'Cadastro',
                                ),
                                Tab(
                                  text: 'Conferência',
                                ),
                              ],
                              controller: _model.tabBarController,
                              onTap: (i) async {
                                [() async {}, () async {}][i]();
                              },
                            ),
                          ),
                          Expanded(
                            child: TabBarView(
                              controller: _model.tabBarController,
                              children: [
                                Container(
                                  width: 100.0,
                                  height: 100.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                  ),
                                  child: SingleChildScrollView(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryBackground,
                                          ),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Container(
                                                width:
                                                    MediaQuery.sizeOf(context)
                                                            .width *
                                                        1.0,
                                                height:
                                                    MediaQuery.sizeOf(context)
                                                            .height *
                                                        0.5,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                ),
                                                child: Padding(
                                                  padding: const EdgeInsets.all(16.0),
                                                  child: FutureBuilder<
                                                      List<
                                                          ControleCadastroProdutosRow>>(
                                                    future:
                                                        ControleCadastroProdutosTable()
                                                            .queryRows(
                                                      queryFn: (q) => q
                                                          .eqOrNull(
                                                            'usuario',
                                                            currentUserUid,
                                                          )
                                                          .order('nome',
                                                              ascending: true),
                                                    ),
                                                    builder:
                                                        (context, snapshot) {
                                                      // Customize what your widget looks like when it's loading.
                                                      if (!snapshot.hasData) {
                                                        return Center(
                                                          child: SizedBox(
                                                            width: 50.0,
                                                            height: 50.0,
                                                            child:
                                                                CircularProgressIndicator(
                                                              valueColor:
                                                                  AlwaysStoppedAnimation<
                                                                      Color>(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                              ),
                                                            ),
                                                          ),
                                                        );
                                                      }
                                                      List<ControleCadastroProdutosRow>
                                                          listViewControleCadastroProdutosRowList =
                                                          snapshot.data!;

                                                      return ListView.builder(
                                                        padding:
                                                            EdgeInsets.zero,
                                                        shrinkWrap: true,
                                                        scrollDirection:
                                                            Axis.vertical,
                                                        itemCount:
                                                            listViewControleCadastroProdutosRowList
                                                                .length,
                                                        itemBuilder: (context,
                                                            listViewIndex) {
                                                          final listViewControleCadastroProdutosRow =
                                                              listViewControleCadastroProdutosRowList[
                                                                  listViewIndex];
                                                          return Align(
                                                            alignment:
                                                                const AlignmentDirectional(
                                                                    0.0, 1.0),
                                                            child: Padding(
                                                              padding:
                                                                  const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          8.0,
                                                                          0.0,
                                                                          8.0),
                                                              child: InkWell(
                                                                splashColor: Colors
                                                                    .transparent,
                                                                focusColor: Colors
                                                                    .transparent,
                                                                hoverColor: Colors
                                                                    .transparent,
                                                                highlightColor:
                                                                    Colors
                                                                        .transparent,
                                                                onTap:
                                                                    () async {
                                                                  _model.produto =
                                                                      listViewControleCadastroProdutosRow
                                                                          .nome!;
                                                                  _model.valor =
                                                                      listViewControleCadastroProdutosRow
                                                                          .valorVenda;
                                                                  safeSetState(
                                                                      () {});
                                                                  _model
                                                                      .total = _model
                                                                          .quantidade *
                                                                      (_model
                                                                          .valor!);
                                                                  safeSetState(
                                                                      () {});
                                                                },
                                                                child:
                                                                    Container(
                                                                  width: double
                                                                      .infinity,
                                                                  height: 60.0,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryBackground,
                                                                    boxShadow: const [
                                                                      BoxShadow(
                                                                        blurRadius:
                                                                            4.0,
                                                                        color: Color(
                                                                            0x520E151B),
                                                                        offset:
                                                                            Offset(
                                                                          0.0,
                                                                          2.0,
                                                                        ),
                                                                      )
                                                                    ],
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            8.0),
                                                                  ),
                                                                  child:
                                                                      Padding(
                                                                    padding:
                                                                        const EdgeInsets.all(
                                                                            8.0),
                                                                    child: Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .spaceBetween,
                                                                      children: [
                                                                        Expanded(
                                                                          flex:
                                                                              6,
                                                                          child:
                                                                              Padding(
                                                                            padding: const EdgeInsetsDirectional.fromSTEB(
                                                                                4.0,
                                                                                0.0,
                                                                                0.0,
                                                                                0.0),
                                                                            child:
                                                                                Text(
                                                                              valueOrDefault<String>(
                                                                                listViewControleCadastroProdutosRow.nome,
                                                                                '-',
                                                                              ),
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: 'Montserrat',
                                                                                    letterSpacing: 0.0,
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        Expanded(
                                                                          flex:
                                                                              5,
                                                                          child:
                                                                              Text(
                                                                            valueOrDefault<String>(
                                                                              formatNumber(
                                                                                listViewControleCadastroProdutosRow.valorVenda,
                                                                                formatType: FormatType.custom,
                                                                                currency: 'R\$ ',
                                                                                format: '#,##0.00',
                                                                                locale: 'pt_br',
                                                                              ),
                                                                              '0',
                                                                            ),
                                                                            style: FlutterFlowTheme.of(context).bodyLarge.override(
                                                                                  fontFamily: 'Readex Pro',
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FontWeight.w900,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                        Expanded(
                                                                          flex:
                                                                              2,
                                                                          child:
                                                                              Padding(
                                                                            padding: const EdgeInsetsDirectional.fromSTEB(
                                                                                4.0,
                                                                                0.0,
                                                                                0.0,
                                                                                0.0),
                                                                            child:
                                                                                InkWell(
                                                                              splashColor: Colors.transparent,
                                                                              focusColor: Colors.transparent,
                                                                              hoverColor: Colors.transparent,
                                                                              highlightColor: Colors.transparent,
                                                                              onTap: () async {
                                                                                await showModalBottomSheet(
                                                                                  isScrollControlled: true,
                                                                                  backgroundColor: Colors.transparent,
                                                                                  enableDrag: false,
                                                                                  context: context,
                                                                                  builder: (context) {
                                                                                    return Padding(
                                                                                      padding: MediaQuery.viewInsetsOf(context),
                                                                                      child: EditarProdutosWidget(
                                                                                        idProduto: listViewControleCadastroProdutosRow,
                                                                                      ),
                                                                                    );
                                                                                  },
                                                                                ).then((value) => safeSetState(() {}));
                                                                              },
                                                                              child: Icon(
                                                                                Icons.edit_note,
                                                                                color: FlutterFlowTheme.of(context).secondaryText,
                                                                                size: 24.0,
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          );
                                                        },
                                                      );
                                                    },
                                                  ),
                                                ),
                                              ),
                                              Align(
                                                alignment: const AlignmentDirectional(
                                                    0.0, 0.0),
                                                child: Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          16.0, 8.0, 16.0, 8.0),
                                                  child: FFButtonWidget(
                                                    onPressed: () async {
                                                      context.pushNamed(
                                                          'cadastroProdutos');
                                                    },
                                                    text: 'Novo Produto',
                                                    icon: const Icon(
                                                      Icons.add,
                                                      size: 15.0,
                                                    ),
                                                    options: FFButtonOptions(
                                                      width: double.infinity,
                                                      height: 40.0,
                                                      padding:
                                                          const EdgeInsets.all(0.0),
                                                      iconPadding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                      textStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleSmall
                                                              .override(
                                                                fontFamily:
                                                                    'Readex Pro',
                                                                color: Colors
                                                                    .white,
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                      elevation: 3.0,
                                                      borderSide: const BorderSide(
                                                        color:
                                                            Colors.transparent,
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 20.0, 0.0, 8.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    FlutterFlowIconButton(
                                                      borderColor:
                                                          Colors.transparent,
                                                      borderRadius: 30.0,
                                                      borderWidth: 1.0,
                                                      buttonSize: 60.0,
                                                      icon: Icon(
                                                        Icons
                                                            .horizontal_rule_rounded,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryText,
                                                        size: 30.0,
                                                      ),
                                                      onPressed: () async {
                                                        if (_model.quantidade ==
                                                            1.0) {
                                                          await showDialog(
                                                            context: context,
                                                            builder:
                                                                (alertDialogContext) {
                                                              return AlertDialog(
                                                                title: const Text(
                                                                    'Atenção!'),
                                                                content: const Text(
                                                                    'Quantidade não pode ser menor do que 1.'),
                                                                actions: [
                                                                  TextButton(
                                                                    onPressed: () =>
                                                                        Navigator.pop(
                                                                            alertDialogContext),
                                                                    child: const Text(
                                                                        'Ok'),
                                                                  ),
                                                                ],
                                                              );
                                                            },
                                                          );
                                                        } else {
                                                          _model.quantidade =
                                                              _model.quantidade +
                                                                  -1.0;
                                                          safeSetState(() {});
                                                        }

                                                        safeSetState(() {
                                                          _model.textController
                                                                  ?.text =
                                                              valueOrDefault<
                                                                  String>(
                                                            _model.quantidade
                                                                .toString(),
                                                            '-',
                                                          );
                                                        });
                                                        _model.total =
                                                            _model.quantidade *
                                                                (_model.valor!);
                                                        safeSetState(() {});
                                                      },
                                                    ),
                                                    Expanded(
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    8.0,
                                                                    0.0,
                                                                    8.0,
                                                                    0.0),
                                                        child: SizedBox(
                                                          width: 40.0,
                                                          child: TextFormField(
                                                            controller: _model
                                                                .textController,
                                                            focusNode: _model
                                                                .textFieldFocusNode,
                                                            onFieldSubmitted:
                                                                (_) async {
                                                              _model.quantidade =
                                                                  double.parse(_model
                                                                      .textController
                                                                      .text);
                                                              safeSetState(
                                                                  () {});
                                                              _model
                                                                  .total = _model
                                                                      .quantidade *
                                                                  (_model
                                                                      .valor!);
                                                              safeSetState(
                                                                  () {});
                                                            },
                                                            autofocus: false,
                                                            obscureText: false,
                                                            decoration:
                                                                InputDecoration(
                                                              labelText:
                                                                  'Quantidade',
                                                              labelStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Readex Pro',
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                              hintText: '0',
                                                              hintStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Readex Pro',
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                              enabledBorder:
                                                                  OutlineInputBorder(
                                                                borderSide:
                                                                    BorderSide(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                                  width: 2.0,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8.0),
                                                              ),
                                                              focusedBorder:
                                                                  OutlineInputBorder(
                                                                borderSide:
                                                                    BorderSide(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                                  width: 2.0,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8.0),
                                                              ),
                                                              errorBorder:
                                                                  OutlineInputBorder(
                                                                borderSide:
                                                                    BorderSide(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .error,
                                                                  width: 2.0,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8.0),
                                                              ),
                                                              focusedErrorBorder:
                                                                  OutlineInputBorder(
                                                                borderSide:
                                                                    BorderSide(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .error,
                                                                  width: 2.0,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8.0),
                                                              ),
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .headlineMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Readex Pro',
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                            textAlign: TextAlign
                                                                .center,
                                                            keyboardType:
                                                                const TextInputType
                                                                    .numberWithOptions(
                                                                    signed:
                                                                        true,
                                                                    decimal:
                                                                        true),
                                                            validator: _model
                                                                .textControllerValidator
                                                                .asValidator(
                                                                    context),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    FlutterFlowIconButton(
                                                      borderColor:
                                                          Colors.transparent,
                                                      borderRadius: 30.0,
                                                      borderWidth: 1.0,
                                                      buttonSize: 60.0,
                                                      icon: Icon(
                                                        Icons.add,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryText,
                                                        size: 30.0,
                                                      ),
                                                      onPressed: () async {
                                                        _model.quantidade =
                                                            _model.quantidade +
                                                                1.0;
                                                        safeSetState(() {});
                                                        safeSetState(() {
                                                          _model.textController
                                                                  ?.text =
                                                              valueOrDefault<
                                                                  String>(
                                                            _model.quantidade
                                                                .toString(),
                                                            '-',
                                                          );
                                                        });
                                                        _model.total =
                                                            _model.quantidade *
                                                                (_model.valor!);
                                                        safeSetState(() {});
                                                      },
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(8.0),
                                                    child: RichText(
                                                      textScaler:
                                                          MediaQuery.of(context)
                                                              .textScaler,
                                                      text: TextSpan(
                                                        children: [
                                                          TextSpan(
                                                            text: 'Produto: ',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Readex Pro',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                ),
                                                          ),
                                                          TextSpan(
                                                            text:
                                                                _model.produto,
                                                            style: const TextStyle(),
                                                          )
                                                        ],
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Readex Pro',
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(8.0),
                                                    child: RichText(
                                                      textScaler:
                                                          MediaQuery.of(context)
                                                              .textScaler,
                                                      text: TextSpan(
                                                        children: [
                                                          TextSpan(
                                                            text: 'Valor:',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Readex Pro',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                ),
                                                          ),
                                                          TextSpan(
                                                            text:
                                                                valueOrDefault<
                                                                    String>(
                                                              formatNumber(
                                                                _model.valor,
                                                                formatType:
                                                                    FormatType
                                                                        .custom,
                                                                currency:
                                                                    'R\$ ',
                                                                format:
                                                                    '#,###.00',
                                                                locale: 'pt_br',
                                                              ),
                                                              '0,00',
                                                            ),
                                                            style: const TextStyle(),
                                                          )
                                                        ],
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Readex Pro',
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.all(8.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    RichText(
                                                      textScaler:
                                                          MediaQuery.of(context)
                                                              .textScaler,
                                                      text: TextSpan(
                                                        children: [
                                                          TextSpan(
                                                            text: 'Total:',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Readex Pro',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                ),
                                                          ),
                                                          TextSpan(
                                                            text:
                                                                valueOrDefault<
                                                                    String>(
                                                              formatNumber(
                                                                _model.total,
                                                                formatType:
                                                                    FormatType
                                                                        .custom,
                                                                currency:
                                                                    'R\$ ',
                                                                format:
                                                                    '#,###.00',
                                                                locale: 'pt_br',
                                                              ),
                                                              '0,00',
                                                            ),
                                                            style: const TextStyle(),
                                                          )
                                                        ],
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleLarge
                                                                .override(
                                                                  fontFamily:
                                                                      'Readex Pro',
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Align(
                                                alignment: const AlignmentDirectional(
                                                    0.0, 0.0),
                                                child: Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 0.0, 8.0),
                                                  child: FFButtonWidget(
                                                    onPressed: () async {
                                                      if ((_model.produto ==
                                                              'Selecione um produto!') ||
                                                          (_model.produto ==
                                                                  '')) {
                                                        await showDialog(
                                                          context: context,
                                                          builder:
                                                              (alertDialogContext) {
                                                            return AlertDialog(
                                                              content: const Text(
                                                                  'Selecione um produto!'),
                                                              actions: [
                                                                TextButton(
                                                                  onPressed: () =>
                                                                      Navigator.pop(
                                                                          alertDialogContext),
                                                                  child: const Text(
                                                                      'Ok'),
                                                                ),
                                                              ],
                                                            );
                                                          },
                                                        );
                                                      } else {
                                                        await ControleProduoItensTable()
                                                            .insert({
                                                          'referencia': widget
                                                              .idProducao,
                                                          'nome_produto':
                                                              _model.produto,
                                                          'quantidade_produzida':
                                                              _model.quantidade,
                                                          'usuario':
                                                              currentUserUid,
                                                          'valor_produto':
                                                              _model.valor,
                                                          'valor_total':
                                                              _model.total,
                                                        });
                                                        _model.quantidade = 1.0;
                                                        _model.produto =
                                                            'Selecione um produto!';
                                                        _model.valor = 0.0;
                                                        _model.total = 0.0;
                                                        safeSetState(() {});
                                                        safeSetState(() {
                                                          _model.textController
                                                                  ?.text =
                                                              valueOrDefault<
                                                                  String>(
                                                            _model.quantidade
                                                                .toString(),
                                                            '-',
                                                          );
                                                        });
                                                        _model.total =
                                                            _model.quantidade *
                                                                (_model.valor!);
                                                        safeSetState(() {});
                                                        safeSetState(() => _model
                                                                .requestCompleter =
                                                            null);
                                                        await _model
                                                            .waitForRequestCompleted();
                                                      }
                                                    },
                                                    text: 'Salvar',
                                                    options: FFButtonOptions(
                                                      width: 100.0,
                                                      height: 40.0,
                                                      padding:
                                                          const EdgeInsets.all(0.0),
                                                      iconPadding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      color: const Color(0xFF1CB829),
                                                      textStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleSmall
                                                              .override(
                                                                fontFamily:
                                                                    'Readex Pro',
                                                                color: Colors
                                                                    .white,
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                      elevation: 3.0,
                                                      borderSide: const BorderSide(
                                                        color:
                                                            Colors.transparent,
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Container(
                                  width: MediaQuery.sizeOf(context).width * 1.0,
                                  height:
                                      MediaQuery.sizeOf(context).height * 0.5,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Container(
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                1.0,
                                        height:
                                            MediaQuery.sizeOf(context).height *
                                                0.6,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryBackground,
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(16.0),
                                          child: FutureBuilder<
                                              List<ControleProduoItensRow>>(
                                            future: (_model.requestCompleter ??=
                                                    Completer<
                                                        List<
                                                            ControleProduoItensRow>>()
                                                      ..complete(
                                                          ControleProduoItensTable()
                                                              .queryRows(
                                                        queryFn: (q) => q
                                                            .eqOrNull(
                                                              'referencia',
                                                              widget
                                                                  .idProducao,
                                                            )
                                                            .order('id'),
                                                      )))
                                                .future,
                                            builder: (context, snapshot) {
                                              // Customize what your widget looks like when it's loading.
                                              if (!snapshot.hasData) {
                                                return Center(
                                                  child: SizedBox(
                                                    width: 50.0,
                                                    height: 50.0,
                                                    child:
                                                        CircularProgressIndicator(
                                                      valueColor:
                                                          AlwaysStoppedAnimation<
                                                              Color>(
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primary,
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              }
                                              List<ControleProduoItensRow>
                                                  listViewConferenciaControleProduoItensRowList =
                                                  snapshot.data!;

                                              return ListView.builder(
                                                padding: EdgeInsets.zero,
                                                primary: false,
                                                shrinkWrap: true,
                                                scrollDirection: Axis.vertical,
                                                itemCount:
                                                    listViewConferenciaControleProduoItensRowList
                                                        .length,
                                                itemBuilder: (context,
                                                    listViewConferenciaIndex) {
                                                  final listViewConferenciaControleProduoItensRow =
                                                      listViewConferenciaControleProduoItensRowList[
                                                          listViewConferenciaIndex];
                                                  return SingleChildScrollView(
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Align(
                                                          alignment:
                                                              const AlignmentDirectional(
                                                                  0.0, 1.0),
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        8.0,
                                                                        0.0,
                                                                        8.0),
                                                            child: Container(
                                                              width: double
                                                                  .infinity,
                                                              height: 60.0,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground,
                                                                boxShadow: const [
                                                                  BoxShadow(
                                                                    blurRadius:
                                                                        4.0,
                                                                    color: Color(
                                                                        0x520E151B),
                                                                    offset:
                                                                        Offset(
                                                                      0.0,
                                                                      2.0,
                                                                    ),
                                                                  )
                                                                ],
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8.0),
                                                              ),
                                                              child: Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                        .all(
                                                                            8.0),
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceBetween,
                                                                  children: [
                                                                    Expanded(
                                                                      flex: 6,
                                                                      child:
                                                                          Padding(
                                                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                                                            4.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            Text(
                                                                          valueOrDefault<
                                                                              String>(
                                                                            listViewConferenciaControleProduoItensRow.nomeProduto,
                                                                            '-',
                                                                          ),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyLarge
                                                                              .override(
                                                                                fontFamily: 'Readex Pro',
                                                                                letterSpacing: 0.0,
                                                                              ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Expanded(
                                                                      flex: 4,
                                                                      child:
                                                                          Text(
                                                                        valueOrDefault<
                                                                            String>(
                                                                          formatNumber(
                                                                            listViewConferenciaControleProduoItensRow.valorTotal,
                                                                            formatType:
                                                                                FormatType.custom,
                                                                            currency:
                                                                                'R\$ ',
                                                                            format:
                                                                                '#,###.00',
                                                                            locale:
                                                                                'pt_br',
                                                                          ),
                                                                          '0',
                                                                        ),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyLarge
                                                                            .override(
                                                                              fontFamily: 'Readex Pro',
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.w900,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                    Expanded(
                                                                      flex: 1,
                                                                      child:
                                                                          Padding(
                                                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                                                            4.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            Icon(
                                                                          Icons
                                                                              .edit_note,
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondaryText,
                                                                          size:
                                                                              24.0,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  );
                                                },
                                              );
                                            },
                                          ),
                                        ),
                                      ),
                                      Align(
                                        alignment:
                                            const AlignmentDirectional(0.0, 1.0),
                                        child: Padding(
                                          padding: const EdgeInsets.all(16.0),
                                          child: Container(
                                            width: double.infinity,
                                            height: 100.0,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .accent4,
                                              boxShadow: const [
                                                BoxShadow(
                                                  blurRadius: 4.0,
                                                  color: Color(0x520E151B),
                                                  offset: Offset(
                                                    0.0,
                                                    2.0,
                                                  ),
                                                )
                                              ],
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: [
                                                Padding(
                                                  padding: const EdgeInsets.all(8.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Expanded(
                                                        flex: 6,
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      4.0,
                                                                      0.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: Text(
                                                            'Quantidade:',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyLarge
                                                                .override(
                                                                  fontFamily:
                                                                      'Readex Pro',
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                          ),
                                                        ),
                                                      ),
                                                      Expanded(
                                                        flex: 4,
                                                        child: FutureBuilder<
                                                            List<
                                                                ViewSomaProducaoRow>>(
                                                          future:
                                                              ViewSomaProducaoTable()
                                                                  .querySingleRow(
                                                            queryFn: (q) =>
                                                                q.eqOrNull(
                                                              'referencia',
                                                              widget
                                                                  .idProducao,
                                                            ),
                                                          ),
                                                          builder: (context,
                                                              snapshot) {
                                                            // Customize what your widget looks like when it's loading.
                                                            if (!snapshot
                                                                .hasData) {
                                                              return Center(
                                                                child: SizedBox(
                                                                  width: 50.0,
                                                                  height: 50.0,
                                                                  child:
                                                                      CircularProgressIndicator(
                                                                    valueColor:
                                                                        AlwaysStoppedAnimation<
                                                                            Color>(
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .primary,
                                                                    ),
                                                                  ),
                                                                ),
                                                              );
                                                            }
                                                            List<ViewSomaProducaoRow>
                                                                textViewSomaProducaoRowList =
                                                                snapshot.data!;

                                                            final textViewSomaProducaoRow =
                                                                textViewSomaProducaoRowList
                                                                        .isNotEmpty
                                                                    ? textViewSomaProducaoRowList
                                                                        .first
                                                                    : null;

                                                            return Text(
                                                              valueOrDefault<
                                                                  String>(
                                                                textViewSomaProducaoRow
                                                                    ?.somaQuantidadeProduzida
                                                                    ?.toString(),
                                                                '0',
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyLarge
                                                                  .override(
                                                                    fontFamily:
                                                                        'Readex Pro',
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w900,
                                                                  ),
                                                            );
                                                          },
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.all(8.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Expanded(
                                                        flex: 6,
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      4.0,
                                                                      0.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: Text(
                                                            'Valor:',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyLarge
                                                                .override(
                                                                  fontFamily:
                                                                      'Readex Pro',
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                          ),
                                                        ),
                                                      ),
                                                      Expanded(
                                                        flex: 4,
                                                        child: FutureBuilder<
                                                            List<
                                                                ViewSomaProducaoRow>>(
                                                          future:
                                                              ViewSomaProducaoTable()
                                                                  .querySingleRow(
                                                            queryFn: (q) =>
                                                                q.eqOrNull(
                                                              'referencia',
                                                              widget
                                                                  .idProducao,
                                                            ),
                                                          ),
                                                          builder: (context,
                                                              snapshot) {
                                                            // Customize what your widget looks like when it's loading.
                                                            if (!snapshot
                                                                .hasData) {
                                                              return Center(
                                                                child: SizedBox(
                                                                  width: 50.0,
                                                                  height: 50.0,
                                                                  child:
                                                                      CircularProgressIndicator(
                                                                    valueColor:
                                                                        AlwaysStoppedAnimation<
                                                                            Color>(
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .primary,
                                                                    ),
                                                                  ),
                                                                ),
                                                              );
                                                            }
                                                            List<ViewSomaProducaoRow>
                                                                textViewSomaProducaoRowList =
                                                                snapshot.data!;

                                                            final textViewSomaProducaoRow =
                                                                textViewSomaProducaoRowList
                                                                        .isNotEmpty
                                                                    ? textViewSomaProducaoRowList
                                                                        .first
                                                                    : null;

                                                            return Text(
                                                              formatNumber(
                                                                textViewSomaProducaoRow!
                                                                    .somaValorTotal!,
                                                                formatType:
                                                                    FormatType
                                                                        .custom,
                                                                currency:
                                                                    'R\$ ',
                                                                format:
                                                                    '#,###.00',
                                                                locale: 'pt_br',
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyLarge
                                                                  .override(
                                                                    fontFamily:
                                                                        'Readex Pro',
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w900,
                                                                  ),
                                                            );
                                                          },
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ).animateOnPageLoad(
                  animationsMap['containerOnPageLoadAnimation2']!),
            ),
          ],
        ),
      ),
    ).animateOnPageLoad(animationsMap['containerOnPageLoadAnimation1']!);
  }
}
