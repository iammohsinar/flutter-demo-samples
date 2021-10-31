import 'package:equatable/equatable.dart';
import 'package:mysql1/src/results/row.dart';

class Student extends Equatable {
  Student({
    required this.studentId,
    required this.name,
    required this.enrolledCardNumber,
    required this.isActive,
  });
  late final int studentId;
  late final String name;
  late final String enrolledCardNumber;
  late final int isActive;

  Student.initial()
      : studentId = 0,
        name = '',
        enrolledCardNumber = '',
        isActive = 0;

  Student.fromJson(Map<String, dynamic> json) {
    studentId = json['studentId'];
    name = json['name'];
    enrolledCardNumber = json['enrolledCardNumber'];
    isActive = json['isActive'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['studentId'] = studentId;
    _data['name'] = name;
    _data['enrolledCardNumber'] = enrolledCardNumber;
    _data['isActive'] = isActive;
    return _data;
  }

  Student.fromResult(ResultRow row) {
    studentId = row['studentId'];
    name = row['name'];
    enrolledCardNumber = row['enrolledCardNumber'];
    isActive = row['isActive'];
  }

  @override
  List<Object?> get props => [studentId, name, enrolledCardNumber, isActive];
}
