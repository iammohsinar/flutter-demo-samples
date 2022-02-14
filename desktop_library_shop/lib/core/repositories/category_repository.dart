//
// @ Author: Mohsin AR
// @ Email: mohsinazeemrind@gmail.com
// @ Github: https://github.com/iammohsinar
// @ Create Time: 03-11-2021 00:19:43
// @ Modified time: 10-02-2022 00:45:22
//

import 'package:desktop_library_shop/core/config/db_connection.dart';
import 'package:desktop_library_shop/core/models/category.dart';
import 'package:flutter/material.dart';
import 'package:mysql1/mysql1.dart';

class CategoryRepository {
  Future<List<Category>> getAllCategories() async {
    var con = await Db.connection;

    Results results =
        await con.query('select cat.* from categories cat where cat.isActive = 1');
    var categories = <Category>[];
    for (var r in results) {
      categories.add(Category.fromResult(r));
    }
    return categories;
  }
}
