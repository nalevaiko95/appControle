// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class RelatorioProdutoStruct extends BaseStruct {
  RelatorioProdutoStruct({
    int? id,
    String? nome,
    double? valor,
  })  : _id = id,
        _nome = nome,
        _valor = valor;

  // "id" field.
  int? _id;
  int get id => _id ?? 0;
  set id(int? val) => _id = val;

  void incrementId(int amount) => id = id + amount;

  bool hasId() => _id != null;

  // "Nome" field.
  String? _nome;
  String get nome => _nome ?? '';
  set nome(String? val) => _nome = val;

  bool hasNome() => _nome != null;

  // "valor" field.
  double? _valor;
  double get valor => _valor ?? 0.0;
  set valor(double? val) => _valor = val;

  void incrementValor(double amount) => valor = valor + amount;

  bool hasValor() => _valor != null;

  static RelatorioProdutoStruct fromMap(Map<String, dynamic> data) =>
      RelatorioProdutoStruct(
        id: castToType<int>(data['id']),
        nome: data['Nome'] as String?,
        valor: castToType<double>(data['valor']),
      );

  static RelatorioProdutoStruct? maybeFromMap(dynamic data) => data is Map
      ? RelatorioProdutoStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'Nome': _nome,
        'valor': _valor,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.int,
        ),
        'Nome': serializeParam(
          _nome,
          ParamType.String,
        ),
        'valor': serializeParam(
          _valor,
          ParamType.double,
        ),
      }.withoutNulls;

  static RelatorioProdutoStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      RelatorioProdutoStruct(
        id: deserializeParam(
          data['id'],
          ParamType.int,
          false,
        ),
        nome: deserializeParam(
          data['Nome'],
          ParamType.String,
          false,
        ),
        valor: deserializeParam(
          data['valor'],
          ParamType.double,
          false,
        ),
      );

  @override
  String toString() => 'RelatorioProdutoStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is RelatorioProdutoStruct &&
        id == other.id &&
        nome == other.nome &&
        valor == other.valor;
  }

  @override
  int get hashCode => const ListEquality().hash([id, nome, valor]);
}

RelatorioProdutoStruct createRelatorioProdutoStruct({
  int? id,
  String? nome,
  double? valor,
}) =>
    RelatorioProdutoStruct(
      id: id,
      nome: nome,
      valor: valor,
    );
