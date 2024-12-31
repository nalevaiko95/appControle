import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'cadastro_cobertura_model.dart';
export 'cadastro_cobertura_model.dart';

class CadastroCoberturaWidget extends StatefulWidget {
  const CadastroCoberturaWidget({
    super.key,
    required this.campanhaId,
  });

  final ControleCampanhasRow? campanhaId;

  @override
  State<CadastroCoberturaWidget> createState() =>
      _CadastroCoberturaWidgetState();
}

class _CadastroCoberturaWidgetState extends State<CadastroCoberturaWidget> {
  late CadastroCoberturaModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CadastroCoberturaModel());

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

    return Title(
        title: 'listaIncentivos',
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
              title: InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  await actions.captureScreenAndGeneratePdf();
                },
                child: Text(
                  'Controle Incentivos',
                  style: FlutterFlowTheme.of(context).headlineMedium.override(
                        fontFamily: 'Readex Pro',
                        color: Colors.white,
                        fontSize: 22.0,
                        letterSpacing: 0.0,
                      ),
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
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Expanded(
                                    child: FutureBuilder<
                                        List<ControleCadastroProdutosRow>>(
                                      future: ControleCadastroProdutosTable()
                                          .queryRows(
                                        queryFn: (q) => q
                                            .eqOrNull(
                                              'id_negocio',
                                              FFAppState().negocioSelecionado,
                                            )
                                            .order('nome', ascending: true),
                                      ),
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
                                        List<ControleCadastroProdutosRow>
                                            dropDownClientesControleCadastroProdutosRowList =
                                            snapshot.data!;

                                        return FlutterFlowDropDown<int>(
                                          controller: _model
                                                  .dropDownClientesValueController ??=
                                              FormFieldController<int>(
                                            _model.dropDownClientesValue ??=
                                                dropDownClientesControleCadastroProdutosRowList
                                                    .firstOrNull?.id,
                                          ),
                                          options: List<int>.from(
                                              dropDownClientesControleCadastroProdutosRowList
                                                  .map((e) => e.id)
                                                  .toList()),
                                          optionLabels:
                                              dropDownClientesControleCadastroProdutosRowList
                                                  .map((e) => e.nome)
                                                  .withoutNulls
                                                  .toList(),
                                          onChanged: (val) => safeSetState(() =>
                                              _model.dropDownClientesValue =
                                                  val),
                                          width: 200.0,
                                          height: 50.0,
                                          searchHintTextStyle:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium
                                                  .override(
                                                    fontFamily: 'Readex Pro',
                                                    letterSpacing: 0.0,
                                                  ),
                                          searchTextStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Readex Pro',
                                                    letterSpacing: 0.0,
                                                  ),
                                          textStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Readex Pro',
                                                    letterSpacing: 0.0,
                                                  ),
                                          hintText: 'Selecione o Produto',
                                          searchHintText: 'Pesquisar...',
                                          icon: Icon(
                                            Icons.keyboard_arrow_down_rounded,
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                            size: 24.0,
                                          ),
                                          fillColor:
                                              FlutterFlowTheme.of(context)
                                                  .secondaryBackground,
                                          elevation: 2.0,
                                          borderColor:
                                              FlutterFlowTheme.of(context)
                                                  .alternate,
                                          borderWidth: 2.0,
                                          borderRadius: 8.0,
                                          margin:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  12.0, 0.0, 12.0, 0.0),
                                          hidesUnderline: true,
                                          isOverButton: false,
                                          isSearchable: true,
                                          isMultiSelect: false,
                                        );
                                      },
                                    ),
                                  ),
                                  FlutterFlowIconButton(
                                    borderColor:
                                        FlutterFlowTheme.of(context).primary,
                                    borderRadius: 8.0,
                                    borderWidth: 1.0,
                                    buttonSize: 50.0,
                                    fillColor:
                                        FlutterFlowTheme.of(context).primary,
                                    icon: Icon(
                                      Icons.add,
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      size: 24.0,
                                    ),
                                    onPressed: () async {
                                      context.pushNamed('cadastroProdutos');
                                    },
                                  ),
                                ].divide(const SizedBox(width: 8.0)),
                              ),
                              Expanded(
                                child:
                                    FutureBuilder<List<ControleCampanhasRow>>(
                                  future: ControleCampanhasTable().queryRows(
                                    queryFn: (q) => q
                                        .eqOrNull(
                                          'negocio_id',
                                          FFAppState().negocioSelecionado,
                                        )
                                        .order('campanha_id'),
                                  ),
                                  builder: (context, snapshot) {
                                    // Customize what your widget looks like when it's loading.
                                    if (!snapshot.hasData) {
                                      return Center(
                                        child: SizedBox(
                                          width: 50.0,
                                          height: 50.0,
                                          child: CircularProgressIndicator(
                                            valueColor:
                                                AlwaysStoppedAnimation<Color>(
                                              FlutterFlowTheme.of(context)
                                                  .primary,
                                            ),
                                          ),
                                        ),
                                      );
                                    }
                                    List<ControleCampanhasRow>
                                        listViewControleCampanhasRowList =
                                        snapshot.data!;

                                    return ListView.separated(
                                      padding: EdgeInsets.zero,
                                      shrinkWrap: true,
                                      scrollDirection: Axis.vertical,
                                      itemCount:
                                          listViewControleCampanhasRowList
                                              .length,
                                      separatorBuilder: (_, __) =>
                                          const SizedBox(height: 12.0),
                                      itemBuilder: (context, listViewIndex) {
                                        final listViewControleCampanhasRow =
                                            listViewControleCampanhasRowList[
                                                listViewIndex];
                                        return Container(
                                          width: double.infinity,
                                          height: 70.0,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Expanded(
                                                flex: 2,
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Container(
                                                      width: 50.0,
                                                      height: 50.0,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(30.0),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Expanded(
                                                flex: 8,
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    AutoSizeText(
                                                      valueOrDefault<String>(
                                                        listViewControleCampanhasRow
                                                            .nome,
                                                        '-',
                                                      ),
                                                      minFontSize: 12.0,
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Readex Pro',
                                                            fontSize: 20.0,
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            lineHeight: 0.0,
                                                          ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ].divide(const SizedBox(width: 8.0)),
                                          ),
                                        );
                                      },
                                    );
                                  },
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
          ),
        ));
  }
}
