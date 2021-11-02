import 'package:desktop_library_shop/core/models/book.dart';
import 'package:desktop_library_shop/core/models/student.dart';
import 'package:desktop_library_shop/core/models/user.dart';
import 'package:equatable/equatable.dart';
import 'package:mysql1/mysql1.dart';

class BookBorrowed extends Equatable {
  BookBorrowed({
    required this.bookId,
    required this.borrower,
    required this.borrowOn,
    required this.issuer,
    required this.issueOn,
    required this.returnOn,
    required this.shouldReturnOn,
    required this.fineAmount,
  });

  late final int bookId;
  late final int borrower;
  late final DateTime borrowOn;
  late final int issuer;
  late final DateTime issueOn;
  late final DateTime returnOn;
  late final DateTime shouldReturnOn;
  late final int fineAmount;

  BookBorrowed.initial()
      : bookId = 0,
        borrower = 0,
        borrowOn = DateTime.now(),
        issuer = 0,
        issueOn = DateTime.now(),
        returnOn = DateTime.now(),
        shouldReturnOn = DateTime.now(),
        fineAmount = 0;

  BookBorrowed.fromResult(ResultRow r) {
    bookId = r['bookId'];
    borrower = r['borrower'];
    borrowOn = r['borrowOn'];
    issuer = r['issuer'];
    issueOn = r['issueOn'];
    returnOn = r['returnOn'] ?? DateTime(DateTime.now().year - 1);
    shouldReturnOn = r['shouldReturnOn'];
    fineAmount = r['fineAmount'];
  }

  @override
  List<Object?> get props => [
        bookId,
        borrower,
        borrowOn,
        issuer,
        issueOn,
        returnOn,
        shouldReturnOn,
        fineAmount,
      ];
}
