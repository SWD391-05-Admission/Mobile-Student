import 'dart:developer';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:mobile_customer/models/talkshow.dart';
import 'package:mobile_customer/values/app_colors.dart';
import 'package:mobile_customer/values/app_fonts.dart';
import 'package:mobile_customer/values/app_styles.dart';

class TalkshowDetailHistoryScreen extends StatefulWidget {
  const TalkshowDetailHistoryScreen();
  static const routeName = '/talkshow-detail-history-screen';

  @override
  _TalkshowDetailHistoryScreenState createState() =>
      _TalkshowDetailHistoryScreenState();
}

String _getDate(String date) {
  String day = date.substring(8, 10);
  String month = date.substring(5, 7);
  String year = date.substring(0, 4);
  return '$day-$month-$year';
}

class _TalkshowDetailHistoryScreenState
    extends State<TalkshowDetailHistoryScreen> {
  bool isShow = false;
  @override
  Widget build(BuildContext context) {
    Column listUniverWidget(Talkshow talkshow) {
      List<Widget> listUniverWidget = [];
      listUniverWidget.add(SizedBox(
        height: 3,
      ));
      // for (int i = 0; i < talkshow.major.listUniversity.length; i++) {//open it
      //   var item = talkshow.major.listUniversity[i];
      //   if (i != 0) {
      //     listUniverWidget.add(Divider(
      //       color: Colors.black,
      //     ));
      //   }
      //   listUniverWidget.add(
      //     Row(
      //       children: [
      //         SizedBox(
      //           height: 80,
      //           width: 110,
      //           child: Image.network(item.image),
      //         ),
      //         SizedBox(width: 10),
      //         Expanded(
      //           child: Column(
      //             crossAxisAlignment: CrossAxisAlignment.start,
      //             children: [
      //               // (i != 0)
      //               //     ? Divider(
      //               //         color: Colors.black,
      //               //       )
      //               //     : SizedBox(),
      //               // Container(
      //               //   height: 20,
      //               //   child: Text('ádf'),
      //               //   color: Colors.amber,
      //               // ),
      //               // Divider(
      //               //   color: Colors.black,
      //               // ),
      //               // Text(
      //               //   'University code : ${item.code}',
      //               //   style: AppStyle.bookDetail,
      //               // ),
      //               Text(
      //                 'Name : ${item.name}',
      //                 style: AppStyle.bookDetail,
      //               ),
      //               Text(
      //                 'Email : ${item.email}',
      //                 style: AppStyle.bookDetail,
      //               ),
      //               Text(
      //                 'Website : ${item.website}',
      //                 style: AppStyle.bookDetail,
      //               ),
      //               Row(
      //                 // crossAxisAlignment: CrossAxisAlignment.stretch,
      //                 // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //                 children: [
      //                   Text(
      //                     'Fee : ${item.minFee.toString()} - ${item.maxFee.toString()}',
      //                     style: AppStyle.bookDetail,
      //                   ),
      //                   Expanded(child: SizedBox()),
      //                   GestureDetector(
      //                     child: Text(
      //                       'See detail >>',
      //                       style: AppStyle.bookDetail,
      //                     ),
      //                     onTap: () {
      //                       Navigator.of(context).pushNamed(
      //                         '/university-detail-screen',
      //                         arguments: item,
      //                       );
      //                     },
      //                   ),
      //                 ],
      //               ),
      //             ],
      //           ),
      //         )
      //       ],
      //     ),
      //   );
      //   if (i == talkshow.major.listUniversity.length - 1) {
      //     listUniverWidget.add(SizedBox(
      //       height: 70,
      //     ));
      //   }
      // }
      return Column(
        children: [...listUniverWidget],
      );
    }

    final double _sizeHeight = MediaQuery.of(context).size.height -
        MediaQuery.of(context).padding.top -
        MediaQuery.of(context).padding.bottom;
    final double _sizeWidth = MediaQuery.of(context).size.width -
        MediaQuery.of(context).padding.left -
        MediaQuery.of(context).padding.right;
    Talkshow talkshow = ModalRoute.of(context).settings.arguments;

    String dateStart = _getDate(talkshow.date);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Thông tin buổi tư vấn',
          style: AppStyle.titleSearch,
        ),
        // flexibleSpace:
        //     Container(decoration: BoxDecoration(color: Colors.white)),
        // flexibleSpace: AppColors.flexibleSpaceWhite,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: Image.network(talkshow.image),
            ),
            SizedBox(
              height: _sizeHeight * 0.01,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 6),
                  Text(
                    '${talkshow.description}',
                    style: AppStyle.bookDetail.copyWith(fontSize: 14),
                  ),
                  // Text(
                  //   'Time : ${talkshow.timeStart} - ${talkshow.timeFinish}',
                  //   style: AppStyle.desciptionStyle,
                  // ),
                  SizedBox(height: 6),
                  RichText(
                    text: TextSpan(
                      text: 'Thời gian bắt đầu : ',
                      style: AppStyle.bookDetail
                          .copyWith(color: Colors.black, fontSize: 14),
                      children: <TextSpan>[
                        TextSpan(
                          text: '${talkshow.timeStart} ngày $dateStart',
                          style: TextStyle(
                            fontFamily: AppFonts.poppins,
                            fontSize: 14,
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
                  SizedBox(height: 6),
                  RichText(
                    text: TextSpan(
                      text: 'Chuyên nghành : ',
                      style: AppStyle.bookDetail.copyWith(
                        color: Colors.black,
                        fontSize: 14,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: '${talkshow.major.name}',
                          style: TextStyle(
                            fontFamily: AppFonts.poppins,
                            fontSize: 14,
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
                  SizedBox(height: 6),
                  RichText(
                    text: TextSpan(
                      text: 'Giá : ',
                      style: AppStyle.bookDetail.copyWith(
                        color: Colors.black,
                        fontSize: 14,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: '${talkshow.price} miếng dưa hấu',
                          style: TextStyle(
                            fontFamily: AppFonts.poppins,
                            fontSize: 14,
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

                  // RichText(
                  //   text: TextSpan(
                  //     text: 'List of university : ',
                  //     style: AppStyle.bookDetail.copyWith(
                  //       color: Colors.black,
                  //     ),
                  //     children: <TextSpan>[
                  //       TextSpan(
                  //         text: '${talkshow.price}',
                  //         style: TextStyle(
                  //           fontFamily: AppFonts.poppins,
                  //           fontSize: 12,
                  //           shadows: [
                  //             Shadow(
                  //               // offset: Offset(1.0, 1.0),
                  //               blurRadius: 8,
                  //               color: Color(0xFF999999),
                  //             ),
                  //           ],
                  //           fontWeight: FontWeight.bold,
                  //           // fontStyle: FontStyle.italic,
                  //         ),
                  //       ),
                  //       // TextSpan(text: ' world!'),
                  //     ],
                  //   ),
                  // ),

                  // Text(
                  //   'Time finish: ${talkshow.timeFinish}',
                  //   style: AppStyle.desciptionStyle,
                  // ),
                  SizedBox(height: 6),

                  RichText(
                    text: TextSpan(
                      text: 'Nhà diễn giả : ',
                      style: AppStyle.bookDetail.copyWith(
                        color: Colors.black,
                        fontSize: 14,
                      ),
                      children: [
                        TextSpan(
                          text: '${talkshow.counselor.fullName}',
                          style: TextStyle(
                            fontFamily: AppFonts.poppins,
                            fontSize: 14,
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
                        TextSpan(
                          text:
                              ' (Thông tin chi tiết về ${talkshow.counselor.fullName})',
                          style: TextStyle(
                            fontStyle: FontStyle.italic,
                            color: Color(0xFF3366FF),
                            fontSize: 14,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.of(context).pushNamed(
                                '/counselor-detail-screen',
                                arguments: talkshow.counselor,
                              );
                            },
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  Divider(height: 1, color: Colors.black26),
                  SizedBox(height: 10),
                  RichText(
                    text: TextSpan(
                      text: 'Tên trường : ',
                      style: AppStyle.bookDetail.copyWith(
                        color: Colors.black,
                        fontSize: 14,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: '${talkshow.university.name}',
                          style: TextStyle(
                            fontFamily: AppFonts.poppins,
                            fontSize: 14,
                            shadows: [
                              Shadow(
                                // offset: Offset(1.0, 1.0),
                                blurRadius: 8,
                                color: Color(0xFF999999),
                              ),
                            ],
                            // fontWeight: FontWeight.bold,
                            // fontStyle: FontStyle.italic,
                          ),
                        ),
                        // TextSpan(text: ' world!'),
                      ],
                    ),
                  ),

                  SizedBox(height: 6),
                  RichText(
                    text: TextSpan(
                      text: 'Mã trường : ',
                      style: AppStyle.bookDetail.copyWith(
                        color: Colors.black,
                        fontSize: 14,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: '${talkshow.university.code}',
                          style: TextStyle(
                            fontFamily: AppFonts.poppins,
                            fontSize: 14,
                            shadows: [
                              Shadow(
                                // offset: Offset(1.0, 1.0),
                                blurRadius: 8,
                                color: Color(0xFF999999),
                              ),
                            ],
                            // fontWeight: FontWeight.bold,
                            // fontStyle: FontStyle.italic,
                          ),
                        ),
                        // TextSpan(text: ' world!'),
                      ],
                    ),
                  ),
                  SizedBox(height: 6),
                  RichText(
                    text: TextSpan(
                      text: 'Website : ',
                      style: AppStyle.bookDetail.copyWith(
                        color: Colors.black,
                        fontSize: 14,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: '${talkshow.university.website}',
                          style: TextStyle(
                            fontStyle: FontStyle.italic,
                            color: Color(0xFF3366FF),
                            fontSize: 14,
                          ),
                        ),
                        // TextSpan(text: ' world!'),
                      ],
                    ),
                  ),
                  SizedBox(height: 6),
                  RichText(
                    text: TextSpan(
                      text: 'Email : ',
                      style: AppStyle.bookDetail.copyWith(
                        color: Colors.black,
                        fontSize: 14,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: '${talkshow.university.email}',
                          style: TextStyle(
                            fontStyle: FontStyle.italic,
                            color: Color(0xFF3366FF),
                            fontSize: 14,
                          ),
                        ),
                        // TextSpan(text: ' world!'),
                      ],
                    ),
                  ),
                  SizedBox(height: 6),
                  RichText(
                    text: TextSpan(
                      text: 'Facebook : ',
                      style: AppStyle.bookDetail.copyWith(
                        color: Colors.black,
                        fontSize: 14,
                      ),
                      children: [
                        TextSpan(
                          text: '${talkshow.university.facebook}',
                          style: TextStyle(
                            fontStyle: FontStyle.italic,
                            color: Color(0xFF3366FF),
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 6),
                  RichText(
                    text: TextSpan(
                      text: 'Điểm đầu vào năm trước : ',
                      style: AppStyle.bookDetail.copyWith(
                        color: Colors.black,
                        fontSize: 14,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: '${talkshow.university.lastYearBenchMark}',
                          style: TextStyle(
                            fontFamily: AppFonts.poppins,
                            fontSize: 14,
                            shadows: [
                              Shadow(
                                // offset: Offset(1.0, 1.0),
                                blurRadius: 8,
                                color: Color(0xFF999999),
                              ),
                            ],
                            // fontWeight: FontWeight.bold,
                            // fontStyle: FontStyle.italic,
                          ),
                        ),
                        // TextSpan(text: ' world!'),
                      ],
                    ),
                  ),
                  SizedBox(height: 6),
                  RichText(
                    text: TextSpan(
                      text: 'Học phí : ',
                      style: AppStyle.bookDetail.copyWith(
                        color: Colors.black,
                        fontSize: 14,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text:
                              '${talkshow.university.minFee} - ${talkshow.university.maxFee} VND',
                          style: TextStyle(
                            fontFamily: AppFonts.poppins,
                            fontSize: 14,
                            shadows: [
                              Shadow(
                                // offset: Offset(1.0, 1.0),
                                blurRadius: 8,
                                color: Color(0xFF999999),
                              ),
                            ],
                            // fontWeight: FontWeight.bold,
                            // fontStyle: FontStyle.italic,
                          ),
                        ),
                        // TextSpan(text: ' world!'),
                      ],
                    ),
                  ),

                  // Row(
                  //   children: [

                  //     SizedBox(
                  //       width: 2,
                  //     ),
                  //     GestureDetector(
                  //       child: Icon(
                  //         Icons.arrow_drop_down,
                  //         // size: 25,
                  //       ),
                  //       onTap: () {
                  //         log('ontap');
                  //         setState(() {
                  //           // isShow = !isShow;
                  //           if (isShow) {
                  //             isShow = false;
                  //           } else {
                  //             isShow = true;
                  //           }
                  //           log(isShow.toString());
                  //         });
                  //       },
                  //     ),
                  //   ],
                  // ),
                  // SizedBox(height: 0.5),
                  // (isShow) ? listUniverWidget(talkshow) : SizedBox(),
                  // Expanded(child: SizedBox()),
                  // Row(
                  //   children: [
                  //     Expanded(
                  //       child: ElevatedButton(
                  //         style: ElevatedButton.styleFrom(
                  //           primary: Color(0xFFDDDDDD),
                  //         ),
                  //         onPressed: () {
                  //           log('TAP LOG OUT');
                  //         },
                  //         child: Text('Book now'),
                  //       ),
                  //     ),
                  //   ],
                  // ),
                ],
              ),
            ),
            SizedBox(height: _sizeHeight * 0.14),
          ],
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   backgroundColor: Colors.white,
      //   child: Icon(Icons.search),
      //   onPressed: () {
      //     log('TAP FLOATING');
      //   },
      // ),
      // floatingActionButton: Container(
      //   decoration: BoxDecoration(
      //     color: Color(0xFFDDDDDD),
      //     borderRadius: BorderRadius.circular(10),
      //   ),
      //   width: 90.0,
      //   height: 50.0,
      //   // width: 90.0,
      //   // height: 40.0,
      //   child: new RawMaterialButton(
      //     shape: new CircleBorder(),
      //     elevation: 0.0,
      //     child: Text(
      //       '\$${talkshow.price} ĐẶT NGAY',
      //       style: AppStyle.bookDetail.copyWith(fontSize: 13),
      //       textAlign: TextAlign.center,
      //     ),
      //     onPressed: () {
      //       return showDialog(
      //         context: context,
      //         builder: (context) {
      //           // String areaDropdow;
      //           return StatefulBuilder(
      //             builder: (context, setState) {
      //               return SimpleDialog(
      //                 // key: _formKey,
      //                 children: <Widget>[
      //                   Text(
      //                     'Bạn có muốn đăng kí không ?',
      //                     style: AppStyle.titleSearch,
      //                     textAlign: TextAlign.center,
      //                   ),
      //                   SizedBox(height: _sizeHeight * 0.02),
      //                   Row(
      //                     mainAxisAlignment: MainAxisAlignment.end,
      //                     children: [
      //                       ElevatedButton(
      //                         onPressed: () {
      //                           Navigator.of(context).pop();
      //                         },
      //                         child: Text(
      //                           'Có',
      //                           style: AppStyle.titleSearch,
      //                         ),
      //                       ),
      //                       SizedBox(
      //                         width: _sizeWidth * 0.03,
      //                       ),
      //                       ElevatedButton(
      //                         onPressed: () {
      //                           Navigator.of(context).pop();
      //                         },
      //                         child: Text(
      //                           'Không',
      //                           style: AppStyle.titleSearch,
      //                         ),
      //                       ),
      //                       SizedBox(
      //                         width: _sizeWidth * 0.06,
      //                       ),
      //                     ],
      //                   )
      //                 ],
      //               );
      //             },
      //           );
      //         },
      //       );
      //     },
      //   ),
      // ),
    );
  }
}
