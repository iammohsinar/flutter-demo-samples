//
// @ Author: Mohsin AR
// @ Email: mohsinazeemrind@gmail.com
// @ Github: https://github.com/iammohsinar
// @ Create Time: 03-11-2021 00:17:23
// @ Modified time: 10-02-2022 00:45:19
//

import 'package:desktop_library_shop/core/config/db_connection.dart';
import 'package:desktop_library_shop/core/models/student.dart';
import 'package:flutter/material.dart';
import 'package:mysql1/mysql1.dart';

class StudentRepository {
  Future<Student> getStudentData(String rollNumber) async {
    var con = await Db.connection;

    Results result = await con.query(
        "select std.* from students std where std.enrolledCardNumber = ? and std.isActive = 1 ",
        [rollNumber]);
    return result.isNotEmpty ? Student.fromResult(result.first) : Student.initial();
  }

  Future<Student> getStudentById(int id) async {
    var con = await Db.connection;

    Results result = await con.query(
        "select std.* from students std where std.studentId = ? and std.isActive = 1 ", [id]);
    return result.isNotEmpty ? Student.fromResult(result.first) : Student.initial();
  }
}
