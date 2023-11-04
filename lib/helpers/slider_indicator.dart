import 'package:astrofuse_abhay/services/api_endpoints.dart';
import 'package:carousel_indicator/carousel_indicator.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CarouselWithIndicator extends StatefulWidget {
  final List<String>? images;
  CarouselWithIndicator({required this.images});

  @override
  _CarouselWithIndicatorState createState() => _CarouselWithIndicatorState();
}

class _CarouselWithIndicatorState extends State<CarouselWithIndicator> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Transform.scale(
          scale: 1.0,
          child: CarouselSlider(
            items: widget.images!
                .map((item) => Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: Image.network(
                        "${ApiEndPoints.imageBaseUrl}$item",
                        fit: BoxFit.cover,
                      ),
                    )))
                .toList(),
            options: CarouselOptions(
                viewportFraction: 1,
                enlargeFactor: 1,
                enableInfiniteScroll: false,
                disableCenter: false,
                onPageChanged: (index, reason) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
                autoPlay: false,
                enlargeCenterPage: true,
                animateToClosest: true,
                aspectRatio: 16 / 5),
          ),
        ),
        Positioned.fill(
          top: 13.5.h,
          child: Center(
            child: CarouselIndicator(
              count: widget.images!.length,
              index: _currentIndex,
              color: Colors.grey,
              activeColor: Colors.orange,
              height: 8,
              width: 8,
            ),
          ),
        ),
      ],
    );
  }
}
