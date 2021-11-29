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
  late FocusNode _bookIdFocus,
      _barCodeIdFocus,
      _referenceNoFocus,
      _bookTitleFocus,
      _categoryFocus,
      _authorFocus,
      _publisherFocus,
      _publishYearFocus,
      _totalCopiesFocus,
      _languageFocus,
      _descriptionFocus,
      _addBtnFocus,
      _updateBtnFocus,
      _cancelBtnFocus,
      _printBtnFocus;

  @override
  void initState() {
    _bookIdFocus = FocusNode();
    _barCodeIdFocus = FocusNode();
    _referenceNoFocus = FocusNode();
    _bookTitleFocus = FocusNode();

    _categoryFocus = FocusNode();
    _authorFocus = FocusNode();
    _publisherFocus = FocusNode();
    _publishYearFocus = FocusNode();
    _totalCopiesFocus = FocusNode();
    _languageFocus = FocusNode();
    _descriptionFocus = FocusNode();

    _addBtnFocus = FocusNode();
    _updateBtnFocus = FocusNode();
    _cancelBtnFocus = FocusNode();
    _printBtnFocus = FocusNode();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
            padding: const EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 0),
            child: AppPanel(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                          child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const AppTextLabel('Book ID'),
                          UIUtil.hXSmallSpace(),
                          Flexible(
                            child: AppTextFormField(
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Book Id not found';
                                }
                                return null;
                              },
                              maxLength: 6,
                              isEnable: false,
                              height: 45,
                              current: _bookIdFocus,
                              next: _barCodeIdFocus,
                            ),
                          ),
                          UIUtil.hSmallSpace(),
                          const AppTextLabel('Barcode ID'),
                          UIUtil.hXSmallSpace(),
                          Flexible(
                            flex: 2,
                            child: AppTextFormField(
                              maxLength: 20,
                              height: 45,
                              current: _barCodeIdFocus,
                              next: _referenceNoFocus,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Please type barcode number';
                                }
                                return null;
                              },
                            ),
                          ),
                          UIUtil.hSmallSpace(),
                          AppTextLabel('Reference No.'),
                          UIUtil.hXSmallSpace(),
                          Flexible(
                            flex: 2,
                            child: AppTextFormField(
                              maxLength: 20,
                              height: 45,
                              current: _referenceNoFocus,
                              next: _bookTitleFocus,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Please type reference number';
                                }
                                return null;
                              },
                            ),
                          ),
                          UIUtil.hSmallSpace(),
                        ],
                      )),
                      Expanded(
                          //flex: 2,
                          child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const AppTextLabel('Book Title'),
                          UIUtil.hXSmallSpace(),
                          Flexible(
                              child: AppTextFormField(
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please type Book title';
                              }
                              return null;
                            },
                            maxLength: 100,
                            height: 45,
                            current: _bookTitleFocus,
                            next: _categoryFocus,
                          ))
                        ],
                      )),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                          child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppTextLabel('Category'),
                          UIUtil.hXSmallSpace(),
                          Flexible(
                            child: BookCategory(
                              currentFocus: _categoryFocus,
                              nextFocus: _authorFocus,
                            ),
                          ),
                          UIUtil.hSmallSpace(),
                          AppTextLabel('Author'),
                          UIUtil.hXSmallSpace(),
                          Flexible(
                            child: BookAuthor(
                              currentFocus: _authorFocus,
                              nextFocus: _publisherFocus,
                            ),
                          ),
                          UIUtil.hSmallSpace(),
                          AppTextLabel('Publisher'),
                          UIUtil.hXSmallSpace(),
                          Flexible(
                            child: BookPublisher(
                              currentFocus: _publisherFocus,
                              nextFocus: _publishYearFocus,
                            ),
                          ),
                          UIUtil.hSmallSpace(),
                        ],
                      )),
                      Expanded(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AppTextLabel('Publish year'),
                            UIUtil.hXSmallSpace(),
                            Flexible(
                              child: AppTextFormField(
                                maxLength: 4,
                                height: 45,
                                current: _publishYearFocus,
                                next: _totalCopiesFocus,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Please type publish year';
                                  }
                                  return null;
                                },
                              ),
                            ),
                            UIUtil.hSmallSpace(),
                            AppTextLabel('Total Copies ?'),
                            UIUtil.hXSmallSpace(),
                            Flexible(
                                fit: FlexFit.tight,
                                child: AppTextFormField(
                                  maxLength: 100,
                                  height: 45,
                                  current: _totalCopiesFocus,
                                  next: _languageFocus,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Please type total copies';
                                    }
                                    return null;
                                  },
                                )),
                            UIUtil.hSmallSpace(),
                            AppTextLabel('Language'),
                            UIUtil.hXSmallSpace(),
                            Flexible(
                                flex: 2,
                                child: AppTextFormField(
                                  maxLength: 100,
                                  height: 45,
                                  current: _languageFocus,
                                  next: _addBtnFocus,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Please type language';
                                    }
                                    return null;
                                  },
                                )),
                            UIUtil.hSmallSpace(),
                            AppTextLabel('Description'),
                            UIUtil.hXSmallSpace(),
                            Flexible(
                                flex: 4,
                                child: AppTextFormField(
                                  maxLines: 5,
                                  maxLength: 100,
                                  current: _descriptionFocus,
                                  next: null,
                                )),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
// add/update/cancel buttons
                      AppElevatedBtn(
                          width: 80.0,
                          imgUrl: 'assets/images/icons/save.png',
                          focusNode: _addBtnFocus,
                          isEnable: true,
                          onPressedFn: () {
                            _addBtnFocus.unfocus();
                            FocusScope.of(context).requestFocus(_barCodeIdFocus);
                          },
                          text: 'Save'),
                      UIUtil.hSmallSpace(),
                      AppElevatedBtn(
                          width: 80.0,
                          imgUrl: 'assets/images/icons/cancel.png',
                          focusNode: _cancelBtnFocus,
                          isEnable: true,
                          onPressedFn: () {},
                          text: 'Cancel'),
                      UIUtil.hSmallSpace(),
                      AppElevatedBtn(
                          width: 80.0,
                          imgUrl: 'assets/images/icons/printer.png',
                          focusNode: _printBtnFocus,
                          isEnable: true,
                          onPressedFn: () {},
                          text: 'Print')
                    ],
                  )
                ],
              ),
              title: 'New Book',
              headerColor: const Color(0xFF001D74),
              bodyColor: Colors.white,
            )),
        Padding(
            padding: const EdgeInsets.all(20),
            child: AppPanel(
              child: Container(
                height: 100,
              ),
              title: 'Book Details',
              headerColor: const Color(0xFF001D74),
              bodyColor: Colors.white,
            )),
      ],
    );
  }
}

class BookCategory extends StatefulWidget {
  final FocusNode currentFocus;
  final FocusNode nextFocus;
  const BookCategory({Key? key, required this.currentFocus, required this.nextFocus})
      : super(key: key);

  @override
  _BookCategoryState createState() => _BookCategoryState();
}

class _BookCategoryState extends State<BookCategory> {
  String value = 'Choose language';
  @override
  Widget build(BuildContext context) {
    return AppDropDown(
      currentFocus: widget.currentFocus,
      validator: (value) {
        if (value!.toLowerCase() == 'choose language') {
          return 'Please choose language';
        }
        return null;
      },
      items: _items(),
      onChange: (value) {
        setState(() {
          this.value = value!;
        });
        FocusScope.of(context).requestFocus(widget.nextFocus);
      },
      value: value,
    );
  }

  List<DropdownMenuItem<String>> _items() {
    return <String>['Choose language', 'Java', 'Flutter', 'Python', 'Reactjs']
        .map<DropdownMenuItem<String>>((String value) {
      return DropdownMenuItem(
        value: value,
        child: Text(value),
      );
    }).toList();
  }
}

class BookAuthor extends StatefulWidget {
  final FocusNode currentFocus;
  final FocusNode nextFocus;
  const BookAuthor({Key? key, required this.currentFocus, required this.nextFocus})
      : super(key: key);

  @override
  _BookAuthorState createState() => _BookAuthorState();
}

class _BookAuthorState extends State<BookAuthor> {
  String value = 'Choose Author';
  @override
  Widget build(BuildContext context) {
    return AppDropDown(
      currentFocus: widget.currentFocus,
      validator: (value) {
        if (value!.toLowerCase() == 'choose author') {
          return 'Please choose author';
        }
        return null;
      },
      items: _items(),
      onChange: (value) {
        setState(() {
          this.value = value!;
        });
        FocusScope.of(context).requestFocus(widget.nextFocus);
      },
      value: value,
    );
  }

  List<DropdownMenuItem<String>> _items() {
    return <String>['Choose Author', 'Uncle bob', 'Joshua Bloch', 'Gayle Laakmann McDowell']
        .map<DropdownMenuItem<String>>((String value) {
      return DropdownMenuItem(
        value: value,
        child: Text(value),
      );
    }).toList();
  }
}

class BookPublisher extends StatefulWidget {
  final FocusNode currentFocus;
  final FocusNode nextFocus;
  const BookPublisher({Key? key, required this.currentFocus, required this.nextFocus})
      : super(key: key);

  @override
  _BookPublisherState createState() => _BookPublisherState();
}

class _BookPublisherState extends State<BookPublisher> {
  String value = 'Choose publisher';
  @override
  Widget build(BuildContext context) {
    return AppDropDown(
      currentFocus: widget.currentFocus,
      validator: (value) {
        if (value!.toLowerCase() == 'choose publisher') {
          return 'Please choose publisher';
        }
        return null;
      },
      items: _items(),
      onChange: (value) {
        setState(() {
          this.value = value!;
        });
        FocusScope.of(context).requestFocus(widget.nextFocus);
      },
      value: value,
    );
  }

  List<DropdownMenuItem<String>> _items() {
    return <String>[
      'Choose publisher',
      'CareerCup',
      'O\'Reilly Media',
    ].map<DropdownMenuItem<String>>((String value) {
      return DropdownMenuItem(
        value: value,
        child: Text(value),
      );
    }).toList();
  }
}
