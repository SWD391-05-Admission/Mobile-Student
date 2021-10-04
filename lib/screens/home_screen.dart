import 'dart:convert';
import 'dart:developer';

// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
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

class HomeScreen extends StatefulWidget {
  const HomeScreen();
  static const routeName = '/home';
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  dynamic tmp1;
  IconData _icon = Icons.search;
  final controller = TextEditingController();
  PageController _pageController;
  int _currentIndex = 0;
  List<String> listTmp = [
    'LE',
    'DUY',
    'TUAN',
    'VU',
  ];

  @override
  void initState() {
    _pageController = PageController(
      viewportFraction: 0.95,
    );
    super.initState();
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
    List<User> listConsultant = [];
    listConsultant = User.createListConsulant();
    // final universityData = Provider.of<Universities>(context);
    // final universities = universityData.items;
    return ListView(
      children: [
        // Container(
        //   decoration: AppColors.decorationGradient,
        //   height: 61,
        //   child: Column(
        //     mainAxisAlignment: MainAxisAlignment.end,
        //     children: [
        //       Padding(
        //         padding: const EdgeInsets.only(
        //             left: 15, right: 15, top: 10, bottom: 10),
        //         child: Container(
        //           height: 40,
        //           child: Row(
        //             children: [
        //               Padding(
        //                 padding: const EdgeInsets.only(left: 10.5),
        //                 child: GestureDetector(
        //                   child: Icon(
        //                     Icons.search,
        //                     color: Colors.black45,
        //                     size: 20,
        //                   ),
        //                   onTap: () {
        //                     FocusScope.of(context).requestFocus(FocusNode());
        //                     print('VALUE : ${controller.text}');
        //                   },
        //                 ),
        //               ),
        //               Expanded(
        //                 child: TextField(
        //                   textAlign: TextAlign.start,
        //                   controller: controller,
        //                   decoration: InputDecoration(
        //                     border: InputBorder.none,
        //                     focusedBorder: InputBorder.none,
        //                     enabledBorder: InputBorder.none,
        //                     errorBorder: InputBorder.none,
        //                     disabledBorder: InputBorder.none,
        //                     contentPadding: EdgeInsets.only(
        //                         left: 10, bottom: 11.5, top: 3, right: 10),
        //                     hintText: " Search",
        //                     hintStyle:
        //                         AppStyle.h2.copyWith(color: Colors.black26),
        //                   ),
        //                   cursorColor: Colors.black12,
        //                   cursorWidth: 0.5,
        //                   style: AppStyle.h2.copyWith(color: Colors.black54),
        //                   onChanged: (context) {
        //                     setState(() {
        //                       context = controller.text;
        //                     });
        //                   },
        //                   onSubmitted: (value) {
        //                     print('VALUE: $value');
        //                   },
        //                 ),
        //               ),
        //               controller.text.isNotEmpty
        //                   ? Padding(
        //                       padding: const EdgeInsets.only(right: 7.5),
        //                       child: GestureDetector(
        //                         child: Icon(
        //                           Icons.close,
        //                           color: Colors.black38,
        //                           size: 22,
        //                         ),
        //                         onTap: () {
        //                           FocusScope.of(context)
        //                               .requestFocus(FocusNode());
        //                           setState(() {
        //                             controller.clear();
        //                           });
        //                         },
        //                       ),
        //                     )
        //                   : Padding(
        //                       padding: const EdgeInsets.only(right: 9),
        //                       child: GestureDetector(
        //                         // child: Icon(
        //                         //   // Icons.drag_indicator_sharp,
        //                         //   Icons.filter_list_rounded,
        //                         //   color: Colors.black45,
        //                         //   size: 22,
        //                         // ),
        //                         child: ImageIcon(
        //                           AssetImage('assets/icons/filter.png'),
        //                           size: 22,
        //                           color: Colors.black45,
        //                         ),
        //                         onTap: () {
        //                           print('TAP FILTER');
        //                           return showDialog(
        //                             context: context,
        //                             builder: (context) {
        //                               return SimpleDialog(
        //                                 title: const Text('GeeksforGeeks'),
        //                                 children: <Widget>[
        //                                   Column(
        //                                     children: [
        //                                       Text('Data 1'),
        //                                       Text('Data 2'),
        //                                       Text('Data 3'),
        //                                       Text('Data 4'),
        //                                       Text('Data 5'),
        //                                       Text('Data 6'),
        //                                     ],
        //                                   ),
        //                                 ],
        //                               );
        //                               // return
        //                             },
        //                           );
        //                         },
        //                       ),
        //                     ),
        //             ],
        //           ),
        //           decoration: BoxDecoration(
        //             border: Border.all(color: Colors.black87, width: 0.1),
        //             borderRadius: BorderRadius.circular(5),
        //             color: Colors.white,
        //             boxShadow: [
        //               BoxShadow(
        //                 color: Colors.black38,
        //                 offset: Offset(0, 1),
        //                 blurRadius: 5,
        //               )
        //             ],
        //           ),
        //         ),
        //       ),
        //     ],
        //   ),
        // ),
        // SizedBox(height: _sizeHeight * 0),

        // SizedBox(height: _sizeHeight * 0.022),
        CarouselWidget(),
        // Padding(
        //   padding: const EdgeInsets.symmetric(horizontal: 15),
        //   child: ClipRRect(
        //     borderRadius: BorderRadius.circular(5),
        //     child: ImageSlideshow(
        //       width: double.infinity,
        //       height: 200,
        //       initialPage: 0,
        //       indicatorColor: Color(0xFF00CCFF),
        //       indicatorBackgroundColor: Colors.white,
        //       onPageChanged: (value) {
        //         // debugPrint('Page changed: $value');
        //       },
        //       autoPlayInterval: 3000,
        //       isLoop: true,
        //       children: [
        //         ...getListAds(),
        //       ],
        //     ),
        //   ),
        // ),
        // SizedBox(
        //   height: _sizeHeight * 0.01,
        // ),
        // Padding(
        //   padding: const EdgeInsets.symmetric(horizontal: 170),
        //   child: Divider(
        //     color: Colors.black38,
        //     // height: 0.,
        //   ),
        // ),
        // SizedBox(
        //   height: _sizeHeight * 0.01,
        // ),
        // SizedBox(height: 2),
        // SizedBox(height: 5),
        // Padding(
        //   padding: const EdgeInsets.only(left: 4, right: 4, bottom: 5),
        //   child: Container(
        //     height: 40,
        //     decoration: BoxDecoration(
        //       border: Border.all(color: Colors.black26, width: 0.5),
        //       borderRadius: BorderRadius.circular(3),
        //     ),
        //     child: Row(
        //       children: [
        //         Padding(
        //           padding: const EdgeInsets.only(left: 10.5),
        //           child: GestureDetector(
        //             child: Icon(
        //               Icons.search,
        //               color: Colors.black26,
        //               size: 20,
        //             ),
        //             onTap: () {
        //               FocusScope.of(context).requestFocus(FocusNode());
        //               print('VALUE : ${controller.text}');
        //             },
        //           ),
        //         ),
        //         Expanded(
        //           child: TextField(
        //             textAlign: TextAlign.center,
        //             controller: controller,
        //             decoration: InputDecoration(
        //                 border: InputBorder.none,
        //                 focusedBorder: InputBorder.none,
        //                 enabledBorder: InputBorder.none,
        //                 errorBorder: InputBorder.none,
        //                 disabledBorder: InputBorder.none,
        //                 contentPadding: EdgeInsets.only(
        //                     left: 10, bottom: 11.5, top: 3, right: 10),
        //                 hintText: " Search",
        //                 hintStyle: AppStyle.h2
        //                     .copyWith(color: Colors.black26.withOpacity(0.2))),
        //             cursorColor: Colors.black12,
        //             style: AppStyle.h2.copyWith(color: Colors.black45),
        //             onChanged: (context) {
        //               setState(() {
        //                 context = controller.text;
        //               });
        //             },
        //             onSubmitted: (value) {
        //               print('VALUE: $value');
        //             },
        //           ),
        //         ),
        //         controller.text.isNotEmpty
        //             ? Padding(
        //                 padding: const EdgeInsets.only(right: 7.5),
        //                 child: GestureDetector(
        //                   child: Icon(
        //                     Icons.close,
        //                     color: Colors.black26,
        //                     size: 22,
        //                   ),
        //                   onTap: () {
        //                     FocusScope.of(context).requestFocus(FocusNode());
        //                     setState(() {
        //                       controller.clear();
        //                     });
        //                   },
        //                 ),
        //               )
        //             : Padding(
        //                 padding: const EdgeInsets.only(right: 9),
        //                 child: GestureDetector(
        //                   child: Icon(
        //                     // Icons.drag_indicator_sharp,
        //                     Icons.filter_list_rounded,
        //                     color: Colors.black26,
        //                     size: 22,
        //                   ),
        //                   onTap: () {
        //                     print('TAP FILTER');
        //                   },
        //                 ),
        //               ),
        //       ],
        //     ),
        //   ),
        // ),
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
                        BoxShadow(
                          // offset: Offset(1.0, 1.0),
                          blurRadius: 8,
                          color: Color(0xFF999999).withOpacity(0.5),
                        )
                      ],
                      // color: Color(0xFF4DF2E1),
                      color: Colors.white,
                    ),
                  ),
                  onTap: () {
                    Navigator.of(context).pushNamed('/search-talkshow-screen');
                    // final user = FirebaseAuth.instance.currentUser;
                    // String tmpToken;
                    // user.getIdTokenResult().then((value) {
                    //   Future<void> getData() async {
                    //     String url = 'http://20.89.111.129/api/Login';
                    //     Uri uri = Uri.parse(url);

                    //     Map<String, String> headers = {
                    //       'token': '${value.token}'
                    //     };
                    //     http.Response res =
                    //         await http.get(uri, headers: headers);
                    //     // log('TOKEN TRONG FUTURE NE: $tmpToken');
                    //     // log('HEADER NE: ${headers.toString()}');
                    //     log('response nè: ${res.body}');
                    //     // log('STATUS CODE NEF: ${res.statusCode}');
                    //     final tmp = jsonDecode(res.body);
                    //     setState(() {
                    //       tmp1 = tmp;
                    //     });
                    //     log('HIHIHIHIHIHI ${tmp['token']['result']}');
                    //   }

                    //   getData();

                    //   log('ACCESS TOKEN NEF: $tmpToken');
                    // });
                    // log('TOKEN NGOAIF FUTURE: $tmpToken');
                    // Authen().authen();
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
                        'Consultants',
                        textAlign: TextAlign.center,
                        style: AppStyle.typeSearch,
                      ),
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      boxShadow: [
                        BoxShadow(
                          // offset: Offset(1.0, 1.0),
                          blurRadius: 8,
                          color: Color(0xFF999999).withOpacity(0.5),
                        )
                      ],
                      // color: Color(0xFF2DE2ED),
                      color: Colors.white,
                    ),
                  ),
                  onTap: () {
                    Navigator.of(context)
                        .pushNamed('/search-consultant-screen');
                    // Future<void> getPost() async {
                    //   String url = 'http://20.89.111.129/api/Login/Post';
                    //   Uri uri = Uri.parse(url);
                    //   log('BODY NE $tmp1');
                    //   Map<String, String> headers = {
                    //     'Authorization': 'Bearer ${tmp1['token']['result']}'
                    //   };
                    //   http.Response res =
                    //       await http.post(uri, headers: headers);
                    //   log('STATUS ${res.statusCode}');
                    //   // log('TOKEN TRONG FUTURE NE: $tmpToken');
                    //   // log('HEADER NE: ${headers.toString()}');
                    //   log('response nè: ${res.body}');
                    //   // log('STATUS CODE NEF: ${res.statusCode}');
                    //   // final tmp = jsonDecode(res.body);
                    //   // log('BODYYYYYYYYYYY $tmp');
                    // }

                    // getPost();
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
                        BoxShadow(
                          // offset: Offset(1.0, 1.0),
                          blurRadius: 8,
                          color: Color(0xFF999999).withOpacity(0.5),
                        )
                      ],
                      // color: Color(0xFF14D5F6),
                      color: Colors.white,
                    ),
                  ),
                  onTap: () {
                    Navigator.of(context)
                        .pushNamed('/search-university-screen');
                  },
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: _sizeHeight * 0.02,
        ),
        // Padding(
        //   padding: const EdgeInsets.symmetric(horizontal: 16),
        //   child: Divider(
        //     color: Colors.black38,
        //     // height: 0.,
        //   ),
        // ),
        // Padding(
        //   padding: const EdgeInsets.symmetric(horizontal: 16),
        //   child: Divider(
        //     color: Colors.black38,
        //     // height: 0.,
        //   ),
        // ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 170),
          child: Divider(
            color: Colors.black38,
            // height: 0.,
          ),
        ),
        SizedBox(
          height: _sizeHeight * 0.017,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Container(
            height: _sizeHeight * 0.5,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  blurRadius: 8,
                  color: Color(0xFF999999).withOpacity(0.4),
                )
              ],
            ),
            child: Column(
              children: [
                SizedBox(height: _sizeHeight * 0.024),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    // mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.school_outlined),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Popular Talkshows',
                        style: AppStyle.titleSearch,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: _sizeHeight * 0.022),
                Container(
                  height: _sizeHeight * 0.395,
                  child: PageView.builder(
                    controller: _pageController,
                    itemCount: 3,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(left: 5, right: 5),
                        child: GestureDetector(
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              color: Color(0xFFDDDDDD),
                              border: Border.all(
                                color: Colors.black54,
                                width: 0.07,
                              ),
                            ),
                            // height: 100,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  // height: 100,
                                  // width: 100,
                                  // child:
                                  //     Image.network(listTalkshow[index].image),
                                  child: ClipRRect(
                                    // borderRadius: BorderRadius.circular(4.0),
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(4),
                                        topRight: Radius.circular(4)),
                                    child: Image.network(
                                        listTalkshow[index].image),
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
                                            // mainAxisAlignment:
                                            //     MainAxisAlignment.spaceBetween,
                                            // crossAxisAlignment:
                                            //     CrossAxisAlignment.end,
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
                                              Text(
                                                'See more >>',
                                                style: TextStyle(
                                                  fontFamily: AppFonts.poppins,
                                                  fontSize: 12,
                                                ),
                                              )
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
                                // Padding(
                                //   padding: const EdgeInsets.only(left: 6),
                                //   child: Text(
                                //     listTalkshow[index].id,
                                //     style: AppStyle.logoChooseUniver,
                                //   ),
                                // ),
                                // Padding(
                                //   padding: const EdgeInsets.only(left: 6),
                                //   child: Text(
                                //     listTalkshow[index].name,
                                //     style: AppStyle.logoChooseUniver,
                                //   ),
                                // ),
                                // (index == 2)
                                //     ? Padding(
                                //         padding:
                                //             const EdgeInsets.only(left: 250),
                                //         child: GestureDetector(
                                //           child: Text(
                                //             'SEE MORE >>',
                                //             style: AppStyle.link,
                                //           ),
                                //           onTap: () {
                                //             print('ON TAP SEE MORE');
                                //             Navigator.of(context).pushNamed(
                                //                 '/search-talkshow-screen');
                                //           },
                                //         ),
                                //       )
                                //     : SizedBox(),
                                // (index == 2)
                                //     ? Row(
                                //         children: [
                                //           SizedBox(
                                //             width: _sizeWidth * 0.02,
                                //           ),
                                //           Text(
                                //             'Price : ${listTalkshow[index].price}',
                                //             style: TextStyle(
                                //               fontFamily: AppFonts.poppins,
                                //               fontSize: 12,
                                //             ),
                                //           ),
                                //           Expanded(child: SizedBox()),
                                //           Text(
                                //             'See more >>',
                                //             style: TextStyle(
                                //               fontFamily: AppFonts.poppins,
                                //               fontSize: 12,
                                //             ),
                                //           ),
                                //         ],
                                //       )
                                //     : SizedBox()
                              ],
                            ),
                          ),
                          onTap: () {
                            Navigator.of(context).pushNamed(
                                '/talkshow-detail-screen',
                                arguments: listTalkshow[index]);
                          },
                        ),
                      );
                    },
                    onPageChanged: (index) {
                      setState(() {
                        _currentIndex = index;
                      });
                    },
                  ),
                ),
                // SizedBox(height: _sizeHeight * 0.025),
              ],
            ),
          ),
        ),
        SizedBox(height: _sizeHeight * 0.03),
        // Padding(
        //   padding: const EdgeInsets.symmetric(horizontal: 170),
        //   child: Divider(
        //     color: Colors.black38,
        //     // height: 0.,
        //   ),
        // ),
        //
        // Center(
        //   child: Text('HOT TITLE HERE'),
        // ),
        // SizedBox(height: 10),
        // Container(
        //   height: 250,
        //   child: PageView.builder(
        //     controller: _pageController,
        //     itemCount: 3,
        //     itemBuilder: (context, index) {
        //       return Padding(
        //         padding: const EdgeInsets.only(left: 5, right: 5),
        //         child: GestureDetector(
        //           child: Container(
        //             decoration: BoxDecoration(
        //               borderRadius:
        //                   BorderRadius.circular(4), // <= No more error here :)
        //               color: Colors.pink,
        //             ),
        //             height: 100,
        //             child: Column(
        //               crossAxisAlignment: CrossAxisAlignment.start,
        //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //               children: [
        //                 Padding(
        //                   padding: const EdgeInsets.only(left: 6),
        //                   child: Text(
        //                     universities[index].name,
        //                     style: AppStyle.logoChooseUniver,
        //                   ),
        //                 ),
        //                 Padding(
        //                   padding: const EdgeInsets.only(left: 6),
        //                   child: Text(
        //                     universities[index].id,
        //                     style: AppStyle.logoChooseUniver,
        //                   ),
        //                 ),
        //                 Padding(
        //                   padding: const EdgeInsets.only(left: 6),
        //                   child: Text(
        //                     universities[index].name,
        //                     style: AppStyle.logoChooseUniver,
        //                   ),
        //                 ),
        //                 (index == 2)
        //                     ? Padding(
        //                         padding: const EdgeInsets.only(left: 300),
        //                         child: GestureDetector(
        //                           child: Text(
        //                             'SEE MORE >>',
        //                             style: AppStyle.link,
        //                           ),
        //                           onTap: () {
        //                             print('ON TAP SEE MORE');
        //                             Navigator.of(context)
        //                                 .pushNamed('/university-item');
        //                           },
        //                         ),
        //                       )
        //                     : SizedBox()
        //               ],
        //             ),
        //           ),
        //           onTap: () {
        //             Navigator.of(context).pushNamed('/university-detail',
        //                 arguments: universities[index]);
        //           },
        //         ),
        //       );
        //     },
        //     onPageChanged: (index) {
        //       setState(() {
        //         _currentIndex = index;
        //       });
        //     },
        //   ),
        // ),
        // SizedBox(height: _sizeHeight * 0.015),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  blurRadius: 8,
                  color: Color(0xFF999999).withOpacity(0.4),
                )
              ],
            ),
            child: Column(
              children: [
                SizedBox(height: _sizeHeight * 0.024),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    // mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.school_outlined),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Popular Consultants',
                        style: AppStyle.titleSearch,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: _sizeHeight * 0.022),
                Container(
                  height: _sizeHeight * 0.32,
                  child: PageView.builder(
                    controller: _pageController,
                    itemCount: 3,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(left: 5, right: 5),
                        child: GestureDetector(
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              color: Colors.grey,
                            ),
                            height: 100,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  height: 100,
                                  width: 100,
                                  child: Image.network(
                                      listConsultant[index].image),
                                ),
                                // Padding(
                                //   padding: const EdgeInsets.only(left: 6),
                                //   child: Text(
                                //     universities[index].id,
                                //     style: AppStyle.logoChooseUniver,
                                //   ),
                                // ),
                                // Padding(
                                //   padding: const EdgeInsets.only(left: 6),
                                //   child: Text(
                                //     universities[index].name,
                                //     style: AppStyle.logoChooseUniver,
                                //   ),
                                // ),
                                (index == 2)
                                    ? Padding(
                                        padding:
                                            const EdgeInsets.only(left: 300),
                                        child: GestureDetector(
                                          child: Text(
                                            'SEE MORE >>',
                                            style: AppStyle.link,
                                          ),
                                          onTap: () {
                                            print('ON TAP SEE MORE');
                                            Navigator.of(context).pushNamed(
                                                '/search-consultant-screen');
                                          },
                                        ),
                                      )
                                    : SizedBox()
                              ],
                            ),
                          ),
                          onTap: () {
                            Navigator.of(context).pushNamed(
                                '/consultant-detail-screen',
                                arguments: listConsultant[index]);
                          },
                        ),
                      );
                    },
                    onPageChanged: (index) {
                      setState(() {
                        _currentIndex = index;
                      });
                    },
                  ),
                ),
                SizedBox(height: _sizeHeight * 0.025),
              ],
            ),
          ),
        ),
        SizedBox(height: _sizeHeight * 0.03),
        // Padding(
        //   padding: const EdgeInsets.symmetric(horizontal: 170),
        //   child: Divider(
        //     color: Colors.black38,
        //     // height: 0.,
        //   ),
        // ),
        // SizedBox(height: _sizeHeight * 0.011),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  blurRadius: 8,
                  color: Color(0xFF999999).withOpacity(0.4),
                )
              ],
            ),
            child: Column(
              children: [
                SizedBox(height: _sizeHeight * 0.024),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    // mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.school_outlined),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Popular Universities',
                        style: AppStyle.titleSearch,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: _sizeHeight * 0.022),
                Container(
                  height: _sizeHeight * 0.32,
                  child: PageView.builder(
                    controller: _pageController,
                    itemCount: 3,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(left: 5, right: 5),
                        child: GestureDetector(
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              color: Colors.grey,
                            ),
                            height: 100,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 6),
                                  child: Text(
                                    listUniversity[index].name,
                                    style: AppStyle.logoChooseUniver,
                                  ),
                                ),
                                // Padding(
                                //   padding: const EdgeInsets.only(left: 6),
                                //   child: Text(
                                //     universities[index].id,
                                //     style: AppStyle.logoChooseUniver,
                                //   ),
                                // ),
                                // Padding(
                                //   padding: const EdgeInsets.only(left: 6),
                                //   child: Text(
                                //     universities[index].name,
                                //     style: AppStyle.logoChooseUniver,
                                //   ),
                                // ),
                                (index == 2)
                                    ? Padding(
                                        padding:
                                            const EdgeInsets.only(left: 300),
                                        child: GestureDetector(
                                          child: Text(
                                            'SEE MORE >>',
                                            style: AppStyle.link,
                                          ),
                                          onTap: () {
                                            print('ON TAP SEE MORE');
                                            Navigator.of(context).pushNamed(
                                                '/search-university-screen');
                                          },
                                        ),
                                      )
                                    : SizedBox()
                              ],
                            ),
                          ),
                          onTap: () {
                            Navigator.of(context).pushNamed(
                                '/university-detail-screen',
                                arguments: listUniversity[index]);
                          },
                        ),
                      );
                    },
                    onPageChanged: (index) {
                      setState(() {
                        _currentIndex = index;
                      });
                    },
                  ),
                ),
                SizedBox(height: _sizeHeight * 0.025),
              ],
            ),
          ),
        ),
        SizedBox(height: 20),
      ],
    );
  }
}
