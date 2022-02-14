//
// @ Author: Mohsin AR
// @ Email: mohsinazeemrind@gmail.com
// @ Github: https://github.com/iammohsinar
// @ Create Time: 03-11-2021 00:50:13
// @ Modified time: 10-02-2022 00:44:59
//

import 'package:desktop_library_shop/core/models/category.dart';
import 'package:desktop_library_shop/core/repositories/category_repository.dart';
import 'package:desktop_library_shop/locator.dart';

abstract class CategoryDao {
  Future<List<Category>> getAll();
}

class CategoryDaoImpl extends CategoryDao {
  final CategoryRepository _categoryRepository = loc<CategoryRepository>();
  @override
  Future<List<Category>> getAll() async {
    return await _categoryRepository.getAllCategories();
  }
}
