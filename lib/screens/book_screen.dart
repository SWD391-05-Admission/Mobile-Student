import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_advanced_avatar/flutter_advanced_avatar.dart';
import 'package:mobile_customer/models/talkshow.dart';
import 'package:mobile_customer/providers/talkshow_controller.dart';
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
  Future future;
  @override
  void initState() {
    future = TalkshowController().getListTalkshow('', '', '', 1, 2);
    super.initState();
  }

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
                        "Sắp diễn ra",
                        style: AppStyle.barStyle,
                        // style: AppStyle.titleSearch,
                      ),
                    ),
                  ),
                  Tab(
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        "Lịch sử tham",
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
            FutureBuilder(
              future: future,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  Map<String, List<Talkshow>> mapTalkshow = snapshot.data;
                  String numberOfPage = mapTalkshow.keys.elementAt(0);
                  List<Talkshow> list = mapTalkshow.entries.first.value;
                  return Padding(
                    padding:
                        const EdgeInsets.only(top: 15, left: 15, right: 15),
                    child: Column(
                      children: [
                        for (int i = 0; i < list.length; i++) ...{
                          GestureDetector(
                            child: Row(
                              children: [
                                Container(
                                  height: 70,
                                  width: 100,
                                  child: Image.network(
                                    list[i].image,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                SizedBox(
                                  width: 15,
                                ),
                                Expanded(
                                  child: SizedBox(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          list[i].description,
                                          style: AppStyle.bookDetail,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        Text(
                                          'Vào lúc ${list[i].timeStart} ngày ${list[i].date}',
                                          style: AppStyle.bookDetail,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        Text(
                                          'Nhà diễn giả : ${list[i].counselor.fullName}',
                                          style: AppStyle.bookDetail,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        Text(
                                          'Giá : ${list[i].price} miếng dưa hấu',
                                          style: AppStyle.bookDetail,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            onTap: () {
                              Navigator.of(context).pushNamed(
                                  '/talkshow-detail-history-screen',
                                  arguments: list[i]);
                            },
                          ),
                          (i < list.length - 1)
                              ? Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 15),
                                  child:
                                      Divider(height: 1, color: Colors.black26),
                                )
                              : SizedBox(),
                        }
                      ],
                    ),
                  );
                } else if (snapshot.connectionState ==
                    ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(
                      color: Colors.black38,
                    ),
                  );
                } else {
                  return Center();
                }
              },
            ),
            FutureBuilder(
              future: future,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  Map<String, List<Talkshow>> mapTalkshow = snapshot.data;
                  String numberOfPage = mapTalkshow.keys.elementAt(0);
                  List<Talkshow> list = mapTalkshow.entries.first.value;
                  return Padding(
                    padding:
                        const EdgeInsets.only(top: 15, left: 15, right: 15),
                    child: Column(
                      children: [
                        for (int i = 0; i < list.length; i++) ...{
                          GestureDetector(
                            child: Row(
                              children: [
                                Container(
                                  height: 70,
                                  width: 100,
                                  child: Image.network(
                                    list[i].image,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                SizedBox(
                                  width: 15,
                                ),
                                Expanded(
                                  child: SizedBox(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          list[i].description,
                                          style: AppStyle.bookDetail,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        Text(
                                          'Vào lúc ${list[i].timeStart} ngày ${list[i].date}',
                                          style: AppStyle.bookDetail,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        Text(
                                          'Nhà diễn giả : ${list[i].counselor.fullName}',
                                          style: AppStyle.bookDetail,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        Text(
                                          'Giá : ${list[i].price} miếng dưa hấu',
                                          style: AppStyle.bookDetail,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            onTap: () {
                              Navigator.of(context).pushNamed(
                                  '/talkshow-detail-history-screen',
                                  arguments: list[i]);
                            },
                          ),
                          (i < list.length - 1)
                              ? Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 15),
                                  child:
                                      Divider(height: 1, color: Colors.black26),
                                )
                              : SizedBox(),
                        }
                      ],
                    ),
                  );
                } else if (snapshot.connectionState ==
                    ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(
                      color: Colors.black38,
                    ),
                  );
                } else {
                  return Center();
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
