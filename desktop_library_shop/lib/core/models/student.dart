class Student {
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
}
