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
                  flex: 2,
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
                  flex: 4,
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
      createContainer("Name", (user.fullName == null) ? '' : user.fullName),
      createContainer("Email", (user.email == null) ? '' : user.email),
      createContainer("Address", (user.address == null) ? '' : user.address),
      createContainer("Birthday", (user.birthday == null) ? '' : user.birthday),
      createContainer("Phone", (user.phone == null) ? '' : user.phone),
      createContainer(
          "High School", (user.highSchool == null) ? '' : user.highSchool),
      createContainer("Gender", (user.gender == null) ? '' : user.gender),
    ];
    return list;
  }

  TextEditingController _textFieldController = TextEditingController();

  _displayDialog(BuildContext context, String titleField, String value) async {
    String newTitle = titleField.toLowerCase();
    var controller = TextEditingController();
    controller.text = value;
    String oldValue = '';
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
            controller: controller,
            autofocus: true,
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
                // _textFieldController.clear();
                // log(controller.text);
                if (titleField == 'Email') {
                  user.email = controller.text;
                } else if (titleField == 'Address') {
                  user.address = controller.text;
                } else if (titleField == 'Name') {
                  user.fullName = controller.text;
                } else if (titleField == 'Birthday') {
                  user.birthday = controller.text;
                } else if (titleField == 'Phone') {
                  user.phone = controller.text;
                } else if (titleField == 'High School') {
                  user.highSchool = controller.text;
                } else if (titleField == 'Gender') {
                  user.gender = controller.text;
                }
                // UserController().updateUser(user);
                UserController().setUpdateUser(user);
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  User user;

  @override
  void initState() {
    // UserController().setUser();
    user = Provider.of<UserController>(context, listen: false).user;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    user = Provider.of<UserController>(context, listen: false).user;
    // log(user.image);
    final double _sizeHeight = MediaQuery.of(context).size.height -
        MediaQuery.of(context).padding.top -
        MediaQuery.of(context).padding.bottom;
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(_sizeHeight * 0.325),
          child: SizedBox(
            // color: Colors.amber,
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
                                      log('TAP CHANGE AVATAR');
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
                            height: 15,
                          ),
                          Center(
                            child: Text(
                              // user.fullName,
                              'Le Duy Tuan Vu',
                              style: AppStyle.h1.copyWith(
                                color: Colors.black87,
                                // fontWeight: FontWeight.bold,
                                fontFamily: AppFonts.poppins,
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
                            height: 16,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                // ),
                SizedBox(
                  height: _sizeHeight * 0.005,
                ),
                TabBar(
                  indicatorSize: TabBarIndicatorSize.label,
                  tabs: [
                    Tab(
                      child: Align(
                        alignment: Alignment.center,
                        child: Text("Profile", style: AppStyle.barStyle),
                      ),
                    ),
                    Tab(
                      child: Align(
                        alignment: Alignment.center,
                        child: Text("Wallet", style: AppStyle.barStyle),
                      ),
                    ),
                  ],
                  unselectedLabelColor: Colors.black38,
                  indicatorColor: Colors.black,
                  indicatorWeight: 0.8,
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
                // Padding(
                //   padding: const EdgeInsets.symmetric(horizontal: 16),
                //   child: FlatButton(
                //     onPressed: () {
                //       // User user = UserController().user;
                //       // log(user.fullName);
                //       final provider = Provider.of<GoogleSignInProvider>(
                //         context,
                //         listen: false,
                //       );
                //       provider.googleLogout();
                //     },
                //     child: Text('LOG OUT'),
                //   ),
                // )
                SizedBox(
                  height: 7,
                ),
                // FlatButton(
                //   child: Text(
                //     'Logout',
                //     style: AppStyle.h3,
                //     textAlign: TextAlign.start,
                //   ),
                //   onPressed: () {
                //     // final provider = Provider.of<GoogleSignInProvider>(
                //     //   context,
                //     //   listen: false,
                //     // );
                //     // provider.googleLogout();
                //   },
                // ),
                Padding(
                  padding: const EdgeInsets.only(left: 16),
                  child: GestureDetector(
                    child: Text(
                      'Logout',
                      style: AppStyle.h3,
                      textAlign: TextAlign.start,
                    ),
                    onTap: () {
                      final provider = Provider.of<GoogleSignInProvider>(
                        context,
                        listen: false,
                      );
                      provider.googleLogout();
                    },
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
              ],
            ),
            ListView(
              children: [
                Icon(Icons.wallet_travel),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
