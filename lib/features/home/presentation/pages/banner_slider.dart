import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:technical_test_okta/core/domain/entities/popular_movie.dart';
import 'package:technical_test_okta/core/utils/helper.dart';

import '../provider/home_provider.dart';

class BannerSlider extends StatefulWidget {
  final List<PopularMovieData> movieData;
  const BannerSlider({Key? key, required this.movieData}) : super(key: key);

  @override
  State<BannerSlider> createState() => _BannerSliderState();
}

class _BannerSliderState extends State<BannerSlider> {
  @override
  Widget build(BuildContext context) {
    final CarouselController controller = CarouselController();
    final List<Widget> imageSliders = widget.movieData
        .map((item) => Container(
              margin: const EdgeInsets.all(2.0),
              child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(5.0)),
                  child: Image.network(mergeImageUrl(item.backdropPath),
                      fit: BoxFit.cover, width: 1000.0)),
            ))
        .toList();

    return Consumer<HomeProvider>(builder: (context, provider, _) {
      return Column(children: [
        const SizedBox(
          height: 10.0,
        ),
        CarouselSlider(
          items: imageSliders,
          carouselController: controller,
          options: CarouselOptions(
              autoPlay: true,
              enlargeCenterPage: true,
              aspectRatio: 2.5,
              onPageChanged: (index, reason) {
                provider.setCurrent = index;
              }),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: widget.movieData.asMap().entries.map((entry) {
            return GestureDetector(
              onTap: () => controller.animateToPage(entry.key),
              child: Container(
                width: 8.0,
                height: 8.0,
                margin:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: (Theme.of(context).brightness == Brightness.dark
                            ? Colors.white
                            : Colors.black)
                        .withOpacity(
                            provider.current == entry.key ? 0.9 : 0.4)),
              ),
            );
          }).toList(),
        ),
      ]);
    });
  }
}
