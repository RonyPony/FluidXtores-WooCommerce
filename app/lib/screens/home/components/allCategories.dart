import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fluid/constants.dart';
import 'package:fluid/models/Categories.dart' as cate;
import 'package:fluid/providers/catalog_provider.dart';
import 'package:fluid/screens/category/category_detail_screen.dart';
import 'package:fluid/screens/home/components/section_title.dart';
import 'package:fluid/screens/categories/categories_screen.dart';

import '../../../size_config.dart';

class AllCategoriesSection extends StatelessWidget {
  const AllCategoriesSection({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final categoryProvider = Provider.of<CatalogProvider>(context);
    Future<cate.AllCategories> allCategories =
        categoryProvider.getAllCategories();
    return Column(
      children: [
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: SectionTitle(
            title: "Categories",
            press: () {
              Navigator.pushNamed(context, CategoriesScreen.routeName);
            },
          ),
        ),
        SizedBox(height: getProportionateScreenWidth(10)),
        FutureBuilder<cate.AllCategories>(
          builder: (context, snapshot) {
            if (snapshot.data != null && snapshot.data.categories.length > 0) {
              return SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    ...snapshot.data.categories
                        .map((e) => _buildAcat(e, context))
                        .toList(),
                  ],
                ),
              );
            } else {
              if (snapshot.connectionState == ConnectionState.done &&
                  snapshot.data.categories.length == 0) {
                return Column(
                  children: [
                    SizedBox(
                      height: 0,
                    ),
                    Icon(
                      Icons.category_outlined,
                      color: kPrimaryColor.withOpacity(0.3),
                      size: 80,
                    ),
                    Center(
                      child: Text(
                        'Aun no hemos publicado ninguna categoria',
                        style: TextStyle(
                          color: kPrimaryColor.withOpacity(1),
                        ),
                      ),
                    )
                  ],
                );
              } else {
                return Column(
                  children: [
                    Center(
                      child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation(kPrimaryColor),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Loading Categories',
                      style: TextStyle(color: kPrimaryColor),
                    )
                  ],
                );
              }
            }
          },
          future: allCategories,
        ),
      ],
    );
  }

  _buildAcat(cate.Categories e, BuildContext context) {
    return CategoryCard(
        category: e.name,
        image: e.image != null
            ? e.image.src
            : 'https://i.pinimg.com/736x/f5/e3/9b/f5e39b4d6b6dcd0ddb5c5d26b1e84ca5.jpg',
        numOfBrands: e.id,
        press: () {
          Navigator.pushNamed(context, CategoryDetailScreen.routeName,
              arguments: CatDetailsArguments(catId: e.id));
        });
  }
}

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    Key key,
    @required this.category,
    @required this.image,
    @required this.numOfBrands,
    @required this.press,
  }) : super(key: key);

  final String category, image;
  final int numOfBrands;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: getProportionateScreenWidth(20)),
      child: GestureDetector(
        onTap: press,
        child: SizedBox(
          width: getProportionateScreenWidth(242),
          height: getProportionateScreenWidth(100),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Stack(
              children: [
                Image(
                  image: NetworkImage(image),
                  fit: BoxFit.cover,
                ),
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color(0xFF343434).withOpacity(0.4),
                        Color(0xFF343434).withOpacity(0.15),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(15.0),
                    vertical: getProportionateScreenWidth(10),
                  ),
                  child: Text.rich(
                    TextSpan(
                      style: TextStyle(color: Colors.white),
                      children: [
                        TextSpan(
                          text: "$category\n",
                          style: TextStyle(
                            fontSize: getProportionateScreenWidth(18),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextSpan(text: "$numOfBrands Brands")
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
