import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class BannerCrousel extends StatefulWidget {
  const BannerCrousel ({Key? key}) : super(key: key);

  @override
  State<BannerCrousel> createState() => _BannerCrouselState();
}

class _BannerCrouselState extends State<BannerCrousel> {
  int _Current = 10;
  final CarouselController _controller = CarouselController();
  List<String> bannerimages = [
    "assets/images/banner_1.jpg",
    "assets/images/banner_2.jpg",
    "assets/images/banner_3.jpg",
    "assets/images/banner_4.jpg",
  ];
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      CarouselSlider(
        items: bannerimages
            .map((item) => Image.asset(
          item,
          fit: BoxFit.cover,
        ))
            .toList(),
        carouselController: _controller,
        options: CarouselOptions(
            autoPlay: true,
            enlargeCenterPage: true,
            aspectRatio: 6.0,
            onPageChanged: (index, reason) {
              setState(() {
                _Current = index;
              });
            }),
      ),
      Positioned.fill(
        bottom: 0,
        left: 0,
        right: 0,
        child: Align(
          alignment: Alignment.bottomCenter,
          child:
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: bannerimages.asMap().entries.map((entry) {
              return GestureDetector(
                onTap: () => _controller.animateToPage(entry.key),
                child: Container(
                  width: 11.0,
                  height: 11.0,
                  margin:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: (Theme.of(context).brightness == Brightness.dark
                          ? Colors.white
                          : Colors.black)
                          .withOpacity(_Current == entry.key ? 0.9 : 0.4)),
                ),
              );
            }).toList(),
          ),
        ),
      ),
    ]);
  }
}
