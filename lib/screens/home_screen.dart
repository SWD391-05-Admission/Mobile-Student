import 'dart:convert';
import 'dart:developer';

// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mobile_customer/models/counselor.dart';
import 'package:mobile_customer/models/talkshow.dart';
import 'package:mobile_customer/models/university.dart';
import 'package:mobile_customer/models/user.dart';
import 'package:mobile_customer/providers/auth.dart';
import 'package:mobile_customer/values/app_colors.dart';
import 'package:mobile_customer/values/app_fonts.dart';
import 'package:mobile_customer/values/app_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:mobile_customer/widgets/carousel_widget.dart';
import 'package:http/http.dart' as http;
import 'package:mobile_customer/widgets/search_widget.dart';
import 'package:mobile_customer/widgets/talkshow_detail_item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen();
  static const routeName = '/home';
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final searchController = TextEditingController();
  String areaDropdow = '',
      typeDropdown = '',
      degreeDropdown = '',
      industryDropdown = '';
  List<Talkshow> listTalkshow = [];
  List<User> listConsultant = [];
  List<University> listUniversity = [];

  final controller = TextEditingController();
  PageController _pageController;
  int _currentIndex = 0;

  @override
  void initState() {
    _pageController = PageController(
      viewportFraction: 0.95,
    );
    super.initState();
  }

  bool isTalkshow = true, isConsultant = false, isUniversity = false;

  List<Widget> getListTalkshow(List<Talkshow> list, double sizeHeight) {
    List<Widget> listWidget = [];
    listWidget.add(SearchWidget(nameSearch: 'talkshow'));
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
                      // Padding(
                      //   padding: const EdgeInsets.only(left: 10, right: 10),
                      //   child: Text(
                      //     'Counselor : ${list[i].counselor.fullName}',
                      //     overflow: TextOverflow.ellipsis,
                      //     style: AppStyle.bookDetail,
                      //   ),
                      // ),
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
                      // Padding(
                      //   padding: const EdgeInsets.only(left: 10, right: 10),
                      //   child: Text(
                      //     'Price : ${list[i].price.toString()}',
                      //     maxLines: 2,
                      //     overflow: TextOverflow.ellipsis,
                      //     style: AppStyle.bookDetail,
                      //   ),
                      // ),
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
                      // Padding(
                      //   padding: const EdgeInsets.only(left: 10, right: 10),
                      //   child: Text(
                      //     'Major : ${list[i].major.name}',
                      //     overflow: TextOverflow.ellipsis,
                      //     style: AppStyle.bookDetail,
                      //   ),
                      // ),
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
                      // Padding(
                      //   padding: const EdgeInsets.only(left: 10, right: 10),
                      //   child: Text(
                      //     'Date time : ${list[i].timeStart} - ${list[i].timeFinish} ${list[i].date}',
                      //     maxLines: 2,
                      //     overflow: TextOverflow.ellipsis,
                      //     style: AppStyle.bookDetail,
                      //   ),
                      // ),
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
              SizedBox(height: sizeHeight * 0.045),
            ],
          ),
        ),
      );
    }
    return listWidget;
  }

  // List<Widget> getListConsultant(List<User> list, double sizeHeight) {
  //   List<Widget> listWidget = [];
  //   listWidget.add(SearchWidget(nameSearch: 'consultant'));
  //   listWidget.add(SizedBox(height: sizeHeight * 0.015));
  //   listWidget.add(
  //     Padding(
  //       padding: const EdgeInsets.symmetric(horizontal: 170),
  //       child: Divider(
  //         color: Colors.black38,
  //       ),
  //     ),
  //   );
  //   listWidget.add(SizedBox(height: sizeHeight * 0.015));
  //   for (int i = 0; i < list.length; i++) {
  //     listWidget.add(
  //       Padding(
  //         padding: const EdgeInsets.symmetric(horizontal: 15),
  //         child: Column(
  //           children: [
  //             GestureDetector(
  //               child: Container(
  //                 decoration: BoxDecoration(
  //                   borderRadius: BorderRadius.circular(5),
  //                   color: Colors.white,
  //                   boxShadow: [
  //                     BoxShadow(
  //                       blurRadius: 7,
  //                       color: Color(0xFFBBBBBB),
  //                     )
  //                   ],
  //                   border: Border.all(width: 0.05, color: Colors.black),
  //                 ),
  //                 child: Column(
  //                   children: [
  //                     ClipRRect(
  //                       // borderRadius: BorderRadius.circular(4.0),
  //                       borderRadius: BorderRadius.only(
  //                           topLeft: Radius.circular(4),
  //                           topRight: Radius.circular(4)),
  //                       child: Image.network(list[i].image),
  //                     ),
  //                     Text(list[i].description),
  //                     Text(list[i].address),
  //                     Text(list[i].email),
  //                     Text(list[i].fullName),
  //                     Text(list[i].gender),
  //                     Text(list[i].phone),
  //                   ],
  //                 ),
  //               ),
  //               onTap: () {
  //                 Navigator.of(context).pushNamed('/consultant-detail-screen',
  //                     arguments: list[i]);
  //               },
  //             ),
  //             SizedBox(height: sizeHeight * 0.04),
  //           ],
  //         ),
  //       ),
  //     );
  //   }
  //   return listWidget;
  // }
  List<Widget> getListCounselor(List<Counselor> list, double sizeHeight) {
    List<Widget> listWidget = [];
    listWidget.add(SearchWidget(nameSearch: 'counselor'));
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
                      // Padding(
                      //   padding: const EdgeInsets.only(left: 10, right: 10),
                      //   child: Text(
                      //     'Counselor : ${list[i].counselor.fullName}',
                      //     overflow: TextOverflow.ellipsis,
                      //     style: AppStyle.bookDetail,
                      //   ),
                      // ),
                      SizedBox(
                        height: sizeHeight * 0.003,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: RichText(
                          text: TextSpan(
                            text: 'Name : ',
                            style: AppStyle.bookDetail.copyWith(
                              color: Colors.black,
                            ),
                            children: <TextSpan>[
                              TextSpan(
                                text: '${list[i].fullName}',
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
                      // Padding(
                      //   padding: const EdgeInsets.only(left: 10, right: 10),
                      //   child: Text(
                      //     'Price : ${list[i].price.toString()}',
                      //     maxLines: 2,
                      //     overflow: TextOverflow.ellipsis,
                      //     style: AppStyle.bookDetail,
                      //   ),
                      // ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: RichText(
                          text: TextSpan(
                            text: 'Email : ',
                            style: AppStyle.bookDetail.copyWith(
                              color: Colors.black,
                            ),
                            children: <TextSpan>[
                              TextSpan(
                                text: '${list[i].email}',
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
                      // Padding(
                      //   padding: const EdgeInsets.only(left: 10, right: 10),
                      //   child: Text(
                      //     'Major : ${list[i].major.name}',
                      //     overflow: TextOverflow.ellipsis,
                      //     style: AppStyle.bookDetail,
                      //   ),
                      // ),

                      Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: RichText(
                          text: TextSpan(
                            text: 'Address : ',
                            style: AppStyle.bookDetail.copyWith(
                              color: Colors.black,
                            ),
                            children: <TextSpan>[
                              TextSpan(
                                text: '${list[i].address}',
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
                      // Padding(
                      //   padding: const EdgeInsets.only(left: 10, right: 10),
                      //   child: Text(
                      //     'Date time : ${list[i].timeStart} - ${list[i].timeFinish} ${list[i].date}',
                      //     maxLines: 2,
                      //     overflow: TextOverflow.ellipsis,
                      //     style: AppStyle.bookDetail,
                      //   ),
                      // ),
                      SizedBox(
                        height: sizeHeight * 0.003,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: Row(
                          children: [
                            RichText(
                              text: TextSpan(
                                text: 'Phone : ',
                                style: AppStyle.bookDetail.copyWith(
                                  color: Colors.black,
                                ),
                                children: <TextSpan>[
                                  TextSpan(
                                    text: '${list[i].phone}',
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
                                    '/counselor-detail-screen',
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
                  Navigator.of(context).pushNamed('/counselor-detail-screen',
                      arguments: list[i]);
                },
              ),
              SizedBox(height: sizeHeight * 0.045),
            ],
          ),
        ),
      );
    }
    return listWidget;
  }

  // List<Widget> getListUniversity(List<University> list, double sizeHeight) {
  //   List<Widget> listWidget = [];
  //   listWidget.add(SearchWidget(nameSearch: 'university'));
  //   listWidget.add(SizedBox(height: sizeHeight * 0.015));
  //   listWidget.add(
  //     Padding(
  //       padding: const EdgeInsets.symmetric(horizontal: 170),
  //       child: Divider(
  //         color: Colors.black38,
  //       ),
  //     ),
  //   );
  //   listWidget.add(SizedBox(height: sizeHeight * 0.015));
  //   for (int i = 0; i < list.length; i++) {
  //     listWidget.add(
  //       Padding(
  //         padding: const EdgeInsets.symmetric(horizontal: 15),
  //         child: Column(
  //           children: [
  //             GestureDetector(
  //               child: Container(
  //                 decoration: BoxDecoration(
  //                   borderRadius: BorderRadius.circular(5),
  //                   color: Colors.white,
  //                   boxShadow: [
  //                     BoxShadow(
  //                       blurRadius: 7,
  //                       color: Color(0xFFBBBBBB),
  //                     )
  //                   ],
  //                   border: Border.all(width: 0.05, color: Colors.black),
  //                 ),
  //                 child: Column(
  //                   children: [
  //                     ClipRRect(
  //                       // borderRadius: BorderRadius.circular(4.0),
  //                       borderRadius: BorderRadius.only(
  //                           topLeft: Radius.circular(4),
  //                           topRight: Radius.circular(4)),
  //                       child: Image.network(list[i].image),
  //                     ),
  //                     Text(list[i].description),
  //                     Text(list[i].code),
  //                     Text(list[i].email),
  //                     Text(list[i].facebook),
  //                     Text(list[i].website),
  //                     Text(list[i].name),
  //                   ],
  //                 ),
  //               ),
  //               onTap: () {
  //                 Navigator.of(context).pushNamed('/university-detail-screen',
  //                     arguments: list[i]);
  //               },
  //             ),
  //             SizedBox(height: sizeHeight * 0.04),
  //           ],
  //         ),
  //       ),
  //     );
  //   }
  //   return listWidget;
  // }
  List<Widget> getListUniversity(List<University> list, double sizeHeight) {
    List<Widget> listWidget = [];
    listWidget.add(SearchWidget(nameSearch: 'university'));
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
                      // Padding(
                      //   padding: const EdgeInsets.only(left: 10, right: 10),
                      //   child: Text(
                      //     'Counselor : ${list[i].counselor.fullName}',
                      //     overflow: TextOverflow.ellipsis,
                      //     style: AppStyle.bookDetail,
                      //   ),
                      // ),
                      SizedBox(
                        height: sizeHeight * 0.003,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: RichText(
                          text: TextSpan(
                            text: 'University code : ',
                            style: AppStyle.bookDetail.copyWith(
                              color: Colors.black,
                            ),
                            children: <TextSpan>[
                              TextSpan(
                                text: '${list[i].code}',
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
                      // Padding(
                      //   padding: const EdgeInsets.only(left: 10, right: 10),
                      //   child: Text(
                      //     'Price : ${list[i].price.toString()}',
                      //     maxLines: 2,
                      //     overflow: TextOverflow.ellipsis,
                      //     style: AppStyle.bookDetail,
                      //   ),
                      // ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: RichText(
                          text: TextSpan(
                            text: 'Name : ',
                            style: AppStyle.bookDetail.copyWith(
                              color: Colors.black,
                            ),
                            children: <TextSpan>[
                              TextSpan(
                                text: '${list[i].name}',
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
                      // Padding(
                      //   padding: const EdgeInsets.only(left: 10, right: 10),
                      //   child: Text(
                      //     'Major : ${list[i].major.name}',
                      //     overflow: TextOverflow.ellipsis,
                      //     style: AppStyle.bookDetail,
                      //   ),
                      // ),

                      Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: RichText(
                          text: TextSpan(
                            text: 'Email : ',
                            style: AppStyle.bookDetail.copyWith(
                              color: Colors.black,
                            ),
                            children: <TextSpan>[
                              TextSpan(
                                text: '${list[i].email}',
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
                      // Padding(
                      //   padding: const EdgeInsets.only(left: 10, right: 10),
                      //   child: Text(
                      //     'Date time : ${list[i].timeStart} - ${list[i].timeFinish} ${list[i].date}',
                      //     maxLines: 2,
                      //     overflow: TextOverflow.ellipsis,
                      //     style: AppStyle.bookDetail,
                      //   ),
                      // ),
                      SizedBox(
                        height: sizeHeight * 0.003,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: Row(
                          children: [
                            RichText(
                              text: TextSpan(
                                text: 'Facebook : ',
                                style: AppStyle.bookDetail.copyWith(
                                  color: Colors.black,
                                ),
                                children: <TextSpan>[
                                  TextSpan(
                                    text: '${list[i].facebook}',
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
                                    '/university-detail-screen',
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
                  Navigator.of(context).pushNamed('/university-detail-screen',
                      arguments: list[i]);
                },
              ),
              SizedBox(height: sizeHeight * 0.045),
            ],
          ),
        ),
      );
    }
    return listWidget;
  }

  @override
  Widget build(BuildContext context) {
    final double _sizeHeight = MediaQuery.of(context).size.height -
        MediaQuery.of(context).padding.top -
        MediaQuery.of(context).padding.bottom;
    final double _sizeWidth = MediaQuery.of(context).size.width -
        MediaQuery.of(context).padding.left -
        MediaQuery.of(context).padding.right;
    List<University> listUniversity = [];
    listUniversity = University.createListUniversity();
    List<Talkshow> listTalkshow = [];
    listTalkshow = Talkshow.createListTalkshow();
    List<Counselor> listCounselor = [];
    listCounselor = Counselor.createListCounselor();
    // final universityData = Provider.of<Universities>(context);
    // final universities = universityData.items;
    // ================================================
    // return ListView(
    //   children: [
    //     CarouselWidget(),
    //     SizedBox(
    //       height: _sizeHeight * 0.028,
    //     ),
    //     Padding(
    //       padding: const EdgeInsets.symmetric(horizontal: 15),
    //       child: Row(
    //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //         children: [
    //           Expanded(
    //             child: GestureDetector(
    //               child: Container(
    //                 child: Padding(
    //                   padding: const EdgeInsets.only(
    //                       left: 10, right: 10, top: 6, bottom: 6),
    //                   child: Text(
    //                     'Talkshows',
    //                     textAlign: TextAlign.center,
    //                     style: AppStyle.typeSearch,
    //                   ),
    //                 ),
    //                 decoration: BoxDecoration(
    //                   borderRadius: BorderRadius.circular(5),
    //                   boxShadow: [
    //                     BoxShadow(
    //                       // offset: Offset(1.0, 1.0),
    //                       blurRadius: 8,
    //                       color: Color(0xFF999999).withOpacity(0.5),
    //                     )
    //                   ],
    //                   // color: Color(0xFF4DF2E1),
    //                   color: Colors.white,
    //                 ),
    //               ),
    //               onTap: () {
    //                 Navigator.of(context).pushNamed('/search-talkshow-screen');
    //                 // final user = FirebaseAuth.instance.currentUser;
    //                 // String tmpToken;
    //                 // user.getIdTokenResult().then((value) {
    //                 //   Future<void> getData() async {
    //                 //     String url = 'http://20.89.111.129/api/Login';
    //                 //     Uri uri = Uri.parse(url);

    //                 //     Map<String, String> headers = {
    //                 //       'token': '${value.token}'
    //                 //     };
    //                 //     http.Response res =
    //                 //         await http.get(uri, headers: headers);
    //                 //     // log('TOKEN TRONG FUTURE NE: $tmpToken');
    //                 //     // log('HEADER NE: ${headers.toString()}');
    //                 //     log('response nè: ${res.body}');
    //                 //     // log('STATUS CODE NEF: ${res.statusCode}');
    //                 //     final tmp = jsonDecode(res.body);
    //                 //     setState(() {
    //                 //       tmp1 = tmp;
    //                 //     });
    //                 //     log('HIHIHIHIHIHI ${tmp['token']['result']}');
    //                 //   }

    //                 //   getData();

    //                 //   log('ACCESS TOKEN NEF: $tmpToken');
    //                 // });
    //                 // log('TOKEN NGOAIF FUTURE: $tmpToken');
    //                 // Authen().authen();
    //               },
    //             ),
    //           ),
    //           SizedBox(width: _sizeWidth * 1 / 40),
    //           Expanded(
    //             child: GestureDetector(
    //               child: Container(
    //                 child: Padding(
    //                   padding: const EdgeInsets.only(
    //                       left: 10, right: 10, top: 6, bottom: 6),
    //                   child: Text(
    //                     'Consultants',
    //                     textAlign: TextAlign.center,
    //                     style: AppStyle.typeSearch,
    //                   ),
    //                 ),
    //                 decoration: BoxDecoration(
    //                   borderRadius: BorderRadius.circular(5),
    //                   boxShadow: [
    //                     BoxShadow(
    //                       // offset: Offset(1.0, 1.0),
    //                       blurRadius: 8,
    //                       color: Color(0xFF999999).withOpacity(0.5),
    //                     )
    //                   ],
    //                   // color: Color(0xFF2DE2ED),
    //                   color: Colors.white,
    //                 ),
    //               ),
    //               onTap: () {
    //                 Navigator.of(context)
    //                     .pushNamed('/search-consultant-screen');
    //                 // Future<void> getPost() async {
    //                 //   String url = 'http://20.89.111.129/api/Login/Post';
    //                 //   Uri uri = Uri.parse(url);
    //                 //   log('BODY NE $tmp1');
    //                 //   Map<String, String> headers = {
    //                 //     'Authorization': 'Bearer ${tmp1['token']['result']}'
    //                 //   };
    //                 //   http.Response res =
    //                 //       await http.post(uri, headers: headers);
    //                 //   log('STATUS ${res.statusCode}');
    //                 //   // log('TOKEN TRONG FUTURE NE: $tmpToken');
    //                 //   // log('HEADER NE: ${headers.toString()}');
    //                 //   log('response nè: ${res.body}');
    //                 //   // log('STATUS CODE NEF: ${res.statusCode}');
    //                 //   // final tmp = jsonDecode(res.body);
    //                 //   // log('BODYYYYYYYYYYY $tmp');
    //                 // }

    //                 // getPost();
    //               },
    //             ),
    //           ),
    //           SizedBox(width: _sizeWidth * 1 / 40),
    //           Expanded(
    //             child: GestureDetector(
    //               child: Container(
    //                 child: Padding(
    //                   padding: const EdgeInsets.only(
    //                       left: 10, right: 10, top: 6, bottom: 6),
    //                   child: Text(
    //                     'Universities',
    //                     textAlign: TextAlign.center,
    //                     style: AppStyle.typeSearch,
    //                   ),
    //                 ),
    //                 decoration: BoxDecoration(
    //                   borderRadius: BorderRadius.circular(5),
    //                   boxShadow: [
    //                     BoxShadow(
    //                       // offset: Offset(1.0, 1.0),
    //                       blurRadius: 8,
    //                       color: Color(0xFF999999).withOpacity(0.5),
    //                     )
    //                   ],
    //                   // color: Color(0xFF14D5F6),
    //                   color: Colors.white,
    //                 ),
    //               ),
    //               onTap: () {
    //                 Navigator.of(context)
    //                     .pushNamed('/search-university-screen');
    //               },
    //             ),
    //           ),
    //         ],
    //       ),
    //     ),
    //     SizedBox(
    //       height: _sizeHeight * 0.02,
    //     ),
    //     // Padding(
    //     //   padding: const EdgeInsets.symmetric(horizontal: 16),
    //     //   child: Divider(
    //     //     color: Colors.black38,
    //     //     // height: 0.,
    //     //   ),
    //     // ),
    //     // Padding(
    //     //   padding: const EdgeInsets.symmetric(horizontal: 16),
    //     //   child: Divider(
    //     //     color: Colors.black38,
    //     //     // height: 0.,
    //     //   ),
    //     // ),
    //     Padding(
    //       padding: const EdgeInsets.symmetric(horizontal: 170),
    //       child: Divider(
    //         color: Colors.black38,
    //         // height: 0.,
    //       ),
    //     ),
    //     SizedBox(
    //       height: _sizeHeight * 0.017,
    //     ),
    //     Padding(
    //       padding: const EdgeInsets.symmetric(horizontal: 15),
    //       child: Container(
    //         height: _sizeHeight * 0.5,
    //         decoration: BoxDecoration(
    //           borderRadius: BorderRadius.circular(5),
    //           color: Colors.white,
    //           boxShadow: [
    //             BoxShadow(
    //               blurRadius: 8,
    //               color: Color(0xFF999999).withOpacity(0.4),
    //             )
    //           ],
    //         ),
    //         child: Column(
    //           children: [
    //             SizedBox(height: _sizeHeight * 0.024),
    //             Padding(
    //               padding: const EdgeInsets.symmetric(horizontal: 15),
    //               child: Row(
    //                 // mainAxisAlignment: MainAxisAlignment.center,
    //                 children: [
    //                   Icon(Icons.school_outlined),
    //                   SizedBox(
    //                     width: 10,
    //                   ),
    //                   Text(
    //                     'Popular Talkshows',
    //                     style: AppStyle.titleSearch,
    //                   ),
    //                 ],
    //               ),
    //             ),
    //             SizedBox(height: _sizeHeight * 0.022),
    //             Container(
    //               height: _sizeHeight * 0.395,
    //               child: PageView.builder(
    //                 controller: _pageController,
    //                 itemCount: 3,
    //                 itemBuilder: (context, index) {
    //                   return Padding(
    //                     padding: const EdgeInsets.only(left: 5, right: 5),
    //                     child: GestureDetector(
    //                       child: Container(
    //                         decoration: BoxDecoration(
    //                           borderRadius: BorderRadius.circular(4),
    //                           color: Color(0xFFDDDDDD),
    //                           border: Border.all(
    //                             color: Colors.black54,
    //                             width: 0.07,
    //                           ),
    //                         ),
    //                         // height: 100,
    //                         child: Column(
    //                           crossAxisAlignment: CrossAxisAlignment.start,
    //                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //                           children: [
    //                             Container(
    //                               // height: 100,
    //                               // width: 100,
    //                               // child:
    //                               //     Image.network(listTalkshow[index].image),
    //                               child: ClipRRect(
    //                                 // borderRadius: BorderRadius.circular(4.0),
    //                                 borderRadius: BorderRadius.only(
    //                                     topLeft: Radius.circular(4),
    //                                     topRight: Radius.circular(4)),
    //                                 child: Image.network(
    //                                     listTalkshow[index].image),
    //                               ),
    //                             ),
    //                             Row(
    //                               children: [
    //                                 SizedBox(
    //                                   width: _sizeWidth * 0.02,
    //                                 ),
    //                                 Text(
    //                                   'Speaker : ${listTalkshow[index].speaker.fullName}',
    //                                   style: TextStyle(
    //                                     fontFamily: AppFonts.poppins,
    //                                     fontSize: 12,
    //                                   ),
    //                                 ),
    //                               ],
    //                             ),
    //                             Row(
    //                               children: [
    //                                 SizedBox(
    //                                   width: _sizeWidth * 0.02,
    //                                 ),
    //                                 Text(
    //                                   'Time : ${listTalkshow[index].timeStart} - ${listTalkshow[index].timeFinish}',
    //                                   style: TextStyle(
    //                                     fontFamily: AppFonts.poppins,
    //                                     fontSize: 12,
    //                                   ),
    //                                 ),
    //                               ],
    //                             ),
    //                             Row(
    //                               children: [
    //                                 SizedBox(
    //                                   width: _sizeWidth * 0.02,
    //                                 ),
    //                                 (index == 2)
    //                                     ? Row(
    //                                         // mainAxisAlignment:
    //                                         //     MainAxisAlignment.spaceBetween,
    //                                         // crossAxisAlignment:
    //                                         //     CrossAxisAlignment.end,
    //                                         children: [
    //                                           Text(
    //                                             'Price : ${listTalkshow[index].price}',
    //                                             style: TextStyle(
    //                                               fontFamily: AppFonts.poppins,
    //                                               fontSize: 12,
    //                                             ),
    //                                           ),
    //                                           SizedBox(
    //                                             width: _sizeWidth * 0.53,
    //                                           ),
    //                                           Text(
    //                                             'See more >>',
    //                                             style: TextStyle(
    //                                               fontFamily: AppFonts.poppins,
    //                                               fontSize: 12,
    //                                             ),
    //                                           )
    //                                         ],
    //                                       )
    //                                     : Text(
    //                                         'Price : ${listTalkshow[index].price}',
    //                                         style: TextStyle(
    //                                           fontFamily: AppFonts.poppins,
    //                                           fontSize: 12,
    //                                         ),
    //                                       ),
    //                               ],
    //                             ),
    //                             // Padding(
    //                             //   padding: const EdgeInsets.only(left: 6),
    //                             //   child: Text(
    //                             //     listTalkshow[index].id,
    //                             //     style: AppStyle.logoChooseUniver,
    //                             //   ),
    //                             // ),
    //                             // Padding(
    //                             //   padding: const EdgeInsets.only(left: 6),
    //                             //   child: Text(
    //                             //     listTalkshow[index].name,
    //                             //     style: AppStyle.logoChooseUniver,
    //                             //   ),
    //                             // ),
    //                             // (index == 2)
    //                             //     ? Padding(
    //                             //         padding:
    //                             //             const EdgeInsets.only(left: 250),
    //                             //         child: GestureDetector(
    //                             //           child: Text(
    //                             //             'SEE MORE >>',
    //                             //             style: AppStyle.link,
    //                             //           ),
    //                             //           onTap: () {
    //                             //             print('ON TAP SEE MORE');
    //                             //             Navigator.of(context).pushNamed(
    //                             //                 '/search-talkshow-screen');
    //                             //           },
    //                             //         ),
    //                             //       )
    //                             //     : SizedBox(),
    //                             // (index == 2)
    //                             //     ? Row(
    //                             //         children: [
    //                             //           SizedBox(
    //                             //             width: _sizeWidth * 0.02,
    //                             //           ),
    //                             //           Text(
    //                             //             'Price : ${listTalkshow[index].price}',
    //                             //             style: TextStyle(
    //                             //               fontFamily: AppFonts.poppins,
    //                             //               fontSize: 12,
    //                             //             ),
    //                             //           ),
    //                             //           Expanded(child: SizedBox()),
    //                             //           Text(
    //                             //             'See more >>',
    //                             //             style: TextStyle(
    //                             //               fontFamily: AppFonts.poppins,
    //                             //               fontSize: 12,
    //                             //             ),
    //                             //           ),
    //                             //         ],
    //                             //       )
    //                             //     : SizedBox()
    //                           ],
    //                         ),
    //                       ),
    //                       onTap: () {
    //                         Navigator.of(context).pushNamed(
    //                             '/talkshow-detail-screen',
    //                             arguments: listTalkshow[index]);
    //                       },
    //                     ),
    //                   );
    //                 },
    //                 onPageChanged: (index) {
    //                   setState(() {
    //                     _currentIndex = index;
    //                   });
    //                 },
    //               ),
    //             ),
    //             // SizedBox(height: _sizeHeight * 0.025),
    //           ],
    //         ),
    //       ),
    //     ),
    //     SizedBox(height: _sizeHeight * 0.03),
    //     Padding(
    //       padding: const EdgeInsets.symmetric(horizontal: 15),
    //       child: Container(
    //         decoration: BoxDecoration(
    //           borderRadius: BorderRadius.circular(5),
    //           color: Colors.white,
    //           boxShadow: [
    //             BoxShadow(
    //               blurRadius: 8,
    //               color: Color(0xFF999999).withOpacity(0.4),
    //             )
    //           ],
    //         ),
    //         child: Column(
    //           children: [
    //             SizedBox(height: _sizeHeight * 0.024),
    //             Padding(
    //               padding: const EdgeInsets.symmetric(horizontal: 15),
    //               child: Row(
    //                 // mainAxisAlignment: MainAxisAlignment.center,
    //                 children: [
    //                   Icon(Icons.school_outlined),
    //                   SizedBox(
    //                     width: 10,
    //                   ),
    //                   Text(
    //                     'Popular Consultants',
    //                     style: AppStyle.titleSearch,
    //                   ),
    //                 ],
    //               ),
    //             ),
    //             SizedBox(height: _sizeHeight * 0.022),
    //             Container(
    //               height: _sizeHeight * 0.32,
    //               child: PageView.builder(
    //                 controller: _pageController,
    //                 itemCount: 3,
    //                 itemBuilder: (context, index) {
    //                   return Padding(
    //                     padding: const EdgeInsets.only(left: 5, right: 5),
    //                     child: GestureDetector(
    //                       child: Container(
    //                         decoration: BoxDecoration(
    //                           borderRadius: BorderRadius.circular(4),
    //                           color: Colors.grey,
    //                         ),
    //                         height: 100,
    //                         child: Column(
    //                           crossAxisAlignment: CrossAxisAlignment.start,
    //                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //                           children: [
    //                             Container(
    //                               height: 100,
    //                               width: 100,
    //                               child: Image.network(
    //                                   listConsultant[index].image),
    //                             ),
    //                             (index == 2)
    //                                 ? Padding(
    //                                     padding:
    //                                         const EdgeInsets.only(left: 300),
    //                                     child: GestureDetector(
    //                                       child: Text(
    //                                         'SEE MORE >>',
    //                                         style: AppStyle.link,
    //                                       ),
    //                                       onTap: () {
    //                                         print('ON TAP SEE MORE');
    //                                         Navigator.of(context).pushNamed(
    //                                             '/search-consultant-screen');
    //                                       },
    //                                     ),
    //                                   )
    //                                 : SizedBox()
    //                           ],
    //                         ),
    //                       ),
    //                       onTap: () {
    //                         Navigator.of(context).pushNamed(
    //                             '/consultant-detail-screen',
    //                             arguments: listConsultant[index]);
    //                       },
    //                     ),
    //                   );
    //                 },
    //                 onPageChanged: (index) {
    //                   setState(() {
    //                     _currentIndex = index;
    //                   });
    //                 },
    //               ),
    //             ),
    //             SizedBox(height: _sizeHeight * 0.025),
    //           ],
    //         ),
    //       ),
    //     ),
    //     SizedBox(height: _sizeHeight * 0.03),

    //     Padding(
    //       padding: const EdgeInsets.symmetric(horizontal: 15),
    //       child: Container(
    //         decoration: BoxDecoration(
    //           borderRadius: BorderRadius.circular(5),
    //           color: Colors.white,
    //           boxShadow: [
    //             BoxShadow(
    //               blurRadius: 8,
    //               color: Color(0xFF999999).withOpacity(0.4),
    //             )
    //           ],
    //         ),
    //         child: Column(
    //           children: [
    //             SizedBox(height: _sizeHeight * 0.024),
    //             Padding(
    //               padding: const EdgeInsets.symmetric(horizontal: 15),
    //               child: Row(
    //                 // mainAxisAlignment: MainAxisAlignment.center,
    //                 children: [
    //                   Icon(Icons.school_outlined),
    //                   SizedBox(
    //                     width: 10,
    //                   ),
    //                   Text(
    //                     'Popular Universities',
    //                     style: AppStyle.titleSearch,
    //                   ),
    //                 ],
    //               ),
    //             ),
    //             SizedBox(height: _sizeHeight * 0.022),
    //             Container(
    //               height: _sizeHeight * 0.32,
    //               child: PageView.builder(
    //                 controller: _pageController,
    //                 itemCount: 3,
    //                 itemBuilder: (context, index) {
    //                   return Padding(
    //                     padding: const EdgeInsets.only(left: 5, right: 5),
    //                     child: GestureDetector(
    //                       child: Container(
    //                         decoration: BoxDecoration(
    //                           borderRadius: BorderRadius.circular(4),
    //                           color: Colors.grey,
    //                         ),
    //                         height: 100,
    //                         child: Column(
    //                           crossAxisAlignment: CrossAxisAlignment.start,
    //                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //                           children: [
    //                             Padding(
    //                               padding: const EdgeInsets.only(left: 6),
    //                               child: Text(
    //                                 listUniversity[index].name,
    //                                 style: AppStyle.logoChooseUniver,
    //                               ),
    //                             ),
    //                             (index == 2)
    //                                 ? Padding(
    //                                     padding:
    //                                         const EdgeInsets.only(left: 300),
    //                                     child: GestureDetector(
    //                                       child: Text(
    //                                         'SEE MORE >>',
    //                                         style: AppStyle.link,
    //                                       ),
    //                                       onTap: () {
    //                                         print('ON TAP SEE MORE');
    //                                         Navigator.of(context).pushNamed(
    //                                             '/search-university-screen');
    //                                       },
    //                                     ),
    //                                   )
    //                                 : SizedBox()
    //                           ],
    //                         ),
    //                       ),
    //                       onTap: () {
    //                         Navigator.of(context).pushNamed(
    //                             '/university-detail-screen',
    //                             arguments: listUniversity[index]);
    //                       },
    //                     ),
    //                   );
    //                 },
    //                 onPageChanged: (index) {
    //                   setState(() {
    //                     _currentIndex = index;
    //                   });
    //                 },
    //               ),
    //             ),
    //             SizedBox(height: _sizeHeight * 0.025),
    //           ],
    //         ),
    //       ),
    //     ),
    //     SizedBox(height: 20),
    //   ],
    // );
    // ================================================
// ListView.builder(
//             itemCount: listTalkshow.length,
//             itemBuilder: (context, index) {
//               return TalkshowDetailItem(listTalkshow[index]);
//             },
//           ),
    return ListView(
      children: [
        CarouselWidget(),
        SizedBox(
          height: _sizeHeight * 0.028,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: GestureDetector(
                  child: Container(
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 10, right: 10, top: 6, bottom: 6),
                      child: Text(
                        'Talkshows',
                        textAlign: TextAlign.center,
                        style: AppStyle.typeSearch,
                      ),
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      boxShadow: [
                        isTalkshow
                            ? BoxShadow(
                                // offset: Offset(1.0, 1.0),
                                blurRadius: 8,
                                color: Colors.black26,
                              )
                            : BoxShadow(
                                color: Color(0xFFEEEEEE),
                              )
                      ],
                      border: Border.all(width: 0.15, color: Color(0xFFBBBBBB)),
                      // color: Color(0xFF14D5F6),
                      // color: Colors.white,
                      color: isTalkshow ? Colors.white : Color(0xFFDDDDDD),
                    ),
                  ),
                  onTap: () {
                    log('TAP is talkshow');
                    log('university: $isTalkshow');
                    if (!isTalkshow) {
                      setState(() {
                        isTalkshow = true;
                        isConsultant = false;
                        isUniversity = false;
                        listUniversity = [];
                        listConsultant = [];
                        listTalkshow = Talkshow.createListTalkshow();
                      });
                    }
                  },
                ),
              ),
              SizedBox(width: _sizeWidth * 1 / 40),
              Expanded(
                child: GestureDetector(
                  child: Container(
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 10, right: 10, top: 6, bottom: 6),
                      child: Text(
                        'Counselor',
                        textAlign: TextAlign.center,
                        style: AppStyle.typeSearch,
                      ),
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      boxShadow: [
                        isConsultant
                            ? BoxShadow(
                                // offset: Offset(1.0, 1.0),
                                blurRadius: 8,
                                color: Color(0xFF999999).withOpacity(0.6),
                              )
                            : BoxShadow(
                                color: Color(0xFFEEEEEE),
                              )
                      ],
                      border: Border.all(width: 0.15, color: Color(0xFFBBBBBB)),
                      // color: Color(0xFF14D5F6),
                      // color: Colors.white,
                      color: isConsultant ? Colors.white : Color(0xFFDDDDDD),
                    ),
                  ),
                  onTap: () {
                    log('TAP is consultant');
                    log('university: $isConsultant');
                    if (!isConsultant) {
                      setState(() {
                        isConsultant = true;
                        isTalkshow = false;
                        isUniversity = false;
                        listUniversity = [];
                        listTalkshow = [];
                        listConsultant = User.createListConsulant();
                      });
                    }
                  },
                ),
              ),
              SizedBox(width: _sizeWidth * 1 / 40),
              Expanded(
                child: GestureDetector(
                  child: Container(
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 10, right: 10, top: 6, bottom: 6),
                      child: Text(
                        'Universities',
                        textAlign: TextAlign.center,
                        style: AppStyle.typeSearch,
                      ),
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      boxShadow: [
                        isUniversity
                            ? BoxShadow(
                                // offset: Offset(1.0, 1.0),
                                blurRadius: 8,
                                color: Color(0xFF999999).withOpacity(0.6),
                              )
                            : BoxShadow(
                                color: Color(0xFFEEEEEE),
                              )
                      ],
                      border: Border.all(width: 0.15, color: Color(0xFFBBBBBB)),
                      // color: Color(0xFF14D5F6),
                      // color: Colors.white,
                      color: isUniversity ? Colors.white : Color(0xFFDDDDDD),
                    ),
                  ),
                  onTap: () {
                    log('TAP is university');
                    log('university: $isUniversity');
                    if (!isUniversity) {
                      setState(() {
                        isUniversity = true;
                        isTalkshow = false;
                        isConsultant = false;
                        listTalkshow = [];
                        listConsultant = [];
                        listUniversity = University.createListUniversity();
                      });
                    }
                  },
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: _sizeHeight * 0.03),
        // Padding(
        //   padding: const EdgeInsets.symmetric(horizontal: 170),
        //   child: Divider(
        //     color: Colors.black38,
        //   ),
        // ),
        // SizedBox(height: _sizeHeight * 0.02),
        (isTalkshow)
            ? Column(
                children: [...getListTalkshow(listTalkshow, _sizeHeight)],
              )
            : SizedBox(),
        (isConsultant)
            ? Column(
                children: [...getListCounselor(listCounselor, _sizeHeight)],
              )
            : SizedBox(),
        (isUniversity)
            ? Column(
                children: [...getListUniversity(listUniversity, _sizeHeight)],
              )
            : SizedBox(),
      ],
    );
  }
}
