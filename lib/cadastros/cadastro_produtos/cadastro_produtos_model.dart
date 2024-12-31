import '/flutter_flow/flutter_flow_util.dart';
import 'cadastro_produtos_widget.dart' show CadastroProdutosWidget;
import 'package:flutter/material.dart';

class CadastroProdutosModel extends FlutterFlowModel<CadastroProdutosWidget> {
  ///  Local state fields for this page.

  double? valorVenda = 0.0;

  ///  State fields for stateful widgets in this page.

  final formKey1 = GlobalKey<FormState>();
  final formKey2 = GlobalKey<FormState>();
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // State field(s) for txtCodigoInternoProduto widget.
  FocusNode? txtCodigoInternoProdutoFocusNode;
  TextEditingController? txtCodigoInternoProdutoTextController;
  String? Function(BuildContext, String?)?
      txtCodigoInternoProdutoTextControllerValidator;
  // State field(s) for txtNomeProduto widget.
  FocusNode? txtNomeProdutoFocusNode;
  TextEditingController? txtNomeProdutoTextController;
  String? Function(BuildContext, String?)?
      txtNomeProdutoTextControllerValidator;
  String? _txtNomeProdutoTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Campo Obrigatório!';
    }

    return null;
  }

  // State field(s) for txtUnidadeProduto widget.
  FocusNode? txtUnidadeProdutoFocusNode;
  TextEditingController? txtUnidadeProdutoTextController;
  String? Function(BuildContext, String?)?
      txtUnidadeProdutoTextControllerValidator;
  String? _txtUnidadeProdutoTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Campo Obrigatório!';
    }

    return null;
  }

  // State field(s) for txtValorCustoProduto widget.
  FocusNode? txtValorCustoProdutoFocusNode;
  TextEditingController? txtValorCustoProdutoTextController;
  String? Function(BuildContext, String?)?
      txtValorCustoProdutoTextControllerValidator;
  // State field(s) for txtMargemLucroPtoduto widget.
  FocusNode? txtMargemLucroPtodutoFocusNode;
  TextEditingController? txtMargemLucroPtodutoTextController;
  String? Function(BuildContext, String?)?
      txtMargemLucroPtodutoTextControllerValidator;
  // State field(s) for txtValorProduto widget.
  FocusNode? txtValorProdutoFocusNode;
  TextEditingController? txtValorProdutoTextController;
  String? Function(BuildContext, String?)?
      txtValorProdutoTextControllerValidator;
  String? _txtValorProdutoTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Campo Obrigatório!';
    }

    return null;
  }

  // State field(s) for txtEstoque widget.
  FocusNode? txtEstoqueFocusNode;
  TextEditingController? txtEstoqueTextController;
  String? Function(BuildContext, String?)? txtEstoqueTextControllerValidator;
  // State field(s) for txtCodigoInternoServico widget.
  FocusNode? txtCodigoInternoServicoFocusNode;
  TextEditingController? txtCodigoInternoServicoTextController;
  String? Function(BuildContext, String?)?
      txtCodigoInternoServicoTextControllerValidator;
  // State field(s) for txtNomeServico widget.
  FocusNode? txtNomeServicoFocusNode;
  TextEditingController? txtNomeServicoTextController;
  String? Function(BuildContext, String?)?
      txtNomeServicoTextControllerValidator;
  // State field(s) for txtValorServico widget.
  FocusNode? txtValorServicoFocusNode;
  TextEditingController? txtValorServicoTextController;
  String? Function(BuildContext, String?)?
      txtValorServicoTextControllerValidator;
  String? _txtValorServicoTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Campo Obrigatório!';
    }

    return null;
  }

  // State field(s) for txtUnidadeServico widget.
  FocusNode? txtUnidadeServicoFocusNode;
  TextEditingController? txtUnidadeServicoTextController;
  String? Function(BuildContext, String?)?
      txtUnidadeServicoTextControllerValidator;
  String? _txtUnidadeServicoTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Campo Obrigatório!';
    }

    return null;
  }

  @override
  void initState(BuildContext context) {
    txtNomeProdutoTextControllerValidator =
        _txtNomeProdutoTextControllerValidator;
    txtUnidadeProdutoTextControllerValidator =
        _txtUnidadeProdutoTextControllerValidator;
    txtValorProdutoTextControllerValidator =
        _txtValorProdutoTextControllerValidator;
    txtValorServicoTextControllerValidator =
        _txtValorServicoTextControllerValidator;
    txtUnidadeServicoTextControllerValidator =
        _txtUnidadeServicoTextControllerValidator;
  }

  @override
  void dispose() {
    tabBarController?.dispose();
    txtCodigoInternoProdutoFocusNode?.dispose();
    txtCodigoInternoProdutoTextController?.dispose();

    txtNomeProdutoFocusNode?.dispose();
    txtNomeProdutoTextController?.dispose();

    txtUnidadeProdutoFocusNode?.dispose();
    txtUnidadeProdutoTextController?.dispose();

    txtValorCustoProdutoFocusNode?.dispose();
    txtValorCustoProdutoTextController?.dispose();

    txtMargemLucroPtodutoFocusNode?.dispose();
    txtMargemLucroPtodutoTextController?.dispose();

    txtValorProdutoFocusNode?.dispose();
    txtValorProdutoTextController?.dispose();

    txtEstoqueFocusNode?.dispose();
    txtEstoqueTextController?.dispose();

    txtCodigoInternoServicoFocusNode?.dispose();
    txtCodigoInternoServicoTextController?.dispose();

    txtNomeServicoFocusNode?.dispose();
    txtNomeServicoTextController?.dispose();

    txtValorServicoFocusNode?.dispose();
    txtValorServicoTextController?.dispose();

    txtUnidadeServicoFocusNode?.dispose();
    txtUnidadeServicoTextController?.dispose();
  }
}
