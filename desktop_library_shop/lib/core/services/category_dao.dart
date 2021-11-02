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
    try {
      return await _categoryRepository.getAllCategories();
    } catch (e) {
      rethrow;
    }
  }
}
