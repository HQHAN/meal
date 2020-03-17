import 'package:flutter/material.dart';
import 'package:meal_app/models/category.dart';
import 'package:meal_app/models/dummy_categories.dart';
import 'package:meal_app/widgets/category_item.dart';

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
        return CategoryItem(
          item.id,
          item.title,
          item.bgColor,
        );
      },
      itemCount: DUMMY_CATEGORY.length,
    );
  }
}
