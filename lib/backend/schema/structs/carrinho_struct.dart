// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CarrinhoStruct extends BaseStruct {
  CarrinhoStruct({
    int? idProduto,
    String? nome,
    double? preco,
    double? quantidade,
    double? total,
    String? unidade,
    String? codigo,
    double? desconto,
  })  : _idProduto = idProduto,
        _nome = nome,
        _preco = preco,
        _quantidade = quantidade,
        _total = total,
        _unidade = unidade,
        _codigo = codigo,
        _desconto = desconto;

  // "id_produto" field.
  int? _idProduto;
  int get idProduto => _idProduto ?? 0;
  set idProduto(int? val) => _idProduto = val;

  void incrementIdProduto(int amount) => idProduto = idProduto + amount;

  bool hasIdProduto() => _idProduto != null;

  // "nome" field.
  String? _nome;
  String get nome => _nome ?? '';
  set nome(String? val) => _nome = val;

  bool hasNome() => _nome != null;

  // "preco" field.
  double? _preco;
  double get preco => _preco ?? 0.0;
  set preco(double? val) => _preco = val;

  void incrementPreco(double amount) => preco = preco + amount;

  bool hasPreco() => _preco != null;

  // "quantidade" field.
  double? _quantidade;
  double get quantidade => _quantidade ?? 0.0;
  set quantidade(double? val) => _quantidade = val;

  void incrementQuantidade(double amount) => quantidade = quantidade + amount;

  bool hasQuantidade() => _quantidade != null;

  // "total" field.
  double? _total;
  double get total => _total ?? 0.0;
  set total(double? val) => _total = val;

  void incrementTotal(double amount) => total = total + amount;

  bool hasTotal() => _total != null;

  // "unidade" field.
  String? _unidade;
  String get unidade => _unidade ?? '';
  set unidade(String? val) => _unidade = val;

  bool hasUnidade() => _unidade != null;

  // "codigo" field.
  String? _codigo;
  String get codigo => _codigo ?? '';
  set codigo(String? val) => _codigo = val;

  bool hasCodigo() => _codigo != null;

  // "desconto" field.
  double? _desconto;
  double get desconto => _desconto ?? 0.0;
  set desconto(double? val) => _desconto = val;

  void incrementDesconto(double amount) => desconto = desconto + amount;

  bool hasDesconto() => _desconto != null;

  static CarrinhoStruct fromMap(Map<String, dynamic> data) => CarrinhoStruct(
        idProduto: castToType<int>(data['id_produto']),
        nome: data['nome'] as String?,
        preco: castToType<double>(data['preco']),
        quantidade: castToType<double>(data['quantidade']),
        total: castToType<double>(data['total']),
        unidade: data['unidade'] as String?,
        codigo: data['codigo'] as String?,
        desconto: castToType<double>(data['desconto']),
      );

  static CarrinhoStruct? maybeFromMap(dynamic data) =>
      data is Map ? CarrinhoStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'id_produto': _idProduto,
        'nome': _nome,
        'preco': _preco,
        'quantidade': _quantidade,
        'total': _total,
        'unidade': _unidade,
        'codigo': _codigo,
        'desconto': _desconto,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id_produto': serializeParam(
          _idProduto,
          ParamType.int,
        ),
        'nome': serializeParam(
          _nome,
          ParamType.String,
        ),
        'preco': serializeParam(
          _preco,
          ParamType.double,
        ),
        'quantidade': serializeParam(
          _quantidade,
          ParamType.double,
        ),
        'total': serializeParam(
          _total,
          ParamType.double,
        ),
        'unidade': serializeParam(
          _unidade,
          ParamType.String,
        ),
        'codigo': serializeParam(
          _codigo,
          ParamType.String,
        ),
        'desconto': serializeParam(
          _desconto,
          ParamType.double,
        ),
      }.withoutNulls;

  static CarrinhoStruct fromSerializableMap(Map<String, dynamic> data) =>
      CarrinhoStruct(
        idProduto: deserializeParam(
          data['id_produto'],
          ParamType.int,
          false,
        ),
        nome: deserializeParam(
          data['nome'],
          ParamType.String,
          false,
        ),
        preco: deserializeParam(
          data['preco'],
          ParamType.double,
          false,
        ),
        quantidade: deserializeParam(
          data['quantidade'],
          ParamType.double,
          false,
        ),
        total: deserializeParam(
          data['total'],
          ParamType.double,
          false,
        ),
        unidade: deserializeParam(
          data['unidade'],
          ParamType.String,
          false,
        ),
        codigo: deserializeParam(
          data['codigo'],
          ParamType.String,
          false,
        ),
        desconto: deserializeParam(
          data['desconto'],
          ParamType.double,
          false,
        ),
      );

  @override
  String toString() => 'CarrinhoStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is CarrinhoStruct &&
        idProduto == other.idProduto &&
        nome == other.nome &&
        preco == other.preco &&
        quantidade == other.quantidade &&
        total == other.total &&
        unidade == other.unidade &&
        codigo == other.codigo &&
        desconto == other.desconto;
  }

  @override
  int get hashCode => const ListEquality().hash(
      [idProduto, nome, preco, quantidade, total, unidade, codigo, desconto]);
}

CarrinhoStruct createCarrinhoStruct({
  int? idProduto,
  String? nome,
  double? preco,
  double? quantidade,
  double? total,
  String? unidade,
  String? codigo,
  double? desconto,
}) =>
    CarrinhoStruct(
      idProduto: idProduto,
      nome: nome,
      preco: preco,
      quantidade: quantidade,
      total: total,
      unidade: unidade,
      codigo: codigo,
      desconto: desconto,
    );
