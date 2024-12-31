import '/auth/supabase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:async';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'controle_copy_model.dart';
export 'controle_copy_model.dart';

class ControleCopyWidget extends StatefulWidget {
  const ControleCopyWidget({super.key});

  @override
  State<ControleCopyWidget> createState() => _ControleCopyWidgetState();
}

class _ControleCopyWidgetState extends State<ControleCopyWidget> {
  late ControleCopyModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ControleCopyModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      safeSetState(() => _model.requestCompleter = null);
      await _model.waitForRequestCompleted();
      safeSetState(() => _model.apiRequestCompleter = null);
      await _model.waitForApiRequestCompleted();
      FFAppState().linebreak = (String var1) {
        return "$var1\n";
      }('');
      safeSetState(() {});
    });

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();
    _model.textFieldFocusNode!.addListener(() => safeSetState(() {}));
    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return FutureBuilder<List<ViewControlePedidosRow>>(
      future:
          (_model.requestCompleter ??= Completer<List<ViewControlePedidosRow>>()
                ..complete(ViewControlePedidosTable().querySingleRow(
                  queryFn: (q) => q.eqOrNull(
                    'usuario',
                    currentUserUid,
                  ),
                )))
              .future,
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    FlutterFlowTheme.of(context).primary,
                  ),
                ),
              ),
            ),
          );
        }
        List<ViewControlePedidosRow> controleCopyViewControlePedidosRowList =
            snapshot.data!;

        final controleCopyViewControlePedidosRow =
            controleCopyViewControlePedidosRowList.isNotEmpty
                ? controleCopyViewControlePedidosRowList.first
                : null;

        return Title(
            title: 'controle2',
            color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
            child: GestureDetector(
              onTap: () {
                FocusScope.of(context).unfocus();
                FocusManager.instance.primaryFocus?.unfocus();
              },
              child: Scaffold(
                key: scaffoldKey,
                backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
                floatingActionButton: FloatingActionButton(
                  onPressed: () async {
                    context.pushNamed('carrinho2');
                  },
                  backgroundColor: FlutterFlowTheme.of(context).primary,
                  elevation: 4.0,
                  child: Icon(
                    Icons.add_rounded,
                    color: FlutterFlowTheme.of(context).info,
                    size: 24.0,
                  ),
                ),
                body: SafeArea(
                  top: true,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Container(
                        width: double.infinity,
                        height: 160.0,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                        ),
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              16.0, 0.0, 16.0, 16.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Text(
                                    'Controle',
                                    style: FlutterFlowTheme.of(context)
                                        .displaySmall
                                        .override(
                                          fontFamily: 'Readex Pro',
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                width: double.infinity,
                                child: TextFormField(
                                  controller: _model.textController,
                                  focusNode: _model.textFieldFocusNode,
                                  onChanged: (_) => EasyDebounce.debounce(
                                    '_model.textController',
                                    const Duration(milliseconds: 2000),
                                    () => safeSetState(() {}),
                                  ),
                                  autofocus: false,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    isDense: true,
                                    labelStyle: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .override(
                                          fontFamily: 'Readex Pro',
                                          letterSpacing: 0.0,
                                        ),
                                    hintText: 'Pesquisar...',
                                    hintStyle: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .override(
                                          fontFamily: 'Readex Pro',
                                          letterSpacing: 0.0,
                                        ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                        color: Color(0x00000000),
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(16.0),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                        color: Color(0x00000000),
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(16.0),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(16.0),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(16.0),
                                    ),
                                    filled: true,
                                    fillColor: const Color(0x25507583),
                                    prefixIcon: const Icon(
                                      Icons.search,
                                      size: 30.0,
                                    ),
                                    suffixIcon: _model
                                            .textController!.text.isNotEmpty
                                        ? InkWell(
                                            onTap: () async {
                                              _model.textController?.clear();
                                              safeSetState(() {});
                                            },
                                            child: const Icon(
                                              Icons.clear,
                                              size: 30.0,
                                            ),
                                          )
                                        : null,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Readex Pro',
                                        letterSpacing: 0.0,
                                      ),
                                  textAlign: TextAlign.start,
                                  cursorColor:
                                      FlutterFlowTheme.of(context).primaryText,
                                  validator: _model.textControllerValidator
                                      .asValidator(context),
                                ),
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: FlutterFlowChoiceChips(
                                        options: const [
                                          ChipData('Todos'),
                                          ChipData('Pendente'),
                                          ChipData('Pago')
                                        ],
                                        onChanged: (val) => safeSetState(() =>
                                            _model.choiceChipsValue =
                                                val?.firstOrNull),
                                        selectedChipStyle: ChipStyle(
                                          backgroundColor:
                                              FlutterFlowTheme.of(context)
                                                  .primary,
                                          textStyle: FlutterFlowTheme.of(
                                                  context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Readex Pro',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .info,
                                                letterSpacing: 0.0,
                                              ),
                                          iconColor:
                                              FlutterFlowTheme.of(context).info,
                                          iconSize: 16.0,
                                          elevation: 0.0,
                                          borderRadius:
                                              BorderRadius.circular(12.0),
                                        ),
                                        unselectedChipStyle: ChipStyle(
                                          backgroundColor: const Color(0x4257636C),
                                          textStyle: FlutterFlowTheme.of(
                                                  context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Readex Pro',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                                letterSpacing: 0.0,
                                              ),
                                          iconColor:
                                              FlutterFlowTheme.of(context)
                                                  .secondaryText,
                                          iconSize: 16.0,
                                          elevation: 0.0,
                                          borderRadius:
                                              BorderRadius.circular(12.0),
                                        ),
                                        chipSpacing: 8.0,
                                        rowSpacing: 8.0,
                                        multiselect: false,
                                        alignment: WrapAlignment.center,
                                        controller: _model
                                                .choiceChipsValueController ??=
                                            FormFieldController<List<String>>(
                                          [],
                                        ),
                                        wrapped: true,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ].divide(const SizedBox(height: 8.0)),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Align(
                          alignment: const AlignmentDirectional(0.0, 0.0),
                          child: Container(
                            width: MediaQuery.sizeOf(context).width * 1.0,
                            height: MediaQuery.sizeOf(context).height * 1.0,
                            constraints: const BoxConstraints(
                              maxWidth: 500.0,
                            ),
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                            ),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  16.0, 0.0, 16.0, 16.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 8.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Expanded(
                                          flex: 1,
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Text(
                                                formatNumber(
                                                  controleCopyViewControlePedidosRow!
                                                      .totalPago!,
                                                  formatType: FormatType.custom,
                                                  currency: 'R\$ ',
                                                  format: '#,##0.00',
                                                  locale: 'pt_br',
                                                ),
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily: 'Readex Pro',
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                      fontSize: 20.0,
                                                      letterSpacing: 0.0,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                              ),
                                              Text(
                                                'Total pago',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Readex Pro',
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Expanded(
                                          flex: 1,
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Text(
                                                formatNumber(
                                                  controleCopyViewControlePedidosRow
                                                      .totalPendente!,
                                                  formatType: FormatType.custom,
                                                  currency: 'R\$ ',
                                                  format: '#,##0.00',
                                                  locale: 'pt_br',
                                                ),
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily: 'Readex Pro',
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .error,
                                                      fontSize: 20.0,
                                                      letterSpacing: 0.0,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                              ),
                                              Text(
                                                'Total pendente',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Readex Pro',
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    child: FutureBuilder<ApiCallResponse>(
                                      future: (_model.apiRequestCompleter ??=
                                              Completer<ApiCallResponse>()
                                                ..complete(
                                                    BuscaPedidosCall.call()))
                                          .future,
                                      builder: (context, snapshot) {
                                        // Customize what your widget looks like when it's loading.
                                        if (!snapshot.hasData) {
                                          return Center(
                                            child: SizedBox(
                                              width: 50.0,
                                              height: 50.0,
                                              child: CircularProgressIndicator(
                                                valueColor:
                                                    AlwaysStoppedAnimation<
                                                        Color>(
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                                ),
                                              ),
                                            ),
                                          );
                                        }
                                        final listViewBuscaPedidosResponse =
                                            snapshot.data!;

                                        return Builder(
                                          builder: (context) {
                                            final lvPedidos = (listViewBuscaPedidosResponse
                                                            .jsonBody
                                                            .toList()
                                                            .map<DtPedidosStruct?>(
                                                                DtPedidosStruct
                                                                    .maybeFromMap)
                                                            .toList()
                                                        as Iterable<
                                                            DtPedidosStruct?>)
                                                    .withoutNulls
                                                    .toList() ??
                                                [];

                                            return ListView.separated(
                                              padding: EdgeInsets.zero,
                                              shrinkWrap: true,
                                              scrollDirection: Axis.vertical,
                                              itemCount: lvPedidos.length,
                                              separatorBuilder: (_, __) =>
                                                  const SizedBox(height: 12.0),
                                              itemBuilder:
                                                  (context, lvPedidosIndex) {
                                                final lvPedidosItem =
                                                    lvPedidos[lvPedidosIndex];
                                                return Padding(
                                                  padding: const EdgeInsets.all(2.0),
                                                  child: InkWell(
                                                    splashColor:
                                                        Colors.transparent,
                                                    focusColor:
                                                        Colors.transparent,
                                                    hoverColor:
                                                        Colors.transparent,
                                                    highlightColor:
                                                        Colors.transparent,
                                                    onDoubleTap: () async {
                                                      if (lvPedidosItem
                                                              .statusPagamento ==
                                                          'Pago') {
                                                        await ControlePedidosTable()
                                                            .update(
                                                          data: {
                                                            'status_pagamento':
                                                                'Pendente',
                                                          },
                                                          matchingRows:
                                                              (rows) =>
                                                                  rows.eqOrNull(
                                                            'id',
                                                            lvPedidosItem.id,
                                                          ),
                                                        );
                                                        ScaffoldMessenger.of(
                                                                context)
                                                            .showSnackBar(
                                                          SnackBar(
                                                            content: Text(
                                                              'Pagamento alterado!',
                                                              style: TextStyle(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                              ),
                                                            ),
                                                            duration: const Duration(
                                                                milliseconds:
                                                                    4000),
                                                            backgroundColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                          ),
                                                        );
                                                        safeSetState(() => _model
                                                                .requestCompleter =
                                                            null);
                                                        await _model
                                                            .waitForRequestCompleted();
                                                        safeSetState(() => _model
                                                                .apiRequestCompleter =
                                                            null);
                                                        await _model
                                                            .waitForApiRequestCompleted();
                                                      } else {
                                                        await ControlePedidosTable()
                                                            .update(
                                                          data: {
                                                            'status_pagamento':
                                                                'Pago',
                                                          },
                                                          matchingRows:
                                                              (rows) =>
                                                                  rows.eqOrNull(
                                                            'id',
                                                            lvPedidosItem.id,
                                                          ),
                                                        );
                                                        ScaffoldMessenger.of(
                                                                context)
                                                            .showSnackBar(
                                                          SnackBar(
                                                            content: Text(
                                                              'Pagamento alterado!',
                                                              style: TextStyle(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                              ),
                                                            ),
                                                            duration: const Duration(
                                                                milliseconds:
                                                                    4000),
                                                            backgroundColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                          ),
                                                        );
                                                        safeSetState(() => _model
                                                                .requestCompleter =
                                                            null);
                                                        await _model
                                                            .waitForRequestCompleted();
                                                        safeSetState(() => _model
                                                                .apiRequestCompleter =
                                                            null);
                                                        await _model
                                                            .waitForApiRequestCompleted();
                                                      }
                                                    },
                                                    onLongPress: () async {
                                                      await launchURL(
                                                          'https://wa.me/?text=*Seu Veículo Está Pronto! 🚗✨${FFAppState().linebreak}O serviço no seu carro foi finalizado e está pronto para ser retirado na WB AutoService${FFAppState().linebreak}${FFAppState().linebreak}Pedido nº: ${valueOrDefault<String>(
                                                        lvPedidosItem
                                                            .numeroPedido
                                                            .toString(),
                                                        '-',
                                                      )}${FFAppState().linebreak}*Total: ${valueOrDefault<String>(
                                                        formatNumber(
                                                          lvPedidosItem.total,
                                                          formatType:
                                                              FormatType.custom,
                                                          currency: 'R\$',
                                                          format: '#,##0.00',
                                                          locale: 'pt_br',
                                                        ),
                                                        '-',
                                                      )}*${FFAppState().linebreak}${FFAppState().linebreak}Como você pode pagar:  Dinheiro Cartão de Débito Cartão de Crédito Transferência Bancária Estamos à disposição para qualquer dúvida ou para agendar um horário conveniente para você. Obrigado por confiar em nossos serviços!');
                                                    },
                                                    child: Container(
                                                      width: double.infinity,
                                                      height: 70.0,
                                                      decoration: BoxDecoration(
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                      ),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Expanded(
                                                            flex: 2,
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              children: [
                                                                Container(
                                                                  width: 50.0,
                                                                  height: 50.0,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: lvPedidosItem.statusPagamento ==
                                                                            'Pago'
                                                                        ? FlutterFlowTheme.of(context)
                                                                            .primary
                                                                        : FlutterFlowTheme.of(context)
                                                                            .error,
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            30.0),
                                                                  ),
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .center,
                                                                    children: [
                                                                      Icon(
                                                                        Icons
                                                                            .person_sharp,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryBackground,
                                                                        size:
                                                                            24.0,
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          Expanded(
                                                            flex: 8,
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              children: [
                                                                Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    AutoSizeText(
                                                                      valueOrDefault<
                                                                          String>(
                                                                        lvPedidosItem
                                                                            .cliente,
                                                                        '-',
                                                                      ),
                                                                      minFontSize:
                                                                          12.0,
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Readex Pro',
                                                                            fontSize:
                                                                                20.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.bold,
                                                                          ),
                                                                    ),
                                                                  ],
                                                                ),
                                                                Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    AutoSizeText(
                                                                      formatNumber(
                                                                        lvPedidosItem
                                                                            .total,
                                                                        formatType:
                                                                            FormatType.custom,
                                                                        currency:
                                                                            'R\$ ',
                                                                        format:
                                                                            '#.##0,00',
                                                                        locale:
                                                                            'pt_br',
                                                                      ),
                                                                      minFontSize:
                                                                          12.0,
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Readex Pro',
                                                                            fontSize:
                                                                                16.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.w500,
                                                                          ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          Expanded(
                                                            flex: 2,
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              children: [
                                                                Text(
                                                                  dateTimeFormat(
                                                                    "dd/MM",
                                                                    lvPedidosItem
                                                                        .createdAt!,
                                                                    locale: FFLocalizations.of(
                                                                            context)
                                                                        .languageCode,
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Readex Pro',
                                                                        fontSize:
                                                                            16.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.w500,
                                                                      ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ].divide(const SizedBox(
                                                            width: 8.0)),
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              },
                                            );
                                          },
                                        );
                                      },
                                    ),
                                  ),
                                ].divide(const SizedBox(height: 12.0)),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ));
      },
    );
  }
}
