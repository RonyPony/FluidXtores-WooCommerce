import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fluid/models/category_item.dart';
import 'package:fluid/providers/catalog_provider.dart';

import 'components/body.dart';
import 'components/custom_app_bar.dart';

class CategoryDetailScreen extends StatelessWidget {
  static String routeName = "/categoryDetails";

  @override
  Widget build(BuildContext context) {
    final CatDetailsArguments agrs = ModalRoute.of(context).settings.arguments;
    final categoryProvider = Provider.of<CatalogProvider>(context);
    Future<CategoryItem> category = categoryProvider.getACategory(agrs.catId);
    return FutureBuilder<CategoryItem>(
        future: category,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Scaffold(
              backgroundColor: Color(0xFFF5F6F9),
              appBar: CustomAppBar(rating: agrs.catId.toDouble()),
              body: Body(category: snapshot.data),
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        });
  }
}

class CatDetailsArguments {
  final int catId;

  CatDetailsArguments({@required this.catId});
}
