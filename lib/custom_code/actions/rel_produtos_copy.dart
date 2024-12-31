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

import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

Future relProdutosCopy(List<RelatorioProdutoStruct>? lista) async {
  if (lista == null || lista.isEmpty) {
    print("A lista de produtos está vazia.");
    return;
  }

  final pdf = pw.Document();

  pdf.addPage(
    pw.MultiPage(
      pageFormat: PdfPageFormat.a4,
      margin: const pw.EdgeInsets.all(20),
      build: (pw.Context context) {
        return [
          pw.Header(
            level: 0,
            child: pw.Text(
              'Relatório de Produtos v2',
              style: pw.TextStyle(fontSize: 24, fontWeight: pw.FontWeight.bold),
            ),
          ),
          pw.Table(
            border: pw.TableBorder.all(),
            columnWidths: {
              0: pw.FixedColumnWidth(50),
              1: pw.FlexColumnWidth(),
              2: pw.FixedColumnWidth(80),
            },
            children: [
              // Cabeçalho da tabela
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
              // Conteúdo da tabela
              ...lista.map(
                (produto) => pw.TableRow(
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
                ),
              ),
            ],
          ),
        ];
      },
    ),
  );

  await Printing.layoutPdf(
    onLayout: (PdfPageFormat format) async => pdf.save(),
  );
}
