// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DtPedidosStruct extends BaseStruct {
  DtPedidosStruct({
    int? id,
    DateTime? createdAt,
    String? cliente,
    String? statusPagamento,
    double? total,
    int? numeroPedido,
  })  : _id = id,
        _createdAt = createdAt,
        _cliente = cliente,
        _statusPagamento = statusPagamento,
        _total = total,
        _numeroPedido = numeroPedido;

  // "id" field.
  int? _id;
  int get id => _id ?? 0;
  set id(int? val) => _id = val;

  void incrementId(int amount) => id = id + amount;

  bool hasId() => _id != null;

  // "created_at" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  set createdAt(DateTime? val) => _createdAt = val;

  bool hasCreatedAt() => _createdAt != null;

  // "cliente" field.
  String? _cliente;
  String get cliente => _cliente ?? '';
  set cliente(String? val) => _cliente = val;

  bool hasCliente() => _cliente != null;

  // "status_pagamento" field.
  String? _statusPagamento;
  String get statusPagamento => _statusPagamento ?? '';
  set statusPagamento(String? val) => _statusPagamento = val;

  bool hasStatusPagamento() => _statusPagamento != null;

  // "total" field.
  double? _total;
  double get total => _total ?? 0.0;
  set total(double? val) => _total = val;

  void incrementTotal(double amount) => total = total + amount;

  bool hasTotal() => _total != null;

  // "numero_pedido" field.
  int? _numeroPedido;
  int get numeroPedido => _numeroPedido ?? 0;
  set numeroPedido(int? val) => _numeroPedido = val;

  void incrementNumeroPedido(int amount) =>
      numeroPedido = numeroPedido + amount;

  bool hasNumeroPedido() => _numeroPedido != null;

  static DtPedidosStruct fromMap(Map<String, dynamic> data) => DtPedidosStruct(
        id: castToType<int>(data['id']),
        createdAt: data['created_at'] as DateTime?,
        cliente: data['cliente'] as String?,
        statusPagamento: data['status_pagamento'] as String?,
        total: castToType<double>(data['total']),
        numeroPedido: castToType<int>(data['numero_pedido']),
      );

  static DtPedidosStruct? maybeFromMap(dynamic data) => data is Map
      ? DtPedidosStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'created_at': _createdAt,
        'cliente': _cliente,
        'status_pagamento': _statusPagamento,
        'total': _total,
        'numero_pedido': _numeroPedido,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.int,
        ),
        'created_at': serializeParam(
          _createdAt,
          ParamType.DateTime,
        ),
        'cliente': serializeParam(
          _cliente,
          ParamType.String,
        ),
        'status_pagamento': serializeParam(
          _statusPagamento,
          ParamType.String,
        ),
        'total': serializeParam(
          _total,
          ParamType.double,
        ),
        'numero_pedido': serializeParam(
          _numeroPedido,
          ParamType.int,
        ),
      }.withoutNulls;

  static DtPedidosStruct fromSerializableMap(Map<String, dynamic> data) =>
      DtPedidosStruct(
        id: deserializeParam(
          data['id'],
          ParamType.int,
          false,
        ),
        createdAt: deserializeParam(
          data['created_at'],
          ParamType.DateTime,
          false,
        ),
        cliente: deserializeParam(
          data['cliente'],
          ParamType.String,
          false,
        ),
        statusPagamento: deserializeParam(
          data['status_pagamento'],
          ParamType.String,
          false,
        ),
        total: deserializeParam(
          data['total'],
          ParamType.double,
          false,
        ),
        numeroPedido: deserializeParam(
          data['numero_pedido'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'DtPedidosStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is DtPedidosStruct &&
        id == other.id &&
        createdAt == other.createdAt &&
        cliente == other.cliente &&
        statusPagamento == other.statusPagamento &&
        total == other.total &&
        numeroPedido == other.numeroPedido;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([id, createdAt, cliente, statusPagamento, total, numeroPedido]);
}

DtPedidosStruct createDtPedidosStruct({
  int? id,
  DateTime? createdAt,
  String? cliente,
  String? statusPagamento,
  double? total,
  int? numeroPedido,
}) =>
    DtPedidosStruct(
      id: id,
      createdAt: createdAt,
      cliente: cliente,
      statusPagamento: statusPagamento,
      total: total,
      numeroPedido: numeroPedido,
    );
