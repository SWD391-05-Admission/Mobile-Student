import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_advanced_avatar/flutter_advanced_avatar.dart';
import 'package:mobile_customer/models/talkshow.dart';
import 'package:mobile_customer/values/app_fonts.dart';
import 'package:mobile_customer/values/app_styles.dart';
import 'package:mobile_customer/widgets/book_item.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen();
  static const routesName = '/setting';
  @override
  _SettingScreenState createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  List<Talkshow> listTalkshow = [];
  @override
  Widget build(BuildContext context) {
    final double _sizeHeight = MediaQuery.of(context).size.height -
        MediaQuery.of(context).padding.top -
        MediaQuery.of(context).padding.bottom;

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(_sizeHeight * 0.07),
          child: Column(
            children: [
              SizedBox(
                height: 27,
              ),
              TabBar(
                indicatorSize: TabBarIndicatorSize.label,
                tabs: [
                  Tab(
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        "Upcoming",
                        style: AppStyle.barStyle,
                        // style: AppStyle.titleSearch,
                      ),
                    ),
                  ),
                  Tab(
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        "History",
                        style: AppStyle.barStyle,
                        // style: AppStyle.titleSearch,
                      ),
                    ),
                  ),
                ],
                unselectedLabelColor: Colors.black26,
                indicatorColor: Colors.black,
                indicatorWeight: 0.9,
              )
            ],
          ),
        ),
        body: TabBarView(
          children: [
            ListView.builder(
              itemCount: listTalkshow.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    (index == 0)
                        ? SizedBox(
                            height: 8,
                          )
                        : SizedBox(),
                    BookItem(talkshow: listTalkshow[index]),
                    SizedBox(
                      height: 8,
                    ),
                    (index != listTalkshow.length - 1)
                        ? Padding(
                            padding: const EdgeInsets.only(left: 16, right: 16),
                            child: Divider(),
                          )
                        : SizedBox(
                            height: 8,
                          ),
                  ],
                );
              },
            ),
            ListView.builder(
              itemCount: listTalkshow.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    (index == 0)
                        ? SizedBox(
                            height: 8,
                          )
                        : SizedBox(),
                    BookItem(talkshow: listTalkshow[index]),
                    SizedBox(
                      height: 8,
                    ),
                    (index != listTalkshow.length - 1)
                        ? Padding(
                            padding: const EdgeInsets.only(left: 16, right: 16),
                            child: Divider(),
                          )
                        : SizedBox(
                            height: 8,
                          ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
