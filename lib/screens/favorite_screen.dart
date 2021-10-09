import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:mobile_customer/models/talkshow.dart';
import 'package:mobile_customer/models/user.dart';
import 'package:mobile_customer/values/app_fonts.dart';

class SaveScreen extends StatefulWidget {
  const SaveScreen();
  static const routesName = '/save';

  @override
  _SaveScreenState createState() => _SaveScreenState();
}

PageController _pageControllerCongDong;
PageController _pageControllerTheoDoi;
List<Talkshow> listTalkshow = Talkshow.createListTalkshow();
List<User> listConsultant = User.createListConsulant();
int _currentIndexCongDong = 0;
int _currentIndexTheoDoi = 0;

class _SaveScreenState extends State<SaveScreen> {
  @override
  void initState() {
    _pageControllerCongDong = PageController(
      viewportFraction: 1,
    );
    _pageControllerTheoDoi = PageController(
      viewportFraction: 1,
    );
    super.initState();
  }

  bool isCongDong = true;
  @override
  Widget build(BuildContext context) {
    final double _sizeHeight = MediaQuery.of(context).size.height -
        MediaQuery.of(context).padding.top -
        MediaQuery.of(context).padding.bottom;
    final double _sizeWidth = MediaQuery.of(context).size.width -
        MediaQuery.of(context).padding.left -
        MediaQuery.of(context).padding.right;
    return Column(
      children: [
        SizedBox(
          height: 40,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              child: Text(
                'Cộng đồng ',
                style: (isCongDong)
                    ? TextStyle(
                        fontFamily: AppFonts.poppins,
                        fontSize: 18,
                        shadows: [
                          Shadow(
                            // offset: Offset(1.0, 1.0),
                            blurRadius: 8,
                            color: Colors.black45,
                          ),
                        ],
                        // fontWeight: FontWeight.bold,
                        color: Colors.black,
                      )
                    : TextStyle(
                        fontFamily: AppFonts.poppins,
                        fontSize: 18,
                        // shadows: [
                        //   Shadow(
                        //     // offset: Offset(1.0, 1.0),
                        //     blurRadius: 8,
                        //     color: Colors.black45,
                        //   ),
                        // ],
                        // fontWeight: FontWeight.bold,
                        color: Colors.black38,
                      ),
              ),
              onTap: () {
                if (!isCongDong) {
                  setState(() {
                    isCongDong = true;
                  });
                }
                log('IS CONG DONG: $isCongDong');
              },
            ),
            Text(
              ' | ',
              style: TextStyle(
                fontFamily: AppFonts.poppins,
                fontSize: 18,
                shadows: [
                  Shadow(
                    // offset: Offset(1.0, 1.0),
                    blurRadius: 8,
                    color: Colors.black45,
                  ),
                ],
                // fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            GestureDetector(
              child: Text(
                ' Đang theo dõi',
                style: (isCongDong)
                    ? TextStyle(
                        fontFamily: AppFonts.poppins,
                        fontSize: 18,
                        // shadows: [
                        //   Shadow(
                        //     // offset: Offset(1.0, 1.0),
                        //     blurRadius: 8,
                        //     color: Colors.black45,
                        //   ),
                        // ],
                        // fontWeight: FontWeight.bold,
                        color: Colors.black38,
                      )
                    : TextStyle(
                        fontFamily: AppFonts.poppins,
                        fontSize: 18,
                        shadows: [
                          Shadow(
                            // offset: Offset(1.0, 1.0),
                            blurRadius: 8,
                            color: Colors.black45,
                          ),
                        ],
                        // fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
              ),
              onTap: () {
                if (isCongDong) {
                  setState(() {
                    isCongDong = false;
                    _currentIndexTheoDoi = 0;
                  });
                }
                log('IS CONG DONG: $isCongDong');
              },
            ),
          ],
        ),
        SizedBox(
          height: 16,
        ),
        (isCongDong)
            ? Expanded(
                child: PageView.builder(
                  scrollDirection: Axis.vertical,
                  controller: _pageControllerCongDong,
                  itemCount: 9,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: Color(0xFFDDDDDD),
                          border: Border.all(
                            color: Colors.black54,
                            width: 0.07,
                          ),
                        ),
                        // height: 700,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // SizedBox(
                            //     // height: 1,
                            //     ),
                            SizedBox(
                              // height: 100,
                              // width: 100,
                              // child:
                              //     Image.network(listTalkshow[index].image),
                              child: ClipRRect(
                                // borderRadius: BorderRadius.circular(4.0),
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(4),
                                    topRight: Radius.circular(4)),
                                child:
                                    Image.network(listConsultant[index].image),
                              ),
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: _sizeWidth * 0.02,
                                ),
                                Text(
                                  'Address : ${listConsultant[index].address}',
                                  style: TextStyle(
                                    fontFamily: AppFonts.poppins,
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: _sizeWidth * 0.02,
                                ),
                                Text(
                                  'Birthday : ${listConsultant[index].birthday}',
                                  style: TextStyle(
                                    fontFamily: AppFonts.poppins,
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: _sizeWidth * 0.02,
                                ),
                                (index == 2)
                                    ? Row(
                                        children: [
                                          Text(
                                            'Fullname : ${listConsultant[index].fullName}',
                                            style: TextStyle(
                                              fontFamily: AppFonts.poppins,
                                              fontSize: 12,
                                            ),
                                          ),
                                          SizedBox(
                                            width: _sizeWidth * 0.53,
                                          ),
                                          // Text(
                                          //   'See more >>',
                                          //   style: TextStyle(
                                          //     fontFamily: AppFonts.poppins,
                                          //     fontSize: 12,
                                          //   ),
                                          // )
                                        ],
                                      )
                                    : Text(
                                        'Price : ${listTalkshow[index].price}',
                                        style: TextStyle(
                                          fontFamily: AppFonts.poppins,
                                          fontSize: 12,
                                        ),
                                      ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      onTap: () {
                        Navigator.of(context).pushNamed(
                            '/talkshow-detail-screen',
                            arguments: listTalkshow[index]);
                      },
                    );
                  },
                  onPageChanged: (index) {
                    setState(() {
                      _currentIndexCongDong = index;
                      log('INDEC CONG DONG $_currentIndexCongDong');
                      log('INDEC THEO DOI $_currentIndexTheoDoi');
                    });
                  },
                ),
              )
            : Expanded(
                child: PageView.builder(
                  scrollDirection: Axis.vertical,
                  controller: _pageControllerTheoDoi,
                  itemCount: 9,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: Color(0xFFDDDDDD),
                          border: Border.all(
                            color: Colors.black54,
                            width: 0.07,
                          ),
                        ),
                        // height: 700,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              child: ClipRRect(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(4),
                                    topRight: Radius.circular(4)),
                                child: Image.network(listTalkshow[index].image),
                              ),
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: _sizeWidth * 0.02,
                                ),
                                Text(
                                  'Speaker : ${listTalkshow[index].speaker.fullName}',
                                  style: TextStyle(
                                    fontFamily: AppFonts.poppins,
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: _sizeWidth * 0.02,
                                ),
                                Text(
                                  'Time : ${listTalkshow[index].timeStart} - ${listTalkshow[index].timeFinish}',
                                  style: TextStyle(
                                    fontFamily: AppFonts.poppins,
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: _sizeWidth * 0.02,
                                ),
                                (index == 2)
                                    ? Row(
                                        children: [
                                          Text(
                                            'Price : ${listTalkshow[index].price}',
                                            style: TextStyle(
                                              fontFamily: AppFonts.poppins,
                                              fontSize: 12,
                                            ),
                                          ),
                                          SizedBox(
                                            width: _sizeWidth * 0.53,
                                          ),
                                          // Text(
                                          //   'See more >>',
                                          //   style: TextStyle(
                                          //     fontFamily: AppFonts.poppins,
                                          //     fontSize: 12,
                                          //   ),
                                          // )
                                        ],
                                      )
                                    : Text(
                                        'Price : ${listTalkshow[index].price}',
                                        style: TextStyle(
                                          fontFamily: AppFonts.poppins,
                                          fontSize: 12,
                                        ),
                                      ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      onTap: () {
                        Navigator.of(context).pushNamed(
                            '/talkshow-detail-screen',
                            arguments: listTalkshow[index]);
                      },
                    );
                  },
                  onPageChanged: (index) {
                    setState(() {
                      _currentIndexTheoDoi = index;
                      log('INDEC CONG DONG $_currentIndexCongDong');
                      log('INDEC THEO DOI $_currentIndexTheoDoi');
                    });
                  },
                ),
              ),
      ],
    );
  }
}
