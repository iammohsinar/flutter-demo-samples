//
// @ Author: Mohsin AR
// @ Email: mohsinazeemrind@gmail.com
// @ Github: https://github.com/iammohsinar
// @ Create Time: 26-10-2021 00:02:52
// @ Modified time: 10-02-2022 00:45:36
//

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

  Student.fromResult(ResultRow row) {
    studentId = row['studentId'];
    name = row['name'];
    enrolledCardNumber = row['enrolledCardNumber'];
    isActive = row['isActive'];
  }

  @override
  List<Object?> get props => [studentId, name, enrolledCardNumber, isActive];
}
