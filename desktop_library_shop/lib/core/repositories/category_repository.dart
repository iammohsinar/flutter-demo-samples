import 'package:desktop_library_shop/core/config/db_connection.dart';
import 'package:desktop_library_shop/core/models/category.dart';
import 'package:mysql1/mysql1.dart';

class CategoryRepository {
  Future<List<Category>> getAllCategories() async {
    try {
      var con = await Db.connection;
      Results results =
          await con.query('select cat.* from categories cat where cat.isActive = 1');
      var categories = <Category>[];
      for (var r in results) {
        categories.add(Category.fromResult(r));
      }
      return categories;
    } catch (e) {
      throw Exception('Something went wrong $e');
    }
  }
}
