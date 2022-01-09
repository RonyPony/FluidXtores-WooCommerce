import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:fluid/constants.dart';

class Carousel<T> extends StatefulWidget {
  final List<T> items;

  const Carousel(this.items, {Key key}) : super(key: key);

  @override
  _CarouselState createState() => _CarouselState();
}

class _CarouselState extends State<Carousel> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: CarouselSlider.builder(
            options: CarouselOptions(
              enlargeStrategy: CenterPageEnlargeStrategy.height,
              viewportFraction: 0.9,
              aspectRatio: 2.5 / 1,
              enlargeCenterPage: true,
              autoPlayInterval: const Duration(seconds: 4),
              onPageChanged: (index, reason) =>
                  setState(() => this.index = index),
            ),
            itemBuilder: (context, index, realIndex) => Card(
                elevation: 0,
                clipBehavior: Clip.antiAlias,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                margin: EdgeInsets.symmetric(horizontal: 4),
                child: Container(
                  width: double.infinity,
                  child: Image.network(
                    widget.items[index],
                    fit: BoxFit.cover,
                  ),
                )),
            itemCount: widget.items.length,
          ),
        ),
        _buildCarouselIndicator()
      ],
    );
  }

  Row _buildCarouselIndicator() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: widget.items.map((url) {
        var index = widget.items.indexOf(url);

        return Container(
          width: index == this.index ? 8 : 6,
          height: index == this.index ? 8 : 6,
          margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: index == this.index ? kSecondaryColor : Colors.red,
          ),
        );
      }).toList(),
    );
  }
}
