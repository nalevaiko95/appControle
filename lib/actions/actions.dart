import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';

Future calculaCarrinho(BuildContext context) async {
  FFAppState().contador = 1;
  FFAppState().totalCarrinho = 0.0;
  FFAppState().update(() {});
  while (FFAppState().contador <= FFAppState().itensCarrinho.length) {
    FFAppState().totalCarrinho = FFAppState().totalCarrinho +
        FFAppState()
            .itensCarrinho
            .elementAtOrNull(FFAppState().contador - 1)!
            .total;
    FFAppState().contador = FFAppState().contador + 1;
    FFAppState().update(() {});
  }
}

Future addItem(BuildContext context) async {}
