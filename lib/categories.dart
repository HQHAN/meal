import 'package:flutter/material.dart';
import 'package:meal_app/category_item.dart';
import 'package:meal_app/models/dummy_categories.dart';

import 'models/category.dart';

class Categories extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(10),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20),
      itemBuilder: (ctx, index) {
        Category item = DUMMY_CATEGORY[index];
        return CategoryItem(item.title, item.bgColor);
      },
      itemCount: DUMMY_CATEGORY.length,
    );
  }
}
