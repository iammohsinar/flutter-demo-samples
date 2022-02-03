import 'dart:io';
import 'package:desktop_library_shop/app_router.dart';
import 'package:desktop_library_shop/core/models/user.dart';
import 'package:desktop_library_shop/core/services/user_dao.dart';
import 'package:desktop_library_shop/locator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:window_size/window_size.dart';

import 'dart:typed_data';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

void main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
  //   setWindowTitle('App title');
  //   //Size s = await getWindowMaxSize();

  //   setWindowMinSize(const Size(1000, 1000));
  //   setWindowMaxSize(Size.infinite);
  // }
  setup();
  runApp(LibraryShopApp());
}

class LibraryShopApp extends StatelessWidget {
  const LibraryShopApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>(
      create: (context) => loc<UserDao>().userController.stream,
      initialData: User.initial(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Library Shop',
        theme: ThemeData(
            backgroundColor: const Color(0xFFF7F5ee),
            textTheme: const TextTheme(headline4: TextStyle(color: Colors.black))),
        initialRoute: 'login',
        onGenerateRoute: AppRouter.generateRoute,
      ),
    );
  }
}

// import 'package:flutter/material.dart';

// Future<void> main() async {
//   runApp(const MyApp('Printing Demo'));
// }

class MyApp extends StatelessWidget {
  const MyApp(this.title, {Key? key}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: null,
        body: PdfPreview(
          build: (format) => _generatePdf(format, title),
        ),
      ),
    );
  }

  // void _showDialog(BuildContext context, String message, imageName) {
  //   showDialog<void>(
  //       barrierDismissible: false,
  //       context: context,
  //       builder: (context) {
  //         return Scaffold(
  //           appBar: null,
  //           body: Text(message),
  //         );
  //         // AlertDialog(
  //         //   content: SingleChildScrollView(
  //         //     child: Container(
  //         //         width: 300,
  //         //         height: 400,
  //         //         child: PdfPreview(
  //         //           build: (format) => _generatePdf(format, title),
  //         //         )),
  //         //   ),
  //         //   actions: <Widget>[
  //         //     OutlinedButton(
  //         //         onPressed: () {
  //         //           Navigator.of(context).pop();
  //         //         },
  //         //         child: const Text(
  //         //           'OK',
  //         //           style: TextStyle(color: Color(0xFF6e4875)),
  //         //         )),
  //         //   ],
  //         // );
  //       });
  // }

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
                          child: pw.Text('DONNER NAME'),
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
                          child: pw.Container(
                              padding: const pw.EdgeInsets.all(2.0),
                              height: 25,
                              width: 80,
                              child: pw.Text('REF. NO'),
                              decoration: pw.BoxDecoration(
                                border: pw.Border.all(color: PdfColors.black, width: 2.0),
                              ))),
                      pw.Flexible(
                          child: pw.Container(
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
                              child: pw.Text('DATE'),
                              decoration: pw.BoxDecoration(
                                border: pw.Border.all(color: PdfColors.black, width: 2.0),
                              ))),
                      pw.Flexible(
                          child: pw.Container(
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
                              child: pw.Text('INV. NO.'),
                              decoration: pw.BoxDecoration(
                                border: pw.Border.all(color: PdfColors.black, width: 2.0),
                              ))),
                      pw.Flexible(
                          child: pw.Container(
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
                              child: pw.Text('PAGE'),
                              decoration: pw.BoxDecoration(
                                border: pw.Border.all(color: PdfColors.black, width: 2.0),
                              ))),
                      pw.Flexible(
                          child: pw.Container(
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
                  color: PdfColors.grey400,
                  child: pw.Table(
                      border: pw.TableBorder.all(color: PdfColors.black, width: 2.0),
                      children: [
                        pw.TableRow(children: [
                          pw.Container(alignment: pw.Alignment.center, child: pw.Text('SR')),
                          pw.Container(
                            width: 120,
                            alignment: pw.Alignment.center,
                            child: pw.Text('TITLE'),
                          ),
                          pw.Container(
                            alignment: pw.Alignment.center,
                            child: pw.Text('AUTHOR'),
                          ),
                          pw.Container(
                            alignment: pw.Alignment.center,
                            child: pw.Text('PUBLISHER'),
                          ),
                          pw.Container(
                            alignment: pw.Alignment.center,
                            child: pw.Text('PUBLISH YEAR'),
                          ),
                          pw.Container(
                            alignment: pw.Alignment.center,
                          ),
                        ]),
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
                          child: pw.Container(
                              padding: const pw.EdgeInsets.all(2.0),
                              height: 25,
                              width: 150,
                              child: pw.Text('TOTAL AMOUNT'),
                              decoration: pw.BoxDecoration(
                                border: pw.Border.all(color: PdfColors.black, width: 2.0),
                              ))),
                      pw.Flexible(
                          child: pw.Container(
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
                              width: 150,
                              child: pw.Text('DISCOUNT'),
                              decoration: pw.BoxDecoration(
                                border: pw.Border.all(color: PdfColors.black, width: 2.0),
                              ))),
                      pw.Flexible(
                          child: pw.Container(
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
                              width: 150,
                              child: pw.Text('FINAL AMOUNT'),
                              decoration: pw.BoxDecoration(
                                border: pw.Border.all(color: PdfColors.black, width: 2.0),
                              ))),
                      pw.Flexible(
                          child: pw.Container(
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

                // pw.Row(mainAxisAlignment: pw.MainAxisAlignment.end, children: [
                //   pw.Column(children: [
                //     // pw.Flexible(
                //     //   child:
                //     pw.Container(
                //         padding: const pw.EdgeInsets.all(2.0),
                //         child: pw.Text("RECEIVER'S SIGNATURE"),
                //         decoration: pw.BoxDecoration(
                //             border: pw.Border.all(color: PdfColors.black, width: 2.0),
                //             color: PdfColors.grey300)),
                //     //),
                //     pw.Flexible(
                //       fit: pw.FlexFit.tight,
                //       child:
                //           //  pw.Row(children: [
                //           pw.Container(
                //               padding: const pw.EdgeInsets.all(2.0),
                //               height: 20,
                //               //width: 100,
                //               decoration: pw.BoxDecoration(
                //                   border: pw.Border.all(color: PdfColors.black, width: 2.0),
                //                   color: PdfColors.white)),
                //     )
                //   ])
                //   //  )
                // ]),
                //])
              ),
            ])),
          ]);

          // pw.Column(
          //   children: [
          //     pw.SizedBox(
          //       width: double.infinity,
          //       child: pw.FittedBox(
          //         child: pw.Text(title, style: pw.TextStyle(font: font)),
          //       ),
          //     ),
          //     pw.SizedBox(height: 20),
          //     pw.Flexible(child: pw.FlutterLogo())
          //   ],
          // );
        },
      ),
    );

    return pdf.save();
  }
}

class PrintPdf extends StatelessWidget {
  const PrintPdf({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ElevatedButton(
        onPressed: () async {
          final pdf = pw.Document(version: PdfVersion.pdf_1_5, compress: true);
          final font = await PdfGoogleFonts.nunitoExtraLight();

          pdf.addPage(
            pw.Page(
              pageFormat: PdfPageFormat.a4,
              build: (context) {
                return pw.Column(
                  children: [
                    pw.SizedBox(
                      width: double.infinity,
                      child: pw.FittedBox(
                        child: pw.Text('hello pdf', style: pw.TextStyle(font: font)),
                      ),
                    ),
                    pw.SizedBox(height: 20),
                    pw.Flexible(child: pw.FlutterLogo())
                  ],
                );
              },
            ),
          );
        },
        child: Text('print'),
      ),
    );
  }
}
