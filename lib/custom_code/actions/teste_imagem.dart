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

import 'dart:typed_data';
import 'package:pdf/widgets.dart' as pw;
import 'package:pdf/pdf.dart';
import 'package:flutter/services.dart';
import 'package:printing/printing.dart';
import 'package:http/http.dart' as http;

// Custom action function
Future testeImagem(String? imagemUrl) async {
  final pdf = pw.Document();

  // Verifica se a URL da imagem foi fornecida
  if (imagemUrl == null || imagemUrl.isEmpty) {
    throw Exception("URL da imagem não foi fornecida.");
  }

  // Tenta carregar a imagem da logo do servidor
  pw.Widget? logoWidget;
  try {
    final response = await http.get(Uri.parse(imagemUrl));

    if (response.statusCode == 200) {
      final Uint8List logoBytes = response.bodyBytes;
      logoWidget = pw.Image(
        pw.MemoryImage(logoBytes),
        width: 200, // Ajuste o tamanho da logo conforme necessário
        height: 200,
      );
    } else {
      logoWidget =
          pw.Text("Erro ao carregar imagem (status: ${response.statusCode})");
    }
  } catch (e) {
    logoWidget = pw.Text("Erro ao carregar a logo: $e");
  }

  // Adiciona a página com a logo centralizada ao PDF
  pdf.addPage(
    pw.Page(
      pageFormat: PdfPageFormat.a4,
      build: (context) {
        return pw.Center(
          child: logoWidget ?? pw.Text("Logo não encontrada."),
        );
      },
    ),
  );

  // Salva o PDF para visualização ou download
  await Printing.layoutPdf(
    onLayout: (PdfPageFormat format) async => pdf.save(),
  );
}
