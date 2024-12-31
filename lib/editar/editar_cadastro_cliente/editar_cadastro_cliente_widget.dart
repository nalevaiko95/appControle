import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:provider/provider.dart';
import 'editar_cadastro_cliente_model.dart';
export 'editar_cadastro_cliente_model.dart';

class EditarCadastroClienteWidget extends StatefulWidget {
  const EditarCadastroClienteWidget({
    super.key,
    this.refresh,
    required this.idCliente,
  });

  final Future Function()? refresh;
  final ControleClientesRow? idCliente;

  @override
  State<EditarCadastroClienteWidget> createState() =>
      _EditarCadastroClienteWidgetState();
}

class _EditarCadastroClienteWidgetState
    extends State<EditarCadastroClienteWidget> with TickerProviderStateMixin {
  late EditarCadastroClienteModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EditarCadastroClienteModel());

    _model.txtNomeTextController ??= TextEditingController(
        text: valueOrDefault<String>(
      widget.idCliente?.nome,
      '-',
    ));
    _model.txtNomeFocusNode ??= FocusNode();

    _model.txtTelefoneTextController ??=
        TextEditingController(text: widget.idCliente?.contato);
    _model.txtTelefoneFocusNode ??= FocusNode();

    _model.expandableExpandableController =
        ExpandableController(initialExpanded: false);
    _model.txtNumeroInscricaoTextController ??=
        TextEditingController(text: widget.idCliente?.numeroInscricao);
    _model.txtNumeroInscricaoFocusNode ??= FocusNode();

    _model.txtCEPTextController ??=
        TextEditingController(text: widget.idCliente?.cep);
    _model.txtCEPFocusNode ??= FocusNode();

    _model.txtLogradouroTextController ??=
        TextEditingController(text: widget.idCliente?.logradouro);
    _model.txtLogradouroFocusNode ??= FocusNode();

    _model.txtNumeroTextController ??=
        TextEditingController(text: widget.idCliente?.numero);
    _model.txtNumeroFocusNode ??= FocusNode();

    _model.txtComplementoTextController ??=
        TextEditingController(text: widget.idCliente?.complemento);
    _model.txtComplementoFocusNode ??= FocusNode();

    _model.txtBairroTextController ??=
        TextEditingController(text: widget.idCliente?.bairro);
    _model.txtBairroFocusNode ??= FocusNode();

    _model.txtCidadeTextController ??=
        TextEditingController(text: widget.idCliente?.cidade);
    _model.txtCidadeFocusNode ??= FocusNode();

    _model.txtEstadoTextController1 ??=
        TextEditingController(text: widget.idCliente?.estado);
    _model.txtEstadoFocusNode1 ??= FocusNode();

    _model.txtEstadoTextController2 ??= TextEditingController();
    _model.txtEstadoFocusNode2 ??= FocusNode();

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
          _model.txtEstadoTextController2?.text = dateTimeFormat(
            "dd/MM/yyyy",
            widget.idCliente?.aniversario,
            locale: FFLocalizations.of(context).languageCode,
          );
        }));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Align(
      alignment: const AlignmentDirectional(0.0, 0.0),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Container(
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
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Editar Cadastro',
                        style: FlutterFlowTheme.of(context).titleLarge.override(
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
                ),
                Align(
                  alignment: const AlignmentDirectional(0.0, -1.0),
                  child: Form(
                    key: _model.formKey,
                    autovalidateMode: AutovalidateMode.disabled,
                    child: Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            TextFormField(
                              controller: _model.txtNomeTextController,
                              focusNode: _model.txtNomeFocusNode,
                              autofocus: true,
                              obscureText: false,
                              decoration: InputDecoration(
                                labelText: 'Digite o nome',
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
                              validator: _model.txtNomeTextControllerValidator
                                  .asValidator(context),
                            ),
                            TextFormField(
                              controller: _model.txtTelefoneTextController,
                              focusNode: _model.txtTelefoneFocusNode,
                              autofocus: true,
                              obscureText: false,
                              decoration: InputDecoration(
                                labelText: 'Telefone: (XX) X-XXXX-XXXX',
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
                              keyboardType: TextInputType.phone,
                              validator: _model
                                  .txtTelefoneTextControllerValidator
                                  .asValidator(context),
                              inputFormatters: [_model.txtTelefoneMask],
                            ),
                            Container(
                              width: double.infinity,
                              color: const Color(0x00000000),
                              child: ExpandableNotifier(
                                controller:
                                    _model.expandableExpandableController,
                                child: ExpandablePanel(
                                  header: Text(
                                    'Informações Adicionais',
                                    style: FlutterFlowTheme.of(context)
                                        .titleLarge
                                        .override(
                                          fontFamily: 'Readex Pro',
                                          color: Colors.black,
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                  collapsed: Container(),
                                  expanded: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Expanded(
                                            child: Padding(
                                              padding: const EdgeInsets.all(4.0),
                                              child: FlutterFlowChoiceChips(
                                                options: const [
                                                  ChipData('CPF'),
                                                  ChipData('CNPJ')
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
                                                  [
                                                    widget.idCliente
                                                                    ?.tipoInscricao ==
                                                                null ||
                                                            widget.idCliente
                                                                    ?.tipoInscricao ==
                                                                ''
                                                        ? 'CPF'
                                                        : widget.idCliente!
                                                            .tipoInscricao!
                                                  ],
                                                ),
                                                wrapped: true,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      TextFormField(
                                        controller: _model
                                            .txtNumeroInscricaoTextController,
                                        focusNode:
                                            _model.txtNumeroInscricaoFocusNode,
                                        onChanged: (_) => EasyDebounce.debounce(
                                          '_model.txtNumeroInscricaoTextController',
                                          const Duration(milliseconds: 0),
                                          () async {
                                            safeSetState(() {
                                              _model.txtNumeroInscricaoTextController
                                                      ?.text =
                                                  functions.mascaraCPFCNPJ(
                                                      _model.choiceChipsValue,
                                                      _model
                                                          .txtNumeroInscricaoTextController
                                                          .text)!;
                                              _model.txtNumeroInscricaoMask
                                                  .updateMask(
                                                newValue: TextEditingValue(
                                                  text: _model
                                                      .txtNumeroInscricaoTextController!
                                                      .text,
                                                ),
                                              );
                                            });
                                          },
                                        ),
                                        autofocus: true,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          labelText:
                                              'Digite o ${_model.choiceChipsValue}',
                                          hintStyle:
                                              FlutterFlowTheme.of(context)
                                                  .labelLarge
                                                  .override(
                                                    fontFamily: 'Readex Pro',
                                                    letterSpacing: 0.0,
                                                  ),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .alternate,
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          focusedErrorBorder:
                                              OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          contentPadding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  8.0, 0.0, 0.0, 0.0),
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .labelLarge
                                            .override(
                                              fontFamily: 'Readex Pro',
                                              letterSpacing: 0.0,
                                            ),
                                        maxLength:
                                            _model.choiceChipsValue == 'CPF'
                                                ? 14
                                                : 18,
                                        keyboardType: TextInputType.number,
                                        validator: _model
                                            .txtNumeroInscricaoTextControllerValidator
                                            .asValidator(context),
                                        inputFormatters: [
                                          _model.txtNumeroInscricaoMask
                                        ],
                                      ),
                                      Divider(
                                        thickness: 2.0,
                                        color: FlutterFlowTheme.of(context)
                                            .alternate,
                                      ),
                                      Text(
                                        'Endereço',
                                        style: FlutterFlowTheme.of(context)
                                            .titleLarge
                                            .override(
                                              fontFamily: 'Readex Pro',
                                              color: Colors.black,
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                      TextFormField(
                                        controller: _model.txtCEPTextController,
                                        focusNode: _model.txtCEPFocusNode,
                                        autofocus: true,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          labelText: 'Digite o CEP',
                                          hintStyle:
                                              FlutterFlowTheme.of(context)
                                                  .labelLarge
                                                  .override(
                                                    fontFamily: 'Readex Pro',
                                                    letterSpacing: 0.0,
                                                  ),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .alternate,
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          focusedErrorBorder:
                                              OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          contentPadding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  8.0, 0.0, 0.0, 0.0),
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .labelLarge
                                            .override(
                                              fontFamily: 'Readex Pro',
                                              letterSpacing: 0.0,
                                            ),
                                        validator: _model
                                            .txtCEPTextControllerValidator
                                            .asValidator(context),
                                        inputFormatters: [_model.txtCEPMask],
                                      ),
                                      TextFormField(
                                        controller:
                                            _model.txtLogradouroTextController,
                                        focusNode:
                                            _model.txtLogradouroFocusNode,
                                        autofocus: true,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          labelText:
                                              'Logradouro (rua, avenida, etc)',
                                          hintStyle:
                                              FlutterFlowTheme.of(context)
                                                  .labelLarge
                                                  .override(
                                                    fontFamily: 'Readex Pro',
                                                    letterSpacing: 0.0,
                                                  ),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .alternate,
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          focusedErrorBorder:
                                              OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          contentPadding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  8.0, 0.0, 0.0, 0.0),
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .labelLarge
                                            .override(
                                              fontFamily: 'Readex Pro',
                                              letterSpacing: 0.0,
                                            ),
                                        validator: _model
                                            .txtLogradouroTextControllerValidator
                                            .asValidator(context),
                                      ),
                                      TextFormField(
                                        controller:
                                            _model.txtNumeroTextController,
                                        focusNode: _model.txtNumeroFocusNode,
                                        autofocus: true,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          labelText: 'Número',
                                          hintStyle:
                                              FlutterFlowTheme.of(context)
                                                  .labelLarge
                                                  .override(
                                                    fontFamily: 'Readex Pro',
                                                    letterSpacing: 0.0,
                                                  ),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .alternate,
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          focusedErrorBorder:
                                              OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          contentPadding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  8.0, 0.0, 0.0, 0.0),
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .labelLarge
                                            .override(
                                              fontFamily: 'Readex Pro',
                                              letterSpacing: 0.0,
                                            ),
                                        validator: _model
                                            .txtNumeroTextControllerValidator
                                            .asValidator(context),
                                      ),
                                      TextFormField(
                                        controller:
                                            _model.txtComplementoTextController,
                                        focusNode:
                                            _model.txtComplementoFocusNode,
                                        autofocus: true,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          labelText:
                                              'Complemento (fundos, andar, etc)',
                                          hintStyle:
                                              FlutterFlowTheme.of(context)
                                                  .labelLarge
                                                  .override(
                                                    fontFamily: 'Readex Pro',
                                                    letterSpacing: 0.0,
                                                  ),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .alternate,
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          focusedErrorBorder:
                                              OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          contentPadding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  8.0, 0.0, 0.0, 0.0),
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .labelLarge
                                            .override(
                                              fontFamily: 'Readex Pro',
                                              letterSpacing: 0.0,
                                            ),
                                        validator: _model
                                            .txtComplementoTextControllerValidator
                                            .asValidator(context),
                                      ),
                                      TextFormField(
                                        controller:
                                            _model.txtBairroTextController,
                                        focusNode: _model.txtBairroFocusNode,
                                        autofocus: true,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          labelText: 'Bairro',
                                          hintStyle:
                                              FlutterFlowTheme.of(context)
                                                  .labelLarge
                                                  .override(
                                                    fontFamily: 'Readex Pro',
                                                    letterSpacing: 0.0,
                                                  ),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .alternate,
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          focusedErrorBorder:
                                              OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          contentPadding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  8.0, 0.0, 0.0, 0.0),
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .labelLarge
                                            .override(
                                              fontFamily: 'Readex Pro',
                                              letterSpacing: 0.0,
                                            ),
                                        validator: _model
                                            .txtBairroTextControllerValidator
                                            .asValidator(context),
                                      ),
                                      TextFormField(
                                        controller:
                                            _model.txtCidadeTextController,
                                        focusNode: _model.txtCidadeFocusNode,
                                        autofocus: true,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          labelText: 'Cidade',
                                          hintStyle:
                                              FlutterFlowTheme.of(context)
                                                  .labelLarge
                                                  .override(
                                                    fontFamily: 'Readex Pro',
                                                    letterSpacing: 0.0,
                                                  ),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .alternate,
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          focusedErrorBorder:
                                              OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          contentPadding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  8.0, 0.0, 0.0, 0.0),
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .labelLarge
                                            .override(
                                              fontFamily: 'Readex Pro',
                                              letterSpacing: 0.0,
                                            ),
                                        validator: _model
                                            .txtCidadeTextControllerValidator
                                            .asValidator(context),
                                      ),
                                      TextFormField(
                                        controller:
                                            _model.txtEstadoTextController1,
                                        focusNode: _model.txtEstadoFocusNode1,
                                        autofocus: true,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          labelText: 'Estado',
                                          hintStyle:
                                              FlutterFlowTheme.of(context)
                                                  .labelLarge
                                                  .override(
                                                    fontFamily: 'Readex Pro',
                                                    letterSpacing: 0.0,
                                                  ),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .alternate,
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          focusedErrorBorder:
                                              OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          contentPadding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  8.0, 0.0, 0.0, 0.0),
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .labelLarge
                                            .override(
                                              fontFamily: 'Readex Pro',
                                              letterSpacing: 0.0,
                                            ),
                                        validator: _model
                                            .txtEstadoTextController1Validator
                                            .asValidator(context),
                                      ),
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Expanded(
                                            child: TextFormField(
                                              controller: _model
                                                  .txtEstadoTextController2,
                                              focusNode:
                                                  _model.txtEstadoFocusNode2,
                                              autofocus: true,
                                              obscureText: false,
                                              decoration: InputDecoration(
                                                labelText:
                                                    'Data de Nascimento: dd/mm/aaaa',
                                                hintStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .labelLarge
                                                        .override(
                                                          fontFamily:
                                                              'Readex Pro',
                                                          letterSpacing: 0.0,
                                                        ),
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .alternate,
                                                    width: 2.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primary,
                                                    width: 2.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                errorBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .error,
                                                    width: 2.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                focusedErrorBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .error,
                                                    width: 2.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                contentPadding:
                                                    const EdgeInsetsDirectional
                                                        .fromSTEB(
                                                            8.0, 0.0, 0.0, 0.0),
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .labelLarge
                                                      .override(
                                                        fontFamily:
                                                            'Readex Pro',
                                                        letterSpacing: 0.0,
                                                      ),
                                              keyboardType:
                                                  TextInputType.number,
                                              validator: _model
                                                  .txtEstadoTextController2Validator
                                                  .asValidator(context),
                                              inputFormatters: [
                                                _model.txtEstadoMask2
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ].divide(const SizedBox(height: 16.0)),
                                  ),
                                  theme: const ExpandableThemeData(
                                    tapHeaderToExpand: true,
                                    tapBodyToExpand: false,
                                    tapBodyToCollapse: false,
                                    headerAlignment:
                                        ExpandablePanelHeaderAlignment.center,
                                    hasIcon: true,
                                  ),
                                ),
                              ),
                            ),
                            FFButtonWidget(
                              onPressed: () async {
                                await ControleClientesTable().update(
                                  data: {
                                    'nome': _model.txtNomeTextController.text,
                                    'contato': (String var1) {
                                      return var1.replaceAll(
                                          RegExp(r'[^0-9]'), '');
                                    }(_model.txtTelefoneTextController.text),
                                    'usuario': currentUserUid,
                                    'id_negocio':
                                        FFAppState().negocioSelecionado,
                                    'tipoInscricao': _model.choiceChipsValue,
                                    'numeroInscricao': _model
                                        .txtNumeroInscricaoTextController.text,
                                    'logradouro':
                                        _model.txtLogradouroTextController.text,
                                    'CEP': _model.txtCEPTextController.text,
                                    'numero':
                                        _model.txtNumeroTextController.text,
                                    'complemento': _model
                                        .txtComplementoTextController.text,
                                    'bairro':
                                        _model.txtBairroTextController.text,
                                    'cidade':
                                        _model.txtCidadeTextController.text,
                                    'estado':
                                        _model.txtEstadoTextController1.text,
                                    'aniversario': supaSerialize<DateTime>(
                                        functions.converteData(_model
                                            .txtEstadoTextController2.text)),
                                  },
                                  matchingRows: (rows) => rows.eqOrNull(
                                    'id',
                                    widget.idCliente?.id,
                                  ),
                                );
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      'Cadastro Atualizado!',
                                      style: TextStyle(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryBackground,
                                      ),
                                    ),
                                    duration: const Duration(milliseconds: 2000),
                                    backgroundColor:
                                        FlutterFlowTheme.of(context).primary,
                                  ),
                                );
                                await widget.refresh?.call();
                                Navigator.pop(context);
                              },
                              text: 'Salvar',
                              options: FFButtonOptions(
                                width: 200.0,
                                height: 40.0,
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    16.0, 0.0, 16.0, 0.0),
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
                                elevation: 0.0,
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                            FFButtonWidget(
                              onPressed: () async {
                                await ControleClientesTable().delete(
                                  matchingRows: (rows) => rows.eqOrNull(
                                    'id',
                                    widget.idCliente?.id,
                                  ),
                                );
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      'Cliente Excluído!',
                                      style: TextStyle(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryBackground,
                                      ),
                                    ),
                                    duration: const Duration(milliseconds: 2000),
                                    backgroundColor:
                                        FlutterFlowTheme.of(context).error,
                                  ),
                                );
                                await widget.refresh?.call();
                                Navigator.pop(context);
                              },
                              text: 'Excluir',
                              options: FFButtonOptions(
                                width: 200.0,
                                height: 40.0,
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    16.0, 0.0, 16.0, 0.0),
                                iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: FlutterFlowTheme.of(context).error,
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      fontFamily: 'Readex Pro',
                                      color: Colors.white,
                                      letterSpacing: 0.0,
                                    ),
                                elevation: 0.0,
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                          ].divide(const SizedBox(height: 16.0)),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ).animateOnPageLoad(animationsMap['containerOnPageLoadAnimation']!),
      ),
    );
  }
}
