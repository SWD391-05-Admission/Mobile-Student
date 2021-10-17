import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:mobile_customer/models/talkshow.dart';
import 'package:mobile_customer/screens/favorite_screen.dart';
import 'package:mobile_customer/values/app_fonts.dart';
import 'package:mobile_customer/values/app_styles.dart';
import 'package:mobile_customer/widgets/talkshow_detail_item.dart';

class BookItem extends StatelessWidget {
  Talkshow talkshow;
  BookItem({this.talkshow});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Column(
        children: [
          SizedBox(
            height: 8,
          ),
          Row(
            children: [
              SizedBox(width: 16),
              Expanded(
                flex: 1,
                child: Container(
                  color: Colors.amber,
                  // height: 80,
                  // width: 80,
                  child: Image.network(
                    talkshow.image,
                    // fit: BoxFit.scaleDown,
                  ),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Speaker : ${talkshow.counselor.fullName}',
                      overflow: TextOverflow.ellipsis,
                      style: AppStyle.bookDetail,
                    ),
                    Text(
                      'Time : ${talkshow.timeStart} - ${talkshow.timeFinish}',
                      overflow: TextOverflow.ellipsis,
                      style: AppStyle.bookDetail,
                    ),
                    Text(
                      'Description : ${talkshow.description}',
                      overflow: TextOverflow.ellipsis,
                      style: AppStyle.bookDetail,
                    ),
                    // Row(children: [
                    //   FlatButton(onPressed: onPressed, child: Text())
                    // ],),
                  ],
                ),
              ),
              SizedBox(width: 16),
            ],
          ),
          // SizedBox(
          //   height: 8,
          // ),
          // Padding(
          //   padding: const EdgeInsets.only(left: 16, right: 16),
          //   child: Divider(),
          // ),
        ],
      ),
      onTap: () {
        Navigator.of(context)
            .pushNamed('/book-detail-screen', arguments: talkshow);
      },
    );
  }
}
