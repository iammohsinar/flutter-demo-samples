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

  User.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    userName = json['userName'];
    password = json['password'];
    isActive = json['isActive'];
    role = json['role'];
  }

  User.fromResult(ResultRow row) {
    userId = row['userId'];
    userName = row['userName'];
    password = row['password'];
    isActive = row['isActive'];
    role = row['role'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['userId'] = userId;
    _data['userName'] = userName;
    _data['password'] = password;
    _data['isActive'] = isActive;
    _data['role'] = role;
    return _data;
  }

  @override
  // TODO: implement props
  List<Object?> get props => [userId, userName, password, isActive, role];
}