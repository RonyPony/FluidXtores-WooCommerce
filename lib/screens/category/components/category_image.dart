import 'package:flutter/material.dart';
import 'package:fluid/models/category_item.dart' as ko;
import '../../../constants.dart';
import '../../../size_config.dart';

class CategoryImage extends StatefulWidget {
  const CategoryImage({
    Key key,
    @required this.category,
  }) : super(key: key);

  final ko.CategoryItem category;

  @override
  _CategoryImageState createState() => _CategoryImageState();
}

class _CategoryImageState extends State<CategoryImage> {
  int selectedImage = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: getProportionateScreenWidth(238),
          child: AspectRatio(
            aspectRatio: 1,
            child: Hero(
              tag: widget.category.id.toString(),
              child: widget.category.image != null
                  ? Image(image: NetworkImage(widget.category.image.src))
                  : Center(
                      child: Text('No hay imagen disponible'),
                    ),
            ),
          ),
        ),
      ],
    );
  }

  GestureDetector buildSmallProductPreview(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedImage = index;
        });
      },
      child: AnimatedContainer(
        duration: defaultDuration,
        margin: EdgeInsets.only(right: 15),
        padding: EdgeInsets.all(8),
        height: getProportionateScreenWidth(48),
        width: getProportionateScreenWidth(48),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
              color: kPrimaryColor.withOpacity(selectedImage == index ? 1 : 0)),
        ),
        child: Image(image: NetworkImage(widget.category.image.src)),
      ),
    );
  }
}
