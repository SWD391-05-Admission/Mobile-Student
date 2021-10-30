import 'package:flutter/material.dart';
import '../models/talkshow.dart';
import '../values/app_fonts.dart';
import '../values/app_styles.dart';
import '../widgets/search_widget.dart';

class GetListTalkshow {
  List<Widget> getListTalkshow(
      List<Talkshow> list, double sizeHeight, BuildContext context) {
    List<Widget> listWidget = [];
    // listWidget.add(SearchWidget(nameSearch: 'talkshow'));
    listWidget.add(SizedBox(height: sizeHeight * 0.015));
    listWidget.add(
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 170),
        child: Divider(
          color: Colors.black38,
        ),
      ),
    );
    listWidget.add(SizedBox(height: sizeHeight * 0.015));
    for (int i = 0; i < list.length; i++) {
      listWidget.add(
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              GestureDetector(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 7,
                        color: Color(0xFFBBBBBB),
                      )
                    ],
                    border: Border.all(width: 0.05, color: Colors.black),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        // borderRadius: BorderRadius.circular(4.0),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(4),
                          topRight: Radius.circular(4),
                        ),
                        child: Image.network(list[i].image),
                      ),
                      SizedBox(
                        height: sizeHeight * 0.01,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: Text(
                          '${list[i].description}',
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: AppStyle.bookDetail,
                        ),
                      ),
                      SizedBox(
                        height: sizeHeight * 0.003,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: RichText(
                          text: TextSpan(
                            text: 'Counselor : ',
                            style: AppStyle.bookDetail.copyWith(
                              color: Colors.black,
                            ),
                            children: <TextSpan>[
                              TextSpan(
                                text: '${list[i].counselor.fullName}',
                                style: TextStyle(
                                  fontFamily: AppFonts.poppins,
                                  fontSize: 12,
                                  shadows: [
                                    Shadow(
                                      // offset: Offset(1.0, 1.0),
                                      blurRadius: 8,
                                      color: Color(0xFF999999),
                                    ),
                                  ],
                                  fontWeight: FontWeight.bold,
                                  // fontStyle: FontStyle.italic,
                                ),
                              ),
                              // TextSpan(text: ' world!'),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: sizeHeight * 0.003,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: RichText(
                          text: TextSpan(
                            text: 'Date time : ',
                            style: AppStyle.bookDetail.copyWith(
                              color: Colors.black,
                            ),
                            children: <TextSpan>[
                              TextSpan(
                                text:
                                    'at ${list[i].timeStart} - ${list[i].timeFinish} ${list[i].date}',
                                style: TextStyle(
                                  fontFamily: AppFonts.poppins,
                                  fontSize: 12,
                                  shadows: [
                                    Shadow(
                                      // offset: Offset(1.0, 1.0),
                                      blurRadius: 8,
                                      color: Color(0xFF999999),
                                    ),
                                  ],
                                  fontWeight: FontWeight.bold,
                                  // fontStyle: FontStyle.italic,
                                ),
                              ),
                              // TextSpan(text: ' world!'),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: sizeHeight * 0.003,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: RichText(
                          text: TextSpan(
                            text: 'Major : ',
                            style: AppStyle.bookDetail.copyWith(
                              color: Colors.black,
                            ),
                            children: <TextSpan>[
                              TextSpan(
                                text: '${list[i].major.name}',
                                style: TextStyle(
                                  fontFamily: AppFonts.poppins,
                                  fontSize: 12,
                                  shadows: [
                                    Shadow(
                                      // offset: Offset(1.0, 1.0),
                                      blurRadius: 8,
                                      color: Color(0xFF999999),
                                    ),
                                  ],
                                  fontWeight: FontWeight.bold,
                                  // fontStyle: FontStyle.italic,
                                ),
                              ),
                              // TextSpan(text: ' world!'),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: sizeHeight * 0.003,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: Row(
                          children: [
                            RichText(
                              text: TextSpan(
                                text: 'Price : ',
                                style: AppStyle.bookDetail.copyWith(
                                  color: Colors.black,
                                ),
                                children: <TextSpan>[
                                  TextSpan(
                                    text: '${list[i].price}',
                                    style: TextStyle(
                                      fontFamily: AppFonts.poppins,
                                      fontSize: 12,
                                      shadows: [
                                        Shadow(
                                          // offset: Offset(1.0, 1.0),
                                          blurRadius: 8,
                                          color: Color(0xFF999999),
                                        ),
                                      ],
                                      fontWeight: FontWeight.bold,
                                      // fontStyle: FontStyle.italic,
                                    ),
                                  ),
                                  // TextSpan(text: ' world!'),
                                ],
                              ),
                            ),
                            Expanded(child: SizedBox()),
                            GestureDetector(
                              child: Text(
                                'See Detail >>',
                                style: AppStyle.bookDetail,
                              ),
                              onTap: () {
                                Navigator.of(context).pushNamed(
                                    '/talkshow-detail-screen',
                                    arguments: list[i]);
                              },
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: sizeHeight * 0.01,
                      ),
                    ],
                  ),
                ),
                onTap: () {
                  Navigator.of(context)
                      .pushNamed('/talkshow-detail-screen', arguments: list[i]);
                },
              ),
              SizedBox(height: sizeHeight * 0.02),
            ],
          ),
        ),
      );
    }
    return listWidget;
  }
}
