import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/cadastros/add_carrinho/add_carrinho_widget.dart';
import '/cadastros/cadastro_cliente/cadastro_cliente_widget.dart';
import '/flutter_flow/flutter_flow_button_tabbar.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_radio_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/actions/actions.dart' as action_blocks;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'carrinho_model.dart';
export 'carrinho_model.dart';

class CarrinhoWidget extends StatefulWidget {
  const CarrinhoWidget({super.key});

  @override
  State<CarrinhoWidget> createState() => _CarrinhoWidgetState();
}

class _CarrinhoWidgetState extends State<CarrinhoWidget>
    with TickerProviderStateMixin {
  late CarrinhoModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CarrinhoModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.cliente = _model.dropDownClientesValue;
      _model.data = null;
      _model.idCliente = null;
      safeSetState(() {});
    });

    _model.tabBarController = TabController(
      vsync: this,
      length: 4,
      initialIndex: 0,
    )..addListener(() => safeSetState(() {}));
    _model.textController1 ??= TextEditingController();
    _model.textFieldFocusNode1 ??= FocusNode();

    _model.txtVeiculoEquipamentoTextController ??= TextEditingController();
    _model.txtVeiculoEquipamentoFocusNode ??= FocusNode();

    _model.txtPlacaIdentificacaoTextController ??= TextEditingController();
    _model.txtPlacaIdentificacaoFocusNode ??= FocusNode();

    _model.txtKMTextController ??= TextEditingController();
    _model.txtKMFocusNode ??= FocusNode();

    _model.txtObsTextController ??= TextEditingController();
    _model.txtObsFocusNode ??= FocusNode();

    _model.textFieldFocusNode2 ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {
          _model.textController1?.text = dateTimeFormat(
            "dd/MM/yyyy",
            getCurrentTimestamp,
            locale: FFLocalizations.of(context).languageCode,
          );
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

    return FutureBuilder<List<ControlePedidosRow>>(
      future: ControlePedidosTable().queryRows(
        queryFn: (q) => q.eqOrNull(
          'usuario',
          currentUserUid,
        ),
      ),
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
        List<ControlePedidosRow> carrinhoControlePedidosRowList =
            snapshot.data!;

        return Title(
            title: 'carrinho',
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
                      context.pop();
                    },
                  ),
                  title: Text(
                    'Ordem de Serviço',
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
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                            ),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  16.0, 0.0, 16.0, 0.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Expanded(
                                    child: Column(
                                      children: [
                                        Align(
                                          alignment: const Alignment(0.0, 0),
                                          child: FlutterFlowButtonTabBar(
                                            useToggleButtonStyle: false,
                                            labelStyle:
                                                FlutterFlowTheme.of(context)
                                                    .titleMedium
                                                    .override(
                                                      fontFamily: 'Readex Pro',
                                                      letterSpacing: 0.0,
                                                    ),
                                            unselectedLabelStyle: const TextStyle(),
                                            labelColor:
                                                FlutterFlowTheme.of(context)
                                                    .primaryBackground,
                                            unselectedLabelColor:
                                                FlutterFlowTheme.of(context)
                                                    .secondaryText,
                                            backgroundColor:
                                                FlutterFlowTheme.of(context)
                                                    .primary,
                                            unselectedBackgroundColor:
                                                FlutterFlowTheme.of(context)
                                                    .alternate,
                                            unselectedBorderColor:
                                                FlutterFlowTheme.of(context)
                                                    .alternate,
                                            borderWidth: 2.0,
                                            borderRadius: 8.0,
                                            elevation: 0.0,
                                            buttonMargin:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    8.0, 0.0, 8.0, 0.0),
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
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Icon(
                                                    Icons
                                                        .notifications_active_rounded,
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
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Expanded(
                                                        child: Text(
                                                          'Dados Iniciais',
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .titleSmall
                                                              .override(
                                                                fontFamily:
                                                                    'Readex Pro',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                                fontSize: 20.0,
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                        ),
                                                      ),
                                                    ].divide(
                                                        const SizedBox(width: 8.0)),
                                                  ),
                                                  Expanded(
                                                    child: Container(
                                                      width: double.infinity,
                                                      height: 60.0,
                                                      decoration: BoxDecoration(
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                      ),
                                                      child:
                                                          SingleChildScrollView(
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          4.0,
                                                                          0.0),
                                                              child: FutureBuilder<
                                                                  List<
                                                                      ControleClientesRow>>(
                                                                future:
                                                                    ControleClientesTable()
                                                                        .queryRows(
                                                                  queryFn: (q) => q
                                                                      .eqOrNull(
                                                                        'usuario',
                                                                        currentUserUid,
                                                                      )
                                                                      .order('nome', ascending: true),
                                                                ),
                                                                builder: (context,
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
                                                                          valueColor:
                                                                              AlwaysStoppedAnimation<Color>(
                                                                            FlutterFlowTheme.of(context).primary,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    );
                                                                  }
                                                                  List<ControleClientesRow>
                                                                      dropDownControleClientesRowList =
                                                                      snapshot
                                                                          .data!;

                                                                  return FlutterFlowDropDown<
                                                                      String>(
                                                                    controller: _model
                                                                            .dropDownValueController ??=
                                                                        FormFieldController<
                                                                            String>(
                                                                      _model.dropDownValue ??=
                                                                          'Orçamento',
                                                                    ),
                                                                    options: const [
                                                                      'Orçamento',
                                                                      'Em Execução',
                                                                      'Aguardando Peças',
                                                                      'Pausada',
                                                                      'Finalizada',
                                                                      'Aguardando Retirada'
                                                                    ],
                                                                    onChanged: (val) =>
                                                                        safeSetState(() =>
                                                                            _model.dropDownValue =
                                                                                val),
                                                                    width: double
                                                                        .infinity,
                                                                    height:
                                                                        50.0,
                                                                    searchHintTextStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Readex Pro',
                                                                          letterSpacing:
                                                                              0.0,
                                                                        ),
                                                                    searchTextStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Readex Pro',
                                                                          letterSpacing:
                                                                              0.0,
                                                                        ),
                                                                    textStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Readex Pro',
                                                                          letterSpacing:
                                                                              0.0,
                                                                        ),
                                                                    hintText:
                                                                        'Status',
                                                                    searchHintText:
                                                                        'Pesquisar...',
                                                                    icon: Icon(
                                                                      Icons
                                                                          .keyboard_arrow_down_rounded,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryText,
                                                                      size:
                                                                          24.0,
                                                                    ),
                                                                    fillColor: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryBackground,
                                                                    elevation:
                                                                        2.0,
                                                                    borderColor:
                                                                        FlutterFlowTheme.of(context)
                                                                            .alternate,
                                                                    borderWidth:
                                                                        2.0,
                                                                    borderRadius:
                                                                        8.0,
                                                                    margin: const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            12.0,
                                                                            0.0,
                                                                            12.0,
                                                                            0.0),
                                                                    hidesUnderline:
                                                                        true,
                                                                    isOverButton:
                                                                        false,
                                                                    isSearchable:
                                                                        true,
                                                                    isMultiSelect:
                                                                        false,
                                                                  );
                                                                },
                                                              ),
                                                            ),
                                                            Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Expanded(
                                                                  child:
                                                                      TextFormField(
                                                                    controller:
                                                                        _model
                                                                            .textController1,
                                                                    focusNode:
                                                                        _model
                                                                            .textFieldFocusNode1,
                                                                    autofocus:
                                                                        true,
                                                                    readOnly:
                                                                        true,
                                                                    obscureText:
                                                                        false,
                                                                    decoration:
                                                                        InputDecoration(
                                                                      labelStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .labelMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Readex Pro',
                                                                            letterSpacing:
                                                                                0.0,
                                                                          ),
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
                                                                            BorderSide(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).alternate,
                                                                          width:
                                                                              2.0,
                                                                        ),
                                                                        borderRadius:
                                                                            BorderRadius.circular(8.0),
                                                                      ),
                                                                      focusedBorder:
                                                                          OutlineInputBorder(
                                                                        borderSide:
                                                                            BorderSide(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primary,
                                                                          width:
                                                                              2.0,
                                                                        ),
                                                                        borderRadius:
                                                                            BorderRadius.circular(8.0),
                                                                      ),
                                                                      errorBorder:
                                                                          OutlineInputBorder(
                                                                        borderSide:
                                                                            BorderSide(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).error,
                                                                          width:
                                                                              2.0,
                                                                        ),
                                                                        borderRadius:
                                                                            BorderRadius.circular(8.0),
                                                                      ),
                                                                      focusedErrorBorder:
                                                                          OutlineInputBorder(
                                                                        borderSide:
                                                                            BorderSide(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).error,
                                                                          width:
                                                                              2.0,
                                                                        ),
                                                                        borderRadius:
                                                                            BorderRadius.circular(8.0),
                                                                      ),
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Readex Pro',
                                                                          letterSpacing:
                                                                              0.0,
                                                                        ),
                                                                    validator: _model
                                                                        .textController1Validator
                                                                        .asValidator(
                                                                            context),
                                                                  ),
                                                                ),
                                                                FlutterFlowIconButton(
                                                                  borderColor:
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .primary,
                                                                  borderRadius:
                                                                      8.0,
                                                                  borderWidth:
                                                                      1.0,
                                                                  buttonSize:
                                                                      50.0,
                                                                  fillColor: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                                  icon: Icon(
                                                                    Icons
                                                                        .calendar_month,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryBackground,
                                                                    size: 24.0,
                                                                  ),
                                                                  onPressed:
                                                                      () async {
                                                                    final datePickedDate =
                                                                        await showDatePicker(
                                                                      context:
                                                                          context,
                                                                      initialDate:
                                                                          getCurrentTimestamp,
                                                                      firstDate:
                                                                          DateTime(
                                                                              1900),
                                                                      lastDate:
                                                                          DateTime(
                                                                              2050),
                                                                      builder:
                                                                          (context,
                                                                              child) {
                                                                        return wrapInMaterialDatePickerTheme(
                                                                          context,
                                                                          child!,
                                                                          headerBackgroundColor:
                                                                              FlutterFlowTheme.of(context).primary,
                                                                          headerForegroundColor:
                                                                              FlutterFlowTheme.of(context).info,
                                                                          headerTextStyle: FlutterFlowTheme.of(context)
                                                                              .headlineLarge
                                                                              .override(
                                                                                fontFamily: 'Readex Pro',
                                                                                fontSize: 32.0,
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FontWeight.w600,
                                                                              ),
                                                                          pickerBackgroundColor:
                                                                              FlutterFlowTheme.of(context).secondaryBackground,
                                                                          pickerForegroundColor:
                                                                              FlutterFlowTheme.of(context).primaryText,
                                                                          selectedDateTimeBackgroundColor:
                                                                              FlutterFlowTheme.of(context).primary,
                                                                          selectedDateTimeForegroundColor:
                                                                              FlutterFlowTheme.of(context).info,
                                                                          actionButtonForegroundColor:
                                                                              FlutterFlowTheme.of(context).primaryText,
                                                                          iconSize:
                                                                              24.0,
                                                                        );
                                                                      },
                                                                    );

                                                                    if (datePickedDate !=
                                                                        null) {
                                                                      safeSetState(
                                                                          () {
                                                                        _model.datePicked =
                                                                            DateTime(
                                                                          datePickedDate
                                                                              .year,
                                                                          datePickedDate
                                                                              .month,
                                                                          datePickedDate
                                                                              .day,
                                                                        );
                                                                      });
                                                                    }
                                                                    safeSetState(
                                                                        () {
                                                                      _model.textController1
                                                                              ?.text =
                                                                          dateTimeFormat(
                                                                        "dd/MM/yyyy",
                                                                        _model
                                                                            .datePicked,
                                                                        locale:
                                                                            FFLocalizations.of(context).languageCode,
                                                                      );
                                                                    });
                                                                    _model.data =
                                                                        _model
                                                                            .datePicked;
                                                                    safeSetState(
                                                                        () {});
                                                                  },
                                                                ),
                                                              ].divide(const SizedBox(
                                                                  width: 8.0)),
                                                            ),
                                                            Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Expanded(
                                                                  child: FutureBuilder<
                                                                      List<
                                                                          ControleClientesRow>>(
                                                                    future: ControleClientesTable()
                                                                        .queryRows(
                                                                      queryFn: (q) => q
                                                                          .eqOrNull(
                                                                            'usuario',
                                                                            currentUserUid,
                                                                          )
                                                                          .order('nome', ascending: true),
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
                                                                      List<ControleClientesRow>
                                                                          dropDownClientesControleClientesRowList =
                                                                          snapshot
                                                                              .data!;

                                                                      return FlutterFlowDropDown<
                                                                          int>(
                                                                        controller:
                                                                            _model.dropDownClientesValueController ??=
                                                                                FormFieldController<int>(
                                                                          _model.dropDownClientesValue ??= dropDownClientesControleClientesRowList
                                                                              .firstOrNull
                                                                              ?.id,
                                                                        ),
                                                                        options: List<int>.from(dropDownClientesControleClientesRowList
                                                                            .map((e) =>
                                                                                e.id)
                                                                            .toList()),
                                                                        optionLabels: dropDownClientesControleClientesRowList
                                                                            .map((e) =>
                                                                                e.nome)
                                                                            .withoutNulls
                                                                            .toList(),
                                                                        onChanged:
                                                                            (val) async {
                                                                          safeSetState(() =>
                                                                              _model.dropDownClientesValue = val);
                                                                          _model.cliente =
                                                                              _model.dropDownClientesValue;
                                                                          safeSetState(
                                                                              () {});
                                                                        },
                                                                        width:
                                                                            200.0,
                                                                        height:
                                                                            50.0,
                                                                        searchHintTextStyle: FlutterFlowTheme.of(context)
                                                                            .labelMedium
                                                                            .override(
                                                                              fontFamily: 'Readex Pro',
                                                                              letterSpacing: 0.0,
                                                                            ),
                                                                        searchTextStyle: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'Readex Pro',
                                                                              letterSpacing: 0.0,
                                                                            ),
                                                                        textStyle: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'Readex Pro',
                                                                              letterSpacing: 0.0,
                                                                            ),
                                                                        hintText:
                                                                            'Selecione o Cliente',
                                                                        searchHintText:
                                                                            'Pesquisar...',
                                                                        icon:
                                                                            Icon(
                                                                          Icons
                                                                              .keyboard_arrow_down_rounded,
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondaryText,
                                                                          size:
                                                                              24.0,
                                                                        ),
                                                                        fillColor:
                                                                            FlutterFlowTheme.of(context).secondaryBackground,
                                                                        elevation:
                                                                            2.0,
                                                                        borderColor:
                                                                            FlutterFlowTheme.of(context).alternate,
                                                                        borderWidth:
                                                                            2.0,
                                                                        borderRadius:
                                                                            8.0,
                                                                        margin: const EdgeInsetsDirectional.fromSTEB(
                                                                            12.0,
                                                                            0.0,
                                                                            12.0,
                                                                            0.0),
                                                                        hidesUnderline:
                                                                            true,
                                                                        isOverButton:
                                                                            false,
                                                                        isSearchable:
                                                                            true,
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
                                                                  borderRadius:
                                                                      8.0,
                                                                  borderWidth:
                                                                      1.0,
                                                                  buttonSize:
                                                                      50.0,
                                                                  fillColor: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                                  icon: Icon(
                                                                    Icons.add,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryBackground,
                                                                    size: 24.0,
                                                                  ),
                                                                  onPressed:
                                                                      () async {
                                                                    await showModalBottomSheet(
                                                                      isScrollControlled:
                                                                          true,
                                                                      backgroundColor:
                                                                          Colors
                                                                              .transparent,
                                                                      enableDrag:
                                                                          false,
                                                                      context:
                                                                          context,
                                                                      builder:
                                                                          (context) {
                                                                        return GestureDetector(
                                                                          onTap:
                                                                              () {
                                                                            FocusScope.of(context).unfocus();
                                                                            FocusManager.instance.primaryFocus?.unfocus();
                                                                          },
                                                                          child:
                                                                              Padding(
                                                                            padding:
                                                                                MediaQuery.viewInsetsOf(context),
                                                                            child:
                                                                                SizedBox(
                                                                              height: double.infinity,
                                                                              child: CadastroClienteWidget(
                                                                                refresh: () async {},
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        );
                                                                      },
                                                                    ).then((value) =>
                                                                        safeSetState(
                                                                            () {}));
                                                                  },
                                                                ),
                                                              ].divide(const SizedBox(
                                                                  width: 8.0)),
                                                            ),
                                                            Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                TextFormField(
                                                                  controller: _model
                                                                      .txtVeiculoEquipamentoTextController,
                                                                  focusNode: _model
                                                                      .txtVeiculoEquipamentoFocusNode,
                                                                  autofocus:
                                                                      true,
                                                                  obscureText:
                                                                      false,
                                                                  decoration:
                                                                      InputDecoration(
                                                                    labelText:
                                                                        'Veículo/Equipamento',
                                                                    hintStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelLarge
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
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .alternate,
                                                                        width:
                                                                            2.0,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8.0),
                                                                    ),
                                                                    focusedBorder:
                                                                        OutlineInputBorder(
                                                                      borderSide:
                                                                          BorderSide(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primary,
                                                                        width:
                                                                            2.0,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8.0),
                                                                    ),
                                                                    errorBorder:
                                                                        OutlineInputBorder(
                                                                      borderSide:
                                                                          BorderSide(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .error,
                                                                        width:
                                                                            2.0,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8.0),
                                                                    ),
                                                                    focusedErrorBorder:
                                                                        OutlineInputBorder(
                                                                      borderSide:
                                                                          BorderSide(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .error,
                                                                        width:
                                                                            2.0,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8.0),
                                                                    ),
                                                                    contentPadding:
                                                                        const EdgeInsetsDirectional.fromSTEB(
                                                                            8.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelLarge
                                                                      .override(
                                                                        fontFamily:
                                                                            'Readex Pro',
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                                  validator: _model
                                                                      .txtVeiculoEquipamentoTextControllerValidator
                                                                      .asValidator(
                                                                          context),
                                                                ),
                                                                TextFormField(
                                                                  controller: _model
                                                                      .txtPlacaIdentificacaoTextController,
                                                                  focusNode: _model
                                                                      .txtPlacaIdentificacaoFocusNode,
                                                                  autofocus:
                                                                      true,
                                                                  textCapitalization:
                                                                      TextCapitalization
                                                                          .characters,
                                                                  obscureText:
                                                                      false,
                                                                  decoration:
                                                                      InputDecoration(
                                                                    labelText:
                                                                        'Placa/Identificador',
                                                                    hintStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelLarge
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
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .alternate,
                                                                        width:
                                                                            2.0,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8.0),
                                                                    ),
                                                                    focusedBorder:
                                                                        OutlineInputBorder(
                                                                      borderSide:
                                                                          BorderSide(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primary,
                                                                        width:
                                                                            2.0,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8.0),
                                                                    ),
                                                                    errorBorder:
                                                                        OutlineInputBorder(
                                                                      borderSide:
                                                                          BorderSide(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .error,
                                                                        width:
                                                                            2.0,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8.0),
                                                                    ),
                                                                    focusedErrorBorder:
                                                                        OutlineInputBorder(
                                                                      borderSide:
                                                                          BorderSide(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .error,
                                                                        width:
                                                                            2.0,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8.0),
                                                                    ),
                                                                    contentPadding:
                                                                        const EdgeInsetsDirectional.fromSTEB(
                                                                            8.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelLarge
                                                                      .override(
                                                                        fontFamily:
                                                                            'Readex Pro',
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                                  validator: _model
                                                                      .txtPlacaIdentificacaoTextControllerValidator
                                                                      .asValidator(
                                                                          context),
                                                                  inputFormatters: [
                                                                    _model
                                                                        .txtPlacaIdentificacaoMask
                                                                  ],
                                                                ),
                                                                TextFormField(
                                                                  controller: _model
                                                                      .txtKMTextController,
                                                                  focusNode: _model
                                                                      .txtKMFocusNode,
                                                                  autofocus:
                                                                      true,
                                                                  obscureText:
                                                                      false,
                                                                  decoration:
                                                                      InputDecoration(
                                                                    labelText:
                                                                        'KM',
                                                                    hintStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelLarge
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
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .alternate,
                                                                        width:
                                                                            2.0,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8.0),
                                                                    ),
                                                                    focusedBorder:
                                                                        OutlineInputBorder(
                                                                      borderSide:
                                                                          BorderSide(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primary,
                                                                        width:
                                                                            2.0,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8.0),
                                                                    ),
                                                                    errorBorder:
                                                                        OutlineInputBorder(
                                                                      borderSide:
                                                                          BorderSide(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .error,
                                                                        width:
                                                                            2.0,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8.0),
                                                                    ),
                                                                    focusedErrorBorder:
                                                                        OutlineInputBorder(
                                                                      borderSide:
                                                                          BorderSide(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .error,
                                                                        width:
                                                                            2.0,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8.0),
                                                                    ),
                                                                    contentPadding:
                                                                        const EdgeInsetsDirectional.fromSTEB(
                                                                            8.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
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
                                                                      .txtKMTextControllerValidator
                                                                      .asValidator(
                                                                          context),
                                                                ),
                                                                TextFormField(
                                                                  controller: _model
                                                                      .txtObsTextController,
                                                                  focusNode: _model
                                                                      .txtObsFocusNode,
                                                                  autofocus:
                                                                      true,
                                                                  obscureText:
                                                                      false,
                                                                  decoration:
                                                                      InputDecoration(
                                                                    labelText:
                                                                        'Observação/Anotações',
                                                                    hintStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelLarge
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
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .alternate,
                                                                        width:
                                                                            2.0,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8.0),
                                                                    ),
                                                                    focusedBorder:
                                                                        OutlineInputBorder(
                                                                      borderSide:
                                                                          BorderSide(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primary,
                                                                        width:
                                                                            2.0,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8.0),
                                                                    ),
                                                                    errorBorder:
                                                                        OutlineInputBorder(
                                                                      borderSide:
                                                                          BorderSide(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .error,
                                                                        width:
                                                                            2.0,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8.0),
                                                                    ),
                                                                    focusedErrorBorder:
                                                                        OutlineInputBorder(
                                                                      borderSide:
                                                                          BorderSide(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .error,
                                                                        width:
                                                                            2.0,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8.0),
                                                                    ),
                                                                    contentPadding:
                                                                        const EdgeInsetsDirectional.fromSTEB(
                                                                            8.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelLarge
                                                                      .override(
                                                                        fontFamily:
                                                                            'Readex Pro',
                                                                        letterSpacing:
                                                                            0.0,
                                                                        lineHeight:
                                                                            1.0,
                                                                      ),
                                                                  maxLines:
                                                                      null,
                                                                  validator: _model
                                                                      .txtObsTextControllerValidator
                                                                      .asValidator(
                                                                          context),
                                                                ),
                                                              ].divide(const SizedBox(
                                                                  height:
                                                                      16.0)),
                                                            ),
                                                          ].divide(const SizedBox(
                                                              height: 16.0)),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Container(
                                                    width: double.infinity,
                                                    height: 60.0,
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                    ),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment.end,
                                                      children: [
                                                        FFButtonWidget(
                                                          onPressed: () async {
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
                                                          text: 'Continuar',
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
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ]
                                                    .divide(
                                                        const SizedBox(height: 8.0))
                                                    .around(
                                                        const SizedBox(height: 8.0)),
                                              ),
                                              Column(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Expanded(
                                                    child: Container(
                                                      width: double.infinity,
                                                      height: 60.0,
                                                      decoration: BoxDecoration(
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                      ),
                                                      child:
                                                          SingleChildScrollView(
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Expanded(
                                                                  child: Text(
                                                                    'Produtos e Serviços',
                                                                    textAlign:
                                                                        TextAlign
                                                                            .center,
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleSmall
                                                                        .override(
                                                                          fontFamily:
                                                                              'Readex Pro',
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryText,
                                                                          fontSize:
                                                                              20.0,
                                                                          letterSpacing:
                                                                              0.0,
                                                                        ),
                                                                  ),
                                                                ),
                                                              ].divide(const SizedBox(
                                                                  width: 8.0)),
                                                            ),
                                                            Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Expanded(
                                                                  child: FutureBuilder<
                                                                      List<
                                                                          ControleCadastroProdutosRow>>(
                                                                    future: ControleCadastroProdutosTable()
                                                                        .queryRows(
                                                                      queryFn: (q) => q
                                                                          .eqOrNull(
                                                                            'usuario',
                                                                            currentUserUid,
                                                                          )
                                                                          .order('nome', ascending: true),
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
                                                                      List<ControleCadastroProdutosRow>
                                                                          dropDownItensControleCadastroProdutosRowList =
                                                                          snapshot
                                                                              .data!;

                                                                      return FlutterFlowDropDown<
                                                                          int>(
                                                                        controller:
                                                                            _model.dropDownItensValueController ??=
                                                                                FormFieldController<int>(
                                                                          _model.dropDownItensValue ??= dropDownItensControleCadastroProdutosRowList
                                                                              .firstOrNull
                                                                              ?.id,
                                                                        ),
                                                                        options: List<int>.from(dropDownItensControleCadastroProdutosRowList
                                                                            .map((e) =>
                                                                                e.id)
                                                                            .toList()),
                                                                        optionLabels: dropDownItensControleCadastroProdutosRowList
                                                                            .map((e) =>
                                                                                e.nome)
                                                                            .withoutNulls
                                                                            .toList(),
                                                                        onChanged:
                                                                            (val) async {
                                                                          safeSetState(() =>
                                                                              _model.dropDownItensValue = val);
                                                                          await showModalBottomSheet(
                                                                            isScrollControlled:
                                                                                true,
                                                                            backgroundColor:
                                                                                Colors.transparent,
                                                                            enableDrag:
                                                                                false,
                                                                            context:
                                                                                context,
                                                                            builder:
                                                                                (context) {
                                                                              return GestureDetector(
                                                                                onTap: () {
                                                                                  FocusScope.of(context).unfocus();
                                                                                  FocusManager.instance.primaryFocus?.unfocus();
                                                                                },
                                                                                child: Padding(
                                                                                  padding: MediaQuery.viewInsetsOf(context),
                                                                                  child: SizedBox(
                                                                                    height: double.infinity,
                                                                                    child: AddCarrinhoWidget(
                                                                                      idProduto: _model.dropDownItensValue!,
                                                                                      refresh: () async {},
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              );
                                                                            },
                                                                          ).then((value) =>
                                                                              safeSetState(() {}));
                                                                        },
                                                                        width:
                                                                            200.0,
                                                                        height:
                                                                            50.0,
                                                                        maxHeight:
                                                                            400.0,
                                                                        searchHintTextStyle: FlutterFlowTheme.of(context)
                                                                            .labelMedium
                                                                            .override(
                                                                              fontFamily: 'Readex Pro',
                                                                              letterSpacing: 0.0,
                                                                            ),
                                                                        searchTextStyle: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'Readex Pro',
                                                                              letterSpacing: 0.0,
                                                                            ),
                                                                        textStyle: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'Readex Pro',
                                                                              letterSpacing: 0.0,
                                                                            ),
                                                                        hintText:
                                                                            'Selecione os itens',
                                                                        searchHintText:
                                                                            'Pesquisar...',
                                                                        icon:
                                                                            Icon(
                                                                          Icons
                                                                              .keyboard_arrow_down_rounded,
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondaryText,
                                                                          size:
                                                                              24.0,
                                                                        ),
                                                                        fillColor:
                                                                            FlutterFlowTheme.of(context).secondaryBackground,
                                                                        elevation:
                                                                            2.0,
                                                                        borderColor:
                                                                            FlutterFlowTheme.of(context).alternate,
                                                                        borderWidth:
                                                                            0.0,
                                                                        borderRadius:
                                                                            8.0,
                                                                        margin: const EdgeInsetsDirectional.fromSTEB(
                                                                            12.0,
                                                                            0.0,
                                                                            12.0,
                                                                            0.0),
                                                                        hidesUnderline:
                                                                            true,
                                                                        isOverButton:
                                                                            false,
                                                                        isSearchable:
                                                                            true,
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
                                                                  borderRadius:
                                                                      8.0,
                                                                  borderWidth:
                                                                      1.0,
                                                                  buttonSize:
                                                                      50.0,
                                                                  fillColor: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                                  icon: Icon(
                                                                    Icons.add,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryBackground,
                                                                    size: 24.0,
                                                                  ),
                                                                  onPressed:
                                                                      () async {
                                                                    context.pushNamed(
                                                                        'cadastroProdutos');
                                                                  },
                                                                ),
                                                              ].divide(const SizedBox(
                                                                  width: 8.0)),
                                                            ),
                                                            Builder(
                                                              builder:
                                                                  (context) {
                                                                final lvProdutos =
                                                                    FFAppState()
                                                                        .itensCarrinho
                                                                        .toList();

                                                                return ListView
                                                                    .separated(
                                                                  padding:
                                                                      EdgeInsets
                                                                          .zero,
                                                                  shrinkWrap:
                                                                      true,
                                                                  scrollDirection:
                                                                      Axis.vertical,
                                                                  itemCount:
                                                                      lvProdutos
                                                                          .length,
                                                                  separatorBuilder: (_,
                                                                          __) =>
                                                                      const SizedBox(
                                                                          height:
                                                                              16.0),
                                                                  itemBuilder:
                                                                      (context,
                                                                          lvProdutosIndex) {
                                                                    final lvProdutosItem =
                                                                        lvProdutos[
                                                                            lvProdutosIndex];
                                                                    return InkWell(
                                                                      splashColor:
                                                                          Colors
                                                                              .transparent,
                                                                      focusColor:
                                                                          Colors
                                                                              .transparent,
                                                                      hoverColor:
                                                                          Colors
                                                                              .transparent,
                                                                      highlightColor:
                                                                          Colors
                                                                              .transparent,
                                                                      onTap:
                                                                          () async {},
                                                                      child:
                                                                          Material(
                                                                        color: Colors
                                                                            .transparent,
                                                                        elevation:
                                                                            0.0,
                                                                        shape:
                                                                            RoundedRectangleBorder(
                                                                          borderRadius:
                                                                              BorderRadius.circular(8.0),
                                                                        ),
                                                                        child:
                                                                            Container(
                                                                          width:
                                                                              double.infinity,
                                                                          height:
                                                                              70.0,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).alternate,
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
                                                                            borderRadius:
                                                                                BorderRadius.circular(8.0),
                                                                          ),
                                                                          child:
                                                                              Padding(
                                                                            padding:
                                                                                const EdgeInsets.all(4.0),
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                              children: [
                                                                                Expanded(
                                                                                  flex: 8,
                                                                                  child: Column(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                                                    children: [
                                                                                      Row(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        mainAxisAlignment: MainAxisAlignment.start,
                                                                                        children: [
                                                                                          Expanded(
                                                                                            child: AutoSizeText(
                                                                                              lvProdutosItem.nome,
                                                                                              maxLines: 1,
                                                                                              minFontSize: 12.0,
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
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        mainAxisAlignment: MainAxisAlignment.start,
                                                                                        children: [
                                                                                          Text(
                                                                                            '${lvProdutosItem.quantidade.toString()} ${lvProdutosItem.unidade} x ${formatNumber(
                                                                                              lvProdutosItem.preco,
                                                                                              formatType: FormatType.custom,
                                                                                              currency: 'R\$',
                                                                                              format: '#,##0.00',
                                                                                              locale: 'pt_br',
                                                                                            )} = ',
                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                  fontFamily: 'Readex Pro',
                                                                                                  letterSpacing: 0.0,
                                                                                                ),
                                                                                          ),
                                                                                          Text(
                                                                                            formatNumber(
                                                                                              lvProdutosItem.total,
                                                                                              formatType: FormatType.custom,
                                                                                              currency: 'R\$ ',
                                                                                              format: '#,##0.00',
                                                                                              locale: 'pt_br',
                                                                                            ),
                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                  fontFamily: 'Readex Pro',
                                                                                                  fontSize: 18.0,
                                                                                                  letterSpacing: 0.0,
                                                                                                  fontWeight: FontWeight.bold,
                                                                                                ),
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                ),
                                                                                Expanded(
                                                                                  flex: 1,
                                                                                  child: Column(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                                    children: [
                                                                                      Expanded(
                                                                                        child: FlutterFlowIconButton(
                                                                                          borderColor: Colors.transparent,
                                                                                          borderRadius: 0.0,
                                                                                          borderWidth: 1.0,
                                                                                          buttonSize: 30.0,
                                                                                          icon: Icon(
                                                                                            Icons.close,
                                                                                            color: FlutterFlowTheme.of(context).error,
                                                                                            size: 24.0,
                                                                                          ),
                                                                                          onPressed: () async {
                                                                                            FFAppState().removeAtIndexFromItensCarrinho(lvProdutosIndex);
                                                                                            safeSetState(() {});
                                                                                            await action_blocks.calculaCarrinho(context);
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
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                ),
                                                                              ].divide(const SizedBox(width: 8.0)),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    );
                                                                  },
                                                                );
                                                              },
                                                            ),
                                                          ].divide(const SizedBox(
                                                              height: 16.0)),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Container(
                                                    width: double.infinity,
                                                    height: 120.0,
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                    ),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment.end,
                                                      children: [
                                                        AutoSizeText(
                                                          valueOrDefault<
                                                              String>(
                                                            formatNumber(
                                                              FFAppState()
                                                                  .totalCarrinho,
                                                              formatType:
                                                                  FormatType
                                                                      .custom,
                                                              currency: 'R\$ ',
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
                                                                fontSize: 40.0,
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                        ),
                                                        FFButtonWidget(
                                                          onPressed: () async {
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
                                                          text: 'Continuar',
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
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ]
                                                    .divide(
                                                        const SizedBox(height: 8.0))
                                                    .around(
                                                        const SizedBox(height: 8.0)),
                                              ),
                                              Column(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Expanded(
                                                    child: Align(
                                                      alignment:
                                                          const AlignmentDirectional(
                                                              0.0, 0.0),
                                                      child: Container(
                                                        decoration:
                                                            const BoxDecoration(),
                                                        child: Visibility(
                                                          visible: FFAppState()
                                                                  .totalCarrinho >
                                                              0.0,
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .start,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Expanded(
                                                                    child: Text(
                                                                      'Pagamento',
                                                                      textAlign:
                                                                          TextAlign
                                                                              .center,
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .titleSmall
                                                                          .override(
                                                                            fontFamily:
                                                                                'Readex Pro',
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primaryText,
                                                                            fontSize:
                                                                                20.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                ].divide(const SizedBox(
                                                                    width:
                                                                        8.0)),
                                                              ),
                                                              AutoSizeText(
                                                                'Pedido:',
                                                                maxLines: 1,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .displayMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Readex Pro',
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryText,
                                                                      fontSize:
                                                                          16.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                    ),
                                                              ),
                                                              AutoSizeText(
                                                                (carrinhoControlePedidosRowList
                                                                            .length +
                                                                        1)
                                                                    .toString(),
                                                                maxLines: 1,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .displayMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Readex Pro',
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primary,
                                                                      fontSize:
                                                                          40.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                    ),
                                                              ),
                                                              AutoSizeText(
                                                                'Cliente:',
                                                                maxLines: 1,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .displayMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Readex Pro',
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryText,
                                                                      fontSize:
                                                                          16.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                    ),
                                                              ),
                                                              FutureBuilder<
                                                                  List<
                                                                      ControleClientesRow>>(
                                                                future: ControleClientesTable()
                                                                    .querySingleRow(
                                                                  queryFn: (q) =>
                                                                      q.eqOrNull(
                                                                    'id',
                                                                    _model
                                                                        .dropDownClientesValue,
                                                                  ),
                                                                ),
                                                                builder: (context,
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
                                                                          valueColor:
                                                                              AlwaysStoppedAnimation<Color>(
                                                                            FlutterFlowTheme.of(context).primary,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    );
                                                                  }
                                                                  List<ControleClientesRow>
                                                                      textFieldControleClientesRowList =
                                                                      snapshot
                                                                          .data!;

                                                                  final textFieldControleClientesRow = textFieldControleClientesRowList
                                                                          .isNotEmpty
                                                                      ? textFieldControleClientesRowList
                                                                          .first
                                                                      : null;

                                                                  return SizedBox(
                                                                    width: double
                                                                        .infinity,
                                                                    child:
                                                                        TextFormField(
                                                                      controller:
                                                                          _model.textController6 ??=
                                                                              TextEditingController(
                                                                        text: textFieldControleClientesRow
                                                                            ?.nome,
                                                                      ),
                                                                      focusNode:
                                                                          _model
                                                                              .textFieldFocusNode2,
                                                                      autofocus:
                                                                          false,
                                                                      readOnly:
                                                                          true,
                                                                      obscureText:
                                                                          false,
                                                                      decoration:
                                                                          InputDecoration(
                                                                        isDense:
                                                                            true,
                                                                        labelStyle: FlutterFlowTheme.of(context)
                                                                            .labelMedium
                                                                            .override(
                                                                              fontFamily: 'Readex Pro',
                                                                              letterSpacing: 0.0,
                                                                            ),
                                                                        hintText:
                                                                            'TextField',
                                                                        hintStyle: FlutterFlowTheme.of(context)
                                                                            .labelMedium
                                                                            .override(
                                                                              fontFamily: 'Readex Pro',
                                                                              letterSpacing: 0.0,
                                                                            ),
                                                                        enabledBorder:
                                                                            OutlineInputBorder(
                                                                          borderSide:
                                                                              const BorderSide(
                                                                            color:
                                                                                Color(0x00000000),
                                                                            width:
                                                                                1.0,
                                                                          ),
                                                                          borderRadius:
                                                                              BorderRadius.circular(8.0),
                                                                        ),
                                                                        focusedBorder:
                                                                            OutlineInputBorder(
                                                                          borderSide:
                                                                              const BorderSide(
                                                                            color:
                                                                                Color(0x00000000),
                                                                            width:
                                                                                1.0,
                                                                          ),
                                                                          borderRadius:
                                                                              BorderRadius.circular(8.0),
                                                                        ),
                                                                        errorBorder:
                                                                            OutlineInputBorder(
                                                                          borderSide:
                                                                              BorderSide(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).error,
                                                                            width:
                                                                                1.0,
                                                                          ),
                                                                          borderRadius:
                                                                              BorderRadius.circular(8.0),
                                                                        ),
                                                                        focusedErrorBorder:
                                                                            OutlineInputBorder(
                                                                          borderSide:
                                                                              BorderSide(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).error,
                                                                            width:
                                                                                1.0,
                                                                          ),
                                                                          borderRadius:
                                                                              BorderRadius.circular(8.0),
                                                                        ),
                                                                        filled:
                                                                            true,
                                                                        fillColor:
                                                                            FlutterFlowTheme.of(context).secondaryBackground,
                                                                      ),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Readex Pro',
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primary,
                                                                            fontSize:
                                                                                40.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                          ),
                                                                      textAlign:
                                                                          TextAlign
                                                                              .center,
                                                                      cursorColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .primaryText,
                                                                      validator: _model
                                                                          .textController6Validator
                                                                          .asValidator(
                                                                              context),
                                                                    ),
                                                                  );
                                                                },
                                                              ),
                                                              AutoSizeText(
                                                                'Valor Total:',
                                                                maxLines: 1,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .displayMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Readex Pro',
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryText,
                                                                      fontSize:
                                                                          16.0,
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
                                                                    locale:
                                                                        'pt_br',
                                                                  ),
                                                                  '0',
                                                                ),
                                                                maxLines: 1,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .displayMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Readex Pro',
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primary,
                                                                      fontSize:
                                                                          40.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                    ),
                                                              ),
                                                              AutoSizeText(
                                                                'Pagamento:',
                                                                maxLines: 1,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .displayMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Readex Pro',
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryText,
                                                                      fontSize:
                                                                          16.0,
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
                                                                optionHeight:
                                                                    50.0,
                                                                textStyle: FlutterFlowTheme.of(
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
                                                                direction: Axis
                                                                    .horizontal,
                                                                radioButtonColor:
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary,
                                                                inactiveRadioButtonColor:
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryText,
                                                                toggleable:
                                                                    false,
                                                                horizontalAlignment:
                                                                    WrapAlignment
                                                                        .start,
                                                                verticalAlignment:
                                                                    WrapCrossAlignment
                                                                        .start,
                                                              ),
                                                            ]
                                                                .divide(const SizedBox(
                                                                    height:
                                                                        8.0))
                                                                .around(const SizedBox(
                                                                    height:
                                                                        8.0)),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Container(
                                                    width: double.infinity,
                                                    height: 60.0,
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  0.0,
                                                                  8.0),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .end,
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
                                                            builder: (context,
                                                                snapshot) {
                                                              // Customize what your widget looks like when it's loading.
                                                              if (!snapshot
                                                                  .hasData) {
                                                                return Center(
                                                                  child:
                                                                      SizedBox(
                                                                    width: 50.0,
                                                                    height:
                                                                        50.0,
                                                                    child:
                                                                        CircularProgressIndicator(
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
                                                              List<ControlePedidosRow>
                                                                  buttonControlePedidosRowList =
                                                                  snapshot
                                                                      .data!;

                                                              return FFButtonWidget(
                                                                onPressed:
                                                                    () async {
                                                                  if (_model
                                                                          .data ==
                                                                      null) {
                                                                    _model.data =
                                                                        getCurrentTimestamp;
                                                                    safeSetState(
                                                                        () {});
                                                                  } else {
                                                                    _model.data =
                                                                        _model
                                                                            .data;
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
                                                                        buttonControlePedidosRowList.length +
                                                                            1;
                                                                    safeSetState(
                                                                        () {});
                                                                  }

                                                                  _model.ultimo =
                                                                      await ControlePedidosTable()
                                                                          .insert({
                                                                    'cliente':
                                                                        valueOrDefault<
                                                                            String>(
                                                                      _model
                                                                          .textController6
                                                                          .text,
                                                                      '-',
                                                                    ),
                                                                    'usuario':
                                                                        currentUserUid,
                                                                    'data': supaSerialize<
                                                                            DateTime>(
                                                                        _model
                                                                            .data),
                                                                    'status_pagamento':
                                                                        _model
                                                                            .radioButtonValue,
                                                                    'total':
                                                                        FFAppState()
                                                                            .totalCarrinho,
                                                                    'numero_pedido':
                                                                        _model
                                                                            .numeroPedido,
                                                                    'id_cliente':
                                                                        _model
                                                                            .dropDownClientesValue,
                                                                  });
                                                                  FFAppState()
                                                                      .contador = 1;
                                                                  safeSetState(
                                                                      () {});
                                                                  _model.indice =
                                                                      0;
                                                                  safeSetState(
                                                                      () {});
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
                                                                              _model.indice!)
                                                                          ?.nome,
                                                                      'referencia':
                                                                          _model
                                                                              .numeroPedido,
                                                                      'quantidade': FFAppState()
                                                                          .itensCarrinho
                                                                          .elementAtOrNull(
                                                                              _model.indice!)
                                                                          ?.quantidade,
                                                                      'usuario':
                                                                          currentUserUid,
                                                                      'valor_produto': FFAppState()
                                                                          .itensCarrinho
                                                                          .elementAtOrNull(
                                                                              _model.indice!)
                                                                          ?.preco,
                                                                      'valor_total': FFAppState()
                                                                          .itensCarrinho
                                                                          .elementAtOrNull(
                                                                              _model.indice!)
                                                                          ?.total,
                                                                      'numero_item':
                                                                          FFAppState()
                                                                              .contador,
                                                                      'unidade': FFAppState()
                                                                          .itensCarrinho
                                                                          .elementAtOrNull(
                                                                              _model.indice!)
                                                                          ?.unidade,
                                                                    });
                                                                    FFAppState()
                                                                            .contador =
                                                                        FFAppState().contador +
                                                                            1;
                                                                    safeSetState(
                                                                        () {});
                                                                    _model.indice =
                                                                        _model.indice! +
                                                                            1;
                                                                    safeSetState(
                                                                        () {});
                                                                  }
                                                                  ScaffoldMessenger.of(
                                                                          context)
                                                                      .showSnackBar(
                                                                    SnackBar(
                                                                      content:
                                                                          Text(
                                                                        'Pedido Salvo!',
                                                                        style:
                                                                            TextStyle(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondaryBackground,
                                                                        ),
                                                                      ),
                                                                      duration: const Duration(
                                                                          milliseconds:
                                                                              2000),
                                                                      backgroundColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .primary,
                                                                    ),
                                                                  );
                                                                  FFAppState()
                                                                      .itensCarrinho = [];
                                                                  safeSetState(
                                                                      () {});
                                                                  context
                                                                      .safePop();

                                                                  safeSetState(
                                                                      () {});
                                                                },
                                                                text: 'Salvar',
                                                                options:
                                                                    FFButtonOptions(
                                                                  width: double
                                                                      .infinity,
                                                                  height: 50.0,
                                                                  padding: const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          24.0,
                                                                          0.0,
                                                                          24.0,
                                                                          0.0),
                                                                  iconPadding: const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                                  textStyle: FlutterFlowTheme.of(
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
                                                                  elevation:
                                                                      3.0,
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
                                                  ),
                                                ].divide(const SizedBox(height: 8.0)),
                                              ),
                                              Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Text(
                                                        'Lembretes',
                                                        textAlign:
                                                            TextAlign.center,
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleSmall
                                                                .override(
                                                                  fontFamily:
                                                                      'Readex Pro',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                  fontSize:
                                                                      20.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                      ),
                                                    ],
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
                                                              milliseconds:
                                                                  300),
                                                          curve: Curves.ease,
                                                        );
                                                      });
                                                    },
                                                    text: 'Continuar',
                                                    options: FFButtonOptions(
                                                      width: double.infinity,
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
                                                ]
                                                    .divide(
                                                        const SizedBox(height: 8.0))
                                                    .around(
                                                        const SizedBox(height: 8.0)),
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
