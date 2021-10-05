import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:mobile_customer/models/talkshow.dart';
import 'package:mobile_customer/values/app_fonts.dart';
import 'package:mobile_customer/values/app_styles.dart';
import 'package:mobile_customer/widgets/talkshow_detail_item.dart';

class SearchTalkshowScreen extends StatefulWidget {
  const SearchTalkshowScreen();
  static const routeName = '/search-talkshow-screen';
  @override
  _SearchTalkshowScreenState createState() => _SearchTalkshowScreenState();
}

class _SearchTalkshowScreenState extends State<SearchTalkshowScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final searchController = TextEditingController();
  bool isDrawer = false;
  String areaDropdow, typeDropdown, degreeDropdown, industryDropdown;
  @override
  Widget build(BuildContext context) {
    List<Talkshow> listTalkshow = [];
    listTalkshow = Talkshow.createListTalkshow();
    List<String> listKhuVuc = [
      'None',
      'Quận 1',
      'Quận 2',
      'Quận 3',
      'Quận 4',
      'Quận 5',
      'Quận 6',
      'Quận 7',
      'Quận 8',
      'Quận 9',
      'Quận 10',
      'Quận 11',
      'Quận 12',
      'Quận Bình Thạnh',
      'Quận Tân Bình',
      'Quận Bình Tân',
      'Quận Gò Vấp',
    ];
    List<String> listLoaiTruong = [
      'None',
      'Công lập',
      'Dân lập',
      'Quân sự',
    ];
    List<String> listCapBacDaoTao = [
      'None',
      'Trung cấp',
      'Cao đẳng',
      'Đại học',
      'Cao học',
    ];
    List<String> listNhomNghanh = [
      'None',
      'D1',
      'A1',
      'B1',
      'A',
      'D',
      'B',
      'C',
      'E',
    ];

    final double _sizeHeight = MediaQuery.of(context).size.height -
        MediaQuery.of(context).padding.top -
        MediaQuery.of(context).padding.bottom;
    final double _sizeWidth = MediaQuery.of(context).size.width -
        MediaQuery.of(context).padding.left -
        MediaQuery.of(context).padding.right;
    String khuVuc;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Search Talkshow',
          style: AppStyle.titleSearchAppBar,
        ),
        centerTitle: true,
        flexibleSpace: Container(
          decoration: BoxDecoration(color: Colors.white),
        ),
      ),
      // drawerEnableOpenDragGesture: false,
      // drawer: Drawer(

      //   child: Text('LE DUY TUAN VU'),
      // ),
      body: Column(
        children: [
          SizedBox(height: _sizeHeight * 0.025),
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15),
            child: Container(
              height: _sizeHeight * 0.055,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10.5),
                    child: GestureDetector(
                      child: Icon(
                        Icons.search,
                        color: Colors.black45,
                        size: 20,
                      ),
                      onTap: () {
                        FocusScope.of(context).requestFocus(FocusNode());
                        print(
                            'VALUE search controller : ${searchController.text}');
                      },
                    ),
                  ),
                  Expanded(
                    child: TextField(
                      textAlign: TextAlign.start,
                      controller: searchController,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                        contentPadding: EdgeInsets.only(
                            left: 10, bottom: 15.5, top: 3, right: 10),
                        hintText: " Search",
                        hintStyle: AppStyle.h2
                            .copyWith(color: Colors.black26, fontSize: 15),
                      ),
                      cursorColor: Colors.black12,
                      cursorWidth: 0.5,
                      style: AppStyle.h2
                          .copyWith(color: Colors.black54, fontSize: 15),
                      onChanged: (value) {
                        setState(() {
                          // value = searchController.text;
                          log('CONTROLLER: ${searchController.text}');
                          log('VALUE: $value');
                        });
                      },
                      onSubmitted: (value) {
                        print('VALUE: $value');
                      },
                    ),
                  ),
                  searchController.text.isNotEmpty
                      ? Padding(
                          padding: const EdgeInsets.only(right: 7.5),
                          child: GestureDetector(
                            child: Icon(
                              Icons.close,
                              color: Colors.black38,
                              size: 22,
                            ),
                            onTap: () {
                              FocusScope.of(context).requestFocus(FocusNode());
                              setState(() {
                                searchController.clear();
                              });
                            },
                          ),
                        )
                      : Padding(
                          padding: const EdgeInsets.only(right: 9),
                          child: GestureDetector(
                            // child: Icon(
                            //   // Icons.drag_indicator_sharp,
                            //   Icons.filter_list_rounded,
                            //   color: Colors.black45,
                            //   size: 22,
                            // ),
                            child: ImageIcon(
                              AssetImage('assets/icons/filter.png'),
                              size: 22,
                              color: Colors.black45,
                            ),
                            onTap: () {
                              print('TAP FILTER');
                              return showDialog(
                                context: context,
                                builder: (context) {
                                  // String areaDropdow;
                                  return StatefulBuilder(
                                      builder: (context, setState) {
                                    return SimpleDialog(
                                      // key: _formKey,
                                      children: <Widget>[
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 20),
                                          child: Text(
                                            'Search Filters',
                                            style: TextStyle(
                                              fontFamily: AppFonts.poppins,
                                              fontSize: 18,
                                            ),
                                          ),
                                        ),
                                        SizedBox(height: _sizeHeight * 0.01),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 20),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                'Area',
                                                overflow: TextOverflow.ellipsis,
                                                style: AppStyle.dropdownStyle,
                                              ),
                                              Expanded(child: SizedBox()),
                                              DropdownButtonHideUnderline(
                                                child: DropdownButton<String>(
                                                  // style: TextSty,

                                                  value: areaDropdow,
                                                  items: <String>[...listKhuVuc]
                                                      .map((String value) {
                                                    return DropdownMenuItem<
                                                        String>(
                                                      value: value,
                                                      child: Row(
                                                        children: [
                                                          SizedBox(
                                                            width: 140,
                                                            child: Text(
                                                              value,
                                                              textAlign:
                                                                  TextAlign
                                                                      .right,
                                                              style: AppStyle
                                                                  .dropdownStyle,
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            width: 3,
                                                          ),
                                                        ],
                                                      ),
                                                    );
                                                  }).toList(),
                                                  onChanged: (newValue) {
                                                    setState(() {
                                                      areaDropdow = newValue;
                                                      log('Khu vuc ne: $areaDropdow');
                                                      log('Khu vuc newValue ne: $newValue');
                                                    });
                                                  },
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 20),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                'Type',
                                                overflow: TextOverflow.ellipsis,
                                                style: AppStyle.dropdownStyle,
                                              ),
                                              Expanded(child: SizedBox()),
                                              DropdownButtonHideUnderline(
                                                child: DropdownButton<String>(
                                                  value: typeDropdown,
                                                  items: <String>[
                                                    ...listLoaiTruong
                                                  ].map((String value) {
                                                    return DropdownMenuItem<
                                                        String>(
                                                      value: value,
                                                      child: Row(
                                                        children: [
                                                          SizedBox(
                                                            width: 140,
                                                            child: Text(
                                                              value,
                                                              textAlign:
                                                                  TextAlign
                                                                      .right,
                                                              style: AppStyle
                                                                  .dropdownStyle,
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            width: 3,
                                                          ),
                                                        ],
                                                      ),
                                                    );
                                                  }).toList(),
                                                  onChanged: (newValue) {
                                                    setState(() {
                                                      typeDropdown = newValue;
                                                    });
                                                  },
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 20),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                'Degree training',
                                                overflow: TextOverflow.ellipsis,
                                                style: AppStyle.dropdownStyle,
                                              ),
                                              Expanded(child: SizedBox()),
                                              DropdownButtonHideUnderline(
                                                child: DropdownButton<String>(
                                                  value: degreeDropdown,
                                                  items: <String>[
                                                    ...listCapBacDaoTao
                                                  ].map((String value) {
                                                    return DropdownMenuItem<
                                                        String>(
                                                      value: value,
                                                      child: Row(
                                                        children: [
                                                          SizedBox(
                                                            width: 100,
                                                            child: Text(
                                                              value,
                                                              textAlign:
                                                                  TextAlign
                                                                      .right,
                                                              style: AppStyle
                                                                  .dropdownStyle,
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            width: 3,
                                                          ),
                                                        ],
                                                      ),
                                                    );
                                                  }).toList(),
                                                  onChanged: (newValue) {
                                                    setState(() {
                                                      degreeDropdown = newValue;
                                                    });
                                                  },
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 20),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                'Industry group',
                                                overflow: TextOverflow.ellipsis,
                                                style: AppStyle.dropdownStyle,
                                              ),
                                              Expanded(child: SizedBox()),
                                              DropdownButtonHideUnderline(
                                                child: DropdownButton<String>(
                                                  value: industryDropdown,
                                                  items: <String>[
                                                    ...listNhomNghanh
                                                  ].map((String value) {
                                                    return DropdownMenuItem<
                                                        String>(
                                                      value: value,
                                                      child: Row(
                                                        children: [
                                                          SizedBox(
                                                            width: 100,
                                                            child: Text(
                                                              value,
                                                              textAlign:
                                                                  TextAlign
                                                                      .right,
                                                              style: AppStyle
                                                                  .dropdownStyle,
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            width: 3,
                                                          ),
                                                        ],
                                                      ),
                                                    );
                                                  }).toList(),
                                                  onChanged: (newValue) {
                                                    setState(() {
                                                      industryDropdown =
                                                          newValue;
                                                    });
                                                  },
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(height: _sizeHeight * 0.03),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 20),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              ElevatedButton(
                                                child: Text('Cancle'),
                                                onPressed: () {
                                                  print('TAP HUY BO');
                                                  areaDropdow = null;
                                                  typeDropdown = null;
                                                  degreeDropdown = null;
                                                  industryDropdown = null;
                                                  Navigator.of(context).pop();
                                                },
                                                style: ElevatedButton.styleFrom(
                                                  primary: Color(0xFFEEEEEEE),
                                                  // elevation: 1,
                                                ),
                                              ),
                                              SizedBox(
                                                width: 10,
                                                // height: 1,
                                              ),
                                              ElevatedButton(
                                                child: Text('Apply'),
                                                onPressed: () {
                                                  log('TAP AP DUNG');
                                                  log(areaDropdow);
                                                  log(typeDropdown);
                                                  log(degreeDropdown);
                                                  log(industryDropdown);
                                                  // FocusScope.of(context)
                                                  //     .requestFocus(FocusNode());
                                                  Navigator.of(context).pop();
                                                },
                                                style: ElevatedButton.styleFrom(
                                                  primary: Color(0xFFEEEEEEE),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    );
                                  });
                                },
                              );
                              // log('TAP FILTER');
                              // return AlertDialog(
                              //   content: StatefulBuilder(),
                              // );
                              // return showDialog(: StatefulBuilder(builder: builder));

                              // Scaffold.of(context).openDrawer();
                            },
                          ),
                        ),
                ],
              ),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black87, width: 0.1),
                borderRadius: BorderRadius.circular(5),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    offset: Offset(1, 1),
                    blurRadius: 8,
                  )
                ],
              ),
            ),
          ),
          SizedBox(height: _sizeHeight * 0.015),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 170),
            child: Divider(
              color: Colors.black38,
              // height: 0.,
            ),
          ),
          SizedBox(height: _sizeHeight * 0.012),
          Expanded(
            child: ListView.builder(
              itemCount: listTalkshow.length,
              itemBuilder: (context, index) {
                return TalkshowDetailItem(listTalkshow[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}
