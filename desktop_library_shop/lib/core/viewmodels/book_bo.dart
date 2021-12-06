import 'package:desktop_library_shop/core/enums/state_enums.dart';
import 'package:desktop_library_shop/core/models/book.dart';
import 'package:desktop_library_shop/core/services/book_dao.dart';
import 'package:desktop_library_shop/core/viewmodels/base_bo.dart';
import 'package:desktop_library_shop/locator.dart';

abstract class BookBo extends BaseBoImpl {
  Future<Book> save(Book b);
  Future<Book> getByBarCode(String code);
  Future<List<Book>> searchBook(
      int? categoryId, String? author, String? publisher, DateTime? from, DateTime to);
  late String bookMsg;
}

class BookBoImpl extends BookBo {
  final BookDao _bookDao = loc<BookDao>();

  @override
  Future<Book> save(Book b) async {
    try {
      setState(StateEnum.busy);
      Book _b = await _bookDao.save(b);
      var saved = _b == Book.initial();
      if (saved) {
        bookMsg = 'Problem occurs posting book please data';
        setState(StateEnum.idle);
        return _b;
      }
      bookMsg = 'Book successfully saved';
      setState(StateEnum.idle);
      return _b;
    } catch (e) {
      print(e);
      bookMsg = 'Something went wrong in server call Adminstration $e';
      setState(StateEnum.idle);
      return Book.initial();
    }
  }

  @override
  Future<List<Book>> searchBook(
      int? categoryId, String? author, String? publisher, DateTime? from, DateTime to) async {
    List<Book> books = [];
    setState(StateEnum.busy);
    books = await _bookDao.getBooksByQuery(categoryId, author, publisher, from, to);
    setState(StateEnum.idle);
    return books;
  }

  @override
  Future<Book> getByBarCode(String code) async {
    Book _b;
    setState(StateEnum.busy);
    _b = await _bookDao.getByCode(code);
    setState(StateEnum.idle);
    return _b;
  }
}
