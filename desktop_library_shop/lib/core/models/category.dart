//
// @ Author: Mohsin AR
// @ Email: mohsinazeemrind@gmail.com
// @ Github: https://github.com/iammohsinar
// @ Create Time: 26-10-2021 00:02:52
// @ Modified time: 10-02-2022 00:45:40
//

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

  Category.fromResult(ResultRow r) {
    categoryId = r['categoryId'];
    name = r['name'];
    isActive = r['isActive'];
  }

  @override
  List<Object?> get props => [categoryId, name, isActive];
}
