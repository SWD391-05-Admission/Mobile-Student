import 'package:flutter/material.dart';
import 'package:flutter_advanced_avatar/flutter_advanced_avatar.dart';
import 'package:mobile_customer/models/counselor.dart';
import 'package:mobile_customer/models/user.dart';
import 'package:mobile_customer/values/app_fonts.dart';
import 'package:mobile_customer/values/app_styles.dart';

class ConsultantDetailScreen extends StatelessWidget {
  const ConsultantDetailScreen();
  static const routeName = '/counselor-detail-screen';

  @override
  Widget build(BuildContext context) {
    final double _sizeHeight = MediaQuery.of(context).size.height -
        MediaQuery.of(context).padding.top -
        MediaQuery.of(context).padding.bottom;
    Counselor counselor = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Detail Counselor',
          style: AppStyle.titleSearch,
        ),
        flexibleSpace:
            Container(decoration: BoxDecoration(color: Colors.white)),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Container(
            //   child: Image.network(counselor.image),
            // ),
            SizedBox(
              height: 20,
            ),
            Row(
              // mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                SizedBox(
                  width: 20,
                ),
                Container(
                  child: AdvancedAvatar(
                    decoration: BoxDecoration(
                      // borderRadius: BorderRadius.circular(50),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black54,
                          // spreadRadius: 0.1,
                          blurRadius: 4,
                          offset: Offset(0, 1), // changes position of shadow
                        )
                      ],
                    ),
                    size: 85,
                    image: AssetImage('assets/images/avatar.png'),
                    // image: NetworkImage(user.image),
                    foregroundDecoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      border: Border.all(
                        // color: Color(0xFF49F0EE),
                        color: Colors.white,
                        width: 2,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Column(
                  // mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      counselor.fullName,
                      style: AppStyle.titleSearch
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                    Text(counselor.email, style: AppStyle.bookDetail),
                  ],
                ),
              ],
            ),

            SizedBox(
              height: _sizeHeight * 0.015,
            ),
            // Center(
            //   child: Text(
            //     counselor.fullName,
            //     style: AppStyle.titleSearch,
            //   ),
            // ),
            // SizedBox(
            //   height: _sizeHeight * 0.007,
            // ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Divider(
                color: Colors.black38,
              ),
            ),
            SizedBox(
              height: _sizeHeight * 0.007,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: _sizeHeight * 0.002),
                  Text(
                    '${counselor.description}',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: AppStyle.bookDetail,
                  ),

                  // Text(
                  //   'Name : ${counselor.fullName}',
                  //   style: AppStyle.bookDetail,
                  // ),
                  SizedBox(height: _sizeHeight * 0.005),
                  RichText(
                    text: TextSpan(
                      text: 'Name : ',
                      style: AppStyle.bookDetail.copyWith(
                        color: Colors.black,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: '${counselor.fullName}',
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
                            // fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        // TextSpan(text: ' world!'),
                      ],
                    ),
                  ),
                  SizedBox(height: _sizeHeight * 0.005),
                  // Text(
                  //   'Email : ${counselor.email}',
                  //   style: AppStyle.bookDetail,
                  // ),
                  RichText(
                    text: TextSpan(
                      text: 'Email : ',
                      style: AppStyle.bookDetail.copyWith(
                        color: Colors.black,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: '${counselor.email}',
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
                  SizedBox(height: _sizeHeight * 0.005),
                  // Text(
                  //   'Phone : ${counselor.phone}',
                  //   style: AppStyle.bookDetail,
                  // ),
                  RichText(
                    text: TextSpan(
                      text: 'Phone : ',
                      style: AppStyle.bookDetail.copyWith(
                        color: Colors.black,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: '${counselor.phone}',
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
                  SizedBox(height: _sizeHeight * 0.005),
                  // Text(
                  //   'Address : ${counselor.address}',
                  //   style: AppStyle.bookDetail,
                  // ),
                  RichText(
                    text: TextSpan(
                      text: 'Address : ',
                      style: AppStyle.bookDetail.copyWith(
                        color: Colors.black,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: '${counselor.address}',
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
                  SizedBox(height: _sizeHeight * 0.005),
                  // Text(
                  //   'Birthday : ${counselor.birthday}',
                  //   style: AppStyle.bookDetail,
                  // ),
                  RichText(
                    text: TextSpan(
                      text: 'Birthday : ',
                      style: AppStyle.bookDetail.copyWith(
                        color: Colors.black,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: '${counselor.birthday}',
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
                  SizedBox(height: _sizeHeight * 0.005),
                  // Text(
                  //   'Gender : ${counselor.gender}',
                  //   style: AppStyle.bookDetail,
                  // ),
                  RichText(
                    text: TextSpan(
                      text: 'Gender : ',
                      style: AppStyle.bookDetail.copyWith(
                        color: Colors.black,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: '${counselor.gender}',
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
                  SizedBox(height: _sizeHeight * 0.005),
                  // Text(
                  //   'High School : ${counselor.gender}',
                  //   style: AppStyle.bookDetail,
                  // ),
                  // RichText(
                  //   text: TextSpan(
                  //     text: 'High school : ',
                  //     style: AppStyle.bookDetail.copyWith(
                  //       color: Colors.black,
                  //     ),
                  //     children: <TextSpan>[
                  //       TextSpan(
                  //         text: '${counselor.birthday}',
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
                  //           // fontWeight: FontWeight.bold,
                  //           fontStyle: FontStyle.italic,
                  //         ),
                  //       ),
                  //       // TextSpan(text: ' world!'),
                  //     ],
                  //   ),
                  // ),
                  // SizedBox(height: _sizeHeight * 0.005),
                  // Text(
                  //   'Description : ${counselor.description}',
                  //   style: AppStyle.bookDetail,
                  // ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
