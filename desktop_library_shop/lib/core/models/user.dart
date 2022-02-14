//
// @ Author: Mohsin AR
// @ Email: mohsinazeemrind@gmail.com
// @ Github: https://github.com/iammohsinar
// @ Create Time: 26-10-2021 00:02:52
// @ Modified time: 10-02-2022 00:45:33
//

import 'package:equatable/equatable.dart';
import 'package:mysql1/mysql1.dart';

class User extends Equatable {
  User({
    required this.userId,
    required this.userName,
    required this.password,
    required this.isActive,
    required this.role,
  });
  late final int userId;
  late final String userName;
  late final String password;
  late final int isActive;
  late final String role;

  User.initial()
      : userId = 0,
        userName = '',
        password = '',
        isActive = 0,
        role = '';

  User.fromResult(ResultRow row) {
    print(row.fields);
    userId = row['userId'];
    userName = row['userName'];
    password = row['password'];
    isActive = row['isActive'];
    role = row['role'];
  }

  @override
  List<Object?> get props => [userId, userName, password, isActive, role];
}
