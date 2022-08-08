
import 'package:fluidxtores/constants.dart';

import 'package:fluidxtores/models/Product.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductTags extends StatelessWidget {
  const ProductTags({ Key? key,required this.product, }) : super(key: key);
  final Product product;

  @override
  Widget build(BuildContext context) {
    List<String?> tagList=[];
    product.tags?.forEach((element) {
      tagList.add(element.name);
    });

    String? tagsx = tagList.map((e) => '#$e').toString();

    return Row(
            children: [
              product.tags!.isNotEmpty
                  ? Icon(
                      Icons.tag,
                      size: 25,
                      color: kPrimaryColor.withOpacity(.5),
                    )
                  : SizedBox(),
              SizedBox(width: 5),
              Expanded(
                              child: Text(
                  tagsx.replaceAll("[", "").replaceAll("]", ""),
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: kPrimaryColor.withOpacity(0.5)),
                ),
              ),
            ],
          );
  }
}