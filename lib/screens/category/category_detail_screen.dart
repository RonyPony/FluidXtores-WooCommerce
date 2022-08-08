import 'package:fluidxtores/components/coustom_bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fluidxtores/models/category_item.dart';
import 'package:fluidxtores/providers/catalog_provider.dart';
import 'package:fluidxtores/constants.dart';
import '../../enums.dart';
import 'components/body.dart';
import 'components/custom_app_bar.dart';

class CategoryDetailScreen extends StatelessWidget {
  static String routeName = "/categoryDetails";

  @override
  Widget build(BuildContext context) {
    final CatDetailsArguments? agrs = ModalRoute.of(context)!.settings.arguments as CatDetailsArguments?;
    final categoryProvider = Provider.of<CatalogProvider>(context);
    Future<CategoryItem> category = categoryProvider.getACategory(agrs!.catId);

    return Scaffold(
      body: FutureBuilder<CategoryItem>(
          future: category,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Scaffold(
                backgroundColor: const Color(0xFFF5F6F9),
                appBar: CustomAppBar(agrs.catId.toDouble(),preferredSize: MediaQuery.of(context).size,child: const SizedBox()),
                body: Body(category: snapshot.data!),
              );
            } else {
              return Column(
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  Center(
                    child: const Padding(
                      padding: EdgeInsets.only(top: 200),
                      child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation(kPrimaryColor),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    'Loading this category information',
                    style: TextStyle(color: kPrimaryColor),
                  )
                ],
              );
            }
          }),
      bottomNavigationBar: const CustomBottomNavBar(selectedMenu: MenuState.home),
    );
  }
}

class CatDetailsArguments {
  final int catId;

  CatDetailsArguments({required this.catId});
}
