import 'package:flutter/material.dart';
import '/backend/schema/structs/index.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _apresentacao = prefs.getBool('ff_apresentacao') ?? _apresentacao;
    });
    _safeInit(() {
      _totalCarrinho = prefs.getDouble('ff_totalCarrinho') ?? _totalCarrinho;
    });
    _safeInit(() {
      _itensCarrinho = prefs
              .getStringList('ff_itensCarrinho')
              ?.map((x) {
                try {
                  return CarrinhoStruct.fromSerializableMap(jsonDecode(x));
                } catch (e) {
                  print("Can't decode persisted data type. Error: $e.");
                  return null;
                }
              })
              .withoutNulls
              .toList() ??
          _itensCarrinho;
    });
    _safeInit(() {
      _linebreak = prefs.getString('ff_linebreak') ?? _linebreak;
    });
    _safeInit(() {
      _negocioSelecionado =
          prefs.getInt('ff_negocioSelecionado') ?? _negocioSelecionado;
    });
    _safeInit(() {
      _userId = prefs.getInt('ff_userId') ?? _userId;
    });
    _safeInit(() {
      _timeSelecionado = prefs.getInt('ff_timeSelecionado') ?? _timeSelecionado;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  String _valueFormat = '';
  String get valueFormat => _valueFormat;
  set valueFormat(String value) {
    _valueFormat = value;
  }

  double _valueDouble = 0.0;
  double get valueDouble => _valueDouble;
  set valueDouble(double value) {
    _valueDouble = value;
  }

  bool _apresentacao = false;
  bool get apresentacao => _apresentacao;
  set apresentacao(bool value) {
    _apresentacao = value;
    prefs.setBool('ff_apresentacao', value);
  }

  double _propPrice = 0.0;
  double get propPrice => _propPrice;
  set propPrice(double value) {
    _propPrice = value;
  }

  double _totalCarrinho = 0.0;
  double get totalCarrinho => _totalCarrinho;
  set totalCarrinho(double value) {
    _totalCarrinho = value;
    prefs.setDouble('ff_totalCarrinho', value);
  }

  List<CarrinhoStruct> _itensCarrinho = [];
  List<CarrinhoStruct> get itensCarrinho => _itensCarrinho;
  set itensCarrinho(List<CarrinhoStruct> value) {
    _itensCarrinho = value;
    prefs.setStringList(
        'ff_itensCarrinho', value.map((x) => x.serialize()).toList());
  }

  void addToItensCarrinho(CarrinhoStruct value) {
    itensCarrinho.add(value);
    prefs.setStringList(
        'ff_itensCarrinho', _itensCarrinho.map((x) => x.serialize()).toList());
  }

  void removeFromItensCarrinho(CarrinhoStruct value) {
    itensCarrinho.remove(value);
    prefs.setStringList(
        'ff_itensCarrinho', _itensCarrinho.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromItensCarrinho(int index) {
    itensCarrinho.removeAt(index);
    prefs.setStringList(
        'ff_itensCarrinho', _itensCarrinho.map((x) => x.serialize()).toList());
  }

  void updateItensCarrinhoAtIndex(
    int index,
    CarrinhoStruct Function(CarrinhoStruct) updateFn,
  ) {
    itensCarrinho[index] = updateFn(_itensCarrinho[index]);
    prefs.setStringList(
        'ff_itensCarrinho', _itensCarrinho.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInItensCarrinho(int index, CarrinhoStruct value) {
    itensCarrinho.insert(index, value);
    prefs.setStringList(
        'ff_itensCarrinho', _itensCarrinho.map((x) => x.serialize()).toList());
  }

  int _contador = 0;
  int get contador => _contador;
  set contador(int value) {
    _contador = value;
  }

  String _linebreak = '';
  String get linebreak => _linebreak;
  set linebreak(String value) {
    _linebreak = value;
    prefs.setString('ff_linebreak', value);
  }

  int _negocioSelecionado = 0;
  int get negocioSelecionado => _negocioSelecionado;
  set negocioSelecionado(int value) {
    _negocioSelecionado = value;
    prefs.setInt('ff_negocioSelecionado', value);
  }

  int _userId = 0;
  int get userId => _userId;
  set userId(int value) {
    _userId = value;
    prefs.setInt('ff_userId', value);
  }

  List<RelatorioProdutoStruct> _relatorioProduto = [];
  List<RelatorioProdutoStruct> get relatorioProduto => _relatorioProduto;
  set relatorioProduto(List<RelatorioProdutoStruct> value) {
    _relatorioProduto = value;
  }

  void addToRelatorioProduto(RelatorioProdutoStruct value) {
    relatorioProduto.add(value);
  }

  void removeFromRelatorioProduto(RelatorioProdutoStruct value) {
    relatorioProduto.remove(value);
  }

  void removeAtIndexFromRelatorioProduto(int index) {
    relatorioProduto.removeAt(index);
  }

  void updateRelatorioProdutoAtIndex(
    int index,
    RelatorioProdutoStruct Function(RelatorioProdutoStruct) updateFn,
  ) {
    relatorioProduto[index] = updateFn(_relatorioProduto[index]);
  }

  void insertAtIndexInRelatorioProduto(
      int index, RelatorioProdutoStruct value) {
    relatorioProduto.insert(index, value);
  }

  int _timeSelecionado = 1;
  int get timeSelecionado => _timeSelecionado;
  set timeSelecionado(int value) {
    _timeSelecionado = value;
    prefs.setInt('ff_timeSelecionado', value);
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
