import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_avatar/flutter_advanced_avatar.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:mobile_customer/providers/google_sign_in.dart';
import 'package:mobile_customer/values/app_colors.dart';
import 'package:mobile_customer/values/app_fonts.dart';
import 'package:mobile_customer/values/app_styles.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen();
  static const routeName = '/profile';
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  // final User user = User.createUser();

  final _boxShadow = BoxShadow(
    color: Colors.black.withOpacity(0.1),
    spreadRadius: 0.1,
    blurRadius: 5,
    offset: Offset(1, 1), // changes position of shadow
  );

  // Container avatarAccount(double sizeHeight, user) {
  //   // String avatar =
  //   //     (user == null) ? AppImageIcon.noAccount : AppImageIcon.avatar;
  //   return Container(
  //     height: sizeHeight * 1 / 11,
  //     width: sizeHeight * 1 / 11,
  //     child: CircleAvatar(
  //       // backgroundImage: AssetImage(avatar),
  //       backgroundImage: NetworkImage(user.photoURL),
  //     ),
  //     decoration: BoxDecoration(
  //       boxShadow: [_boxShadow],
  //       borderRadius: BorderRadius.circular(90),
  //     ),
  //   );
  // }

  @override
  Widget createContainer(title, value, _sizeWidth) {
    return Container(
      height: 50,
      // decoration: BoxDecoration(
      //   border: Border.all(color: Colors.grey.withOpacity(0.05)),
      //   borderRadius: BorderRadius.circular(4),
      // ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 9, left: 9, top: 10),
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 11.0),
                    child: Text(
                      title,
                      style: AppStyle.h3,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Text(
                    value,
                    style: AppStyle.h3,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.right,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 12.0, right: 7),
                  child: GestureDetector(
                    child: Icon(
                      Icons.arrow_forward_ios_rounded,
                      size: 15,
                    ),
                    onTap: () {
                      _displayDialog(context, title, value);
                    },
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              right: 20,
              left: 20,
            ),
            child: Divider(
              color: Colors.grey.withOpacity(0.15),
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> listRow(
    _sizeWidth,
    name,
    email,
    refreshToken,
    uid,
  ) {
    List<Widget> list = [
      createContainer("Name", name, _sizeWidth),
      createContainer("Email", email, _sizeWidth),
      createContainer("Refresh Token", refreshToken, _sizeWidth),
      createContainer("UID", uid, _sizeWidth),
    ];
    return list;
  }

  TextEditingController _textFieldController = TextEditingController();

  _displayDialog(BuildContext context, String titleField, String value) async {
    String newTitle = titleField.toLowerCase();
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          elevation: 5,
          title: Text(
            'Enter your new $newTitle',
            style: AppStyle.h1.copyWith(fontSize: 19),
          ),
          content: TextField(
            controller: _textFieldController,
            textInputAction: TextInputAction.go,
            // keyboardType: TextInputType.multiline(),
            decoration: InputDecoration(
              // hintText: " Enter your $titleField",
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.black54),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.black54),
              ),
            ),
            cursorColor: Colors.black54,
            style: AppStyle.h2,
          ),
          actions: <Widget>[
            FlatButton(
              child: Text(
                'Cancel',
                style: AppStyle.h2,
              ),
              onPressed: () {
                _textFieldController.clear();
                Navigator.of(context).pop();
              },
            ),
            FlatButton(
              child: Text(
                'Save',
                style: AppStyle.h2,
              ),
              onPressed: () {
                _textFieldController.clear();
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Widget build(BuildContext context) {
    final double _sizeHeight = MediaQuery.of(context).size.height;
    final double _sizeWidth = MediaQuery.of(context).size.width;
    // User user = User(
    //     avatar:
    //         'https://danongonline.com.vn/wp-content/uploads/2018/02/anh-girl-xinh-mat-moc-9.jpg',
    //     userID: 'leduytuanvu.work@gmail.com',
    //     userName: 'Le Duy Tuan Vu',
    //     phone: '0961191732',
    //     address: '115 Đoàn Thị Điểm, Lộc Thanh, Bảo Lộc, Lâm Đồng',
    //     email: 'leduytuanvu.work@gmail.com',
    //     sex: 'male',
    //     birtchDay: DateTime.now(),
    //     joinDate: DateTime.now(),
    //     status: true);
    final user = FirebaseAuth.instance.currentUser;
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(230),
          child: Container(
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Color(0xFF999999).withOpacity(0.4),
                        // spreadRadius: 0.1,
                        blurRadius: 8,
                      )
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 50),
                    child: Center(
                      // child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 90,
                            width: 90,
                            child: Stack(
                              clipBehavior: Clip.none,
                              fit: StackFit.expand,
                              children: [
                                AdvancedAvatar(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(0.6),
                                        spreadRadius: 0.1,
                                        blurRadius: 10,
                                        offset: Offset(
                                            2, 3), // changes position of shadow
                                      )
                                    ],
                                  ),
                                  size: 90,
                                  // image: AssetImage('assets/images/avatar.png'),
                                  image: NetworkImage(user.photoURL),
                                  foregroundDecoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      // color: Color(0xFF49F0EE),
                                      color: Colors.white,
                                      width: 3,
                                    ),
                                  ),
                                ),
                                Positioned(
                                  top: 67,
                                  bottom: 1,
                                  right: -28,
                                  child: RawMaterialButton(
                                    onPressed: () {
                                      // user.getIdToken(true).then(
                                      //     (value) => log('ID TOKEN: $value'));
                                      // user.getIdTokenResult(true).then(
                                      //     (value) => log(
                                      //         'ID TOKEN ACCESS: ${value.token}'));
                                      // user.refreshToken;

                                      // String accessToken, token;
                                      // final tmpUser = GoogleSignInProvider()
                                      //     .getUser
                                      //     .authentication
                                      //     .then((value) {
                                      //   accessToken = value.accessToken;
                                      //   token = value.idToken;
                                      //   log('access token: $accessToken'
                                      //       .toUpperCase());
                                      //   log('token: $token'.toUpperCase());
                                      // });

                                      // final newUser =
                                      //     GoogleSignInProvider().getUser;
                                      // log(newUser.displayName);
                                      // newUser.authentication
                                      //     .then((value) => null);
                                      // GoogleSignInProvider()
                                      //     .getUser
                                      //     .authentication
                                      //     .then(
                                      //   (value) {
                                      //     accessToken = value.accessToken;
                                      //     token = value.idToken;
                                      //   },
                                      // );
//                                       final tmpUser =
//                                           GoogleSignInProvider().getUser;
//                                       final ggAuth = tmpUser.authentication;

//                                       try {
//    final result = GoogleSignInProvider().getUser;
//    final ggAuth = await result.authentication;
//    print(ggAuth.idToken);
//    print(ggAuth.accessToken);
// } catch (error) {
//   print(error);
// // }
                                      // accessToken =
                                      //     GoogleSignInProvider().getAccessToken;
                                      // token = GoogleSignInProvider().getToken;
                                      // log(widget)
                                      // void getToken() async {
                                      //   final result =
                                      //       await GoogleSignInProvider()
                                      //           .getUser;
                                      //   final ggAuth =
                                      //       await result.authentication;
                                      // log('access token: $accessToken'
                                      //     .toUpperCase());
                                      // log('token: $token'.toUpperCase());
                                      // }
                                      final provider =
                                          Provider.of<GoogleSignInProvider>(
                                        context,
                                        listen: false,
                                      );
                                      provider.googleLogout();
                                    },
                                    elevation: 8.0,
                                    fillColor: Color(0xFFF5F6F9),
                                    child: Icon(
                                      Icons.camera_alt,
                                      color: Colors.black,
                                      size: 14,
                                    ),
                                    shape: CircleBorder(),
                                  ),
                                ),
                                // Positioned(
                                //   left: 192,
                                //   top: -25,
                                //   child: GestureDetector(
                                //     child: IconButton(
                                //       icon: Icon(
                                //         Icons.logout,
                                //         color: Colors.black87,
                                //       ),
                                //       iconSize: 22,
                                //       onPressed: () {
                                //         print('LOGOUT');
                                //         // Navigator.of(context).pushNamed('/');
                                //         // final provider =
                                //         //     Provider.of<GoogleSignInProvider>(
                                //         //         context,
                                //         //         listen: false);
                                //         // provider.googleLogout();
                                //       },
                                //     ),
                                //     onTap: () {
                                //       print('LOGOUT');
                                //       // Navigator.of(context).pushNamed('/');
                                //       // final provider =
                                //       //     Provider.of<GoogleSignInProvider>(
                                //       //         context,
                                //       //         listen: false);
                                //       // provider.googleLogout();
                                //     },
                                //   ),
                                // ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 13,
                          ),
                          Center(
                            child: Text(
                              'Lê Duy Tuấn Vũ',
                              style: AppStyle.h1.copyWith(
                                color: Colors.black87,
                                fontWeight: FontWeight.bold,
                                fontSize: 19,
                                shadows: [
                                  Shadow(
                                    offset: Offset(2.0, 2.0),
                                    blurRadius: 8,
                                    color: Color(0xFF555555),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 13.5,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                // ),
                SizedBox(
                  height: 10,
                ),
                TabBar(
                  indicatorSize: TabBarIndicatorSize.label,
                  tabs: [
                    Tab(
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          "Profile",
                          style: TextStyle(
                            fontFamily: AppFonts.montserrat,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                    Tab(
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          "Wallet",
                          style: TextStyle(
                            fontFamily: AppFonts.montserrat,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  ],
                  unselectedLabelColor: Colors.black45,
                  indicatorColor: Colors.black,
                  indicatorWeight: 0.5,
                )
              ],
            ),
          ),
        ),
        body: TabBarView(
          children: [
            ListView(
              children: [
                SizedBox(
                  height: 10,
                ),
                ...listRow(
                  _sizeWidth,
                  user.displayName,
                  user.email,
                  user.refreshToken,
                  user.uid,
                ),
              ],
            ),
            Icon(Icons.wallet_travel),
          ],
        ),
      ),
    );
  }
}
