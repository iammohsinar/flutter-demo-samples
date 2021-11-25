import 'package:desktop_library_shop/ui/util/app_color.dart';
import 'package:desktop_library_shop/ui/util/ui_util.dart';
import 'package:desktop_library_shop/ui/widgets/app_panel.dart';
import 'package:desktop_library_shop/ui/widgets/app_tab.dart';
import 'package:desktop_library_shop/ui/widgets/app_text.dart';
import 'package:desktop_library_shop/ui/widgets/app_textformfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BookView extends StatefulWidget {
  const BookView({Key? key}) : super(key: key);

  @override
  _BookViewState createState() => _BookViewState();
}

class _BookViewState extends State<BookView> {
  late FocusNode _bookIdFocus;

  late FocusNode _barCodeIdFocus;
  late FocusNode _referenceNoFocus;
  late FocusNode _bookTitleFocus;

  @override
  void initState() {
    _bookIdFocus = FocusNode();
    _barCodeIdFocus = FocusNode();
    _referenceNoFocus = FocusNode();
    _bookTitleFocus = FocusNode();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
            child: Container(
                padding: const EdgeInsets.all(20),
                child: AppPanel(
                  child: Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AppTextLabel('Book ID'),
                            UIUtil.hXSmallSpace(),
                            Flexible(
                              flex: 3,
                              child: AppTextFormField(
                                  maxLength: 6,
                                  icon: Icons.book,
                                  width: 100,
                                  height: 45,
                                  current: _bookIdFocus,
                                  next: _barCodeIdFocus,
                                  validationMsg: 'Book Id not found'),
                            ),
                            UIUtil.hSmallSpace(),
                            AppTextLabel('Barcode ID'),
                            UIUtil.hXSmallSpace(),
                            Flexible(
                              flex: 5,
                              child: AppTextFormField(
                                  maxLength: 15,
                                  icon: Icons.qr_code,
                                  width: 190,
                                  height: 45,
                                  current: _barCodeIdFocus,
                                  next: _referenceNoFocus,
                                  validationMsg: 'Please type barcode number'),
                            ),
                            UIUtil.hSmallSpace(),
                            AppTextLabel('Reference No.'),
                            UIUtil.hXSmallSpace(),
                            Flexible(
                              flex: 5,
                              child: AppTextFormField(
                                  maxLength: 15,
                                  icon: Icons.library_books,
                                  width: 190,
                                  height: 45,
                                  current: _referenceNoFocus,
                                  next: _bookTitleFocus,
                                  validationMsg: 'Please type reference number'),
                            ),
                            UIUtil.hSmallSpace(),
                            AppTextLabel('Book Title'),
                            UIUtil.hXSmallSpace(),
                            Flexible(
                                fit: FlexFit.tight,
                                flex: 12,
                                child: Container(
                                  padding: EdgeInsets.only(top: 00),
                                  color: Colors.red,
                                  //  height: 45,
                                  child: TextFormField(
                                    minLines: 1,
                                    decoration: InputDecoration(
                                        fillColor: Colors.amber,
                                        filled: true,
                                        counterText: ' ',
                                        prefixIcon: Container(
                                            // padding: const EdgeInsets.all(0.0),
                                            // child: Icon(
                                            //   Icons.person,
                                            //   size: 14.0,
                                            // ), // myIcon is a 48px-wide widget.
                                            ),
                                        isDense: true,
                                        contentPadding: EdgeInsets.only(
                                          top: 10,
                                        ),
                                        focusedBorder: const OutlineInputBorder(
                                            borderSide:
                                                BorderSide(color: borderColor, width: 0.8)),
                                        focusedErrorBorder: const OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: errorBorderColor, width: 0.8)),
                                        errorBorder: const OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: errorBorderColor, width: 0.8)),
                                        enabledBorder: const OutlineInputBorder(
                                            borderSide:
                                                BorderSide(color: borderColor, width: 0.8))),
                                  ),
                                )
                                // AppTextFormField(
                                //     icon: Icons.title,
                                //     //width: 10,
                                //     //height: 45,
                                //     current: _bookTitleFocus,
                                //     next: _bookIdFocus,
                                //     validationMsg: 'Please type book title'),
                                )
                          ],
                        )
                      ],
                    ),
                  ),
                  title: 'New Book',
                  headerColor: const Color(0xFF001D74),
                  bodyColor: Colors.white,
                ))),
        Expanded(
            flex: 2,
            child: Container(
                padding: const EdgeInsets.all(20),
                child: AppPanel(
                  child: Container(),
                  title: 'Book Details',
                  headerColor: const Color(0xFF001D74),
                  bodyColor: Colors.white,
                ))),
      ],
    );
  }
}
