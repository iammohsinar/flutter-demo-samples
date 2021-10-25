import 'package:desktop_library_shop/core/models/student.dart';
import 'package:desktop_library_shop/core/models/user.dart';

class Book {
  Book({
    required this.bookId,
    required this.title,
    required this.author,
    required this.publisher,
    required this.cost,
    required this.categoryId,
    required this.borrower,
    required this.issuer,
    required this.issueOn,
    required this.returnOn,
    required this.shouldReturnOn,
    required this.fineAmount,
    required this.isActive,
    required this.stockKeeper,
    required this.stockOn,
    required this.isIssued,
  });
  late final int bookId;
  late final String title;
  late final String author;
  late final String publisher;
  late final int cost;
  late final int categoryId;
  late final Student borrower;
  late final User issuer;
  late final DateTime issueOn;
  late final DateTime returnOn;
  late final DateTime shouldReturnOn;
  late final int fineAmount;
  late final int isActive;
  late final User stockKeeper;
  late final DateTime stockOn;
  late final int isIssued;

  Book.fromJson(Map<String, dynamic> json) {
    bookId = json['bookId'];
    title = json['title'];
    author = json['author'];
    publisher = json['publisher'];
    cost = json['cost'];
    categoryId = json['categoryId'];
    borrower = json['borrower'];
    issuer = json['issuer'];
    issueOn = json['issueOn'];
    returnOn = json['returnOn'];
    shouldReturnOn = json['shouldReturnOn'];
    fineAmount = json['fineAmount'];
    isActive = json['isActive'];
    stockKeeper = json['stockKeeper'];
    stockOn = json['stockOn'];
    isIssued = json['isIssued'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['bookId'] = bookId;
    _data['title'] = title;
    _data['author'] = author;
    _data['publisher'] = publisher;
    _data['cost'] = cost;
    _data['categoryId'] = categoryId;
    _data['borrower'] = borrower;
    _data['issuer'] = issuer;
    _data['issueOn'] = issueOn;
    _data['returnOn'] = returnOn;
    _data['shouldReturnOn'] = shouldReturnOn;
    _data['fineAmount'] = fineAmount;
    _data['isActive'] = isActive;
    _data['stockKeeper'] = stockKeeper;
    _data['stockOn'] = stockOn;
    _data['isIssued'] = isIssued;
    return _data;
  }
}
