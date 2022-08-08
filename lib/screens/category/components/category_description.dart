import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:fluidxtores/models/category_item.dart';

import '../../../size_config.dart';

class CategoryDescription extends StatelessWidget {
  const CategoryDescription({
    Key? key,
    required this.category,
    required this.pressOnSeeMore,
  }) : super(key: key);

  final CategoryItem category;
  final GestureTapCallback pressOnSeeMore;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: Text(
            category.name!,
            style: Theme.of(context).textTheme.headline6,
          ),
        ),
        SizedBox(
          height: getProportionateScreenWidth(50),
        ),
        Padding(
            padding: EdgeInsets.only(
              left: getProportionateScreenWidth(20),
              right: getProportionateScreenWidth(64),
            ),
            child: Html(data: category.description)),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: getProportionateScreenWidth(20),
            vertical: 10,
          ),
          child: GestureDetector(
            onTap: () {
              pressOnSeeMore();
            },
            child: Row(
              children: [
                SizedBox(width: 5),
              ],
            ),
          ),
        )
      ],
    );
  }
}
