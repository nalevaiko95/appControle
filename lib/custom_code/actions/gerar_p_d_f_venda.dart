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

import 'package:pdf/pdf.dart'; // Importação do Pdf para PdfPageFormat
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

Future gerarPDFVenda(
  int? numeroVenda,
  String? nomeCliente,
  String? dataVenda,
  List<String>? listaProdutos, // Mantemos como uma lista de strings
  double? totalVenda,
  double? desconto,
) async {
  // Cria um documento PDF
  final pdf = pw.Document();

  // Adiciona uma página ao documento
  pdf.addPage(
    pw.Page(
      pageFormat: PdfPageFormat.a4, // Define o formato da página
      build: (pw.Context context) {
        return pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: [
            pw.Center(
              child: pw.Text(
                'Nome da Empresa', // Substitua pelo nome real da empresa
                style:
                    pw.TextStyle(fontSize: 24, fontWeight: pw.FontWeight.bold),
              ),
            ),
            pw.SizedBox(height: 20),
            pw.Row(
              mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
              children: [
                pw.Text('Nº da Venda: $numeroVenda'),
                pw.Text('Data da Venda: $dataVenda'),
              ],
            ),
            pw.SizedBox(height: 10),
            pw.Text('Nome do Cliente: $nomeCliente'),
            pw.SizedBox(height: 20),
            pw.Table.fromTextArray(
              headers: [
                'Descrição do Item',
                'Quantidade',
                'Preço Unitário',
                'Total'
              ],
              data: listaProdutos!.map((produto) {
                // Divida a string em partes (você pode definir um delimitador, como "|")
                final partes = produto.split(
                    '|'); // Por exemplo, "descricao|quantidade|preco|total"
                return [
                  partes[0], // Descrição do item
                  partes[1], // Quantidade
                  partes[2], // Preço unitário
                  partes[3], // Total
                ];
              }).toList(),
            ),
            pw.SizedBox(height: 20),
            pw.Row(
              mainAxisAlignment: pw.MainAxisAlignment.end,
              children: [
                pw.Text('Desconto: $desconto'),
                pw.SizedBox(width: 20),
                pw.Text('Total: $totalVenda'),
              ],
            ),
            pw.SizedBox(height: 40),
            pw.Row(
              mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
              children: [
                pw.Text(
                    'Assinatura do Comprador: _______________________________________________'),
              ],
            ),
          ],
        );
      },
    ),
  );

  // Salva e exibe o PDF
  await Printing.layoutPdf(
      onLayout: (PdfPageFormat format) async => pdf.save());
}
