import 'package:flutter/material.dart';
import 'package:mobile_customer/models/university.dart';
import 'package:mobile_customer/values/app_fonts.dart';
import 'package:mobile_customer/values/app_styles.dart';

class UniversityDetailScreen extends StatelessWidget {
  const UniversityDetailScreen();
  static const routeName = '/university-detail-screen';

  @override
  Widget build(BuildContext context) {
    final double _sizeHeight = MediaQuery.of(context).size.height -
        MediaQuery.of(context).padding.top -
        MediaQuery.of(context).padding.bottom;
    University university = ModalRoute.of(context).settings.arguments;
    List<Widget> getList() {
      List<Widget> list = [];
      for (int i = 0; i < university.listAddress.length - 7; i++) {
        list.add(
          Text(
            '>>  ${university.listAddress[i].address}, ${university.listAddress[i].district}',
            style: AppStyle.bookDetail,
          ),
        );
      }
      return list;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Detail University',
          style: AppStyle.titleSearch,
        ),
        // flexibleSpace:
        //     Container(decoration: BoxDecoration(color: Colors.white)),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              child: Image.network(university.image),
            ),
            SizedBox(
              height: _sizeHeight * 0.007,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 7),
                  Text(
                    '${university.description}',
                    style: AppStyle.bookDetail,
                  ),
                  // Text(
                  //   'Time : ${talkshow.timeStart} - ${talkshow.timeFinish}',
                  //   style: AppStyle.desciptionStyle,
                  // ),
                  SizedBox(height: 2.5),
                  RichText(
                    text: TextSpan(
                      text: 'University code : ',
                      style: AppStyle.bookDetail.copyWith(
                        color: Colors.black,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: '${university.code}',
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
                      text: 'Name : ',
                      style: AppStyle.bookDetail.copyWith(
                        color: Colors.black,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: '${university.name}',
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
                      text: 'Website : ',
                      style: AppStyle.bookDetail.copyWith(
                        color: Colors.black,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: '${university.website}',
                          // style: TextStyle(
                          //   fontFamily: AppFonts.poppins,
                          //   fontSize: 12,
                          //   shadows: [
                          //     Shadow(
                          //       // offset: Offset(1.0, 1.0),
                          //       blurRadius: 8,
                          //       color: Color(0xFF999999),
                          //     ),
                          //   ],
                          //   fontWeight: FontWeight.bold,
                          //   // fontStyle: FontStyle.italic,
                          // ),
                          style: TextStyle(
                            fontStyle: FontStyle.italic,
                            color: Color(0xFF3366FF),
                          ),
                        ),
                        // TextSpan(text: ' world!'),
                      ],
                    ),
                  ),
                  SizedBox(height: 2.5),
                  RichText(
                    text: TextSpan(
                      text: 'Email : ',
                      style: AppStyle.bookDetail.copyWith(
                        color: Colors.black,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: '${university.email}',
                          // style: TextStyle(
                          //   fontFamily: AppFonts.poppins,
                          //   fontSize: 12,
                          //   shadows: [
                          //     Shadow(
                          //       // offset: Offset(1.0, 1.0),
                          //       blurRadius: 8,
                          //       color: Color(0xFF999999),
                          //     ),
                          //   ],
                          //   fontWeight: FontWeight.bold,
                          //   // fontStyle: FontStyle.italic,
                          // ),
                          style: TextStyle(
                            fontStyle: FontStyle.italic,
                            color: Color(0xFF3366FF),
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
                      text: 'Facebook : ',
                      style: AppStyle.bookDetail.copyWith(
                        color: Colors.black,
                      ),
                      children: [
                        TextSpan(
                          text: '${university.facebook}',
                          // style: TextStyle(
                          //   fontFamily: AppFonts.poppins,
                          //   fontSize: 12,
                          //   shadows: [
                          //     Shadow(
                          //       // offset: Offset(1.0, 1.0),
                          //       blurRadius: 8,
                          //       color: Color(0xFF999999),
                          //     ),
                          //   ],
                          //   fontWeight: FontWeight.bold,
                          //   // fontStyle: FontStyle.italic,
                          // ),
                          style: TextStyle(
                            fontStyle: FontStyle.italic,
                            color: Color(0xFF3366FF),
                          ),
                        ),
                        // TextSpan(
                        //   text:
                        //       ' (See information about ${talkshow.counselor.fullName})',
                        //   style: TextStyle(
                        //     fontStyle: FontStyle.italic,
                        //     color: Color(0xFF3366FF),
                        //   ),
                        //   recognizer: TapGestureRecognizer()
                        //     ..onTap = () {
                        //       Navigator.of(context).pushNamed(
                        //         '/counselor-detail-screen',
                        //         arguments: talkshow.counselor,
                        //       );
                        //     },
                        // ),
                      ],
                    ),
                  ),
                  SizedBox(height: 2.5),
                  RichText(
                    text: TextSpan(
                      text: 'Last year bench mark : ',
                      style: AppStyle.bookDetail.copyWith(
                        color: Colors.black,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: '${university.lastYearBenchMark}',
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
                      text: 'Fee : ',
                      style: AppStyle.bookDetail.copyWith(
                        color: Colors.black,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text:
                              'from ${university.minFee} to ${university.maxFee}',
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

                  // Row(
                  //   children: [
                  //     Text(
                  //       'List of universities suitable for this major',
                  //       style: AppStyle.bookDetail,
                  //     ),
                  //     SizedBox(
                  //       width: 2,
                  //     ),
                  //     GestureDetector(
                  //       child: Icon(
                  //         Icons.arrow_drop_down,
                  //         // size: 25,
                  //       ),
                  //       // onTap: () {
                  //       //   log('ontap');
                  //       //   setState(() {
                  //       //     // isShow = !isShow;
                  //       //     if (isShow) {
                  //       //       isShow = false;
                  //       //     } else {
                  //       //       isShow = true;
                  //       //     }
                  //       //     log(isShow.toString());
                  //       //   });
                  //       // },
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
                  RichText(
                    text: TextSpan(
                      text: 'Address : ',
                      style: AppStyle.bookDetail.copyWith(
                        color: Colors.black,
                      ),
                      // children: <TextSpan>[
                      //   TextSpan(
                      //     text: '${university.email}',
                      //     style: TextStyle(
                      //       fontFamily: AppFonts.poppins,
                      //       fontSize: 12,
                      //       shadows: [
                      //         Shadow(
                      //           // offset: Offset(1.0, 1.0),
                      //           blurRadius: 8,
                      //           color: Color(0xFF999999),
                      //         ),
                      //       ],
                      //       fontWeight: FontWeight.bold,
                      //       // fontStyle: FontStyle.italic,
                      //     ),
                      //   ),
                      //   // TextSpan(text: ' world!'),
                      // ],
                    ),
                  ),
                  ...getList(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
