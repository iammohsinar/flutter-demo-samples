import 'package:desktop_library_shop/ui/util/app_color.dart';
import 'package:desktop_library_shop/ui/util/ui_util.dart';
import 'package:desktop_library_shop/ui/widgets/app_button.dart';
import 'package:desktop_library_shop/ui/widgets/app_panel.dart';
import 'package:desktop_library_shop/ui/widgets/app_tab.dart';
import 'package:desktop_library_shop/ui/widgets/app_text.dart';
import 'package:desktop_library_shop/ui/widgets/app_textformfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

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
  late FocusNode _addBtnFocus;
  late FocusNode _updateBtnFocus;
  late FocusNode _cancelBtnFocus;

  @override
  void initState() {
    _bookIdFocus = FocusNode();
    _barCodeIdFocus = FocusNode();
    _referenceNoFocus = FocusNode();
    _bookTitleFocus = FocusNode();
    _addBtnFocus = FocusNode();
    _updateBtnFocus = FocusNode();
    _cancelBtnFocus = FocusNode();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
            flex: 2,
            child: Container(
                padding: const EdgeInsets.all(20),
                child: AppPanel(
                  child: Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Expanded(
                                child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                AppTextLabel('Book ID'),
                                UIUtil.hXSmallSpace(),
                                Flexible(
                                  child: AppTextFormField(
                                      maxLength: 6,
                                      //icon: Icons.book,
                                      // width: 100,
                                      isEnable: false,
                                      height: 45,
                                      current: _bookIdFocus,
                                      next: _barCodeIdFocus,
                                      validationMsg: 'Book Id not found'),
                                ),
                                UIUtil.hSmallSpace(),
                                AppTextLabel('Barcode ID'),
                                UIUtil.hXSmallSpace(),
                                Flexible(
                                  flex: 2,
                                  child: AppTextFormField(
                                      maxLength: 20,
                                      //icon: Icons.qr_code,
                                      // width: 190,
                                      height: 45,
                                      current: _barCodeIdFocus,
                                      next: _referenceNoFocus,
                                      validationMsg: 'Please type barcode number'),
                                ),
                                UIUtil.hSmallSpace(),
                                AppTextLabel('Reference No.'),
                                UIUtil.hXSmallSpace(),
                                Flexible(
                                  flex: 2,
                                  child: AppTextFormField(
                                      maxLength: 20,
                                      //icon: Icons.library_books,
                                      //width: 190,
                                      height: 45,
                                      current: _referenceNoFocus,
                                      next: _bookTitleFocus,
                                      validationMsg: 'Please type reference number'),
                                ),
                                UIUtil.hSmallSpace(),
                              ],
                            )),
                            Expanded(
                                //flex: 2,
                                child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                AppTextLabel('Book Title'),
                                UIUtil.hXSmallSpace(),
                                Flexible(
                                    flex: 10,
                                    fit: FlexFit.tight,
                                    child: AppTextFormField(
                                        maxLength: 100,
                                        //icon: Icons.library_books,
                                        // width: 190,
                                        height: 45,
                                        current: _bookTitleFocus,
                                        next: _bookIdFocus,
                                        validationMsg: 'Please type reference number'))
                              ],
                            )),
                          ],
                        ),
                        Row(
                          children: [
                            // Expanded(
                            //     child: Column(
                            //   mainAxisAlignment: MainAxisAlignment.start,
                            //   children: [
                            //     Row(
                            //       crossAxisAlignment: CrossAxisAlignment.start,
                            //       children: [
                            //         // UIUtil.hSmallSpace(),
                            //         // AppTextLabel('Book Title'),
                            //         // UIUtil.hXSmallSpace(),
                            //         // Flexible(
                            //         //     flex: 10,
                            //         //     fit: FlexFit.tight,
                            //         //     child: AppTextFormField(
                            //         //         maxLength: 100,
                            //         //         //icon: Icons.library_books,
                            //         //         // width: 190,
                            //         //         height: 45,
                            //         //         current: _bookTitleFocus,
                            //         //         next: _bookIdFocus,
                            //         //         validationMsg: 'Please type reference number'))
                            //       ],
                            //     )
                            //   ],
                            // )),
                            Expanded(
                                // flex: 2,
                                child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                AppTextLabel('Category'),
                                UIUtil.hXSmallSpace(),
                                Flexible(
                                  child: AppDropDown(),
                                ),
                                UIUtil.hSmallSpace(),
                                AppTextLabel('Author'),
                                UIUtil.hXSmallSpace(),
                                Flexible(
                                  child: AppDropDown(),
                                ),
                                UIUtil.hSmallSpace(),
                                AppTextLabel('Publisher'),
                                UIUtil.hXSmallSpace(),
                                Flexible(
                                  child: AppDropDown(),
                                ),
                                UIUtil.hSmallSpace(),
                              ],
                            )),
                            // Expanded(
                            //     child: Column(
                            //   children: [
                            //     Row(
                            //       crossAxisAlignment: CrossAxisAlignment.start,
                            //       children: [],
                            //     )
                            //   ],
                            // )),
                            Expanded(
                              //flex: 2,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  AppTextLabel('Publish year'),
                                  UIUtil.hXSmallSpace(),
                                  Flexible(
                                    child: AppTextFormField(
                                        maxLength: 20,
                                        //icon: Icons.library_books,
                                        //width: 190,
                                        height: 45,
                                        current: _referenceNoFocus,
                                        next: _bookTitleFocus,
                                        validationMsg: 'Please type reference number'),
                                  ),
                                  UIUtil.hSmallSpace(),
                                  AppTextLabel('Total Copies ?'),
                                  UIUtil.hXSmallSpace(),
                                  Flexible(
                                      fit: FlexFit.tight,
                                      child: AppTextFormField(
                                          maxLength: 100,
                                          //icon: Icons.library_books,
                                          // width: 190,
                                          height: 45,
                                          current: _bookTitleFocus,
                                          next: _bookIdFocus,
                                          validationMsg: 'Please type reference number')),

                                  UIUtil.hSmallSpace(),
                                  AppTextLabel('Language'),
                                  UIUtil.hXSmallSpace(),
                                  Flexible(
                                      flex: 2,
                                      child: AppTextFormField(
                                          maxLength: 100,
                                          //icon: Icons.library_books,
                                          // width: 190,
                                          height: 45,
                                          current: _bookTitleFocus,
                                          next: _bookIdFocus,
                                          validationMsg: 'Please type reference number')),
                                  UIUtil.hSmallSpace(),
                                  AppTextLabel('Description'),
                                  UIUtil.hXSmallSpace(),
                                  Flexible(
                                      flex: 4,
                                      child:

                                          // TextFormField(
                                          //   minLines: 1,
                                          //   decoration: InputDecoration(
                                          //       isDense: true,
                                          //       counterText: ' ',
                                          //       //  prefixIcon: (icon != null) ? Icon(icon) : null, //icon ?? Icon(icon),
                                          //       // enabled: isEnable,
                                          //       contentPadding: const EdgeInsets.only(
                                          //           top: 15,
                                          //           left: 10), //const EdgeInsets.all(10.0),,
                                          //       // fillColor: (isEnable) ? fieldActiveColor : fieldFocusColor,
                                          //       filled: true,
                                          //       border: const OutlineInputBorder(
                                          //           borderSide: BorderSide(
                                          //               color: Colors.black, width: 0.8)),
                                          //       focusedBorder: const OutlineInputBorder(
                                          //           borderSide: BorderSide(
                                          //               color: borderColor, width: 0.8)),
                                          //       focusedErrorBorder: const OutlineInputBorder(
                                          //           borderSide: BorderSide(
                                          //               color: errorBorderColor, width: 0.8)),
                                          //       errorBorder: const OutlineInputBorder(
                                          //           borderSide: BorderSide(
                                          //               color: errorBorderColor, width: 0.8)),
                                          //       enabledBorder: const OutlineInputBorder(
                                          //           borderSide: BorderSide(
                                          //               color: borderColor, width: 0.8))),
                                          //   maxLines: 4,
                                          // )
                                          AppTextFormField(
                                              maxLines: 5,
                                              //maxLength: 100,
                                              //icon: Icons.library_books,
                                              // width: 190,
                                              height: 100,
                                              current: _bookTitleFocus,
                                              next: _bookIdFocus,
                                              validationMsg: 'Please type reference number')),
                                  // UIUtil.hSmallSpace(),
                                  // AppTextLabel('Book Title'),
                                  // UIUtil.hXSmallSpace(),
                                  // Flexible(
                                  //     flex: 10,
                                  //     fit: FlexFit.tight,
                                  //     child: AppTextFormField(
                                  //         maxLength: 100,
                                  //         //icon: Icons.library_books,
                                  //         // width: 190,
                                  //         height: 45,
                                  //         current: _bookTitleFocus,
                                  //         next: _bookIdFocus,
                                  //         validationMsg: 'Please type reference number'))
                                ],
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Row(
                                children: [
// add/update/cancel buttons
                                  AppElevatedBtn(
                                      imgUrl: 'assets/images/icons/save.png',
                                      focusNode: _addBtnFocus,
                                      isEnable: true,
                                      onPressedFn: () {
                                        _addBtnFocus.unfocus();
                                        FocusScope.of(context).requestFocus(_barCodeIdFocus);
                                      },
                                      text: 'Save')
                                ],
                              ),
                            ),
                            Expanded(
                              child: Row(
                                children: [
                                  // print
                                ],
                              ),
                            )
                          ],
                        )
                        // Row(
                        //     mainAxisAlignment: MainAxisAlignment.start,
                        //     crossAxisAlignment: CrossAxisAlignment.start,
                        //     children: [
                        //       AppTextLabel('Book ID'),
                        //       UIUtil.hXSmallSpace(),
                        //       Flexible(
                        //         flex: 1,
                        //         child: AppTextFormField(
                        //             maxLength: 6,
                        //             //icon: Icons.book,
                        //             // width: 100,
                        //             isEnable: false,
                        //             height: 45,
                        //             current: _bookIdFocus,
                        //             next: _barCodeIdFocus,
                        //             validationMsg: 'Book Id not found'),
                        //       ),
                        //       UIUtil.hSmallSpace(),
                        //       AppTextLabel('Barcode ID'),
                        //       UIUtil.hXSmallSpace(),
                        //       Flexible(
                        //         flex: 2,
                        //         child: AppTextFormField(
                        //             maxLength: 20,
                        //             //icon: Icons.qr_code,
                        //             // width: 190,
                        //             height: 45,
                        //             current: _barCodeIdFocus,
                        //             next: _referenceNoFocus,
                        //             validationMsg: 'Please type barcode number'),
                        //       ),
                        //       UIUtil.hSmallSpace(),
                        //       AppTextLabel('Reference No.'),
                        //       UIUtil.hXSmallSpace(),
                        //       Flexible(
                        //         flex: 2,
                        //         child: AppTextFormField(
                        //             maxLength: 20,
                        //             //icon: Icons.library_books,
                        //             //width: 190,
                        //             height: 45,
                        //             current: _referenceNoFocus,
                        //             next: _bookTitleFocus,
                        //             validationMsg: 'Please type reference number'),
                        //       ),
                        //       UIUtil.hSmallSpace(),
                        //       AppTextLabel('Book Title'),
                        //       UIUtil.hXSmallSpace(),
                        //       Flexible(
                        //           flex: 10,
                        //           fit: FlexFit.tight,
                        //           child: AppTextFormField(
                        //               maxLength: 100,
                        //               //icon: Icons.library_books,
                        //               // width: 190,
                        //               height: 45,
                        //               current: _bookTitleFocus,
                        //               next: _bookIdFocus,
                        //               validationMsg: 'Please type reference number'))
                        //     ]),
                        // Row(
                        //     mainAxisAlignment: MainAxisAlignment.start,
                        //     crossAxisAlignment: CrossAxisAlignment.start,
                        //     children: [
                        //       AppTextLabel('Book Category'),
                        //       UIUtil.hXSmallSpace(),
                        //       Flexible(
                        //         flex: 1,
                        //         child: AppDropDown(),
                        //       ),
                        //       UIUtil.hSmallSpace(),
                        //       AppTextLabel('Barcode ID'),
                        //       UIUtil.hXSmallSpace(),
                        //       Flexible(
                        //         flex: 2,
                        //         child: AppTextFormField(
                        //             maxLength: 20,
                        //             //icon: Icons.qr_code,
                        //             // width: 190,
                        //             height: 45,
                        //             current: _barCodeIdFocus,
                        //             next: _referenceNoFocus,
                        //             validationMsg: 'Please type barcode number'),
                        //       ),
                        //       UIUtil.hSmallSpace(),
                        //       AppTextLabel('Reference No.'),
                        //       UIUtil.hXSmallSpace(),
                        //       Flexible(
                        //         flex: 2,
                        //         child: AppTextFormField(
                        //             maxLength: 20,
                        //             //icon: Icons.library_books,
                        //             //width: 190,
                        //             height: 45,
                        //             current: _referenceNoFocus,
                        //             next: _bookTitleFocus,
                        //             validationMsg: 'Please type reference number'),
                        //       ),
                        //       UIUtil.hSmallSpace(),
                        //       AppTextLabel('Book Title'),
                        //       UIUtil.hXSmallSpace(),
                        //       Flexible(
                        //           flex: 10,
                        //           fit: FlexFit.tight,
                        //           child: AppTextFormField(
                        //               maxLength: 100,
                        //               //icon: Icons.library_books,
                        //               // width: 190,
                        //               height: 45,
                        //               current: _bookTitleFocus,
                        //               next: _bookIdFocus,
                        //               validationMsg: 'Please type reference number'))
                        //     ])
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
