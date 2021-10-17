import 'dart:developer';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:mobile_customer/models/talkshow.dart';
import 'package:mobile_customer/values/app_colors.dart';
import 'package:mobile_customer/values/app_fonts.dart';
import 'package:mobile_customer/values/app_styles.dart';

class TalkshowDetailScreen extends StatefulWidget {
  const TalkshowDetailScreen();
  static const routeName = '/talkshow-detail-screen';

  @override
  _TalkshowDetailScreenState createState() => _TalkshowDetailScreenState();
}

class _TalkshowDetailScreenState extends State<TalkshowDetailScreen> {
  bool isShow = false;
  @override
  Widget build(BuildContext context) {
    Column listUniverWidget(Talkshow talkshow) {
      List<Widget> listUniverWidget = [];
      listUniverWidget.add(SizedBox(
        height: 3,
      ));
      for (int i = 0; i < talkshow.major.listUniversity.length; i++) {
        var item = talkshow.major.listUniversity[i];
        if (i != 0) {
          listUniverWidget.add(Divider(
            color: Colors.black,
          ));
        }
        listUniverWidget.add(
          Row(
            children: [
              SizedBox(
                height: 80,
                width: 110,
                child: Image.network(item.image),
              ),
              SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // (i != 0)
                    //     ? Divider(
                    //         color: Colors.black,
                    //       )
                    //     : SizedBox(),
                    // Container(
                    //   height: 20,
                    //   child: Text('ádf'),
                    //   color: Colors.amber,
                    // ),
                    // Divider(
                    //   color: Colors.black,
                    // ),
                    // Text(
                    //   'University code : ${item.code}',
                    //   style: AppStyle.bookDetail,
                    // ),
                    Text(
                      'Name : ${item.name}',
                      style: AppStyle.bookDetail,
                    ),
                    Text(
                      'Email : ${item.email}',
                      style: AppStyle.bookDetail,
                    ),
                    Text(
                      'Website : ${item.website}',
                      style: AppStyle.bookDetail,
                    ),
                    Row(
                      // crossAxisAlignment: CrossAxisAlignment.stretch,
                      // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          'Fee : ${item.minFee.toString()} - ${item.maxFee.toString()}',
                          style: AppStyle.bookDetail,
                        ),
                        Expanded(child: SizedBox()),
                        GestureDetector(
                          child: Text(
                            'See detail >>',
                            style: AppStyle.bookDetail,
                          ),
                          onTap: () {
                            Navigator.of(context).pushNamed(
                              '/university-detail-screen',
                              arguments: item,
                            );
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        );
        if (i == talkshow.major.listUniversity.length - 1) {
          listUniverWidget.add(SizedBox(
            height: 70,
          ));
        }
      }
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

    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Detail Talkshow',
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
                    SizedBox(height: 5),
                    Text(
                      '${talkshow.description}',
                      style: AppStyle.bookDetail,
                    ),
                    // Text(
                    //   'Time : ${talkshow.timeStart} - ${talkshow.timeFinish}',
                    //   style: AppStyle.desciptionStyle,
                    // ),
                    SizedBox(height: 2.5),
                    RichText(
                      text: TextSpan(
                        text: 'Date time : ',
                        style: AppStyle.bookDetail.copyWith(
                          color: Colors.black,
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            text:
                                'at ${talkshow.timeStart} - ${talkshow.timeFinish}',
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
                    SizedBox(height: 2.5),
                    RichText(
                      text: TextSpan(
                        text: 'Major : ',
                        style: AppStyle.bookDetail.copyWith(
                          color: Colors.black,
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            text: '${talkshow.major.name}',
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
                    SizedBox(height: 2.5),
                    RichText(
                      text: TextSpan(
                        text: 'Price : ',
                        style: AppStyle.bookDetail.copyWith(
                          color: Colors.black,
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            text: '${talkshow.price}',
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
                    SizedBox(height: 2.5),

                    RichText(
                      text: TextSpan(
                        text: 'Counselor : ',
                        style: AppStyle.bookDetail.copyWith(
                          color: Colors.black,
                        ),
                        children: [
                          TextSpan(
                            text: '${talkshow.counselor.fullName}',
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
                          TextSpan(
                            text:
                                ' (See information about ${talkshow.counselor.fullName})',
                            style: TextStyle(
                              fontStyle: FontStyle.italic,
                              color: Color(0xFF3366FF),
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
                    SizedBox(height: 2.5),

                    Row(
                      children: [
                        Text(
                          'List of universities suitable for this major',
                          style: AppStyle.bookDetail,
                        ),
                        SizedBox(
                          width: 2,
                        ),
                        GestureDetector(
                          child: Icon(
                            Icons.arrow_drop_down,
                            // size: 25,
                          ),
                          onTap: () {
                            log('ontap');
                            setState(() {
                              // isShow = !isShow;
                              if (isShow) {
                                isShow = false;
                              } else {
                                isShow = true;
                              }
                              log(isShow.toString());
                            });
                          },
                        ),
                      ],
                    ),
                    // SizedBox(height: 0.5),
                    (isShow) ? listUniverWidget(talkshow) : SizedBox(),
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
              )
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
        floatingActionButton: Container(
          decoration: BoxDecoration(
            color: Color(0xFFDDDDDD),
            borderRadius: BorderRadius.circular(50),
          ),
          width: 90.0,
          height: 40.0,
          child: new RawMaterialButton(
            shape: new CircleBorder(),
            elevation: 0.0,
            child: Text(
              '\$${talkshow.price} BOOK',
              style: AppStyle.bookDetail.copyWith(fontSize: 14),
            ),
            onPressed: () {
              return showDialog(
                context: context,
                builder: (context) {
                  // String areaDropdow;
                  return StatefulBuilder(
                    builder: (context, setState) {
                      return SimpleDialog(
                        // key: _formKey,
                        children: <Widget>[
                          Text(
                            'Do you agree to book now ?',
                            style: AppStyle.titleSearch,
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: _sizeHeight * 0.02),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: Text(
                                  'Yes',
                                  style: AppStyle.titleSearch,
                                ),
                              ),
                              SizedBox(
                                width: _sizeWidth * 0.03,
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: Text(
                                  'No',
                                  style: AppStyle.titleSearch,
                                ),
                              ),
                              SizedBox(
                                width: _sizeWidth * 0.06,
                              ),
                            ],
                          )
                        ],
                      );
                    },
                  );
                },
              );
            },
          ),
        ));
  }
}
