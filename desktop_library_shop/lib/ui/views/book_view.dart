import 'package:desktop_library_shop/core/enums/state_enums.dart';
import 'package:desktop_library_shop/core/models/book.dart';
import 'package:desktop_library_shop/core/models/user.dart';
import 'package:desktop_library_shop/core/services/book_dao.dart';
import 'package:desktop_library_shop/core/viewmodels/book_bo.dart';
import 'package:desktop_library_shop/ui/util/app_color.dart';
import 'package:desktop_library_shop/ui/util/app_responsive.dart';
import 'package:desktop_library_shop/ui/util/ui_util.dart';
import 'package:desktop_library_shop/ui/views/base_view.dart';
import 'package:desktop_library_shop/ui/widgets/app_button.dart';
import 'package:desktop_library_shop/ui/widgets/app_panel.dart';
import 'package:desktop_library_shop/ui/widgets/app_tab.dart';
import 'package:desktop_library_shop/ui/widgets/app_text.dart';
import 'package:desktop_library_shop/ui/widgets/app_textformfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

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
      _printBtnFocus,
      _searchBtnFocus,
      _fromDateFocus,
      _toDateFocus,
      _searchCategoryFocus,
      _searchAuthorFocus,
      _searchPublisherFocus,
      _costFocus;
  final ScrollController _tableHorizontalController = ScrollController();
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _authorTextCtrl = TextEditingController();
  final TextEditingController _categoryIdTextCtrl = TextEditingController();
  final TextEditingController _codeTextCtrl = TextEditingController();
  final TextEditingController _costTextCtrl = TextEditingController();
  final TextEditingController _publishYearTextCtrl = TextEditingController();
  //final TextEditingController _pushlisherTextCtrl = TextEditingController();
  final TextEditingController _titleTextCtrl = TextEditingController();
  int categoryId = 0;

  String _publisherInitialValue = 'Choose publisher';

  String _bookAuthorInitialValue = 'Choose Author';

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
    _fromDateFocus = FocusNode();
    _toDateFocus = FocusNode();

    _searchAuthorFocus = FocusNode();
    _searchCategoryFocus = FocusNode();
    _searchPublisherFocus = FocusNode();

    _addBtnFocus = FocusNode();
    _updateBtnFocus = FocusNode();
    _cancelBtnFocus = FocusNode();
    _printBtnFocus = FocusNode();
    _searchBtnFocus = FocusNode();
    _costFocus = FocusNode();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // width < 1000
    // < 500
    return Column(
      children: [
        Padding(
            padding: const EdgeInsets.all(5),
            child: AppPanel(
              child: BaseView<BookBo>(
                builder: (context, bookBo, _) => Form(
                  key: _formKey,
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
                                  // validator: (value) {
                                  //   if (value!.isEmpty) {
                                  //     return 'Book Id not found';
                                  //   }
                                  //   return null;
                                  // },
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
                                  controller: _codeTextCtrl,
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
                                  flex: 8,
                                  child: AppTextFormField(
                                    controller: _titleTextCtrl,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'Please type Book title';
                                      }
                                      return null;
                                    },
                                    maxLength: 100,
                                    height: 45,
                                    current: _bookTitleFocus,
                                    next: _costFocus,
                                  )),
                              UIUtil.hSmallSpace(),
                              AppTextLabel('Cost'),
                              UIUtil.hXSmallSpace(),
                              Flexible(
                                child: AppTextFormField(
                                  controller: _costTextCtrl,
                                  maxLength: 4,
                                  height: 45,
                                  current: _costFocus,
                                  next: _categoryFocus,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Please add cost of book';
                                    }
                                    return null;
                                  },
                                ),
                              ),
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
                                  value: categoryId,
                                  onChange: (value) {
                                    categoryId = int.parse(value!);
                                    FocusScope.of(context).requestFocus(_authorFocus);
                                  },
                                ),
                              ),
                              UIUtil.hSmallSpace(),
                              AppTextLabel('Author'),
                              UIUtil.hXSmallSpace(),
                              Flexible(
                                // flex: 2,
                                child: BookAuthor(
                                  value: _bookAuthorInitialValue,
                                  onChange: (value) {
                                    _bookAuthorInitialValue = value!;
                                    FocusScope.of(context).requestFocus(_publisherFocus);
                                  },
                                  currentFocus: _authorFocus,
                                  nextFocus: _publisherFocus,
                                ),
                              ),
                              UIUtil.hSmallSpace(),
                              AppTextLabel('Publisher'),
                              UIUtil.hXSmallSpace(),
                              Flexible(
                                child: BookPublisher(
                                  value: _publisherInitialValue,
                                  onChange: (value) {
                                    _publisherInitialValue = value!;
                                    FocusScope.of(context).requestFocus(_publishYearFocus);
                                  },
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
                                    controller: _publishYearTextCtrl,
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
                                      maxLength: 4,
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
                      (bookBo.state == StateEnum.busy)
                          ? const CircularProgressIndicator()
                          : Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // add/update/cancel buttons
                                AppElevatedBtn(
                                    width: 80.0,
                                    imgUrl: 'assets/images/icons/save.png',
                                    focusNode: _addBtnFocus,
                                    isEnable: true,
                                    onPressedFn: () async {
                                      //_formKey.currentState!.reset();
                                      if (_formKey.currentState!.validate()) {
                                        Book b = Book(
                                            code: _codeTextCtrl.text,
                                            title: _titleTextCtrl.text,
                                            author: _bookAuthorInitialValue,
                                            publisher: _publisherInitialValue,
                                            publishYear: int.parse(_publishYearTextCtrl.text),
                                            cost: 20, //int.parse(_costTextCtrl.text),
                                            categoryId: categoryId,
                                            stockKeeper:
                                                Provider.of<User>(context, listen: false)
                                                    .userId,
                                            stockOn: DateTime.now());
                                        print(b);
                                        bool success = await bookBo.save(b);
                                        if (success) {
                                          _showDialog(context, bookBo.bookMsg, 'success');
                                          _addBtnFocus.unfocus();
                                          FocusScope.of(context).requestFocus(_barCodeIdFocus);
                                          _formKey.currentState!.reset();
                                        } else {
                                          _showDialog(
                                              context, 'ERROR! ${bookBo.bookMsg}', 'cancel');
                                        }
                                      }
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
                                    text: 'Print'),
                              ],
                            )
                    ],
                  ),
                ),
              ),
              title: 'New Book',
              headerColor: const Color(0xFF001D74),
              bodyColor: Colors.white,
            )),
        Padding(
            padding: const EdgeInsets.all(5),
            child: AppPanel(
              child: Column(children: [
                Container(
                  padding: EdgeInsets.only(top: 5, left: 5, right: 5),
                  color: Color(0xFFE3FFE3),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppTextLabel('Search By: '),
                      UIUtil.hMediumSpace(),
                      AppTextLabel('Category'),
                      UIUtil.hXSmallSpace(),
                      Flexible(
                        child: BookCategory(
                          value: categoryId,
                          currentFocus: _searchCategoryFocus,
                          nextFocus: _searchAuthorFocus,
                        ),
                      ),
                      UIUtil.hSmallSpace(),
                      AppTextLabel('Author'),
                      UIUtil.hXSmallSpace(),
                      Flexible(
                        child: BookAuthor(
                          currentFocus: _searchAuthorFocus,
                          nextFocus: _searchPublisherFocus,
                        ),
                      ),
                      UIUtil.hSmallSpace(),
                      AppTextLabel('Publisher'),
                      UIUtil.hXSmallSpace(),
                      Flexible(
                        child: BookPublisher(
                          currentFocus: _searchPublisherFocus,
                          nextFocus: _fromDateFocus,
                        ),
                      ),
                      UIUtil.hSmallSpace(),
                      AppTextLabel('From Date'),
                      UIUtil.hXSmallSpace(),
                      Flexible(
                          child: AppTextFormField(
                        hintText: 'DD-MM-YYYY',
                        maxLength: 10,
                        height: 45,
                        current: _fromDateFocus,
                        next: _toDateFocus,
                      )),
                      UIUtil.hSmallSpace(),
                      AppTextLabel('To Date'),
                      UIUtil.hXSmallSpace(),
                      Flexible(
                          child: AppTextFormField(
                        hintText: 'DD-MM-YYYY',
                        maxLength: 10,
                        //height: 65,
                        current: _toDateFocus,
                        next: _searchBtnFocus,
                      )),
                      UIUtil.hSmallSpace(),
                      Flexible(
                        child: AppElevatedBtn(
                            width: 100.0,
                            imgUrl: 'assets/images/icons/search.png',
                            focusNode: _searchBtnFocus,
                            isEnable: true,
                            onPressedFn: () {
                              //
                            },
                            text: 'Search'),
                      ),
                    ],
                  ),
                ),
                UIUtil.vXSmallSpace(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Scrollbar(
                        isAlwaysShown: true,
                        controller: _tableHorizontalController,
                        child: ScrollConfiguration(
                          behavior: ScrollConfiguration.of(context).copyWith(
                              dragDevices: {PointerDeviceKind.touch, PointerDeviceKind.mouse}),
                          child: SingleChildScrollView(
                            controller: _tableHorizontalController,
                            scrollDirection: Axis.horizontal,
                            child: DataTable(
                              decoration: BoxDecoration(
                                  border: Border.all(
                                color: Colors.black,
                              )),
                              columns: [
                                DataColumn(label: Text('Code')),
                                DataColumn(label: Text('Reference Code')),
                                DataColumn(label: Text('Category')),
                                DataColumn(label: Text('Title')),
                                DataColumn(label: Text('Author')),
                                DataColumn(label: Text('Publisher')),
                                DataColumn(label: Text('Publish Year')),
                                DataColumn(label: Text('Cost')),
                                DataColumn(label: Text('Condition')),
                                DataColumn(label: Text('Retire')),
                                DataColumn(label: Text('Borrower')),
                                DataColumn(label: Text('Stock Keeper')),
                              ],
                              rows: [],
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ]),
              title: 'Book Details',
              headerColor: const Color(0xFF001D74),
              bodyColor: Colors.white,
            )),
      ],
    );
  }

  void _showDialog(BuildContext context, String message, imageName) {
    showDialog<void>(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return AlertDialog(
            content: SingleChildScrollView(
              child: Container(
                width: 300,
                child: Row(
                  children: <Widget>[
                    Text(
                      message,
                      style: const TextStyle(fontSize: 18),
                    ),
                    Image.asset('assets/images/icons/$imageName.png')
                  ],
                ),
              ),
            ),
            actions: <Widget>[
              OutlinedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text(
                    'OK',
                    style: TextStyle(color: Color(0xFF6e4875)),
                  )),
            ],
          );
        });
  }
}

class BookCategory extends StatefulWidget {
  final FocusNode currentFocus;
  final FocusNode nextFocus;
  void Function(String?)? onChange;
  int value;
  BookCategory(
      {Key? key,
      required this.currentFocus,
      required this.nextFocus,
      required this.value,
      this.onChange})
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
        if (int.parse(value!) == 0) {
          return 'Please choose language';
        }
        return null;
      },
      items: _items(),
      onChange: widget.onChange,
      // (value) {
      //   print(value);
      //   setState(() {
      //     widget.value = int.parse(value!);
      //   });
      //   FocusScope.of(context).requestFocus(widget.nextFocus);
      // },
      value: widget.value.toString(),
    );
  }

  List<DropdownMenuItem<String>> _items() {
    int i = 0;
    return ['Choose language', 'Java', 'Flutter', 'Python', 'Reactjs']
        .map<DropdownMenuItem<String>>((String value) {
      return DropdownMenuItem(
        value: (i++).toString(),
        child: Text(value),
      );
    }).toList();
  }
}

class BookAuthor extends StatefulWidget {
  final FocusNode currentFocus;
  final FocusNode nextFocus;
  final Function(String?)? onChange;
  String? value;
  BookAuthor(
      {Key? key,
      required this.currentFocus,
      required this.nextFocus,
      this.onChange,
      this.value})
      : super(key: key);

  @override
  _BookAuthorState createState() => _BookAuthorState();
}

class _BookAuthorState extends State<BookAuthor> {
  //String value = 'Choose Author';
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
      onChange: widget.onChange,
      value: widget.value,
    );
  }

  List<DropdownMenuItem<String>> _items() {
    return <String>['Choose Author', 'Uncle bob', 'Joshua Bloch', 'Gayle Laakmann McDowell']
        .map<DropdownMenuItem<String>>((String value) {
      return DropdownMenuItem(
        value: value,
        child: Text(
          value,
          softWrap: true,
        ),
      );
    }).toList();
  }
}

class BookPublisher extends StatefulWidget {
  final FocusNode currentFocus;
  final FocusNode nextFocus;
  void Function(String?)? onChange;
  String? value;
  BookPublisher(
      {Key? key,
      required this.currentFocus,
      required this.nextFocus,
      this.onChange,
      this.value})
      : super(key: key);

  @override
  _BookPublisherState createState() => _BookPublisherState();
}

class _BookPublisherState extends State<BookPublisher> {
  //String value = 'Choose publisher';
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
      onChange: widget.onChange,
      value: widget.value,
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

// class ScrollDemo extends StatefulWidget {
//   const ScrollDemo({Key? key}) : super(key: key);

//   @override
//   _ScrollDemoState createState() => _ScrollDemoState();
// }

// class _ScrollDemoState extends State<ScrollDemo> {
//   final ScrollController _tableHorizontalController = ScrollController();
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//         child: Scrollbar(
//             isAlwaysShown: true,
//             controller: _tableHorizontalController,
//             child: ScrollConfiguration(
//                 behavior: ScrollConfiguration.of(context)
//                     .copyWith(dragDevices: {PointerDeviceKind.touch, PointerDeviceKind.mouse}),
//                 child: SingleChildScrollView(
//                     controller: _tableHorizontalController,
//                     scrollDirection: Axis.horizontal,
//                     child: DataTable(
//                       decoration: BoxDecoration(
//                           border: Border.all(
//                         color: Colors.black,
//                       )),
//                       columns: [],
//                       rows: [],
//                     )))));
//   }
// }
