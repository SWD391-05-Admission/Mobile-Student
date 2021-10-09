import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_advanced_avatar/flutter_advanced_avatar.dart';
import 'package:mobile_customer/models/user.dart';
import 'package:mobile_customer/providers/google_sign_in.dart';
import 'package:mobile_customer/providers/user_controller.dart';
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
  Widget createContainer(title, value) {
    return SizedBox(
      height: 50, // NEED FEED HEIGHT
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
                right: 9, left: 9, top: 10), // NEED FEED HEIGHT
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

  List<Widget> listRow(User user) {
    List<Widget> list = [
      createContainer("Name", user.fullName),
      createContainer("Email", user.email),
      createContainer("Address", user.address),
      createContainer(
        "Birthday",
        user.birthday,
      ),
      createContainer(
        "Phone",
        user.phone,
      ),
      createContainer(
        "High School",
        user.highSchool,
      ),
      createContainer(
        "Gender",
        user.gender,
      ),
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

  @override
  Widget build(BuildContext context) {
    // User user = Provider.of<UserController>(context, listen: false).user;
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
                                  image: AssetImage('assets/images/avatar.png'),
                                  // image: NetworkImage(user.image),
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
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 13,
                          ),
                          Center(
                            child: Text(
                              // user.fullName,
                              'Tuan Vu',
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
                // ...listRow(user),
                ElevatedButton(
                  onPressed: () {
                    // UserController().getUser();
                    // User newUser =
                    //     Provider.of<UserController>(context, listen: false)
                    //         .getCurrentUser();
                    // log('SAVE USER : ${newUser.fullName}');
                    // UserController().inUser();
                  },
                  child: Text('GET PROFILE'),
                )
              ],
            ),
            Icon(Icons.wallet_travel),
          ],
        ),
      ),
    );
  }
}
