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

import 'package:pdf/pdf.dart'; // Necessário para PdfPageFormat e PdfColors
import 'package:pdf/widgets.dart' as pw; // Necessário para os widgets PDF
import 'package:printing/printing.dart'; // Para visualização e impressão

Future relProdutos(List<RelatorioProdutoStruct>? lista) async {
  if (lista == null || lista.isEmpty) {
    print("A lista de produtos está vazia.");
    return;
  }

  final pdf = pw.Document();

  pdf.addPage(
    pw.Page(
      pageFormat: PdfPageFormat.a4,
      build: (pw.Context context) {
        return pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: [
            pw.Text(
              'Relatório de Produtos',
              style: pw.TextStyle(fontSize: 24, fontWeight: pw.FontWeight.bold),
            ),
            pw.SizedBox(height: 20),
            pw.Table(
              border: pw.TableBorder.all(),
              columnWidths: {
                0: pw.FixedColumnWidth(50),
                1: pw.FlexColumnWidth(),
                2: pw.FixedColumnWidth(80),
              },
              children: [
                pw.TableRow(
                  decoration: pw.BoxDecoration(color: PdfColors.grey300),
                  children: [
                    pw.Padding(
                      padding: const pw.EdgeInsets.all(8.0),
                      child: pw.Text('ID',
                          style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
                    ),
                    pw.Padding(
                      padding: const pw.EdgeInsets.all(8.0),
                      child: pw.Text('Nome',
                          style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
                    ),
                    pw.Padding(
                      padding: const pw.EdgeInsets.all(8.0),
                      child: pw.Text('Valor',
                          style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
                    ),
                  ],
                ),
                ...lista.map((produto) {
                  return pw.TableRow(
                    children: [
                      pw.Padding(
                        padding: const pw.EdgeInsets.all(8.0),
                        child: pw.Text('${produto.id ?? ""}'),
                      ),
                      pw.Padding(
                        padding: const pw.EdgeInsets.all(8.0),
                        child: pw.Text('${produto.nome ?? ""}'),
                      ),
                      pw.Padding(
                        padding: const pw.EdgeInsets.all(8.0),
                        child: pw.Text(
                          produto.valor != null
                              ? 'R\$ ${produto.valor!.toStringAsFixed(2)}'
                              : '-',
                        ),
                      ),
                    ],
                  );
                }).toList(),
              ],
            ),
          ],
        );
      },
    ),
  );

  await Printing.layoutPdf(
    onLayout: (PdfPageFormat format) async => pdf.save(),
  );
}
