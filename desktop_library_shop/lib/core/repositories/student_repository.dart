import 'package:desktop_library_shop/core/config/db_connection.dart';
import 'package:desktop_library_shop/core/models/student.dart';
import 'package:mysql1/mysql1.dart';

class StudentRepository {
  Future<Student> getStudentData(String rollNumber) async {
    try {
      var con = await Db.connection;
      Results result = await con.query(
          "select std.* from students std where std.enrolledCardNumber = ? and std.isActive = 1 ",
          [rollNumber]);
      return result.isNotEmpty ? Student.fromResult(result.first) : Student.initial();
    } catch (e) {
      throw Exception('No record found $e');
    }
  }

  Future<Student> getStudentById(int id) async {
    try {
      var con = await Db.connection;
      Results result = await con.query(
          "select std.* from students std where std.studentId = ? and std.isActive = 1 ",
          [id]);
      return result.isNotEmpty ? Student.fromResult(result.first) : Student.initial();
    } catch (e) {
      throw Exception('No record found $e');
    }
  }
}
