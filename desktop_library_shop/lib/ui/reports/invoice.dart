import 'dart:typed_data';
import 'package:desktop_library_shop/core/models/book.dart';
import 'package:desktop_library_shop/ui/widgets/app_button.dart';
import 'package:flutter/material.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

class InvoiceReport extends StatelessWidget {
  final Book book;
  final void Function()? onPressed;
  const InvoiceReport({Key? key, required this.book, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leadingWidth: 100,
        leading: AppElevatedBtn(
          width: 100,
          focusNode: FocusNode(),
          isEnable: true,
          onPressedFn: onPressed,
          text: 'Back',
          imgUrl: 'assets/images/icons/back_arrow.png',
        ),
      ),
      body: PdfPreview(
        build: (format) => _generatePdf(format, 'title'),
      ),
    );
  }

  Future<Uint8List> _generatePdf(PdfPageFormat format, String title) async {
    final pdf = pw.Document(version: PdfVersion.pdf_1_5, compress: true);
    final font = await PdfGoogleFonts.nunitoExtraLight();
    final headerImage = await imageFromAssetBundle('assets/images/library_logo.png');
    print(headerImage);
    pdf.addPage(
      pw.Page(
        pageFormat: format,
        build: (context) {
          return pw.Column(children: [
            pw.Flexible(
              child: pw.Row(crossAxisAlignment: pw.CrossAxisAlignment.start, children: [
                pw.Flexible(
                    flex: 2,
                    child: pw.Column(children: [
                      pw.Center(child: pw.Image(headerImage, height: 30, width: 30)),
                      pw.Text('Library Management System',
                          softWrap: true, style: const pw.TextStyle(fontSize: 24.0))
                    ])),
                pw.SizedBox(width: 20),
                pw.Flexible(
                    child:
                        pw.Column(crossAxisAlignment: pw.CrossAxisAlignment.start, children: [
                  pw.Text('Tel: 0345-1234567'),
                  pw.Text('Mob: 0316-1234567'),
                  pw.Text('Add: Street abc, Karachi Pakistan.'),
                ]))
              ]),
            ),
            pw.Flexible(
              child: pw.Row(
                  mainAxisAlignment: pw.MainAxisAlignment.center,
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                    pw.Flexible(
                        //fit: pw.FlexFit.tight,
                        child: pw.Text('BILL SLIP', style: pw.TextStyle(fontSize: 20))

                        // pw.Container(
                        //     height: 20,
                        //     color: PdfColors.amber,
                        //     child: )
                        )
                  ]),
            ),
            pw.SizedBox(height: 20),
            pw.Flexible(
                child: pw.Row(mainAxisAlignment: pw.MainAxisAlignment.spaceEvenly, children: [
              pw.Flexible(
                  fit: pw.FlexFit.tight,
                  child: pw.Container(
                    decoration: pw.BoxDecoration(
                      border: pw.Border.all(color: PdfColors.black, width: 2.0),
                    ),
                    child:

                        // pw.Row(children: [
                        pw.Column(crossAxisAlignment: pw.CrossAxisAlignment.start, children: [
                      pw.Container(
                          alignment: pw.Alignment.center,
                          width: double.infinity,
                          padding: const pw.EdgeInsets.all(2.0),
                          child: pw.Text('DONNER NAME'),
                          decoration: pw.BoxDecoration(
                              border: pw.Border.all(color: PdfColors.black, width: 2.0),
                              color: PdfColors.grey300)),
                      pw.Flexible(
                        fit: pw.FlexFit.tight,
                        child: pw.Container(
                          padding: const pw.EdgeInsets.all(2.0),
                          child: pw.Text('Mohsin Azeem'),
                          height: 20,
                          // decoration: pw.BoxDecoration(
                          //     border: pw.Border.all(color: PdfColors.black, width: 2.0),
                          //     color: PdfColors.white)
                        ),
                      )
                    ]),
                  )
                  //])
                  ),
              pw.SizedBox(width: 20),
              pw.Flexible(
                  fit: pw.FlexFit.tight,
                  child: pw.Column(children: [
                    pw.Row(mainAxisAlignment: pw.MainAxisAlignment.end, children: [
                      pw.Flexible(
                          fit: pw.FlexFit.tight,
                          child: pw.Container(
                              padding: const pw.EdgeInsets.all(2.0),
                              height: 25,
                              width: 80,
                              child: pw.Text('REF. NO'),
                              decoration: pw.BoxDecoration(
                                border: pw.Border.all(color: PdfColors.black, width: 2.0),
                              ))),
                      pw.Flexible(
                          fit: pw.FlexFit.tight,
                          child: pw.Container(
                              padding: const pw.EdgeInsets.all(2.0),
                              height: 25,
                              child: pw.Text(book.code),
                              decoration: pw.BoxDecoration(
                                border: pw.Border.all(color: PdfColors.black, width: 2.0),
                              ))),
                    ]),
                    pw.Row(mainAxisAlignment: pw.MainAxisAlignment.end, children: [
                      pw.Flexible(
                          fit: pw.FlexFit.tight,
                          child: pw.Container(
                              padding: const pw.EdgeInsets.all(2.0),
                              height: 25,
                              width: 80,
                              child: pw.Text('DATE'),
                              decoration: pw.BoxDecoration(
                                border: pw.Border.all(color: PdfColors.black, width: 2.0),
                              ))),
                      pw.Flexible(
                          fit: pw.FlexFit.tight,
                          child: pw.Container(
                              padding: const pw.EdgeInsets.all(2.0),
                              child: pw.Text(
                                  '${book.stockOn.day}-${book.stockOn.month}-${book.stockOn.year}'),
                              height: 25,
                              decoration: pw.BoxDecoration(
                                border: pw.Border.all(color: PdfColors.black, width: 2.0),
                              ))),
                    ]),
                    pw.Row(mainAxisAlignment: pw.MainAxisAlignment.end, children: [
                      pw.Flexible(
                          fit: pw.FlexFit.tight,
                          child: pw.Container(
                              padding: const pw.EdgeInsets.all(2.0),
                              height: 25,
                              width: 80,
                              child: pw.Text('Time'),
                              decoration: pw.BoxDecoration(
                                border: pw.Border.all(color: PdfColors.black, width: 2.0),
                              ))),
                      pw.Flexible(
                          fit: pw.FlexFit.tight,
                          child: pw.Container(
                              padding: const pw.EdgeInsets.all(2.0),
                              child: pw.Text(
                                  '${DateTime.now().hour}: ${DateTime.now().minute}:${DateTime.now().second}'),
                              height: 25,
                              decoration: pw.BoxDecoration(
                                border: pw.Border.all(color: PdfColors.black, width: 2.0),
                              ))),
                    ]),
                    pw.Row(mainAxisAlignment: pw.MainAxisAlignment.end, children: [
                      pw.Flexible(
                          child: pw.Container(
                              padding: const pw.EdgeInsets.all(2.0),
                              height: 25,
                              width: 80,
                              child: pw.Text('User'),
                              decoration: pw.BoxDecoration(
                                border: pw.Border.all(color: PdfColors.black, width: 2.0),
                              ))),
                      pw.Flexible(
                          child: pw.Container(
                              child: pw.Text('Mohsin'),
                              height: 25,
                              decoration: pw.BoxDecoration(
                                border: pw.Border.all(color: PdfColors.black, width: 2.0),
                              ))),
                    ]),
                  ]))
            ])),
            pw.SizedBox(height: 20),
            pw.Flexible(
                flex: 3,
                child: pw.Container(
                  child: pw.Table(
                      border: pw.TableBorder.all(color: PdfColors.black, width: 2.0),
                      children: [
                        pw.TableRow(children: [
                          pw.Container(
                              color: PdfColors.grey400,
                              alignment: pw.Alignment.center,
                              child: pw.Text('SR')),
                          pw.Container(
                            color: PdfColors.grey400,
                            width: 120,
                            alignment: pw.Alignment.center,
                            child: pw.Text('TITLE'),
                          ),
                          pw.Container(
                            color: PdfColors.grey400,
                            alignment: pw.Alignment.center,
                            child: pw.Text('AUTHOR'),
                          ),
                          pw.Container(
                            color: PdfColors.grey400,
                            alignment: pw.Alignment.center,
                            child: pw.Text('PUBLISHER'),
                          ),
                          pw.Container(
                            color: PdfColors.grey400,
                            alignment: pw.Alignment.center,
                            child: pw.Text('PUBLISH YEAR'),
                          ),
                          pw.Container(
                            color: PdfColors.grey400,
                            alignment: pw.Alignment.center,
                          ),
                        ]),
                        pw.TableRow(children: [
                          pw.Container(alignment: pw.Alignment.center, child: pw.Text('01')),
                          pw.Container(
                            width: 120,
                            alignment: pw.Alignment.center,
                            child: pw.Text('${book.title}'),
                          ),
                          pw.Container(
                            alignment: pw.Alignment.center,
                            child: pw.Text('${book.author}'),
                          ),
                          pw.Container(
                            alignment: pw.Alignment.center,
                            child: pw.Text('${book.publisher}'),
                          ),
                          pw.Container(
                            alignment: pw.Alignment.center,
                            child: pw.Text('${book.publishYear}'),
                          ),
                          pw.Container(
                            alignment: pw.Alignment.center,
                          ),
                        ])
                      ]),
                )),
            pw.SizedBox(height: 20),
            pw.Flexible(
                child: pw.Row(mainAxisAlignment: pw.MainAxisAlignment.spaceEvenly, children: [
              pw.Flexible(
                  fit: pw.FlexFit.tight,
                  child: pw.Column(children: [
                    pw.Row(mainAxisAlignment: pw.MainAxisAlignment.end, children: [
                      pw.Flexible(
                          fit: pw.FlexFit.tight,
                          child: pw.Container(
                              padding: const pw.EdgeInsets.all(2.0),
                              height: 25,
                              width: 150,
                              child: pw.Text('Condition'),
                              decoration: pw.BoxDecoration(
                                border: pw.Border.all(color: PdfColors.black, width: 2.0),
                              ))),
                      pw.Flexible(
                          fit: pw.FlexFit.tight,
                          child: pw.Container(
                              child: pw.Text('${book.condition}'),
                              height: 25,
                              decoration: pw.BoxDecoration(
                                border: pw.Border.all(color: PdfColors.black, width: 2.0),
                              ))),
                    ]),
                  ])),
              pw.SizedBox(width: 20),
              pw.Flexible(
                fit: pw.FlexFit.tight,
                child: pw.Container(
                    // padding: const pw.EdgeInsets.all(2.0),
                    child: pw.Column(children: [
                      pw.Container(
                          alignment: pw.Alignment.center,
                          width: double.infinity,
                          padding: const pw.EdgeInsets.all(2.0),
                          child: pw.Text("RECEIVER'S SIGNATURE"),
                          decoration: pw.BoxDecoration(
                              border: pw.Border.all(color: PdfColors.black, width: 2.0),
                              color: PdfColors.grey300)),
                      pw.Flexible(fit: pw.FlexFit.tight, child: pw.Container())
                    ]),
                    decoration: pw.BoxDecoration(
                      border: pw.Border.all(color: PdfColors.black, width: 2.0),
                    )),
              ),
            ])),
          ]);
        },
      ),
    );

    return pdf.save();
  }
}
