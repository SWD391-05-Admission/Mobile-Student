import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:mobile_customer/models/talkshow.dart';

class CarouselWidget extends StatelessWidget {
  List<Talkshow> listTalkshow = Talkshow.createListTalkshow();

  List<Widget> getListAds(BuildContext context) {
    List<Widget> list = [];
    for (int i = 0; i < 3; i++) {
      list.add(
        GestureDetector(
          child: Image.network(
            listTalkshow[i].image,
            fit: BoxFit.cover,
          ),
          onTap: () {
            Navigator.of(context).pushNamed('/talkshow-detail-screen',
                arguments: listTalkshow[i]);
          },
        ),
      );
    }
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ClipRRect(
        // borderRadius: BorderRadius.circular(5),
        child: ImageSlideshow(
          width: double.infinity,
          height: 200,
          initialPage: 0,
          // indicatorColor: Color(0xFF00CCFF),
          indicatorColor: Colors.white,
          indicatorBackgroundColor: Colors.grey,
          onPageChanged: (value) {
            // debugPrint('Page changed: $value');
          },
          autoPlayInterval: 3000,
          isLoop: true,
          children: [
            ...getListAds(context),
          ],
        ),
      ),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            // offset: Offset(1.0, 2.0),
            blurRadius: 8,
            color: Color(0xFF888888),
          ),
        ],
      ),
    );
  }
}
