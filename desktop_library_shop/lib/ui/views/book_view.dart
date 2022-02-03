import 'package:desktop_library_shop/core/enums/state_enums.dart';
import 'package:desktop_library_shop/core/models/book.dart';
import 'package:desktop_library_shop/core/models/user.dart';
import 'package:desktop_library_shop/core/services/book_dao.dart';
import 'package:desktop_library_shop/core/viewmodels/book_bo.dart';
import 'package:desktop_library_shop/ui/reports/invoice.dart';
import 'package:desktop_library_shop/ui/util/app_color.dart';
import 'package:desktop_library_shop/ui/util/app_date_format.dart';
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
  final ScrollController _tableVerticalController = ScrollController();
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _codeTextCtrl = TextEditingController();
  final TextEditingController _costTextCtrl = TextEditingController();
  final TextEditingController _publishYearTextCtrl = TextEditingController();
  final TextEditingController _referenceCodeTextCtrl = TextEditingController();
  final TextEditingController _totalCopiesTextCtrl = TextEditingController();
  final TextEditingController _languageTextCtrl = TextEditingController();
  final TextEditingController _titleTextCtrl = TextEditingController();
  final TextEditingController _fromDateTextCtrl = TextEditingController();
  final TextEditingController _toDateTextCtrl = TextEditingController();
  final TextEditingController _bookdIdTextCtrl = TextEditingController(); // = Book.initial();
  int _categoryId = 0;

  String _publisherInitialValue = 'Choose publisher';

  String _bookAuthorInitialValue = 'Choose Author';

  List<Book> _books = [];

  Book _book = Book.initial();
  //Book? _success;
  int printIndex = 0;

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
    switch (printIndex) {
      case 1:
        print(printIndex);
        return InvoiceReport(
          book: _book,
          onPressed: () {
            setState(() {
              printIndex = 0;
            });
          },
        );
      case 2:
        return Container();
      default:
        return Column(
          children: [
            Padding(
                padding: const EdgeInsets.all(5),
                child: AppPanel(
                  child: BaseView<BookBo>(
                    builder: (context, bookBo, _) {
                      return Form(
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
                                        controller: _bookdIdTextCtrl,
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
                                        onFieldSubmit: (value) async {
                                          _book = await bookBo.getByBarCode(value);

                                          _bookdIdTextCtrl.text = _book.bookId.toString();
                                          _referenceCodeTextCtrl.text = _book.code;
                                          _titleTextCtrl.text = _book.title;
                                          _costTextCtrl.text = _book.cost.toString();
                                          _categoryId = _book.categoryId;
                                          _bookAuthorInitialValue = (_book == Book.initial())
                                              ? 'Choose Author'
                                              : _book.author;
                                          _publisherInitialValue = (_book == Book.initial())
                                              ? 'Choose publisher'
                                              : _book.publisher;
                                          _publishYearTextCtrl.text =
                                              _book.publishYear.toString();
                                          _totalCopiesTextCtrl.text =
                                              _book.totalCopies.toString();
                                          _languageTextCtrl.text = _book.language;

                                          _barCodeIdFocus.unfocus();
                                          FocusScope.of(context)
                                              .requestFocus(_referenceNoFocus);
                                        },
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
                                        controller: _referenceCodeTextCtrl,
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
                                        isEnable:
                                            (Provider.of<User>(context).role == 'manager')
                                                ? false
                                                : true,
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
                                        value: _categoryId,
                                        onChange: (value) {
                                          _categoryId = int.parse(value!);
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
                                          FocusScope.of(context)
                                              .requestFocus(_publishYearFocus);
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
                                            controller: _totalCopiesTextCtrl,
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
                                            controller: _languageTextCtrl,
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
                                      (Provider.of<User>(context).role == 'admin')
                                          ? AppElevatedBtn(
                                              width: 80.0,
                                              imgUrl: 'assets/images/icons/save.png',
                                              focusNode: _addBtnFocus,
                                              isEnable: (_book.bookId > 0) ? false : true,
                                              onPressedFn: () async {
                                                if (_formKey.currentState!.validate()) {
                                                  Book b = Book(
                                                      code: _codeTextCtrl.text,
                                                      title: _titleTextCtrl.text,
                                                      author: _bookAuthorInitialValue,
                                                      publisher: _publisherInitialValue,
                                                      publishYear:
                                                          int.parse(_publishYearTextCtrl.text),
                                                      cost:
                                                          20, //int.parse(_costTextCtrl.text),
                                                      categoryId: _categoryId,
                                                      stockKeeper: Provider.of<User>(context,
                                                              listen: false)
                                                          .userId,
                                                      stockOn: DateTime.now());
                                                  _book = await bookBo.save(b);
                                                  if (_book.bookId > 0) {
                                                    _resetBookForm();
                                                    _showDialog(
                                                        context, bookBo.bookMsg, 'success');
                                                    _addBtnFocus.unfocus();
                                                    FocusScope.of(context)
                                                        .requestFocus(_barCodeIdFocus);
                                                  } else {
                                                    _showDialog(context,
                                                        'ERROR! ${bookBo.bookMsg}', 'cancel');
                                                  }
                                                }
                                              },
                                              text: 'Save')
                                          : SizedBox(),
                                      UIUtil.hSmallSpace(),
                                      (Provider.of<User>(context).role == 'manager' ||
                                              _book.bookId > 0)
                                          ? AppElevatedBtn(
                                              width: 80.0,
                                              imgUrl: 'assets/images/icons/update.png',
                                              focusNode: _updateBtnFocus,
                                              isEnable: true,
                                              onPressedFn: () {},
                                              text: 'Update')
                                          : SizedBox(),
                                      UIUtil.hSmallSpace(),
                                      AppElevatedBtn(
                                          width: 80.0,
                                          imgUrl: 'assets/images/icons/cancel.png',
                                          focusNode: _cancelBtnFocus,
                                          isEnable: true,
                                          onPressedFn: () {
                                            setState(() {
                                              _resetBookForm();
                                            });
                                          },
                                          text: 'Cancel'),
                                      UIUtil.hSmallSpace(),
                                      AppElevatedBtn(
                                          width: 80.0,
                                          imgUrl: 'assets/images/icons/printer.png',
                                          focusNode: _printBtnFocus,
                                          isEnable: true,
                                          onPressedFn: () {
                                            switch (_book.bookId) {
                                              case 0:
                                                _showDialog(
                                                    context, 'noting to print', 'cancel');
                                                return;
                                              default:
                                                setState(() {
                                                  printIndex = 1;
                                                });
                                            }
                                          },
                                          text: 'Print'),
                                    ],
                                  )
                          ],
                        ),
                      );
                    },
                  ),
                  title: 'New Book',
                  headerColor: const Color(0xFF001D74),
                  bodyColor: Colors.white,
                )),
            Padding(
                padding: const EdgeInsets.all(5),
                child: AppPanel(
                  child: BaseView<BookBo>(
                    builder: (context, model, _) => Column(children: [
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
                                value: _categoryId,
                                onChange: (value) {
                                  _categoryId = int.parse(value!);
                                },
                                currentFocus: _searchCategoryFocus,
                                nextFocus: _searchAuthorFocus,
                              ),
                            ),
                            UIUtil.hSmallSpace(),
                            AppTextLabel('Author'),
                            UIUtil.hXSmallSpace(),
                            Flexible(
                              child: BookAuthor(
                                value: _bookAuthorInitialValue,
                                onChange: (value) {
                                  _bookAuthorInitialValue = value!;
                                },
                                currentFocus: _searchAuthorFocus,
                                nextFocus: _searchPublisherFocus,
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
                                },
                                currentFocus: _searchPublisherFocus,
                                nextFocus: _fromDateFocus,
                              ),
                            ),
                            UIUtil.hSmallSpace(),
                            AppTextLabel('From Date'),
                            UIUtil.hXSmallSpace(),
                            Flexible(
                                child: AppTextFormField(
                              controller: _fromDateTextCtrl,
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
                              controller: _toDateTextCtrl,
                              hintText: 'DD-MM-YYYY',
                              maxLength: 10,
                              //height: 65,
                              current: _toDateFocus,
                              next: _searchBtnFocus,
                            )),
                            UIUtil.hSmallSpace(),
                            Flexible(
                              child: (model.state == StateEnum.busy)
                                  ? CircularProgressIndicator()
                                  : AppElevatedBtn(
                                      width: 100.0,
                                      imgUrl: 'assets/images/icons/search.png',
                                      focusNode: _searchBtnFocus,
                                      isEnable: true,
                                      onPressedFn: () async {
                                        if (_toDateTextCtrl.text.trim() != '' &&
                                            _fromDateTextCtrl.text.trim() == '') {
                                          _showDialog(context, 'Please enter from and to date',
                                              'cancel');
                                          return;
                                        }

                                        _books = await model.searchBook(
                                            (_categoryId != 0) ? _categoryId : null,
                                            (_bookAuthorInitialValue != 'Choose Author')
                                                ? _bookAuthorInitialValue
                                                : null,
                                            (_publisherInitialValue != 'Choose publisher')
                                                ? _publisherInitialValue
                                                : null,
                                            (_fromDateTextCtrl.text.trim() != '')
                                                ? AppDate.format(_fromDateTextCtrl.text)
                                                : null,
                                            (_toDateTextCtrl.text.trim() != '')
                                                ? AppDate.format(_toDateTextCtrl.text)
                                                : DateTime.now());
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
                          Flexible(
                            child: Scrollbar(
                              isAlwaysShown: true,
                              controller: _tableHorizontalController,
                              child: ScrollConfiguration(
                                behavior: ScrollConfiguration.of(context).copyWith(
                                    dragDevices: {
                                      PointerDeviceKind.touch,
                                      PointerDeviceKind.mouse
                                    }),
                                child: SingleChildScrollView(
                                  controller: _tableHorizontalController,
                                  scrollDirection: Axis.horizontal,
                                  child: SizedBox(
                                    height: 200,
                                    child: SingleChildScrollView(
                                      controller: _tableVerticalController,
                                      scrollDirection: Axis.vertical,
                                      child: DataTable(
                                          headingRowColor:
                                              MaterialStateProperty.all(Colors.black12),
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                            color: Colors.black,
                                          )),
                                          columns: [
                                            DataColumn(label: Text('Code')),
                                            DataColumn(label: Text('Reference Code')),
                                            DataColumn(label: Text('Title')),
                                            DataColumn(label: Text('Author')),
                                            DataColumn(label: Text('Publisher')),
                                            DataColumn(label: Text('Publish Year')),
                                            DataColumn(label: Text('Cost')),
                                            DataColumn(label: Text('Condition')),
                                            DataColumn(label: Text('Retire')),
                                            DataColumn(label: Text('Stock on')),
                                          ],
                                          rows: [
                                            for (Book r in _books)
                                              DataRow(cells: [
                                                DataCell(Text(r.code)),
                                                DataCell(Text(r.code)),
                                                DataCell(Text(r.title)),
                                                DataCell(Text(r.author)),
                                                DataCell(Text(r.publisher)),
                                                DataCell(Text(r.publishYear.toString())),
                                                DataCell(Text(r.cost.toString())),
                                                DataCell(Text(r.condition)),
                                                DataCell(Text(r.retire!)),
                                                DataCell(Text(
                                                    '${r.stockOn.day}-${r.stockOn.month}-${r.stockOn.year}'))
                                              ])
                                          ]),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ]),
                  ),
                  title: 'Book Details',
                  headerColor: const Color(0xFF001D74),
                  bodyColor: Colors.white,
                )),
          ],
        );
    }
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

  void _resetBookForm() {
    _book = Book.initial();
    _bookdIdTextCtrl.text = '0';
    _totalCopiesTextCtrl.text = '';
    _languageTextCtrl.text = '';
    _codeTextCtrl.text = '';
    _titleTextCtrl.text = '';
    _costTextCtrl.text = '';
    _referenceCodeTextCtrl.text = '';
    _totalCopiesTextCtrl.text = '';
    _languageTextCtrl.text = '';
    _bookAuthorInitialValue = 'Choose Author';
    _categoryId = 0;
    _publisherInitialValue = 'Choose publisher';
    _publishYearTextCtrl.text = '';
    //_formKey.currentState!.reset();
  }

  @override
  void dispose() {
    _codeTextCtrl.dispose();
    _costTextCtrl.dispose();
    _publishYearTextCtrl.dispose();
    _referenceCodeTextCtrl.dispose();
    _totalCopiesTextCtrl.dispose();
    _languageTextCtrl.dispose();
    _titleTextCtrl.dispose();
    _fromDateTextCtrl.dispose();
    _toDateTextCtrl.dispose();
    _bookdIdTextCtrl.dispose();
    super.dispose();
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
  String value = 'Choose category';
  @override
  Widget build(BuildContext context) {
    return AppDropDown(
      currentFocus: widget.currentFocus,
      validator: (value) {
        if (int.parse(value!) == 0) {
          return 'Please Choose category';
        }
        return null;
      },
      items: _items(),
      onChange: widget.onChange,
      value: widget.value.toString(),
    );
  }

  List<DropdownMenuItem<String>> _items() {
    int i = 0;
    return ['Choose category', 'It', 'Physics', 'Arts', 'Economics']
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
      'OReilly Media',
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
