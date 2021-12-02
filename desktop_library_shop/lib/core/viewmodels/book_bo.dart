import 'package:desktop_library_shop/core/enums/state_enums.dart';
import 'package:desktop_library_shop/core/models/book.dart';
import 'package:desktop_library_shop/core/services/book_dao.dart';
import 'package:desktop_library_shop/core/viewmodels/base_bo.dart';
import 'package:desktop_library_shop/locator.dart';

abstract class BookBo extends BaseBoImpl {
  Future<bool> save(Book b);
  late String bookMsg;
}

class BookBoImpl extends BookBo {
  final BookDao _bookDao = loc<BookDao>();

  @override
  Future<bool> save(Book b) async {
    try {
      setState(StateEnum.busy);
      Book _b = await _bookDao.save(b);
      var saved = _b == Book.initial();
      if (saved) {
        bookMsg = 'Problem occurs posting book please data';
        setState(StateEnum.idle);
        return false;
      }
      bookMsg = 'Book successfully saved';
      setState(StateEnum.idle);
      return true;
    } catch (e) {
      print(e);
      bookMsg = 'Something went wrong in server call Adminstration $e';
      setState(StateEnum.idle);
      return false;
    }
  }
}
