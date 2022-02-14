//
// @ Author: Mohsin AR
// @ Email: mohsinazeemrind@gmail.com
// @ Github: https://github.com/iammohsinar
// @ Create Time: 03-11-2021 00:22:58
// @ Modified time: 10-02-2022 00:44:55
//

import 'package:desktop_library_shop/core/models/student.dart';
import 'package:desktop_library_shop/core/repositories/student_repository.dart';
import 'package:desktop_library_shop/locator.dart';

abstract class StudentDao {
  Future<Student> getByRollNumber(String rollNumber);
  Future<Student> getById(int id);
}

class StudentDaoImpl extends StudentDao {
  final StudentRepository _studentRepository = loc<StudentRepository>();

  @override
  Future<Student> getById(int id) async {
    return await _studentRepository.getStudentById(id);
  }

  @override
  Future<Student> getByRollNumber(String rollNumber) async {
    return await _studentRepository.getStudentData(rollNumber);
  }
}
