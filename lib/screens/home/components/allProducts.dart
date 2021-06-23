import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fluid/providers/catalog_provider.dart';
import 'package:fluid/models/AllProducts.dart' as cate;
import 'package:fluid/screens/home/components/section_title.dart';
import 'package:fluid/models/Categories.dart' as cate;
import '../../../size_config.dart';
import 'package:fluid/screens/details/details_screen.dart';
import 'package:fluid/models/Product.dart';
import 'package:fluid/constants.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluid/constants.dart';

class AllProductsSection extends StatefulWidget {
  AllProductsSection({Key key}) : super(key: key);

  @override
  _AllProductsSectionState createState() => _AllProductsSectionState();
}

class _AllProductsSectionState extends State<AllProductsSection> {
  @override
  Widget build(BuildContext context) {
    final productsProvider = Provider.of<CatalogProvider>(context);

    Future<cate.AllProducts> allProducts = productsProvider.getAllProducts();
    return Column(
      children: [
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: SectionTitle(
            title: "All Products",
            press: () {},
          ),
        ),
        SizedBox(height: getProportionateScreenWidth(10)),
        FutureBuilder<cate.AllProducts>(
          builder: (context, snapshot) {
            if (snapshot.data != null) {
              if (snapshot.data.products.length > 0) {
                return SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(children: [
                    ...snapshot.data.products
                        .map((e) => _buildAProd(e, context))
                        .toList(),
                    Icon(
                      Icons.local_mall_rounded,
                      color: kPrimaryColor,
                      size: 70,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 50),
                      child: Text(
                          'We have upload ${productsProvider.productsCount} products, but we are loading every week new products, soon you will be able to see more.'),
                    )
                  ]),
                );
              } else {
                return Text('No hay productos');
              }
            } else {
              return CircularProgressIndicator();
            }
          },
          future: allProducts,
        ),
      ],
    );
  }

  _buildAProd(cate.Products e, BuildContext context) {
    List<String> imagenes = List<String>();
    e.images.forEach((v) {
      imagenes.add(v.src);
    });
    Product producto = Product(
        description: e.shortDescription,
        isInStock: e.isInStock,
        shortDescription: e.shortDescription,
        regularPrice: e.prices.regularPrice,
        fullDescription: e.description,
        images: imagenes,
        price: e.prices.price,
        title: e.name,
        sku: e.sku,
        tags: e.tags,
        colors: List<Color>.generate(5, (index) => Colors.red),
        id: e.id);
    String ruta;
    if (e.images.length > 0) {
      ruta = e.images[0].src;
    } else {
      ruta =
          'https://www.riversideplazashepparton.com.au/wp-content/uploads/2015/10/image-store-placeholder-logo.png';
    }

    //ruta ='https://www.riversideplazashepparton.com.au/wp-content/uploads/2015/10/image-store-placeholder-logo.png';
    print(e.id);
    return Padding(
      padding: EdgeInsets.only(left: getProportionateScreenWidth(0)),
      child: SizedBox(
        width: getProportionateScreenWidth(300),
        child: GestureDetector(
          key: Key(e.id.toString()),
          onTap: () => Navigator.pushNamed(
            context,
            DetailsScreen.routeName,
            arguments: ProductDetailsArguments(product: producto),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AspectRatio(
                aspectRatio: 1.02,
                child: Container(
                  padding: EdgeInsets.all(getProportionateScreenWidth(20)),
                  decoration: BoxDecoration(
                    color: kSecondaryColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child:

                      // Hero(
                      //   tag: e.id.toString(),
                      //   child: Image(
                      // height: 200,
                      // image: NetworkImage(
                      //     e.images[0].src)),
                      //   //child:isImageUrl ? Image.asset(product.images[0]):Image(image: NetworkImage(product.images[0]),),
                      // ),

                      Image(
                    image: NetworkImage(ruta),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Text(
                e.name,
                style: TextStyle(color: Colors.black),
                maxLines: 2,
              ),
              Text(e.sku + ' | ' + e.images.length.toString() + ' more pics'),
              int.parse(e.prices.regularPrice) > int.parse(e.prices.price)
                  ? Text(
                      '\$${e.prices.regularPrice}',
                      style: TextStyle(decoration: TextDecoration.lineThrough),
                    )
                  : SizedBox(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '\$${e.prices.price}',
                    style: TextStyle(
                      fontSize: getProportionateScreenWidth(18),
                      fontWeight: FontWeight.w600,
                      color: kPrimaryColor,
                    ),
                  ),
                  InkWell(
                    borderRadius: BorderRadius.circular(50),
                    onTap: () {},
                    child: Container(
                      padding: EdgeInsets.all(getProportionateScreenWidth(8)),
                      height: getProportionateScreenWidth(28),
                      width: getProportionateScreenWidth(28),
                      decoration: BoxDecoration(
                        color: kPrimaryColor,
                        shape: BoxShape.circle,
                      ),
                      child: SvgPicture.asset(
                        "assets/icons/Heart Icon_2.svg",
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 50,
              )
            ],
          ),
        ),
      ),
    );
  }
}
