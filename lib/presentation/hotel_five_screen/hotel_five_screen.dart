import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:kuddle_s_application27/core/app_export.dart';
import '../../widgets/custom_image_view.dart';

class HotelFive extends StatefulWidget {
  const HotelFive({Key? key}) : super(key: key);

  get property => null;

  @override
  State<HotelFive> createState() => _HotelFiveState();
}

class _HotelFiveState extends State<HotelFive> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }

  int _currentIndex = 0;

  Widget _buildSeventyFour(BuildContext context) {
    final List<String> imageUrls = [
      '${widget.property.propertyPic1}',
      '${widget.property.propertyPic2}',
      '${widget.property.propertyPic3}',
      // Add other image URLs as needed
    ];

    return Align(
      alignment: Alignment.topCenter,
      child: Column(
        children: [
          CarouselSlider.builder(
            itemCount: imageUrls.length,
            itemBuilder: (BuildContext context, int index, int realIndex) {
              return CustomImageView(
                imagePath: imageUrls[index],
                height: 311.v,
                width: 430.h,
                radius: BorderRadius.circular(15.h),
                alignment: Alignment.center,
              );
            },
            options: CarouselOptions(
              height: 311.v,
              viewportFraction: 1.0,
              onPageChanged: (index, reason) {
                setState(() {
                  _currentIndex = index;
                });
              },
              autoPlay: true,
              autoPlayInterval: Duration(
                  seconds: 3), // Set the interval for automatic sliding
              autoPlayAnimationDuration: Duration(milliseconds: 800),
              autoPlayCurve: Curves.fastOutSlowIn,
              enableInfiniteScroll: true,
            ),
          ),
          DotsIndicator(
            dotsCount: imageUrls.length,
            position: _currentIndex,
            decorator: DotsDecorator(
              size: const Size.square(8.0),
              activeSize: const Size(18.0, 8.0),
              activeShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
