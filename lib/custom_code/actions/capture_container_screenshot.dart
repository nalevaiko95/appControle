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

import 'package:flutter/foundation.dart';

import 'package:screenshot/screenshot.dart'; // Importa o pacote Screenshot
import 'dart:typed_data'; // Para manipulação da imagem capturada
import 'dart:io'; // Para manipulação de arquivos (para mobile)
import 'package:path_provider/path_provider.dart'; // Para acessar diretórios de armazenamento (para mobile)
import 'dart:html' as html; // Para manipulação de download na web

Future<void> captureContainerScreenshot(BuildContext context) async {
  try {
    // Crie o ScreenshotController
    ScreenshotController screenshotController = ScreenshotController();

    // Crie uma chave global para identificar o widget que será capturado
    GlobalKey screenshotKey = GlobalKey();

    // Envolva o seu Container dentro do Screenshot widget
    Screenshot(
      key: screenshotKey,
      controller: screenshotController,
      child: Container(
        color: Colors.blueAccent, // Defina o conteúdo do seu Container
        width: 300,
        height: 300,
        child: Center(
          child: Text(
            'Conteúdo a ser capturado',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );

    // Captura a imagem do Container
    Uint8List? capturedImage = await screenshotController.capture();

    // Verifica se a imagem foi capturada
    if (capturedImage == null) {
      print("Erro ao capturar a imagem!");
      return;
    }

    // Verifica se estamos em um dispositivo Web ou em Mobile
    if (kIsWeb) {
      // Se for Web, cria um link de download
      final blob = html.Blob([capturedImage]);
      final url = html.Url.createObjectUrlFromBlob(blob);
      final anchor = html.AnchorElement(href: url)
        ..target = 'blank'
        ..download = 'captured_image.png'
        ..click();
      html.Url.revokeObjectUrl(url);
    } else {
      // Se for Mobile, salva no diretório do dispositivo
      final directory = await getApplicationDocumentsDirectory();
      String path = '${directory.path}/captured_image.png';

      // Cria o arquivo e escreve a imagem nele
      File file = File(path);
      await file.writeAsBytes(capturedImage);

      // Exibe o caminho onde o arquivo foi salvo
      print("Imagem salva em: $path");

      // Aqui você pode adicionar lógica para exibir um SnackBar ou mensagem de sucesso para o usuário
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Imagem salva em: $path')),
      );
    }
  } catch (e) {
    print("Erro ao capturar ou salvar a imagem: $e");
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Erro ao gerar e salvar imagem: $e')),
    );
  }
}
