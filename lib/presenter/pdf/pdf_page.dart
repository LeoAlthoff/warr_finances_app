import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

import '../../shared/utils/database_helper.dart';
import '../../shared/utils/dateFormater.dart';

class ShowPdf extends StatelessWidget {
  const ShowPdf(this.title, {Key? key}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          leading: GestureDetector(
            child: const Icon(Icons.arrow_back),
            onTap: () {
              Navigator.of(context).pop();
            },
          ),
          title: Text(title),
          backgroundColor: Colors.pink,
        ),
        body: PdfPreview(
          build: (format) => _generatePdf(format),
        ),
      ),
    );
  }

  Future<Uint8List> _generatePdf(PdfPageFormat format) async {
    final pdf = pw.Document(version: PdfVersion.pdf_1_5, compress: true);
    final font = await PdfGoogleFonts.nunitoExtraLight();
    final operations = await DatabaseHelper.instance.selectOperation();

    int pageSize = 22;
    int pages = operations['operation']!.length ~/ pageSize;
    bool lastPage = false;
    int lastPageSize = operations['operation']!.length % pageSize;

    int isLastPage(int i) {
      if (i == pages) {
        lastPage = true;
        return lastPageSize;
      }
      return pageSize;
    }

    int test(int index, int i) {
      return index + (i * (pageSize));
    }

    for (int i = 0; i <= pages; i++) {
      pdf.addPage(
        pw.Page(
          pageFormat: format,
          build: (context) {
            return pw.Padding(
              padding: const pw.EdgeInsets.symmetric(horizontal: 16),
              child: pw.Column(
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: [
                  pw.Row(
                    mainAxisAlignment: pw.MainAxisAlignment.center,
                    children: [
                      // pw.Image(AssetImage(Image.asset()  as pw.ImageProvider) as pw.ImageProvider),
                      pw.Column(
                        children: [
                          pw.Text(
                            'Warr finances',
                            style: pw.TextStyle(
                              fontWeight: pw.FontWeight.bold,
                              font: font,
                              fontSize: 20,
                            ),
                          ),
                          pw.Text(
                            'Extrato',
                            style: pw.TextStyle(
                              font: font,
                              fontSize: 15,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                  pw.SizedBox(height: 20),
                  pw.ListView.builder(
                    itemCount: isLastPage(i),
                    itemBuilder: (context, int index) {
                      return pw.Container(
                        decoration: pw.BoxDecoration(
                          color: PdfColors.pink100,
                          border: pw.Border.all(),
                        ),
                        margin: const pw.EdgeInsets.symmetric(vertical: 5),
                        child: pw.Row(
                          mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                          children: [
                            pw.Text(
                              'Operação: ${operations['operation']![test(index, i)]['name']}',
                              style: pw.TextStyle(
                                font: font,
                              ),
                            ),
                            pw.Container(
                              decoration: pw.BoxDecoration(
                                border: pw.Border.all(),
                              ),
                              padding: const pw.EdgeInsets.symmetric(
                                horizontal: 30,
                              ),
                              child: pw.Text(
                                'Valor: ${operations['operation']![test(index, i)]['entry'] == 1 ? '+' : '-'}'
                                'R\$ ${operations['operation']![test(index, i)]['value']}',
                                style: pw.TextStyle(
                                  font: font,
                                ),
                              ),
                            ),
                            pw.Text(
                              'Data: ${formatDate(operations['operation']![test(index, i)]['date'])}',
                              style: pw.TextStyle(
                                font: font,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ],
              ),
            );
          },
        ),
      );
    }
    return pdf.save();
  }
}
