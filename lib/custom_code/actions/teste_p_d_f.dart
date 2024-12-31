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
import 'package:http/http.dart' as http; // Adicione a importação do http

Future testePDF(
  String? logoNegocio,
  String? nomeFantasia,
  String? descricaoNegocio,
  String? enderecoNegocio,
  String? contatoNegocio,
  String? tipoDocumento,
  int? numeroDocumento,
  DateTime? dataDocumento,
  String? nomeCliente,
  String? numeroInscricaoCliente,
  String? enderecoCliente,
  String? contatoCliente,
  List<CarrinhoStruct>? relItens,
) async {
  final pdf = pw.Document();

  // Formata a data
  final String dataFormatada = dataDocumento != null
      ? '${dataDocumento.day}/${dataDocumento.month}/${dataDocumento.year}'
      : 'N/A';

  // Carrega a logo da empresa
  /*pw.Widget? logoWidget;
  if (logoNegocio != null && logoNegocio.isNotEmpty) {
    try {
      final Uint8List logoBytes =
          (await NetworkAssetBundle(Uri.parse(logoNegocio)).load(""))
              .buffer
              .asUint8List();
      logoWidget = pw.Image(
        pw.MemoryImage(logoBytes),
        width: 100,
        height: 100,
      );
    } catch (e) {
      logoWidget = pw.Text("Logo não encontrada",
          style: pw.TextStyle(color: PdfColors.red));
    }
  }*/
  pw.Widget? logoWidget;
  if (logoNegocio != null && logoNegocio.isNotEmpty) {
    try {
      final response = await http.get(Uri.parse(logoNegocio));

      if (response.statusCode == 200) {
        final Uint8List logoBytes = response.bodyBytes;
        logoWidget = pw.Image(
          pw.MemoryImage(logoBytes),
          width: 100, // Ajuste o tamanho conforme necessário
          height: 100,
        );
      } else {
        logoWidget = pw.Text(
            "Erro ao carregar imagem (status: ${response.statusCode})",
            style: pw.TextStyle(color: PdfColors.red));
      }
    } catch (e) {
      logoWidget = pw.Text("Erro ao carregar a logo: $e",
          style: pw.TextStyle(color: PdfColors.red));
    }
  } else {
    logoWidget = pw.Text("Logo não fornecida",
        style: pw.TextStyle(color: PdfColors.red));
  }

  pdf.addPage(
    pw.MultiPage(
      pageFormat: PdfPageFormat.a4,
      margin: pw.EdgeInsets.all(20),
      build: (context) {
        return [
          // Cabeçalho
          pw.Row(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              if (logoWidget != null) logoWidget,
              pw.SizedBox(width: 10),
              pw.Column(
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: [
                  pw.Text(
                    nomeFantasia ?? 'Nome da Empresa',
                    style: pw.TextStyle(
                        fontSize: 18, fontWeight: pw.FontWeight.bold),
                  ),
                  pw.Text(descricaoNegocio ?? 'Descrição da Empresa'),
                  pw.Text(enderecoNegocio ?? 'Endereço da Empresa'),
                  pw.Text(contatoNegocio ?? 'Contato da Empresa'),
                ],
              ),
            ],
          ),
          pw.SizedBox(height: 20),

          // Título
          pw.Text(
            'Relatório de $tipoDocumento',
            style: pw.TextStyle(fontSize: 14, fontWeight: pw.FontWeight.bold),
            textAlign: pw.TextAlign.center,
          ),
          pw.SizedBox(height: 10),

          // Dados do pedido
          pw.Row(
            mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
            children: [
              pw.Text('Número: $numeroDocumento',
                  style: pw.TextStyle(fontSize: 12)),
              pw.Text('Data: $dataFormatada',
                  style: pw.TextStyle(fontSize: 12)),
            ],
          ),
          pw.SizedBox(height: 20),

          // Dados do cliente
          pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              pw.Text('Dados do Cliente:',
                  style: pw.TextStyle(
                      fontSize: 14, fontWeight: pw.FontWeight.bold)),
              pw.Text('Nome: $nomeCliente'),
              pw.Text('Inscrição: $numeroInscricaoCliente'),
              pw.Text('Endereço: $enderecoCliente'),
              pw.Text('Contato: $contatoCliente'),
            ],
          ),
          pw.SizedBox(height: 20),

          // Tabela de itens
          pw.Text('Itens do Pedido:',
              style:
                  pw.TextStyle(fontSize: 10, fontWeight: pw.FontWeight.bold)),
          pw.Table(
            border: pw.TableBorder.all(width: 0.5),
            columnWidths: {
              0: pw.FixedColumnWidth(50), // Largura fixa para 'Código'
              1: pw.FixedColumnWidth(150), // Largura fixa para 'Descrição'
              2: pw.FixedColumnWidth(50), // Largura fixa para 'Unidade'
              3: pw.FixedColumnWidth(50), // Largura fixa para 'Quantidade'
              4: pw.FixedColumnWidth(70), // Largura fixa para 'Preço Unitário'
              5: pw.FixedColumnWidth(70), // Largura fixa para 'Desconto'
              6: pw.FixedColumnWidth(70), // Largura fixa para 'Total'
            },
            children: [
              // Cabeçalho da tabela
              pw.TableRow(
                decoration: pw.BoxDecoration(color: PdfColors.grey300),
                children: [
                  pw.Padding(
                    padding: const pw.EdgeInsets.all(5),
                    child: pw.Text('Cód.',
                        style: pw.TextStyle(
                            fontWeight: pw.FontWeight.bold, fontSize: 10),
                        textAlign: pw.TextAlign.center),
                  ),
                  pw.Padding(
                    padding: const pw.EdgeInsets.all(5),
                    child: pw.Text('Descrição',
                        style: pw.TextStyle(
                            fontWeight: pw.FontWeight.bold, fontSize: 10),
                        textAlign: pw.TextAlign.left),
                  ),
                  pw.Padding(
                    padding: const pw.EdgeInsets.all(5),
                    child: pw.Text('Unid.',
                        style: pw.TextStyle(
                            fontWeight: pw.FontWeight.bold, fontSize: 10),
                        textAlign: pw.TextAlign.center),
                  ),
                  pw.Padding(
                    padding: const pw.EdgeInsets.all(5),
                    child: pw.Text('Quant.',
                        style: pw.TextStyle(
                            fontWeight: pw.FontWeight.bold, fontSize: 10),
                        textAlign: pw.TextAlign.right),
                  ),
                  pw.Padding(
                    padding: const pw.EdgeInsets.all(5),
                    child: pw.Text('Preço Unit.',
                        style: pw.TextStyle(
                            fontWeight: pw.FontWeight.bold, fontSize: 10),
                        textAlign: pw.TextAlign.right),
                  ),
                  pw.Padding(
                    padding: const pw.EdgeInsets.all(5),
                    child: pw.Text('Desconto',
                        style: pw.TextStyle(
                            fontWeight: pw.FontWeight.bold, fontSize: 10),
                        textAlign: pw.TextAlign.right),
                  ),
                  pw.Padding(
                    padding: const pw.EdgeInsets.all(5),
                    child: pw.Text('Total',
                        style: pw.TextStyle(
                            fontWeight: pw.FontWeight.bold, fontSize: 10),
                        textAlign: pw.TextAlign.right),
                  ),
                ],
              ),
              // Linhas de itens
              ...?relItens?.map((item) {
                return pw.TableRow(
                  children: [
                    pw.Padding(
                      padding: const pw.EdgeInsets.all(5),
                      child: pw.Text(item.codigo ?? '-',
                          style: pw.TextStyle(fontSize: 10),
                          textAlign: pw.TextAlign.center),
                    ),
                    pw.Padding(
                      padding: const pw.EdgeInsets.all(5),
                      child: pw.Text(item.nome ?? '-',
                          style: pw.TextStyle(fontSize: 10),
                          textAlign: pw.TextAlign.left),
                    ),
                    pw.Padding(
                      padding: const pw.EdgeInsets.all(5),
                      child: pw.Text(item.unidade ?? '-',
                          style: pw.TextStyle(fontSize: 10),
                          textAlign: pw.TextAlign.center),
                    ),
                    pw.Padding(
                      padding: const pw.EdgeInsets.all(5),
                      child: pw.Text(item.quantidade?.toStringAsFixed(2) ?? '0',
                          style: pw.TextStyle(fontSize: 10),
                          textAlign: pw.TextAlign.right),
                    ),
                    pw.Padding(
                      padding: const pw.EdgeInsets.all(5),
                      child: pw.Text(
                          'R\$ ${item.preco?.toStringAsFixed(2) ?? '0.00'}',
                          style: pw.TextStyle(fontSize: 10),
                          textAlign: pw.TextAlign.right),
                    ),
                    pw.Padding(
                      padding: const pw.EdgeInsets.all(5),
                      child: pw.Text(
                          'R\$ ${item.desconto?.toStringAsFixed(2) ?? '0.00'}',
                          style: pw.TextStyle(fontSize: 10),
                          textAlign: pw.TextAlign.right),
                    ),
                    pw.Padding(
                      padding: const pw.EdgeInsets.all(5),
                      child: pw.Text(
                          'R\$ ${item.total?.toStringAsFixed(2) ?? '0.00'}',
                          style: pw.TextStyle(fontSize: 10),
                          textAlign: pw.TextAlign.right),
                    ),
                  ],
                );
              }),
            ],
          ),

          // Totalizadores
          if (relItens != null && relItens.isNotEmpty)
            pw.Padding(
              padding: pw.EdgeInsets.only(top: 20),
              child: pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                children: [
                  pw.Text(
                    'Valor Total:',
                    style: pw.TextStyle(
                        fontSize: 14, fontWeight: pw.FontWeight.bold),
                  ),
                  pw.Text(
                    'R\$ ${relItens.map((e) => e.total ?? 0).reduce((a, b) => a + b).toStringAsFixed(2)}',
                    style: pw.TextStyle(
                        fontSize: 14, fontWeight: pw.FontWeight.bold),
                  ),
                ],
              ),
            ),
        ];
      },
    ),
  );

  // Exibe ou imprime o PDF
  await Printing.layoutPdf(
    onLayout: (PdfPageFormat format) async => pdf.save(),
  );
}
