// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:flutter/rendering.dart';
import 'dart:typed_data';
import 'dart:ui' as ui; // Para manipulação de imagem
import 'package:path_provider/path_provider.dart'; // Para salvar no dispositivo
import 'dart:io'; // Para manipulação de arquivos (Mobile)
import 'dart:html' as html; // Para salvar na web
import 'package:flutter/foundation.dart'; // Para detectar a plataforma

Future<void> testeImagem2(BuildContext context) async {
  try {
    // Inicializa a GlobalKey que será usada para capturar o container
    final GlobalKey globalKey = GlobalKey();

    // Exemplo de Container que será capturado (verifique se o widget foi renderizado antes de capturar)
    final containerWidget = RepaintBoundary(
      key: globalKey,
      child: Container(
        width: 360, // Definir o tamanho desejado
        height: 360, // Definir o tamanho desejado
        color: Colors.blueAccent,
        child: Center(
          child: Text(
            'Grande Final!',
            style: TextStyle(color: Colors.white, fontSize: 24),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );

    // Aguardar o ciclo de renderização completo antes de capturar a imagem
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      try {
        // Acessa o renderObject do container para gerar a imagem
        final boundary = globalKey.currentContext?.findRenderObject()
            as RenderRepaintBoundary?;

        if (boundary == null) {
          throw Exception('O boundary não foi encontrado ou não está pronto.');
        }

        // Captura a imagem
        ui.Image image = await boundary.toImage(
            pixelRatio: 3.0); // 3x a resolução do container
        ByteData? byteData =
            await image.toByteData(format: ui.ImageByteFormat.png);
        if (byteData == null) return;

        Uint8List pngBytes = byteData.buffer.asUint8List();

        if (kIsWeb) {
          // Salvar na Web
          final blob = html.Blob([pngBytes]);
          final url = html.Url.createObjectUrlFromBlob(blob);
          final anchor = html.AnchorElement(href: url)
            ..setAttribute("download", "jogo_1080x1080.png")
            ..click();
          html.Url.revokeObjectUrl(url);
        } else {
          // Salvar no Mobile
          final directory = await getApplicationDocumentsDirectory();
          final filePath = '${directory.path}/jogo_1080x1080.png';
          final file = File(filePath);
          await file.writeAsBytes(pngBytes);

          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Imagem salva em: $filePath')),
          );
        }
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Erro ao gerar imagem: $e')),
        );
      }
    });
  } catch (e) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Erro ao gerar vossa imagem: $e')),
    );
  }
}
