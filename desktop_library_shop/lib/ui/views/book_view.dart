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
                            Expanded(
                              child: AppTextFormField(
                                  width: 150,
                                  height: 55,
                                  current: _bookIdFocus,
                                  next: _barCodeIdFocus,
                                  validationMsg: 'Book Id not found'),
                            ),
                            UIUtil.hSmallSpace(),
                            AppTextLabel('Barcode ID'),
                            UIUtil.hXSmallSpace(),
                            Expanded(
                              child: AppTextFormField(
                                  width: 150,
                                  height: 55,
                                  current: _barCodeIdFocus,
                                  next: _referenceNoFocus,
                                  validationMsg: 'Please type barcode number'),
                            ),
                            UIUtil.hSmallSpace(),
                            AppTextLabel('Reference No.'),
                            UIUtil.hXSmallSpace(),
                            Expanded(
                              child: AppTextFormField(
                                  width: 150,
                                  height: 55,
                                  current: _referenceNoFocus,
                                  next: _bookTitleFocus,
                                  validationMsg: 'Please type reference number'),
                            ),
                            UIUtil.hSmallSpace(),
                            AppTextLabel('Book Title'),
                            UIUtil.hXSmallSpace(),
                            Expanded(
                              child: AppTextFormField(
                                  width: 150,
                                  height: 55,
                                  current: _bookTitleFocus,
                                  next: _bookIdFocus,
                                  validationMsg: 'Please type book title'),
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
