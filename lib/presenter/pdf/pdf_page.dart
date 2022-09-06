import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../dio/dio_helper.dart';
import 'package:intl/intl.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

import '../../shared/utils/shared_preferences.dart';

class ShowPdf extends StatelessWidget {
  const ShowPdf(this.title, {Key? key}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
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
        ),
        body: PdfPreview(
          pdfFileName: 'extrato.pdf',
          canChangePageFormat: false,
          initialPageFormat: PdfPageFormat(
            PdfPageFormat.a4.width,
            PdfPageFormat.a4.height,
            marginAll: 0,
          ),
          build: (format) => _generatePdf(format),
        ),
      ),
    );
  }

  Future<Uint8List> _generatePdf(PdfPageFormat format) async {
    final pdf = pw.Document(version: PdfVersion.pdf_1_5, compress: true);
    final font = await PdfGoogleFonts.nunitoExtraLight();
    final operations = await DioHelper.getOperations(DateTime.now(), SharedPreferencesHelper.prefs!.getInt("UserId")!);
    final iconPng =
        (await rootBundle.load('assets/images/icon.png')).buffer.asUint8List();

    int pageSize = 35;
    int pages = operations[2].length ~/ pageSize;
    int lastPageSize = operations[2].length % pageSize;

    int isLastPage(int i) {
      if (i == pages) {
        return lastPageSize;
      }
      return pageSize;
    }

    int getIndex(int index, int i) {
      return index + (i * (pageSize));
    }

    for (int i = 0; i <= pages; i++) {
      pdf.addPage(
        pw.Page(
          pageFormat: format,
          build: (context) {
            return pw.Padding(
              padding: const pw.EdgeInsets.all(32),
              child: pw.Column(
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: [
                  pw.Row(
                    mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                    children: [
                      pw.Image(
                        pw.MemoryImage(iconPng),
                        fit: pw.BoxFit.cover,
                        height: 50,
                        width: 50,
                      ),
                      pw.Column(
                        crossAxisAlignment: pw.CrossAxisAlignment.end,
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
                  pw.SizedBox(height: 30),
                  pw.Container(
                    padding: const pw.EdgeInsets.all(16),
                    decoration: pw.BoxDecoration(
                      border: pw.Border.all(color: PdfColors.black, width: 1),
                    ),
                    child: pw.Row(
                      mainAxisAlignment: pw.MainAxisAlignment.spaceAround,
                      children: [
                        pw.ListView.builder(
                          itemCount: isLastPage(i),
                          itemBuilder: (context, int index) {
                            return pw.Container(
                              color: index % 2 == 0
                                  ? PdfColors.pink100
                                  : PdfColors.white,
                              child: pw.Text(
                                '   ${operations[2][getIndex(index, i)].name}   ',
                                style: pw.TextStyle(
                                  font: font,
                                ),
                              ),
                            );
                          },
                        ),
                        pw.ListView.builder(
                          itemCount: isLastPage(i),
                          itemBuilder: (context, int index) {
                            return pw.Container(
                              color: index % 2 == 0
                                  ? PdfColors.pink100
                                  : PdfColors.white,
                              child: pw.Text(
                                '   ${operations[2][getIndex(index, i)].entry == true ? ' ' : '-'}'
                                'R\$ ${operations[2][getIndex(index, i)].value}   ',
                                style: pw.TextStyle(
                                  font: font,
                                ),
                              ),
                            );
                          },
                        ),
                        pw.ListView.builder(
                          itemCount: isLastPage(i),
                          itemBuilder: (context, int index) {
                            return pw.Container(
                              color: index % 2 == 0
                                  ? PdfColors.pink100
                                  : PdfColors.white,
                              child: pw.Text(
                                '   ${DateFormat('dd/MM/yyyy', 'pt_BR').format(operations[2][getIndex(index, i)].date)}   ',
                                style: pw.TextStyle(
                                  font: font,
                                ),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
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
