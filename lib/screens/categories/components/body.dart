// ignore_for_file: import_of_legacy_library_into_null_safe

import 'package:flutter/material.dart';
import 'package:fluidxtores/components/default_button.dart';
import 'package:fluidxtores/screens/category/category_detail_screen.dart';
import 'package:fluidxtores/size_config.dart';
import 'package:provider/provider.dart';
import '../../../constants.dart';
import 'top_rounded_container.dart';
import 'package:fluidxtores/models/Categories.dart' as cate;
import 'package:fluidxtores/providers/catalog_provider.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

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
                      left: SizeConfig.screenWidth! * 0.15,
                      right: SizeConfig.screenWidth! * 0.15,
                      bottom: getProportionateScreenWidth(40),
                      top: getProportionateScreenWidth(15),
                    ),
                    child: Column(
                      children: [
                        SizedBox(height: getProportionateScreenWidth(10)),
                        FutureBuilder<cate.AllCategories>(
                          builder: (context, snapshot) {
                            if (snapshot.data != null &&
                                snapshot.data!.categories!.isNotEmpty) {
                              return SingleChildScrollView(
                                scrollDirection: Axis.vertical,
                                child: Column(
                                  children: [
                                    ...?snapshot.data?.categories
                                        ?.map((e) => _buildAcat(e, context))
                                        .toList(),
                                  ],
                                ),
                              );
                            } else {
                              if (snapshot.connectionState ==
                                      ConnectionState.done &&
                                  snapshot.data!.categories?.length == 0) {
                                return Column(
                                  children: [
                                    SizedBox(
                                      height: 50,
                                    ),
                                    Icon(
                                      Icons.category_rounded,
                                      color: kPrimaryColor.withOpacity(0.3),
                                      size: 80,
                                    ),
                                    Center(
                                      child: Text(
                                        'Ups!',
                                        style: TextStyle(
                                          fontSize: 30,
                                          color: kPrimaryColor.withOpacity(0.5),
                                        ),
                                      ),
                                    ),
                                    Center(
                                      child: Text(
                                        'There are not categories to show',
                                        style: TextStyle(
                                          color: kPrimaryColor.withOpacity(1),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 50,
                                    ),
                                  ],
                                );
                              } else {
                                return Column(
                                  children: [
                                    Center(
                                      child: CircularProgressIndicator(
                                        valueColor: AlwaysStoppedAnimation(
                                            kPrimaryColor),
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
          image: e.image == null
              ? 'https://i.pinimg.com/736x/f5/e3/9b/f5e39b4d6b6dcd0ddb5c5d26b1e84ca5.jpg'
              : e.image?.src,
          numOfBrands: e.id!,
          press: () {
            Navigator.pushNamed(context, CategoryDetailScreen.routeName,
                arguments: CatDetailsArguments(catId: e.id!));
          }),
      SizedBox(
        height: 30,
      )
    ],
  );
}

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    Key? key,
    required this.category,
    required this.image,
    required this.numOfBrands,
    required this.press,
  }) : super(key: key);

  final String? category, image;
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
                  image: NetworkImage(image!),
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
