import 'package:equatable/equatable.dart';
import 'package:mysql1/src/results/row.dart';

class Category extends Equatable {
  Category({
    required this.categoryId,
    required this.name,
    required this.isActive,
  });
  late final int categoryId;
  late final String name;
  late final int isActive;

  Category.fromJson(Map<String, dynamic> json) {
    categoryId = json['categoryId'];
    name = json['name'];
    isActive = json['isActive'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['categoryId'] = categoryId;
    _data['name'] = name;
    _data['isActive'] = isActive;
    return _data;
  }

  Category.fromResult(ResultRow r) {
    categoryId = r['categoryId'];
    name = r['name'];
    isActive = r['isActive'];
  }

  @override
  // TODO: implement props
  List<Object?> get props => [categoryId, name, isActive];
}
