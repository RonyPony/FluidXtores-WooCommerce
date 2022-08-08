import 'package:flutter/material.dart';
import 'package:fluidxtores/components/carousel.dart';
import 'package:fluidxtores/helper/other_helpers.dart';
import 'package:fluidxtores/providers/advertisement_provider.dart';

import '../../../models/FluidXstores_media.dart';


class MainBanner extends StatefulWidget {
  static String routeName = '/home';
  const MainBanner({Key? key}) : super(key: key);

  @override
  _MainBannerState createState() => _MainBannerState();
}

class _MainBannerState extends State<MainBanner>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  Future<List<fluidxtoresMedia>>? _advertisement;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return _buildAdvertisementCarousel();
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () => initialize());
    var y = getProvider<AdvertisementProvider>(listen: false, context: context);
    _advertisement = y.getAll();
  }

  void initialize() async {}

  Widget _buildAdvertisementCarousel() {
    return FutureBuilder(
      future: _advertisement,
      builder: (BuildContext context,
          AsyncSnapshot<List<fluidxtoresMedia>> snapshot) {
        if (!snapshot.hasData) return SizedBox();

        if (snapshot.hasError)
          return Container(
            child: Text(
              'loadCouldNotBePossibleMessage',
            ),
          );

        final advertisementImageUrls =
            snapshot.data!.map((e) => e.guid!.rendered).toList();
        return Carousel(advertisementImageUrls);
      },
    );
  }
}
