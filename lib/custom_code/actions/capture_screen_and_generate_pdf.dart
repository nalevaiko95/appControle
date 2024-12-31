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

import 'package:screenshot/screenshot.dart'; // Add this to pubspec.yaml
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw; // Add this to pubspec.yaml
import 'dart:typed_data';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

Future<void> captureScreenAndGeneratePdf() async {
  try {
    // Initialize the ScreenshotController
    final screenshotController = ScreenshotController();

    // Capture the screenshot of the current screen
    final Uint8List? capturedImage = await screenshotController.capture();
    if (capturedImage == null) {
      throw Exception('Erro ao capturar a tela.');
    }

    // Create a PDF document
    final pdf = pw.Document();

    // Add the captured image as a page in the PDF
    pdf.addPage(
      pw.Page(
        pageFormat: PdfPageFormat.a4,
        build: (pw.Context context) {
          return pw.Image(
            pw.MemoryImage(capturedImage),
            fit: pw.BoxFit.contain,
          );
        },
      ),
    );

    // Save the PDF to a temporary directory
    final tempDir = await getTemporaryDirectory();
    final pdfPath = '${tempDir.path}/captured_screen.pdf';
    final pdfFile = File(pdfPath);
    await pdfFile.writeAsBytes(await pdf.save());

    // Optionally, display a message with the file path
    print('PDF salvo em: $pdfPath');
  } catch (e) {
    print('Erro ao capturar a tela e gerar PDF: $e');
  }
}
