import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/custom_code/actions/index.dart' as actions;
import 'dart:async';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'controle_model.dart';
export 'controle_model.dart';

class ControleWidget extends StatefulWidget {
  const ControleWidget({super.key});

  @override
  State<ControleWidget> createState() => _ControleWidgetState();
}

class _ControleWidgetState extends State<ControleWidget> {
  late ControleModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ControleModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      safeSetState(() => _model.requestCompleter4 = null);
      await _model.waitForRequestCompleted4();
      safeSetState(() => _model.requestCompleter1 = null);
      await _model.waitForRequestCompleted1();
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
      future: (_model.requestCompleter4 ??=
              Completer<List<ViewControlePedidosRow>>()
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
        List<ViewControlePedidosRow> controleViewControlePedidosRowList =
            snapshot.data!;

        final controleViewControlePedidosRow =
            controleViewControlePedidosRowList.isNotEmpty
                ? controleViewControlePedidosRowList.first
                : null;

        return Title(
            title: 'controle',
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
                    context.pushNamed('carrinho');
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
                  child: FutureBuilder<List<ControleCadastroNegocioRow>>(
                    future: ControleCadastroNegocioTable().querySingleRow(
                      queryFn: (q) => q.eqOrNull(
                        'id_negocio',
                        FFAppState().negocioSelecionado,
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
                      List<ControleCadastroNegocioRow>
                          columnControleCadastroNegocioRowList = snapshot.data!;

                      final columnControleCadastroNegocioRow =
                          columnControleCadastroNegocioRowList.isNotEmpty
                              ? columnControleCadastroNegocioRowList.first
                              : null;

                      return Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          FutureBuilder<List<ControleClientesRow>>(
                            future: ControleClientesTable().queryRows(
                              queryFn: (q) => q,
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
                              List<ControleClientesRow>
                                  containerControleClientesRowList =
                                  snapshot.data!;

                              return Container(
                                width: double.infinity,
                                height: 170.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      16.0, 0.0, 16.0, 16.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(25.0),
                                            child: Image.network(
                                              valueOrDefault<String>(
                                                columnControleCadastroNegocioRow
                                                    ?.logo,
                                                'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/controle-qoevo2/assets/6ta9hdkz05nv/image.png',
                                              ),
                                              width: 40.0,
                                              height: 40.0,
                                              fit: BoxFit.contain,
                                              errorBuilder: (context, error,
                                                      stackTrace) =>
                                                  Image.asset(
                                                'assets/images/error_image.png',
                                                width: 40.0,
                                                height: 40.0,
                                                fit: BoxFit.contain,
                                              ),
                                            ),
                                          ),
                                          Column(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Controle',
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .displaySmall
                                                    .override(
                                                      fontFamily: 'Readex Pro',
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                      fontSize: 24.0,
                                                      letterSpacing: 0.0,
                                                    ),
                                              ),
                                              Align(
                                                alignment: const AlignmentDirectional(
                                                    0.0, -1.0),
                                                child: Text(
                                                  valueOrDefault<String>(
                                                    columnControleCadastroNegocioRow
                                                        ?.nomeFantasia,
                                                    '-',
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .displaySmall
                                                      .override(
                                                        fontFamily:
                                                            'Readex Pro',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        fontSize: 16.0,
                                                        letterSpacing: 0.0,
                                                      ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ].divide(const SizedBox(width: 8.0)),
                                      ),
                                      SizedBox(
                                        width: double.infinity,
                                        child: TextFormField(
                                          controller: _model.textController,
                                          focusNode: _model.textFieldFocusNode,
                                          onChanged: (_) =>
                                              EasyDebounce.debounce(
                                            '_model.textController',
                                            const Duration(milliseconds: 2000),
                                            () => safeSetState(() {}),
                                          ),
                                          autofocus: false,
                                          obscureText: false,
                                          decoration: InputDecoration(
                                            isDense: true,
                                            labelStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium
                                                    .override(
                                                      fontFamily: 'Readex Pro',
                                                      letterSpacing: 0.0,
                                                    ),
                                            hintText: 'Pesquisar...',
                                            hintStyle:
                                                FlutterFlowTheme.of(context)
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
                                              borderRadius:
                                                  BorderRadius.circular(16.0),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: const BorderSide(
                                                color: Color(0x00000000),
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(16.0),
                                            ),
                                            errorBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .error,
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(16.0),
                                            ),
                                            focusedErrorBorder:
                                                OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .error,
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(16.0),
                                            ),
                                            filled: true,
                                            fillColor: const Color(0x25507583),
                                            prefixIcon: const Icon(
                                              Icons.search,
                                              size: 30.0,
                                            ),
                                            suffixIcon: _model.textController!
                                                    .text.isNotEmpty
                                                ? InkWell(
                                                    onTap: () async {
                                                      _model.textController
                                                          ?.clear();
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
                                              FlutterFlowTheme.of(context)
                                                  .primaryText,
                                          validator: _model
                                              .textControllerValidator
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
                                                onChanged: (val) =>
                                                    safeSetState(() => _model
                                                            .choiceChipsValue =
                                                        val?.firstOrNull),
                                                selectedChipStyle: ChipStyle(
                                                  backgroundColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primary,
                                                  textStyle: FlutterFlowTheme
                                                          .of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Readex Pro',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .info,
                                                        letterSpacing: 0.0,
                                                      ),
                                                  iconColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .info,
                                                  iconSize: 16.0,
                                                  elevation: 0.0,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          12.0),
                                                ),
                                                unselectedChipStyle: ChipStyle(
                                                  backgroundColor:
                                                      const Color(0x4257636C),
                                                  textStyle: FlutterFlowTheme
                                                          .of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Readex Pro',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryText,
                                                        letterSpacing: 0.0,
                                                      ),
                                                  iconColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .secondaryText,
                                                  iconSize: 16.0,
                                                  elevation: 0.0,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          12.0),
                                                ),
                                                chipSpacing: 8.0,
                                                rowSpacing: 8.0,
                                                multiselect: false,
                                                initialized:
                                                    _model.choiceChipsValue !=
                                                        null,
                                                alignment: WrapAlignment.center,
                                                controller: _model
                                                        .choiceChipsValueController ??=
                                                    FormFieldController<
                                                        List<String>>(
                                                  ['Todos'],
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
                              );
                            },
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
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Expanded(
                                            flex: 1,
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Text(
                                                  valueOrDefault<String>(
                                                    formatNumber(
                                                      controleViewControlePedidosRow
                                                          ?.totalPago,
                                                      formatType:
                                                          FormatType.custom,
                                                      currency: 'R\$ ',
                                                      format: '#,##0.00',
                                                      locale: 'pt_br',
                                                    ),
                                                    '0',
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Readex Pro',
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
                                                  style: FlutterFlowTheme.of(
                                                          context)
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
                                                  valueOrDefault<String>(
                                                    formatNumber(
                                                      controleViewControlePedidosRow
                                                          ?.totalPendente,
                                                      formatType:
                                                          FormatType.custom,
                                                      currency: 'R\$ ',
                                                      format: '#,##0.00',
                                                      locale: 'pt_br',
                                                    ),
                                                    '0',
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Readex Pro',
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
                                                  style: FlutterFlowTheme.of(
                                                          context)
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
                                      if (_model.choiceChipsValue == 'Todos')
                                        Expanded(
                                          child: FutureBuilder<
                                              List<ControlePedidosRow>>(
                                            future: (_model
                                                        .requestCompleter1 ??=
                                                    Completer<
                                                        List<
                                                            ControlePedidosRow>>()
                                                      ..complete(
                                                          ControlePedidosTable()
                                                              .queryRows(
                                                        queryFn: (q) => q
                                                            .eqOrNull(
                                                              'usuario',
                                                              currentUserUid,
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
                                              List<ControlePedidosRow>
                                                  listViewControlePedidosRowList =
                                                  snapshot.data!;

                                              return ListView.separated(
                                                padding: EdgeInsets.zero,
                                                shrinkWrap: true,
                                                scrollDirection: Axis.vertical,
                                                itemCount:
                                                    listViewControlePedidosRowList
                                                        .length,
                                                separatorBuilder: (_, __) =>
                                                    const SizedBox(height: 12.0),
                                                itemBuilder:
                                                    (context, listViewIndex) {
                                                  final listViewControlePedidosRow =
                                                      listViewControlePedidosRowList[
                                                          listViewIndex];
                                                  return Padding(
                                                    padding:
                                                        const EdgeInsets.all(2.0),
                                                    child: InkWell(
                                                      splashColor:
                                                          Colors.transparent,
                                                      focusColor:
                                                          Colors.transparent,
                                                      hoverColor:
                                                          Colors.transparent,
                                                      highlightColor:
                                                          Colors.transparent,
                                                      onTap: () async {
                                                        context.pushNamed(
                                                          'relatorioPDF',
                                                          queryParameters: {
                                                            'idPedido':
                                                                serializeParam(
                                                              listViewControlePedidosRow,
                                                              ParamType
                                                                  .SupabaseRow,
                                                            ),
                                                          }.withoutNulls,
                                                        );
                                                      },
                                                      onDoubleTap: () async {
                                                        if (listViewControlePedidosRow
                                                                .statusPagamento ==
                                                            'Pago') {
                                                          await ControlePedidosTable()
                                                              .update(
                                                            data: {
                                                              'status_pagamento':
                                                                  'Pendente',
                                                            },
                                                            matchingRows:
                                                                (rows) => rows
                                                                    .eqOrNull(
                                                              'id',
                                                              listViewControlePedidosRow
                                                                  .id,
                                                            ),
                                                          );
                                                          ScaffoldMessenger.of(
                                                                  context)
                                                              .showSnackBar(
                                                            SnackBar(
                                                              content: Text(
                                                                'Pagamento alterado!',
                                                                style:
                                                                    TextStyle(
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
                                                          safeSetState(() =>
                                                              _model.requestCompleter4 =
                                                                  null);
                                                          await _model
                                                              .waitForRequestCompleted4();
                                                          safeSetState(() =>
                                                              _model.requestCompleter1 =
                                                                  null);
                                                          await _model
                                                              .waitForRequestCompleted1();
                                                        } else {
                                                          await ControlePedidosTable()
                                                              .update(
                                                            data: {
                                                              'status_pagamento':
                                                                  'Pago',
                                                            },
                                                            matchingRows:
                                                                (rows) => rows
                                                                    .eqOrNull(
                                                              'id',
                                                              listViewControlePedidosRow
                                                                  .id,
                                                            ),
                                                          );
                                                          ScaffoldMessenger.of(
                                                                  context)
                                                              .showSnackBar(
                                                            SnackBar(
                                                              content: Text(
                                                                'Pagamento alterado!',
                                                                style:
                                                                    TextStyle(
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
                                                          safeSetState(() =>
                                                              _model.requestCompleter4 =
                                                                  null);
                                                          await _model
                                                              .waitForRequestCompleted4();
                                                          safeSetState(() =>
                                                              _model.requestCompleter1 =
                                                                  null);
                                                          await _model
                                                              .waitForRequestCompleted1();
                                                        }
                                                      },
                                                      onLongPress: () async {
                                                        await launchURL(
                                                            'https://wa.me/?text=*Seu Veículo Está Pronto! 🚗✨${FFAppState().linebreak}O serviço no seu carro foi finalizado e está pronto para ser retirado na WB AutoService${FFAppState().linebreak}${FFAppState().linebreak}Pedido nº: ${listViewControlePedidosRow.numeroPedido?.toString()}${FFAppState().linebreak}*Total: ${formatNumber(
                                                          listViewControlePedidosRow
                                                              .total,
                                                          formatType:
                                                              FormatType.custom,
                                                          currency: 'R\$ ',
                                                          format: '#,##0.00',
                                                          locale: 'pt_br',
                                                        )}*${FFAppState().linebreak}${FFAppState().linebreak}Como você pode pagar:  Dinheiro Cartão de Débito Cartão de Crédito Transferência Bancária Estamos à disposição para qualquer dúvida ou para agendar um horário conveniente para você. Obrigado por confiar em nossos serviços!');
                                                      },
                                                      child: Container(
                                                        width: double.infinity,
                                                        height: 70.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
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
                                                                    height:
                                                                        50.0,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: listViewControlePedidosRow.statusPagamento ==
                                                                              'Pago'
                                                                          ? FlutterFlowTheme.of(context)
                                                                              .primary
                                                                          : FlutterFlowTheme.of(context)
                                                                              .error,
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              30.0),
                                                                    ),
                                                                    child:
                                                                        Column(
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
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondaryBackground,
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
                                                                          listViewControlePedidosRow
                                                                              .cliente,
                                                                          '-',
                                                                        ),
                                                                        minFontSize:
                                                                            12.0,
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'Readex Pro',
                                                                              fontSize: 20.0,
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.bold,
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
                                                                        valueOrDefault<
                                                                            String>(
                                                                          formatNumber(
                                                                            listViewControlePedidosRow.total,
                                                                            formatType:
                                                                                FormatType.custom,
                                                                            currency:
                                                                                'R\$ ',
                                                                            format:
                                                                                '#,##0.00',
                                                                            locale:
                                                                                'pt_br',
                                                                          ),
                                                                          '-',
                                                                        ),
                                                                        minFontSize:
                                                                            12.0,
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'Readex Pro',
                                                                              fontSize: 16.0,
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.w500,
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
                                                                    valueOrDefault<
                                                                        String>(
                                                                      dateTimeFormat(
                                                                        "dd/M",
                                                                        listViewControlePedidosRow
                                                                            .createdAt,
                                                                        locale:
                                                                            FFLocalizations.of(context).languageCode,
                                                                      ),
                                                                      '-',
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
                                                                  FutureBuilder<
                                                                      List<
                                                                          ControlePedidosItensRow>>(
                                                                    future: ControlePedidosItensTable()
                                                                        .queryRows(
                                                                      queryFn:
                                                                          (q) =>
                                                                              q.eqOrNull(
                                                                        'id',
                                                                        listViewControlePedidosRow
                                                                            .id,
                                                                      ),
                                                                    ),
                                                                    builder:
                                                                        (context,
                                                                            snapshot) {
                                                                      // Customize what your widget looks like when it's loading.
                                                                      if (!snapshot
                                                                          .hasData) {
                                                                        return Center(
                                                                          child:
                                                                              SizedBox(
                                                                            width:
                                                                                50.0,
                                                                            height:
                                                                                50.0,
                                                                            child:
                                                                                CircularProgressIndicator(
                                                                              valueColor: AlwaysStoppedAnimation<Color>(
                                                                                FlutterFlowTheme.of(context).primary,
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        );
                                                                      }
                                                                      List<ControlePedidosItensRow>
                                                                          iconControlePedidosItensRowList =
                                                                          snapshot
                                                                              .data!;

                                                                      return InkWell(
                                                                        splashColor:
                                                                            Colors.transparent,
                                                                        focusColor:
                                                                            Colors.transparent,
                                                                        hoverColor:
                                                                            Colors.transparent,
                                                                        highlightColor:
                                                                            Colors.transparent,
                                                                        onTap:
                                                                            () async {
                                                                          ScaffoldMessenger.of(context)
                                                                              .showSnackBar(
                                                                            SnackBar(
                                                                              content: Text(
                                                                                'PDF',
                                                                                style: TextStyle(
                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                ),
                                                                              ),
                                                                              duration: const Duration(milliseconds: 1000),
                                                                              backgroundColor: FlutterFlowTheme.of(context).secondary,
                                                                            ),
                                                                          );
                                                                          await actions
                                                                              .testePDF(
                                                                            valueOrDefault<String>(
                                                                              columnControleCadastroNegocioRow?.logo,
                                                                              'https://kqduhwuwvzmovlbdurth.supabase.co/storage/v1/object/public/imagens/logoNegocios/1733311816781000.jpg',
                                                                            ),
                                                                            columnControleCadastroNegocioRow?.nomeFantasia,
                                                                            columnControleCadastroNegocioRow?.descricao,
                                                                            columnControleCadastroNegocioRow?.endereco,
                                                                            columnControleCadastroNegocioRow?.telefone,
                                                                            'Ordem de Serviço',
                                                                            listViewControlePedidosRow.numeroPedido,
                                                                            listViewControlePedidosRow.createdAt,
                                                                            listViewControlePedidosRow.cliente,
                                                                            '100.989.699-78',
                                                                            'teste',
                                                                            '43999801243',
                                                                            FFAppState().itensCarrinho.toList(),
                                                                          );
                                                                        },
                                                                        child:
                                                                            FaIcon(
                                                                          FontAwesomeIcons
                                                                              .solidFilePdf,
                                                                          color:
                                                                              FlutterFlowTheme.of(context).error,
                                                                          size:
                                                                              24.0,
                                                                        ),
                                                                      );
                                                                    },
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
                                          ),
                                        ),
                                      if (_model.choiceChipsValue == 'Pago')
                                        Expanded(
                                          child: FutureBuilder<
                                              List<ControlePedidosRow>>(
                                            future: (_model
                                                        .requestCompleter2 ??=
                                                    Completer<
                                                        List<
                                                            ControlePedidosRow>>()
                                                      ..complete(
                                                          ControlePedidosTable()
                                                              .queryRows(
                                                        queryFn: (q) => q
                                                            .eqOrNull(
                                                              'usuario',
                                                              currentUserUid,
                                                            )
                                                            .eqOrNull(
                                                              'status_pagamento',
                                                              'Pago',
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
                                              List<ControlePedidosRow>
                                                  listViewControlePedidosRowList =
                                                  snapshot.data!;

                                              return ListView.separated(
                                                padding: EdgeInsets.zero,
                                                shrinkWrap: true,
                                                scrollDirection: Axis.vertical,
                                                itemCount:
                                                    listViewControlePedidosRowList
                                                        .length,
                                                separatorBuilder: (_, __) =>
                                                    const SizedBox(height: 12.0),
                                                itemBuilder:
                                                    (context, listViewIndex) {
                                                  final listViewControlePedidosRow =
                                                      listViewControlePedidosRowList[
                                                          listViewIndex];
                                                  return Padding(
                                                    padding:
                                                        const EdgeInsets.all(2.0),
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
                                                        if (listViewControlePedidosRow
                                                                .statusPagamento ==
                                                            'Pago') {
                                                          await ControlePedidosTable()
                                                              .update(
                                                            data: {
                                                              'status_pagamento':
                                                                  'Pendente',
                                                            },
                                                            matchingRows:
                                                                (rows) => rows
                                                                    .eqOrNull(
                                                              'id',
                                                              listViewControlePedidosRow
                                                                  .id,
                                                            ),
                                                          );
                                                          ScaffoldMessenger.of(
                                                                  context)
                                                              .showSnackBar(
                                                            SnackBar(
                                                              content: Text(
                                                                'Pagamento alterado!',
                                                                style:
                                                                    TextStyle(
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
                                                          safeSetState(() =>
                                                              _model.requestCompleter4 =
                                                                  null);
                                                          await _model
                                                              .waitForRequestCompleted4();
                                                          safeSetState(() =>
                                                              _model.requestCompleter2 =
                                                                  null);
                                                          await _model
                                                              .waitForRequestCompleted2();
                                                        } else {
                                                          await ControlePedidosTable()
                                                              .update(
                                                            data: {
                                                              'status_pagamento':
                                                                  'Pago',
                                                            },
                                                            matchingRows:
                                                                (rows) => rows
                                                                    .eqOrNull(
                                                              'id',
                                                              listViewControlePedidosRow
                                                                  .id,
                                                            ),
                                                          );
                                                          ScaffoldMessenger.of(
                                                                  context)
                                                              .showSnackBar(
                                                            SnackBar(
                                                              content: Text(
                                                                'Pagamento alterado!',
                                                                style:
                                                                    TextStyle(
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
                                                          safeSetState(() =>
                                                              _model.requestCompleter4 =
                                                                  null);
                                                          await _model
                                                              .waitForRequestCompleted4();
                                                          safeSetState(() =>
                                                              _model.requestCompleter2 =
                                                                  null);
                                                          await _model
                                                              .waitForRequestCompleted2();
                                                        }
                                                      },
                                                      onLongPress: () async {
                                                        await launchURL(
                                                            'https://wa.me/?text=*Seu Veículo Está Pronto! 🚗✨${FFAppState().linebreak}O serviço no seu carro foi finalizado e está pronto para ser retirado na WB AutoService${FFAppState().linebreak}${FFAppState().linebreak}Pedido nº: ${listViewControlePedidosRow.numeroPedido?.toString()}${FFAppState().linebreak}*Total: ${formatNumber(
                                                          listViewControlePedidosRow
                                                              .total,
                                                          formatType:
                                                              FormatType.custom,
                                                          currency: 'R\$ ',
                                                          format: '#,##0.00',
                                                          locale: 'pt_br',
                                                        )}*${FFAppState().linebreak}${FFAppState().linebreak}Como você pode pagar:  Dinheiro Cartão de Débito Cartão de Crédito Transferência Bancária Estamos à disposição para qualquer dúvida ou para agendar um horário conveniente para você. Obrigado por confiar em nossos serviços!');
                                                      },
                                                      child: Container(
                                                        width: double.infinity,
                                                        height: 70.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
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
                                                                    height:
                                                                        50.0,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: listViewControlePedidosRow.statusPagamento ==
                                                                              'Pago'
                                                                          ? FlutterFlowTheme.of(context)
                                                                              .primary
                                                                          : FlutterFlowTheme.of(context)
                                                                              .error,
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              30.0),
                                                                    ),
                                                                    child:
                                                                        Column(
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
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondaryBackground,
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
                                                                          listViewControlePedidosRow
                                                                              .cliente,
                                                                          '-',
                                                                        ),
                                                                        minFontSize:
                                                                            12.0,
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'Readex Pro',
                                                                              fontSize: 20.0,
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.bold,
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
                                                                        valueOrDefault<
                                                                            String>(
                                                                          formatNumber(
                                                                            listViewControlePedidosRow.total,
                                                                            formatType:
                                                                                FormatType.custom,
                                                                            currency:
                                                                                'R\$ ',
                                                                            format:
                                                                                '#,##0.00',
                                                                            locale:
                                                                                'pt_br',
                                                                          ),
                                                                          '-',
                                                                        ),
                                                                        minFontSize:
                                                                            12.0,
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'Readex Pro',
                                                                              fontSize: 16.0,
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.w500,
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
                                                                    valueOrDefault<
                                                                        String>(
                                                                      dateTimeFormat(
                                                                        "dd/M",
                                                                        listViewControlePedidosRow
                                                                            .createdAt,
                                                                        locale:
                                                                            FFLocalizations.of(context).languageCode,
                                                                      ),
                                                                      '-',
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
                                                                  FutureBuilder<
                                                                      List<
                                                                          ControlePedidosItensRow>>(
                                                                    future: ControlePedidosItensTable()
                                                                        .queryRows(
                                                                      queryFn:
                                                                          (q) =>
                                                                              q.eqOrNull(
                                                                        'id',
                                                                        listViewControlePedidosRow
                                                                            .id,
                                                                      ),
                                                                    ),
                                                                    builder:
                                                                        (context,
                                                                            snapshot) {
                                                                      // Customize what your widget looks like when it's loading.
                                                                      if (!snapshot
                                                                          .hasData) {
                                                                        return Center(
                                                                          child:
                                                                              SizedBox(
                                                                            width:
                                                                                50.0,
                                                                            height:
                                                                                50.0,
                                                                            child:
                                                                                CircularProgressIndicator(
                                                                              valueColor: AlwaysStoppedAnimation<Color>(
                                                                                FlutterFlowTheme.of(context).primary,
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        );
                                                                      }
                                                                      List<ControlePedidosItensRow>
                                                                          iconControlePedidosItensRowList =
                                                                          snapshot
                                                                              .data!;

                                                                      return InkWell(
                                                                        splashColor:
                                                                            Colors.transparent,
                                                                        focusColor:
                                                                            Colors.transparent,
                                                                        hoverColor:
                                                                            Colors.transparent,
                                                                        highlightColor:
                                                                            Colors.transparent,
                                                                        onTap:
                                                                            () async {
                                                                          await showDialog(
                                                                            context:
                                                                                context,
                                                                            builder:
                                                                                (alertDialogContext) {
                                                                              return AlertDialog(
                                                                                content: Text(iconControlePedidosItensRowList.length.toString()),
                                                                                actions: [
                                                                                  TextButton(
                                                                                    onPressed: () => Navigator.pop(alertDialogContext),
                                                                                    child: const Text('Ok'),
                                                                                  ),
                                                                                ],
                                                                              );
                                                                            },
                                                                          );
                                                                          await actions
                                                                              .gerarPDFVenda(
                                                                            listViewControlePedidosRow.id,
                                                                            listViewControlePedidosRow.cliente,
                                                                            listViewControlePedidosRow.dataField?.toString(),
                                                                            _model.produtos.toList(),
                                                                            listViewControlePedidosRow.total,
                                                                            0.0,
                                                                          );
                                                                        },
                                                                        child:
                                                                            FaIcon(
                                                                          FontAwesomeIcons
                                                                              .solidFilePdf,
                                                                          color:
                                                                              FlutterFlowTheme.of(context).error,
                                                                          size:
                                                                              24.0,
                                                                        ),
                                                                      );
                                                                    },
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
                                          ),
                                        ),
                                      if (_model.choiceChipsValue == 'Pendente')
                                        Expanded(
                                          child: FutureBuilder<
                                              List<ControlePedidosRow>>(
                                            future: (_model
                                                        .requestCompleter3 ??=
                                                    Completer<
                                                        List<
                                                            ControlePedidosRow>>()
                                                      ..complete(
                                                          ControlePedidosTable()
                                                              .queryRows(
                                                        queryFn: (q) => q
                                                            .eqOrNull(
                                                              'usuario',
                                                              currentUserUid,
                                                            )
                                                            .eqOrNull(
                                                              'status_pagamento',
                                                              'Pendente',
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
                                              List<ControlePedidosRow>
                                                  listViewControlePedidosRowList =
                                                  snapshot.data!;

                                              return ListView.separated(
                                                padding: EdgeInsets.zero,
                                                shrinkWrap: true,
                                                scrollDirection: Axis.vertical,
                                                itemCount:
                                                    listViewControlePedidosRowList
                                                        .length,
                                                separatorBuilder: (_, __) =>
                                                    const SizedBox(height: 12.0),
                                                itemBuilder:
                                                    (context, listViewIndex) {
                                                  final listViewControlePedidosRow =
                                                      listViewControlePedidosRowList[
                                                          listViewIndex];
                                                  return Padding(
                                                    padding:
                                                        const EdgeInsets.all(2.0),
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
                                                        if (listViewControlePedidosRow
                                                                .statusPagamento ==
                                                            'Pago') {
                                                          await ControlePedidosTable()
                                                              .update(
                                                            data: {
                                                              'status_pagamento':
                                                                  'Pendente',
                                                            },
                                                            matchingRows:
                                                                (rows) => rows
                                                                    .eqOrNull(
                                                              'id',
                                                              listViewControlePedidosRow
                                                                  .id,
                                                            ),
                                                          );
                                                          ScaffoldMessenger.of(
                                                                  context)
                                                              .showSnackBar(
                                                            SnackBar(
                                                              content: Text(
                                                                'Pagamento alterado!',
                                                                style:
                                                                    TextStyle(
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
                                                          safeSetState(() =>
                                                              _model.requestCompleter4 =
                                                                  null);
                                                          await _model
                                                              .waitForRequestCompleted4();
                                                          safeSetState(() =>
                                                              _model.requestCompleter3 =
                                                                  null);
                                                          await _model
                                                              .waitForRequestCompleted3();
                                                        } else {
                                                          await ControlePedidosTable()
                                                              .update(
                                                            data: {
                                                              'status_pagamento':
                                                                  'Pago',
                                                            },
                                                            matchingRows:
                                                                (rows) => rows
                                                                    .eqOrNull(
                                                              'id',
                                                              listViewControlePedidosRow
                                                                  .id,
                                                            ),
                                                          );
                                                          ScaffoldMessenger.of(
                                                                  context)
                                                              .showSnackBar(
                                                            SnackBar(
                                                              content: Text(
                                                                'Pagamento alterado!',
                                                                style:
                                                                    TextStyle(
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
                                                          safeSetState(() =>
                                                              _model.requestCompleter4 =
                                                                  null);
                                                          await _model
                                                              .waitForRequestCompleted4();
                                                          safeSetState(() =>
                                                              _model.requestCompleter3 =
                                                                  null);
                                                          await _model
                                                              .waitForRequestCompleted3();
                                                        }
                                                      },
                                                      onLongPress: () async {
                                                        await launchURL(
                                                            'https://wa.me/?text=*Seu Veículo Está Pronto! 🚗✨${FFAppState().linebreak}O serviço no seu carro foi finalizado e está pronto para ser retirado na WB AutoService${FFAppState().linebreak}${FFAppState().linebreak}Pedido nº: ${listViewControlePedidosRow.numeroPedido?.toString()}${FFAppState().linebreak}*Total: ${formatNumber(
                                                          listViewControlePedidosRow
                                                              .total,
                                                          formatType:
                                                              FormatType.custom,
                                                          currency: 'R\$ ',
                                                          format: '#,##0.00',
                                                          locale: 'pt_br',
                                                        )}*${FFAppState().linebreak}${FFAppState().linebreak}Como você pode pagar:  Dinheiro Cartão de Débito Cartão de Crédito Transferência Bancária Estamos à disposição para qualquer dúvida ou para agendar um horário conveniente para você. Obrigado por confiar em nossos serviços!');
                                                      },
                                                      child: Container(
                                                        width: double.infinity,
                                                        height: 70.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
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
                                                                    height:
                                                                        50.0,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: listViewControlePedidosRow.statusPagamento ==
                                                                              'Pago'
                                                                          ? FlutterFlowTheme.of(context)
                                                                              .primary
                                                                          : FlutterFlowTheme.of(context)
                                                                              .error,
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              30.0),
                                                                    ),
                                                                    child:
                                                                        Column(
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
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondaryBackground,
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
                                                                          listViewControlePedidosRow
                                                                              .cliente,
                                                                          '-',
                                                                        ),
                                                                        minFontSize:
                                                                            12.0,
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'Readex Pro',
                                                                              fontSize: 20.0,
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.bold,
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
                                                                        valueOrDefault<
                                                                            String>(
                                                                          formatNumber(
                                                                            listViewControlePedidosRow.total,
                                                                            formatType:
                                                                                FormatType.custom,
                                                                            currency:
                                                                                'R\$ ',
                                                                            format:
                                                                                '#,##0.00',
                                                                            locale:
                                                                                'pt_br',
                                                                          ),
                                                                          '-',
                                                                        ),
                                                                        minFontSize:
                                                                            12.0,
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'Readex Pro',
                                                                              fontSize: 16.0,
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.w500,
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
                                                                    valueOrDefault<
                                                                        String>(
                                                                      dateTimeFormat(
                                                                        "dd/M",
                                                                        listViewControlePedidosRow
                                                                            .createdAt,
                                                                        locale:
                                                                            FFLocalizations.of(context).languageCode,
                                                                      ),
                                                                      '-',
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
                                                                  FutureBuilder<
                                                                      List<
                                                                          ControlePedidosItensRow>>(
                                                                    future: ControlePedidosItensTable()
                                                                        .queryRows(
                                                                      queryFn:
                                                                          (q) =>
                                                                              q.eqOrNull(
                                                                        'id',
                                                                        listViewControlePedidosRow
                                                                            .id,
                                                                      ),
                                                                    ),
                                                                    builder:
                                                                        (context,
                                                                            snapshot) {
                                                                      // Customize what your widget looks like when it's loading.
                                                                      if (!snapshot
                                                                          .hasData) {
                                                                        return Center(
                                                                          child:
                                                                              SizedBox(
                                                                            width:
                                                                                50.0,
                                                                            height:
                                                                                50.0,
                                                                            child:
                                                                                CircularProgressIndicator(
                                                                              valueColor: AlwaysStoppedAnimation<Color>(
                                                                                FlutterFlowTheme.of(context).primary,
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        );
                                                                      }
                                                                      List<ControlePedidosItensRow>
                                                                          iconControlePedidosItensRowList =
                                                                          snapshot
                                                                              .data!;

                                                                      return InkWell(
                                                                        splashColor:
                                                                            Colors.transparent,
                                                                        focusColor:
                                                                            Colors.transparent,
                                                                        hoverColor:
                                                                            Colors.transparent,
                                                                        highlightColor:
                                                                            Colors.transparent,
                                                                        onTap:
                                                                            () async {
                                                                          await showDialog(
                                                                            context:
                                                                                context,
                                                                            builder:
                                                                                (alertDialogContext) {
                                                                              return AlertDialog(
                                                                                content: Text(iconControlePedidosItensRowList.length.toString()),
                                                                                actions: [
                                                                                  TextButton(
                                                                                    onPressed: () => Navigator.pop(alertDialogContext),
                                                                                    child: const Text('Ok'),
                                                                                  ),
                                                                                ],
                                                                              );
                                                                            },
                                                                          );
                                                                          await actions
                                                                              .gerarPDFVenda(
                                                                            listViewControlePedidosRow.id,
                                                                            listViewControlePedidosRow.cliente,
                                                                            listViewControlePedidosRow.dataField?.toString(),
                                                                            _model.produtos.toList(),
                                                                            listViewControlePedidosRow.total,
                                                                            0.0,
                                                                          );
                                                                        },
                                                                        child:
                                                                            FaIcon(
                                                                          FontAwesomeIcons
                                                                              .solidFilePdf,
                                                                          color:
                                                                              FlutterFlowTheme.of(context).error,
                                                                          size:
                                                                              24.0,
                                                                        ),
                                                                      );
                                                                    },
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
                                          ),
                                        ),
                                    ].divide(const SizedBox(height: 12.0)),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ].addToStart(const SizedBox(height: 8.0)),
                      );
                    },
                  ),
                ),
              ),
            ));
      },
    );
  }
}
