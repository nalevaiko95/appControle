import '/a1/editar_produto_carrinho/editar_produto_carrinho_widget.dart';
import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_radio_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/actions/actions.dart' as action_blocks;
import 'dart:async';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'carrinho2_model.dart';
export 'carrinho2_model.dart';

class Carrinho2Widget extends StatefulWidget {
  const Carrinho2Widget({super.key});

  @override
  State<Carrinho2Widget> createState() => _Carrinho2WidgetState();
}

class _Carrinho2WidgetState extends State<Carrinho2Widget>
    with TickerProviderStateMixin {
  late Carrinho2Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => Carrinho2Model());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.cliente = 'Não Identificado';
      _model.data = null;
      _model.idCliente = null;
      safeSetState(() {});
    });

    _model.tabBarController = TabController(
      vsync: this,
      length: 3,
      initialIndex: 0,
    )..addListener(() => safeSetState(() {}));
    _model.textController1 ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();

    _model.txtNomeTextController ??= TextEditingController();
    _model.txtNomeFocusNode ??= FocusNode();

    _model.txtValorTextController ??= TextEditingController();
    _model.txtValorFocusNode ??= FocusNode();

    _model.txtQtdTextController ??= TextEditingController();
    _model.txtQtdFocusNode ??= FocusNode();

    _model.txtObsTextController ??= TextEditingController();
    _model.txtObsFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {
          _model.textController1?.text = dateTimeFormat(
            "dd/MM/yyyy",
            getCurrentTimestamp,
            locale: FFLocalizations.of(context).languageCode,
          );
          _model.txtQtdTextController?.text = '1';
        }));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Title(
        title: 'carrinho2',
        color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            floatingActionButton: Opacity(
              opacity: 0.0,
              child: FloatingActionButton(
                onPressed: () {
                  print('FloatingActionButton pressed ...');
                },
                backgroundColor: FlutterFlowTheme.of(context).primary,
                elevation: 8.0,
                child: Icon(
                  Icons.check_sharp,
                  color: FlutterFlowTheme.of(context).info,
                  size: 24.0,
                ),
              ),
            ),
            appBar: AppBar(
              backgroundColor: FlutterFlowTheme.of(context).primary,
              automaticallyImplyLeading: false,
              leading: FlutterFlowIconButton(
                borderColor: Colors.transparent,
                borderRadius: 30.0,
                borderWidth: 1.0,
                buttonSize: 60.0,
                icon: const Icon(
                  Icons.arrow_back_rounded,
                  color: Colors.white,
                  size: 30.0,
                ),
                onPressed: () async {
                  context.safePop();
                },
              ),
              title: Text(
                'Carrinho',
                style: FlutterFlowTheme.of(context).headlineMedium.override(
                      fontFamily: 'Readex Pro',
                      color: Colors.white,
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
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
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
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(24.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: Column(
                                  children: [
                                    Align(
                                      alignment: const Alignment(0.0, 0),
                                      child: TabBar(
                                        labelColor: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        unselectedLabelColor:
                                            FlutterFlowTheme.of(context)
                                                .secondaryText,
                                        labelStyle: FlutterFlowTheme.of(context)
                                            .titleMedium
                                            .override(
                                              fontFamily: 'Readex Pro',
                                              letterSpacing: 0.0,
                                            ),
                                        unselectedLabelStyle: const TextStyle(),
                                        indicatorColor:
                                            FlutterFlowTheme.of(context)
                                                .primary,
                                        padding: const EdgeInsets.all(4.0),
                                        tabs: const [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Icon(
                                                Icons.person,
                                              ),
                                              Tab(
                                                text: '',
                                              ),
                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Icon(
                                                Icons.shopping_cart,
                                              ),
                                              Tab(
                                                text: '',
                                              ),
                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              FaIcon(
                                                FontAwesomeIcons
                                                    .solidCreditCard,
                                              ),
                                              Tab(
                                                text: '',
                                              ),
                                            ],
                                          ),
                                        ],
                                        controller: _model.tabBarController,
                                        onTap: (i) async {
                                          [
                                            () async {},
                                            () async {},
                                            () async {}
                                          ][i]();
                                        },
                                      ),
                                    ),
                                    Expanded(
                                      child: TabBarView(
                                        controller: _model.tabBarController,
                                        children: [
                                          Column(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Expanded(
                                                    child: TextFormField(
                                                      controller: _model
                                                          .textController1,
                                                      focusNode: _model
                                                          .textFieldFocusNode,
                                                      autofocus: true,
                                                      readOnly: true,
                                                      obscureText: false,
                                                      decoration:
                                                          InputDecoration(
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
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .alternate,
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
                                                            color: FlutterFlowTheme
                                                                    .of(context)
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
                                                            color: FlutterFlowTheme
                                                                    .of(context)
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
                                                            color: FlutterFlowTheme
                                                                    .of(context)
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
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Readex Pro',
                                                            letterSpacing: 0.0,
                                                          ),
                                                      validator: _model
                                                          .textController1Validator
                                                          .asValidator(context),
                                                    ),
                                                  ),
                                                  FlutterFlowIconButton(
                                                    borderColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primary,
                                                    borderRadius: 8.0,
                                                    borderWidth: 1.0,
                                                    buttonSize: 50.0,
                                                    fillColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primary,
                                                    icon: Icon(
                                                      Icons.calendar_month,
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                      size: 24.0,
                                                    ),
                                                    onPressed: () async {
                                                      final datePickedDate =
                                                          await showDatePicker(
                                                        context: context,
                                                        initialDate:
                                                            getCurrentTimestamp,
                                                        firstDate:
                                                            DateTime(1900),
                                                        lastDate:
                                                            DateTime(2050),
                                                        builder:
                                                            (context, child) {
                                                          return wrapInMaterialDatePickerTheme(
                                                            context,
                                                            child!,
                                                            headerBackgroundColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                            headerForegroundColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .info,
                                                            headerTextStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .headlineLarge
                                                                    .override(
                                                                      fontFamily:
                                                                          'Readex Pro',
                                                                      fontSize:
                                                                          32.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600,
                                                                    ),
                                                            pickerBackgroundColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground,
                                                            pickerForegroundColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                            selectedDateTimeBackgroundColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                            selectedDateTimeForegroundColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .info,
                                                            actionButtonForegroundColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                            iconSize: 24.0,
                                                          );
                                                        },
                                                      );

                                                      if (datePickedDate !=
                                                          null) {
                                                        safeSetState(() {
                                                          _model.datePicked =
                                                              DateTime(
                                                            datePickedDate
                                                                .year,
                                                            datePickedDate
                                                                .month,
                                                            datePickedDate.day,
                                                          );
                                                        });
                                                      }
                                                      safeSetState(() {
                                                        _model.textController1
                                                                ?.text =
                                                            dateTimeFormat(
                                                          "dd/MM/yyyy",
                                                          _model.datePicked,
                                                          locale:
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .languageCode,
                                                        );
                                                      });
                                                      _model.data =
                                                          _model.datePicked;
                                                      safeSetState(() {});
                                                    },
                                                  ),
                                                ].divide(const SizedBox(width: 8.0)),
                                              ),
                                              if (responsiveVisibility(
                                                context: context,
                                                phone: false,
                                                tablet: false,
                                                tabletLandscape: false,
                                                desktop: false,
                                              ))
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Expanded(
                                                      flex: 8,
                                                      child: FutureBuilder<
                                                          List<
                                                              ControleClientesRow>>(
                                                        future: (_model
                                                                    .requestCompleter ??=
                                                                Completer<
                                                                    List<
                                                                        ControleClientesRow>>()
                                                                  ..complete(
                                                                      ControleClientesTable()
                                                                          .queryRows(
                                                                    queryFn: (q) => q
                                                                        .eqOrNull(
                                                                          'usuario',
                                                                          currentUserUid,
                                                                        )
                                                                        .order('nome', ascending: true),
                                                                  )))
                                                            .future,
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
                                                          List<ControleClientesRow>
                                                              dropDownClienteControleClientesRowList =
                                                              snapshot.data!;

                                                          return FlutterFlowDropDown<
                                                              String>(
                                                            controller: _model
                                                                    .dropDownClienteValueController ??=
                                                                FormFieldController<
                                                                        String>(
                                                                    null),
                                                            options:
                                                                dropDownClienteControleClientesRowList
                                                                    .map((e) =>
                                                                        e.nome)
                                                                    .withoutNulls
                                                                    .toList(),
                                                            onChanged: (val) =>
                                                                safeSetState(() =>
                                                                    _model.dropDownClienteValue =
                                                                        val),
                                                            width: MediaQuery
                                                                        .sizeOf(
                                                                            context)
                                                                    .width *
                                                                0.9,
                                                            height: 50.0,
                                                            searchHintTextStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Readex Pro',
                                                                      letterSpacing:
                                                                          0.0,
                                                                    ),
                                                            searchTextStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Readex Pro',
                                                                      letterSpacing:
                                                                          0.0,
                                                                    ),
                                                            textStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Readex Pro',
                                                                      letterSpacing:
                                                                          0.0,
                                                                    ),
                                                            hintText:
                                                                'Selecione...',
                                                            searchHintText:
                                                                'Digite o nome do cliente',
                                                            icon: Icon(
                                                              Icons
                                                                  .keyboard_arrow_down_rounded,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryText,
                                                              size: 24.0,
                                                            ),
                                                            fillColor: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                            elevation: 2.0,
                                                            borderColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .alternate,
                                                            borderWidth: 2.0,
                                                            borderRadius: 8.0,
                                                            margin:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        16.0,
                                                                        4.0,
                                                                        16.0,
                                                                        4.0),
                                                            hidesUnderline:
                                                                true,
                                                            isOverButton: true,
                                                            isSearchable: true,
                                                            isMultiSelect:
                                                                false,
                                                          );
                                                        },
                                                      ),
                                                    ),
                                                    FlutterFlowIconButton(
                                                      borderColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                      borderRadius: 8.0,
                                                      borderWidth: 1.0,
                                                      buttonSize: 50.0,
                                                      fillColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                      icon: Icon(
                                                        Icons.add,
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                        size: 24.0,
                                                      ),
                                                      onPressed: () async {
                                                        context.pushNamed(
                                                            'cadastroClientes');

                                                        safeSetState(() => _model
                                                                .requestCompleter =
                                                            null);
                                                        await _model
                                                            .waitForRequestCompleted();
                                                      },
                                                    ),
                                                  ].divide(
                                                      const SizedBox(width: 8.0)),
                                                ),
                                              if (responsiveVisibility(
                                                context: context,
                                                phone: false,
                                                tablet: false,
                                                tabletLandscape: false,
                                                desktop: false,
                                              ))
                                                InkWell(
                                                  splashColor:
                                                      Colors.transparent,
                                                  focusColor:
                                                      Colors.transparent,
                                                  hoverColor:
                                                      Colors.transparent,
                                                  highlightColor:
                                                      Colors.transparent,
                                                  onTap: () async {
                                                    _model.cliente =
                                                        'Não Identificado';
                                                    safeSetState(() {});
                                                    safeSetState(() {
                                                      _model.dropDownClienteValueController
                                                              ?.value =
                                                          'Não Identificado';
                                                    });
                                                  },
                                                  child: Container(
                                                    width: double.infinity,
                                                    height: 70.0,
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                      borderRadius:
                                                          BorderRadius.circular(
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
                                                                height: 50.0,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .error,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
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
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
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
                                                                  RichText(
                                                                    textScaler:
                                                                        MediaQuery.of(context)
                                                                            .textScaler,
                                                                    text:
                                                                        TextSpan(
                                                                      children: const [
                                                                        TextSpan(
                                                                          text:
                                                                              'Não Identificar',
                                                                          style:
                                                                              TextStyle(),
                                                                        )
                                                                      ],
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Readex Pro',
                                                                            color:
                                                                                FlutterFlowTheme.of(context).error,
                                                                            fontSize:
                                                                                24.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.bold,
                                                                          ),
                                                                    ),
                                                                    textAlign:
                                                                        TextAlign
                                                                            .start,
                                                                  ),
                                                                ],
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ].divide(
                                                          const SizedBox(width: 8.0)),
                                                    ),
                                                  ),
                                                ),
                                              FFButtonWidget(
                                                onPressed: () async {
                                                  context.pushNamed(
                                                      'cadastroClientes');
                                                },
                                                text: 'Novo Cliente',
                                                icon: Icon(
                                                  Icons.add,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                  size: 15.0,
                                                ),
                                                options: FFButtonOptions(
                                                  width: double.infinity,
                                                  height: 40.0,
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          24.0, 0.0, 24.0, 0.0),
                                                  iconPadding:
                                                      const EdgeInsetsDirectional
                                                          .fromSTEB(0.0, 0.0,
                                                              0.0, 0.0),
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                  textStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleSmall
                                                          .override(
                                                            fontFamily:
                                                                'Readex Pro',
                                                            color: Colors.white,
                                                            letterSpacing: 0.0,
                                                          ),
                                                  elevation: 3.0,
                                                  borderSide: const BorderSide(
                                                    color: Colors.transparent,
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                              ),
                                              Expanded(
                                                child: FutureBuilder<
                                                    List<ControleClientesRow>>(
                                                  future:
                                                      ControleClientesTable()
                                                          .queryRows(
                                                    queryFn: (q) => q
                                                        .eqOrNull(
                                                          'usuario',
                                                          currentUserUid,
                                                        )
                                                        .order('nome',
                                                            ascending: true),
                                                  ),
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
                                                    List<ControleClientesRow>
                                                        listViewControleClientesRowList =
                                                        snapshot.data!;

                                                    return ListView.builder(
                                                      padding: EdgeInsets.zero,
                                                      shrinkWrap: true,
                                                      scrollDirection:
                                                          Axis.vertical,
                                                      itemCount:
                                                          listViewControleClientesRowList
                                                              .length,
                                                      itemBuilder: (context,
                                                          listViewIndex) {
                                                        final listViewControleClientesRow =
                                                            listViewControleClientesRowList[
                                                                listViewIndex];
                                                        return InkWell(
                                                          splashColor: Colors
                                                              .transparent,
                                                          focusColor: Colors
                                                              .transparent,
                                                          hoverColor: Colors
                                                              .transparent,
                                                          highlightColor: Colors
                                                              .transparent,
                                                          onTap: () async {
                                                            _model.cliente =
                                                                listViewControleClientesRow
                                                                    .nome;
                                                            _model.idCliente =
                                                                listViewControleClientesRow
                                                                    .id;
                                                            safeSetState(() {});
                                                            safeSetState(() {
                                                              _model.dropDownClienteValueController
                                                                      ?.value =
                                                                  listViewControleClientesRow
                                                                      .nome!;
                                                            });
                                                            safeSetState(() {
                                                              _model
                                                                  .tabBarController!
                                                                  .animateTo(
                                                                min(
                                                                    _model.tabBarController!
                                                                            .length -
                                                                        1,
                                                                    _model.tabBarController!
                                                                            .index +
                                                                        1),
                                                                duration: const Duration(
                                                                    milliseconds:
                                                                        300),
                                                                curve:
                                                                    Curves.ease,
                                                              );
                                                            });
                                                          },
                                                          child: Container(
                                                            width:
                                                                double.infinity,
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
                                                                  MainAxisSize
                                                                      .max,
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
                                                                        width:
                                                                            50.0,
                                                                        height:
                                                                            50.0,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primary,
                                                                          borderRadius:
                                                                              BorderRadius.circular(30.0),
                                                                        ),
                                                                        child:
                                                                            Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.center,
                                                                          children: [
                                                                            Icon(
                                                                              Icons.person_sharp,
                                                                              color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                              size: 24.0,
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
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.start,
                                                                        children: [
                                                                          FutureBuilder<
                                                                              List<ViewSomaProducaoRow>>(
                                                                            future:
                                                                                ViewSomaProducaoTable().querySingleRow(
                                                                              queryFn: (q) => q.eqOrNull(
                                                                                'referencia',
                                                                                listViewControleClientesRow.id,
                                                                              ),
                                                                            ),
                                                                            builder:
                                                                                (context, snapshot) {
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
                                                                              List<ViewSomaProducaoRow> richTextViewSomaProducaoRowList = snapshot.data!;

                                                                              final richTextViewSomaProducaoRow = richTextViewSomaProducaoRowList.isNotEmpty ? richTextViewSomaProducaoRowList.first : null;

                                                                              return RichText(
                                                                                textScaler: MediaQuery.of(context).textScaler,
                                                                                text: TextSpan(
                                                                                  children: [
                                                                                    TextSpan(
                                                                                      text: valueOrDefault<String>(
                                                                                        listViewControleClientesRow.nome,
                                                                                        '-',
                                                                                      ),
                                                                                      style: const TextStyle(),
                                                                                    )
                                                                                  ],
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: 'Readex Pro',
                                                                                        color: FlutterFlowTheme.of(context).primary,
                                                                                        fontSize: 24.0,
                                                                                        letterSpacing: 0.0,
                                                                                        fontWeight: FontWeight.bold,
                                                                                      ),
                                                                                ),
                                                                                textAlign: TextAlign.start,
                                                                              );
                                                                            },
                                                                          ),
                                                                        ],
                                                                      ),
                                                                      Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.start,
                                                                        children: [
                                                                          FutureBuilder<
                                                                              List<ViewSomaProducaoRow>>(
                                                                            future:
                                                                                ViewSomaProducaoTable().querySingleRow(
                                                                              queryFn: (q) => q.eqOrNull(
                                                                                'referencia',
                                                                                listViewControleClientesRow.id,
                                                                              ),
                                                                            ),
                                                                            builder:
                                                                                (context, snapshot) {
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
                                                                              List<ViewSomaProducaoRow> richTextViewSomaProducaoRowList = snapshot.data!;

                                                                              final richTextViewSomaProducaoRow = richTextViewSomaProducaoRowList.isNotEmpty ? richTextViewSomaProducaoRowList.first : null;

                                                                              return RichText(
                                                                                textScaler: MediaQuery.of(context).textScaler,
                                                                                text: TextSpan(
                                                                                  children: [
                                                                                    TextSpan(
                                                                                      text: valueOrDefault<String>(
                                                                                        listViewControleClientesRow.contato,
                                                                                        '-',
                                                                                      ),
                                                                                      style: const TextStyle(
                                                                                        fontWeight: FontWeight.w600,
                                                                                        fontSize: 14.0,
                                                                                      ),
                                                                                    )
                                                                                  ],
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: 'Readex Pro',
                                                                                        letterSpacing: 0.0,
                                                                                      ),
                                                                                ),
                                                                                textAlign: TextAlign.start,
                                                                              );
                                                                            },
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ].divide(const SizedBox(
                                                                  width: 8.0)),
                                                            ),
                                                          ),
                                                        );
                                                      },
                                                    );
                                                  },
                                                ),
                                              ),
                                              FFButtonWidget(
                                                onPressed: () async {
                                                  safeSetState(() {
                                                    _model.tabBarController!
                                                        .animateTo(
                                                      min(
                                                          _model.tabBarController!
                                                                  .length -
                                                              1,
                                                          _model.tabBarController!
                                                                  .index +
                                                              1),
                                                      duration: const Duration(
                                                          milliseconds: 300),
                                                      curve: Curves.ease,
                                                    );
                                                  });
                                                },
                                                text: 'Continuar',
                                                options: FFButtonOptions(
                                                  width: double.infinity,
                                                  height: 50.0,
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          24.0, 0.0, 24.0, 0.0),
                                                  iconPadding:
                                                      const EdgeInsetsDirectional
                                                          .fromSTEB(0.0, 0.0,
                                                              0.0, 0.0),
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                  textStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleSmall
                                                          .override(
                                                            fontFamily:
                                                                'Readex Pro',
                                                            color: Colors.white,
                                                            letterSpacing: 0.0,
                                                          ),
                                                  elevation: 3.0,
                                                  borderSide: const BorderSide(
                                                    color: Colors.transparent,
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                              ),
                                            ].divide(const SizedBox(height: 8.0)),
                                          ),
                                          Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Align(
                                                alignment: const AlignmentDirectional(
                                                    0.0, -1.0),
                                                child: Form(
                                                  key: _model.formKey,
                                                  autovalidateMode:
                                                      AutovalidateMode.disabled,
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      TextFormField(
                                                        controller: _model
                                                            .txtNomeTextController,
                                                        focusNode: _model
                                                            .txtNomeFocusNode,
                                                        autofocus: true,
                                                        obscureText: false,
                                                        decoration:
                                                            InputDecoration(
                                                          hintText:
                                                              'Digite o nome',
                                                          hintStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelLarge
                                                                  .override(
                                                                    fontFamily:
                                                                        'Readex Pro',
                                                                    letterSpacing:
                                                                        0.0,
                                                                  ),
                                                          enabledBorder:
                                                              UnderlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .alternate,
                                                              width: 2.0,
                                                            ),
                                                            borderRadius:
                                                                const BorderRadius
                                                                    .only(
                                                              topLeft: Radius
                                                                  .circular(
                                                                      4.0),
                                                              topRight: Radius
                                                                  .circular(
                                                                      4.0),
                                                            ),
                                                          ),
                                                          focusedBorder:
                                                              UnderlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primary,
                                                              width: 2.0,
                                                            ),
                                                            borderRadius:
                                                                const BorderRadius
                                                                    .only(
                                                              topLeft: Radius
                                                                  .circular(
                                                                      4.0),
                                                              topRight: Radius
                                                                  .circular(
                                                                      4.0),
                                                            ),
                                                          ),
                                                          errorBorder:
                                                              UnderlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .error,
                                                              width: 2.0,
                                                            ),
                                                            borderRadius:
                                                                const BorderRadius
                                                                    .only(
                                                              topLeft: Radius
                                                                  .circular(
                                                                      4.0),
                                                              topRight: Radius
                                                                  .circular(
                                                                      4.0),
                                                            ),
                                                          ),
                                                          focusedErrorBorder:
                                                              UnderlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .error,
                                                              width: 2.0,
                                                            ),
                                                            borderRadius:
                                                                const BorderRadius
                                                                    .only(
                                                              topLeft: Radius
                                                                  .circular(
                                                                      4.0),
                                                              topRight: Radius
                                                                  .circular(
                                                                      4.0),
                                                            ),
                                                          ),
                                                          contentPadding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      8.0,
                                                                      0.0,
                                                                      0.0,
                                                                      0.0),
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelLarge
                                                                .override(
                                                                  fontFamily:
                                                                      'Readex Pro',
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                        validator: _model
                                                            .txtNomeTextControllerValidator
                                                            .asValidator(
                                                                context),
                                                      ),
                                                      TextFormField(
                                                        controller: _model
                                                            .txtValorTextController,
                                                        focusNode: _model
                                                            .txtValorFocusNode,
                                                        autofocus: true,
                                                        obscureText: false,
                                                        decoration:
                                                            InputDecoration(
                                                          hintText: 'R\$ 0,00',
                                                          hintStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelLarge
                                                                  .override(
                                                                    fontFamily:
                                                                        'Readex Pro',
                                                                    letterSpacing:
                                                                        0.0,
                                                                  ),
                                                          enabledBorder:
                                                              UnderlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .alternate,
                                                              width: 2.0,
                                                            ),
                                                            borderRadius:
                                                                const BorderRadius
                                                                    .only(
                                                              topLeft: Radius
                                                                  .circular(
                                                                      4.0),
                                                              topRight: Radius
                                                                  .circular(
                                                                      4.0),
                                                            ),
                                                          ),
                                                          focusedBorder:
                                                              UnderlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primary,
                                                              width: 2.0,
                                                            ),
                                                            borderRadius:
                                                                const BorderRadius
                                                                    .only(
                                                              topLeft: Radius
                                                                  .circular(
                                                                      4.0),
                                                              topRight: Radius
                                                                  .circular(
                                                                      4.0),
                                                            ),
                                                          ),
                                                          errorBorder:
                                                              UnderlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .error,
                                                              width: 2.0,
                                                            ),
                                                            borderRadius:
                                                                const BorderRadius
                                                                    .only(
                                                              topLeft: Radius
                                                                  .circular(
                                                                      4.0),
                                                              topRight: Radius
                                                                  .circular(
                                                                      4.0),
                                                            ),
                                                          ),
                                                          focusedErrorBorder:
                                                              UnderlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .error,
                                                              width: 2.0,
                                                            ),
                                                            borderRadius:
                                                                const BorderRadius
                                                                    .only(
                                                              topLeft: Radius
                                                                  .circular(
                                                                      4.0),
                                                              topRight: Radius
                                                                  .circular(
                                                                      4.0),
                                                            ),
                                                          ),
                                                          contentPadding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      8.0,
                                                                      0.0,
                                                                      0.0,
                                                                      0.0),
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelLarge
                                                                .override(
                                                                  fontFamily:
                                                                      'Readex Pro',
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                        keyboardType:
                                                            TextInputType
                                                                .number,
                                                        validator: _model
                                                            .txtValorTextControllerValidator
                                                            .asValidator(
                                                                context),
                                                        inputFormatters: [
                                                          FilteringTextInputFormatter
                                                              .allow(RegExp(
                                                                  '[0-9]'))
                                                        ],
                                                      ),
                                                      Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          FlutterFlowIconButton(
                                                            borderRadius: 8.0,
                                                            buttonSize: 40.0,
                                                            fillColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondary,
                                                            icon: FaIcon(
                                                              FontAwesomeIcons
                                                                  .minus,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .info,
                                                              size: 24.0,
                                                            ),
                                                            onPressed:
                                                                () async {
                                                              safeSetState(() {
                                                                _model
                                                                    .txtQtdTextController
                                                                    ?.text = (double.parse(_model
                                                                            .txtQtdTextController
                                                                            .text) -
                                                                        1)
                                                                    .toString();
                                                              });
                                                            },
                                                          ),
                                                          Padding(
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        8.0,
                                                                        0.0,
                                                                        8.0,
                                                                        0.0),
                                                            child: SizedBox(
                                                              width: MediaQuery
                                                                          .sizeOf(
                                                                              context)
                                                                      .width *
                                                                  0.5,
                                                              child:
                                                                  TextFormField(
                                                                controller: _model
                                                                    .txtQtdTextController,
                                                                focusNode: _model
                                                                    .txtQtdFocusNode,
                                                                autofocus:
                                                                    false,
                                                                obscureText:
                                                                    false,
                                                                decoration:
                                                                    InputDecoration(
                                                                  isDense: true,
                                                                  labelStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleLarge
                                                                      .override(
                                                                        fontFamily:
                                                                            'Readex Pro',
                                                                        fontSize:
                                                                            36.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                                  alignLabelWithHint:
                                                                      true,
                                                                  hintText:
                                                                      'TextField',
                                                                  hintStyle: FlutterFlowTheme.of(
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
                                                                        const BorderSide(
                                                                      color: Color(
                                                                          0x00000000),
                                                                      width:
                                                                          1.0,
                                                                    ),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            8.0),
                                                                  ),
                                                                  focusedBorder:
                                                                      OutlineInputBorder(
                                                                    borderSide:
                                                                        const BorderSide(
                                                                      color: Color(
                                                                          0x00000000),
                                                                      width:
                                                                          1.0,
                                                                    ),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            8.0),
                                                                  ),
                                                                  errorBorder:
                                                                      OutlineInputBorder(
                                                                    borderSide:
                                                                        BorderSide(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .error,
                                                                      width:
                                                                          1.0,
                                                                    ),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            8.0),
                                                                  ),
                                                                  focusedErrorBorder:
                                                                      OutlineInputBorder(
                                                                    borderSide:
                                                                        BorderSide(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .error,
                                                                      width:
                                                                          1.0,
                                                                    ),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            8.0),
                                                                  ),
                                                                  filled: true,
                                                                  fillColor: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryBackground,
                                                                ),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Readex Pro',
                                                                      fontSize:
                                                                          36.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                    ),
                                                                textAlign:
                                                                    TextAlign
                                                                        .center,
                                                                keyboardType:
                                                                    const TextInputType
                                                                        .numberWithOptions(
                                                                        decimal:
                                                                            true),
                                                                cursorColor:
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryText,
                                                                validator: _model
                                                                    .txtQtdTextControllerValidator
                                                                    .asValidator(
                                                                        context),
                                                              ),
                                                            ),
                                                          ),
                                                          FlutterFlowIconButton(
                                                            borderColor: Colors
                                                                .transparent,
                                                            borderRadius: 8.0,
                                                            buttonSize: 40.0,
                                                            fillColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondary,
                                                            icon: Icon(
                                                              Icons.add,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .info,
                                                              size: 24.0,
                                                            ),
                                                            onPressed:
                                                                () async {
                                                              safeSetState(() {
                                                                _model
                                                                    .txtQtdTextController
                                                                    ?.text = (double.parse(_model
                                                                            .txtQtdTextController
                                                                            .text) +
                                                                        1)
                                                                    .toString();
                                                              });
                                                            },
                                                          ),
                                                        ].divide(const SizedBox(
                                                            width: 12.0)),
                                                      ),
                                                      TextFormField(
                                                        controller: _model
                                                            .txtObsTextController,
                                                        focusNode: _model
                                                            .txtObsFocusNode,
                                                        autofocus: true,
                                                        obscureText: false,
                                                        decoration:
                                                            InputDecoration(
                                                          hintText:
                                                              'Observação',
                                                          hintStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelLarge
                                                                  .override(
                                                                    fontFamily:
                                                                        'Readex Pro',
                                                                    letterSpacing:
                                                                        0.0,
                                                                  ),
                                                          enabledBorder:
                                                              UnderlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .alternate,
                                                              width: 2.0,
                                                            ),
                                                            borderRadius:
                                                                const BorderRadius
                                                                    .only(
                                                              topLeft: Radius
                                                                  .circular(
                                                                      4.0),
                                                              topRight: Radius
                                                                  .circular(
                                                                      4.0),
                                                            ),
                                                          ),
                                                          focusedBorder:
                                                              UnderlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primary,
                                                              width: 2.0,
                                                            ),
                                                            borderRadius:
                                                                const BorderRadius
                                                                    .only(
                                                              topLeft: Radius
                                                                  .circular(
                                                                      4.0),
                                                              topRight: Radius
                                                                  .circular(
                                                                      4.0),
                                                            ),
                                                          ),
                                                          errorBorder:
                                                              UnderlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .error,
                                                              width: 2.0,
                                                            ),
                                                            borderRadius:
                                                                const BorderRadius
                                                                    .only(
                                                              topLeft: Radius
                                                                  .circular(
                                                                      4.0),
                                                              topRight: Radius
                                                                  .circular(
                                                                      4.0),
                                                            ),
                                                          ),
                                                          focusedErrorBorder:
                                                              UnderlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .error,
                                                              width: 2.0,
                                                            ),
                                                            borderRadius:
                                                                const BorderRadius
                                                                    .only(
                                                              topLeft: Radius
                                                                  .circular(
                                                                      4.0),
                                                              topRight: Radius
                                                                  .circular(
                                                                      4.0),
                                                            ),
                                                          ),
                                                          contentPadding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      8.0,
                                                                      0.0,
                                                                      0.0,
                                                                      0.0),
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelLarge
                                                                .override(
                                                                  fontFamily:
                                                                      'Readex Pro',
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                        validator: _model
                                                            .txtObsTextControllerValidator
                                                            .asValidator(
                                                                context),
                                                      ),
                                                      Align(
                                                        alignment:
                                                            const AlignmentDirectional(
                                                                0.0, 0.0),
                                                        child: FFButtonWidget(
                                                          onPressed: () async {
                                                            if (_model.formKey
                                                                        .currentState ==
                                                                    null ||
                                                                !_model.formKey
                                                                    .currentState!
                                                                    .validate()) {
                                                              return;
                                                            }
                                                            safeSetState(() {
                                                              _model
                                                                  .txtValorTextController
                                                                  ?.clear();
                                                              _model
                                                                  .txtNomeTextController
                                                                  ?.clear();
                                                            });
                                                            await action_blocks
                                                                .calculaCarrinho(
                                                                    context);
                                                          },
                                                          text: 'Adicionar',
                                                          options:
                                                              FFButtonOptions(
                                                            width:
                                                                double.infinity,
                                                            height: 50.0,
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            iconPadding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondary,
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
                                                            borderSide:
                                                                const BorderSide(
                                                              color: Colors
                                                                  .transparent,
                                                              width: 1.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                          ),
                                                        ),
                                                      ),
                                                    ].divide(
                                                        const SizedBox(height: 12.0)),
                                                  ),
                                                ),
                                              ),
                                              Flexible(
                                                child: Builder(
                                                  builder: (context) {
                                                    final lvItensCarrinho =
                                                        FFAppState()
                                                            .itensCarrinho
                                                            .sortedList(
                                                                keyOf: (e) =>
                                                                    e.idProduto,
                                                                desc: true)
                                                            .toList();

                                                    return ListView.separated(
                                                      padding: EdgeInsets.zero,
                                                      primary: false,
                                                      shrinkWrap: true,
                                                      scrollDirection:
                                                          Axis.vertical,
                                                      itemCount: lvItensCarrinho
                                                          .length,
                                                      separatorBuilder: (_,
                                                              __) =>
                                                          const SizedBox(height: 8.0),
                                                      itemBuilder: (context,
                                                          lvItensCarrinhoIndex) {
                                                        final lvItensCarrinhoItem =
                                                            lvItensCarrinho[
                                                                lvItensCarrinhoIndex];
                                                        return InkWell(
                                                          splashColor: Colors
                                                              .transparent,
                                                          focusColor: Colors
                                                              .transparent,
                                                          hoverColor: Colors
                                                              .transparent,
                                                          highlightColor: Colors
                                                              .transparent,
                                                          onTap: () async {
                                                            await showModalBottomSheet(
                                                              isScrollControlled:
                                                                  true,
                                                              backgroundColor:
                                                                  Colors
                                                                      .transparent,
                                                              enableDrag: false,
                                                              context: context,
                                                              builder:
                                                                  (context) {
                                                                return GestureDetector(
                                                                  onTap: () {
                                                                    FocusScope.of(
                                                                            context)
                                                                        .unfocus();
                                                                    FocusManager
                                                                        .instance
                                                                        .primaryFocus
                                                                        ?.unfocus();
                                                                  },
                                                                  child:
                                                                      Padding(
                                                                    padding: MediaQuery
                                                                        .viewInsetsOf(
                                                                            context),
                                                                    child:
                                                                        EditarProdutoCarrinhoWidget(
                                                                      id: lvItensCarrinhoItem,
                                                                    ),
                                                                  ),
                                                                );
                                                              },
                                                            ).then((value) =>
                                                                safeSetState(
                                                                    () {}));
                                                          },
                                                          child: Material(
                                                            color: Colors
                                                                .transparent,
                                                            elevation: 0.0,
                                                            shape:
                                                                const RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .only(
                                                                bottomLeft: Radius
                                                                    .circular(
                                                                        0.0),
                                                                bottomRight: Radius
                                                                    .circular(
                                                                        16.0),
                                                                topLeft: Radius
                                                                    .circular(
                                                                        16.0),
                                                                topRight: Radius
                                                                    .circular(
                                                                        2.0),
                                                              ),
                                                            ),
                                                            child: Container(
                                                              width: double
                                                                  .infinity,
                                                              height: 70.0,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .alternate,
                                                                boxShadow: const [
                                                                  BoxShadow(
                                                                    blurRadius:
                                                                        4.0,
                                                                    color: Color(
                                                                        0x33000000),
                                                                    offset:
                                                                        Offset(
                                                                      0.0,
                                                                      2.0,
                                                                    ),
                                                                  )
                                                                ],
                                                                borderRadius:
                                                                    const BorderRadius
                                                                        .only(
                                                                  bottomLeft: Radius
                                                                      .circular(
                                                                          0.0),
                                                                  bottomRight: Radius
                                                                      .circular(
                                                                          16.0),
                                                                  topLeft: Radius
                                                                      .circular(
                                                                          16.0),
                                                                  topRight: Radius
                                                                      .circular(
                                                                          2.0),
                                                                ),
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
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Expanded(
                                                                      flex: 8,
                                                                      child:
                                                                          Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.start,
                                                                        children: [
                                                                          Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.start,
                                                                            children: [
                                                                              Expanded(
                                                                                child: AutoSizeText(
                                                                                  valueOrDefault<String>(
                                                                                    lvItensCarrinhoItem.nome,
                                                                                    '-',
                                                                                  ),
                                                                                  maxLines: 1,
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: 'Readex Pro',
                                                                                        color: FlutterFlowTheme.of(context).primary,
                                                                                        fontSize: 24.0,
                                                                                        letterSpacing: 0.0,
                                                                                        fontWeight: FontWeight.bold,
                                                                                      ),
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                          Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.start,
                                                                            children: [
                                                                              RichText(
                                                                                textScaler: MediaQuery.of(context).textScaler,
                                                                                text: TextSpan(
                                                                                  children: [
                                                                                    TextSpan(
                                                                                      text: valueOrDefault<String>(
                                                                                        formatNumber(
                                                                                          lvItensCarrinhoItem.total,
                                                                                          formatType: FormatType.custom,
                                                                                          currency: 'R\$ ',
                                                                                          format: '#,###.00',
                                                                                          locale: 'pt_br',
                                                                                        ),
                                                                                        '-',
                                                                                      ),
                                                                                      style: const TextStyle(
                                                                                        fontWeight: FontWeight.w600,
                                                                                        fontSize: 14.0,
                                                                                      ),
                                                                                    )
                                                                                  ],
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: 'Readex Pro',
                                                                                        letterSpacing: 0.0,
                                                                                      ),
                                                                                ),
                                                                                textAlign: TextAlign.start,
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                    Expanded(
                                                                      flex: 2,
                                                                      child:
                                                                          Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.center,
                                                                        children: [
                                                                          Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.center,
                                                                            children: [
                                                                              FlutterFlowIconButton(
                                                                                borderRadius: 20.0,
                                                                                borderWidth: 1.0,
                                                                                buttonSize: 40.0,
                                                                                icon: Icon(
                                                                                  Icons.close,
                                                                                  color: FlutterFlowTheme.of(context).error,
                                                                                  size: 24.0,
                                                                                ),
                                                                                onPressed: () async {
                                                                                  FFAppState().removeAtIndexFromItensCarrinho(lvItensCarrinhoIndex);
                                                                                  safeSetState(() {});
                                                                                  ScaffoldMessenger.of(context).showSnackBar(
                                                                                    SnackBar(
                                                                                      content: Text(
                                                                                        'Excluído!',
                                                                                        style: TextStyle(
                                                                                          color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                        ),
                                                                                      ),
                                                                                      duration: const Duration(milliseconds: 2000),
                                                                                      backgroundColor: FlutterFlowTheme.of(context).error,
                                                                                    ),
                                                                                  );
                                                                                },
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ].divide(const SizedBox(
                                                                      width:
                                                                          8.0)),
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
                                              FFButtonWidget(
                                                onPressed: () async {
                                                  await action_blocks
                                                      .calculaCarrinho(context);
                                                  safeSetState(() {});
                                                  safeSetState(() {
                                                    _model.tabBarController!
                                                        .animateTo(
                                                      min(
                                                          _model.tabBarController!
                                                                  .length -
                                                              1,
                                                          _model.tabBarController!
                                                                  .index +
                                                              1),
                                                      duration: const Duration(
                                                          milliseconds: 300),
                                                      curve: Curves.ease,
                                                    );
                                                  });
                                                },
                                                text: 'Continuar',
                                                options: FFButtonOptions(
                                                  width: double.infinity,
                                                  height: 50.0,
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          24.0, 0.0, 24.0, 0.0),
                                                  iconPadding:
                                                      const EdgeInsetsDirectional
                                                          .fromSTEB(0.0, 0.0,
                                                              0.0, 0.0),
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                  textStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleSmall
                                                          .override(
                                                            fontFamily:
                                                                'Readex Pro',
                                                            color: Colors.white,
                                                            letterSpacing: 0.0,
                                                          ),
                                                  elevation: 3.0,
                                                  borderSide: const BorderSide(
                                                    color: Colors.transparent,
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                              ),
                                            ]
                                                .divide(const SizedBox(height: 8.0))
                                                .around(const SizedBox(height: 8.0)),
                                          ),
                                          Column(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Align(
                                                alignment: const AlignmentDirectional(
                                                    0.0, 0.0),
                                                child: Container(
                                                  decoration: const BoxDecoration(),
                                                  child: Visibility(
                                                    visible: FFAppState()
                                                            .totalCarrinho >
                                                        0.0,
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  8.0,
                                                                  0.0),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                        children: [
                                                          AutoSizeText(
                                                            'Cliente:',
                                                            maxLines: 1,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .displayMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Readex Pro',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                  fontSize:
                                                                      22.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                          ),
                                                          AutoSizeText(
                                                            valueOrDefault<
                                                                String>(
                                                              _model.cliente,
                                                              'Não identificado',
                                                            ),
                                                            maxLines: 1,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .displayMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Readex Pro',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                          ),
                                                          AutoSizeText(
                                                            'Valor Total:',
                                                            maxLines: 1,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .displayMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Readex Pro',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                  fontSize:
                                                                      22.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                          ),
                                                          AutoSizeText(
                                                            valueOrDefault<
                                                                String>(
                                                              formatNumber(
                                                                FFAppState()
                                                                    .totalCarrinho,
                                                                formatType:
                                                                    FormatType
                                                                        .custom,
                                                                currency:
                                                                    'R\$ ',
                                                                format:
                                                                    '#,###.00',
                                                                locale: 'pt_br',
                                                              ),
                                                              '0',
                                                            ),
                                                            maxLines: 1,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .displayMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Readex Pro',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                          ),
                                                          AutoSizeText(
                                                            'Pagamento:',
                                                            maxLines: 1,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .displayMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Readex Pro',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                  fontSize:
                                                                      22.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                          ),
                                                          FlutterFlowRadioButton(
                                                            options: [
                                                              'Pago',
                                                              'Pendente'
                                                            ].toList(),
                                                            onChanged: (val) =>
                                                                safeSetState(
                                                                    () {}),
                                                            controller: _model
                                                                    .radioButtonValueController ??=
                                                                FormFieldController<
                                                                        String>(
                                                                    'Pendente'),
                                                            optionHeight: 50.0,
                                                            textStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Readex Pro',
                                                                      letterSpacing:
                                                                          0.0,
                                                                    ),
                                                            buttonPosition:
                                                                RadioButtonPosition
                                                                    .left,
                                                            direction:
                                                                Axis.horizontal,
                                                            radioButtonColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                            inactiveRadioButtonColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryText,
                                                            toggleable: false,
                                                            horizontalAlignment:
                                                                WrapAlignment
                                                                    .start,
                                                            verticalAlignment:
                                                                WrapCrossAlignment
                                                                    .start,
                                                          ),
                                                        ]
                                                            .divide(const SizedBox(
                                                                height: 8.0))
                                                            .around(const SizedBox(
                                                                height: 8.0)),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                width: double.infinity,
                                                height: 100.0,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                ),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.end,
                                                  children: [
                                                    FutureBuilder<
                                                        List<
                                                            ControlePedidosRow>>(
                                                      future:
                                                          ControlePedidosTable()
                                                              .queryRows(
                                                        queryFn: (q) =>
                                                            q.eqOrNull(
                                                          'usuario',
                                                          currentUserUid,
                                                        ),
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
                                                        List<ControlePedidosRow>
                                                            buttonControlePedidosRowList =
                                                            snapshot.data!;

                                                        return FFButtonWidget(
                                                          onPressed: () async {
                                                            if (_model.data ==
                                                                null) {
                                                              _model.data =
                                                                  getCurrentTimestamp;
                                                              safeSetState(
                                                                  () {});
                                                            } else {
                                                              _model.data =
                                                                  _model.data;
                                                              safeSetState(
                                                                  () {});
                                                            }

                                                            if (buttonControlePedidosRowList.isEmpty) {
                                                              _model.numeroPedido =
                                                                  1;
                                                              safeSetState(
                                                                  () {});
                                                            } else {
                                                              _model.numeroPedido =
                                                                  (buttonControlePedidosRowList
                                                                          .lastOrNull!
                                                                          .numeroPedido!) +
                                                                      1;
                                                              safeSetState(
                                                                  () {});
                                                            }

                                                            await ControlePedidosTable()
                                                                .insert({
                                                              'cliente': _model
                                                                  .cliente,
                                                              'usuario':
                                                                  currentUserUid,
                                                              'data': supaSerialize<
                                                                      DateTime>(
                                                                  _model.data),
                                                              'status_pagamento':
                                                                  _model
                                                                      .radioButtonValue,
                                                              'total': FFAppState()
                                                                  .totalCarrinho,
                                                              'numero_pedido':
                                                                  _model
                                                                      .numeroPedido,
                                                              'id_cliente':
                                                                  _model
                                                                      .idCliente,
                                                              'servico': true,
                                                            });
                                                            FFAppState()
                                                                .contador = 1;
                                                            safeSetState(() {});
                                                            _model.indice = 0;
                                                            safeSetState(() {});
                                                            while (FFAppState()
                                                                    .contador <=
                                                                FFAppState()
                                                                    .itensCarrinho
                                                                    .length) {
                                                              await ControlePedidosItensTable()
                                                                  .insert({
                                                                'nome_produto': FFAppState()
                                                                    .itensCarrinho
                                                                    .elementAtOrNull(
                                                                        _model
                                                                            .indice!)
                                                                    ?.nome,
                                                                'referencia': _model
                                                                    .numeroPedido,
                                                                'quantidade': FFAppState()
                                                                    .itensCarrinho
                                                                    .elementAtOrNull(
                                                                        _model
                                                                            .indice!)
                                                                    ?.quantidade,
                                                                'usuario':
                                                                    currentUserUid,
                                                                'valor_produto': FFAppState()
                                                                    .itensCarrinho
                                                                    .elementAtOrNull(
                                                                        _model
                                                                            .indice!)
                                                                    ?.preco,
                                                                'valor_total': FFAppState()
                                                                    .itensCarrinho
                                                                    .elementAtOrNull(
                                                                        _model
                                                                            .indice!)
                                                                    ?.total,
                                                                'numero_item':
                                                                    FFAppState()
                                                                        .contador,
                                                              });
                                                              FFAppState()
                                                                      .contador =
                                                                  FFAppState()
                                                                          .contador +
                                                                      1;
                                                              safeSetState(
                                                                  () {});
                                                              _model.indice =
                                                                  _model.indice! +
                                                                      1;
                                                              safeSetState(
                                                                  () {});
                                                            }
                                                            ScaffoldMessenger
                                                                    .of(context)
                                                                .showSnackBar(
                                                              SnackBar(
                                                                content: Text(
                                                                  'Pedido Salvo!',
                                                                  style:
                                                                      TextStyle(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryBackground,
                                                                  ),
                                                                ),
                                                                duration: const Duration(
                                                                    milliseconds:
                                                                        2000),
                                                                backgroundColor:
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary,
                                                              ),
                                                            );
                                                            FFAppState()
                                                                .itensCarrinho = [];
                                                            safeSetState(() {});

                                                            context.pushNamed(
                                                                'controle');
                                                          },
                                                          text: 'Salvar',
                                                          options:
                                                              FFButtonOptions(
                                                            width:
                                                                double.infinity,
                                                            height: 50.0,
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        24.0,
                                                                        0.0,
                                                                        24.0,
                                                                        0.0),
                                                            iconPadding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            color: FlutterFlowTheme
                                                                    .of(context)
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
                                                            borderSide:
                                                                const BorderSide(
                                                              color: Colors
                                                                  .transparent,
                                                              width: 1.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                          ),
                                                        );
                                                      },
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ].divide(const SizedBox(height: 8.0)),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ].divide(const SizedBox(height: 8.0)),
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
  }
}
