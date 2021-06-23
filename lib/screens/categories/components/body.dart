import 'package:flutter/material.dart';
import 'package:fluid/components/default_button.dart';
import 'package:fluid/screens/category/category_detail_screen.dart';
import 'package:fluid/size_config.dart';
import 'top_rounded_container.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:fluid/models/Categories.dart' as cate;
import 'package:fluid/providers/catalog_provider.dart';

class Body extends StatelessWidget {
  const Body({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final categoryProvider = Provider.of<CatalogProvider>(context);
    Future<cate.AllCategories> allCategories =
        categoryProvider.getAllCategories();
    return ListView(
      children: [
        Column(
          children: [
            Column(
              children: [
                TopRoundedContainer(
                  color: Colors.white,
                  child: Padding(
                    padding: EdgeInsets.only(
                      left: SizeConfig.screenWidth * 0.15,
                      right: SizeConfig.screenWidth * 0.15,
                      bottom: getProportionateScreenWidth(40),
                      top: getProportionateScreenWidth(15),
                    ),
                    child: Column(
                      children: [
                        SizedBox(height: getProportionateScreenWidth(10)),
                        FutureBuilder<cate.AllCategories>(
                          builder: (context, snapshot) {
                            if (snapshot.data != null &&
                                snapshot.data.categories.length > 0) {
                              return SingleChildScrollView(
                                scrollDirection: Axis.vertical,
                                child: Column(
                                  children: [
                                    ...snapshot.data.categories
                                        .map((e) => _buildAcat(e, context))
                                        .toList(),
                                  ],
                                ),
                              );
                            } else {
                              return CircularProgressIndicator();
                            }
                          },
                          future: allCategories,
                        ),
                        DefaultButton(
                          text: "Go back",
                          icon: Icon(
                            Icons.arrow_back_ios_rounded,
                            color: Colors.white,
                          ),
                          press: () {
                            Navigator.pop(context);
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}

_buildAcat(cate.Categories e, BuildContext context) {
  return Column(
    children: [
      CategoryCard(
          category: e.name,
          image:
              'https://i.pinimg.com/736x/f5/e3/9b/f5e39b4d6b6dcd0ddb5c5d26b1e84ca5.jpg',
          numOfBrands: e.id,
          press: () {
            Navigator.pushNamed(context, CategoryDetailScreen.routeName,
                arguments: CatDetailsArguments(catId: e.id));
          }),
      SizedBox(
        height: 30,
      )
    ],
  );
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
      padding: EdgeInsets.only(),
      child: GestureDetector(
        onTap: press,
        child: SizedBox(
          width: getProportionateScreenWidth(300),
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
