import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:mobile_customer/providers/university_controller.dart';
import 'package:mobile_customer/values/app_fonts.dart';
import 'package:mobile_customer/values/app_value.dart';
import '../widgets/get_list_counselor.dart';
import '../widgets/get_list_talkshow.dart';
import '../widgets/get_list_university.dart';
import '../models/counselor.dart';
import '../models/talkshow.dart';
import '../models/university.dart';
import '../providers/counselor_controller.dart';
import '../values/app_styles.dart';
import 'package:flutter/cupertino.dart';
import '../widgets/carousel_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen();
  static const routeName = '/home';
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isTalkshow = false, isCounselor = true, isUniversity = false;
  int _currentPage = 1;
  int _limit = 2;

  Future myFuture;

  Future<Map<String, List<Counselor>>> _getListCounselor(String txtSearch) {
    String email, name, phone;
    (_findByEmailCounselor) ? email = txtSearch : email = '';
    (_findByNameCounselor) ? name = txtSearch : name = '';
    (_findByPhoneCounselor) ? phone = txtSearch : phone = '';

    return CounselorController()
        .getListCounselor(email, name, phone, _currentPage, _limit);
  }

  Future<Map<String, List<University>>> _getListUniversity(String txtSearch) {
    log('vovovo');
    return UniversityConntroller()
        .getListUniversity('', '', '', _currentPage, _limit);
  }

  Future<List<Talkshow>> _getListTalkshow() {}

  _paging(String numOfPage) {
    int numPage = int.parse(numOfPage);
    List<Widget> list = [];
    if (numPage < 6 && numPage > 1) {
      for (int i = 1; i < numPage + 1; i++) {
        list.add(
          GestureDetector(
            child: SizedBox(
              height: 20,
              width: 20,
              child: Text(
                '$i',
                style: AppStyle.bookDetail.copyWith(
                  fontSize: 14,
                  color: (i == _currentPage) ? Colors.black : Colors.black26,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            onTap: () {
              setState(() {
                _currentPage = i;
                myFuture = _getList(txtSearch);
              });
            },
          ),
        );
        if (i != numPage) {
          list.add(SizedBox(
            width: 5,
          ));
        }
      }
    } else {}
    return list;
  }

  _getList(String txtSearch) {
    if (isCounselor) {
      log('vo get cónultant');
      return _getListCounselor(txtSearch);
    } else if (isTalkshow) {
      log('vo get talkshow');
      return _getListTalkshow;
    } else {
      log('vo get university');
      return _getListUniversity(txtSearch);
    }
  }

  final searchController = TextEditingController();
  String areaDropdow;
  String typeDropdown;
  String degreeDropdown;
  String industryDropdown;
  bool _findByNameCounselor = true, _tmpFindName = true;
  bool _findByPhoneCounselor = true, _tmpFindPhone = true;
  bool _findByEmailCounselor = true, _tmpFindEmail = true;
  bool _findByMaTruong = true, _tmpFindMaTruong = true;
  bool _findByTenTruong = true, _tmpFindTenTruong = true;
  bool _findByEmailTruong = true, _tmpFindEmailTruong = true;
  bool _findBySdtTruong = true, _tmpFindSdtTruong = true;
  String txtSearch = '';

  _searchWidget(height, width) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15),
      child: Container(
        height: height * 0.055,
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
                  print('VALUE search controller : ${searchController.text}');
                },
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(top: 5), // chỉnh sửa search
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
                        left: width * 0.01, bottom: height * 0.012),
                    hintText: " Tìm kiếm",
                    hintStyle: AppStyle.h2
                        .copyWith(color: Colors.black26, fontSize: 15),
                  ),
                  cursorColor: Colors.black12,
                  cursorWidth: 0.5,
                  style:
                      AppStyle.h2.copyWith(color: Colors.black54, fontSize: 15),
                  onChanged: (value) {
                    setState(() {
                      // value = searchController.text;
                      log('CONTROLLER: ${searchController.text}');
                      log('VALUE SEARCH: $value');
                    });
                  },
                  onSubmitted: (valueSearch) {
                    txtSearch = valueSearch;
                    myFuture = _getList(valueSearch);
                  },
                ),
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
                        if (isTalkshow) {
                          log('vo talkshow ne');
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
                                        'Area',
                                        style: TextStyle(
                                          fontFamily: AppFonts.poppins,
                                          fontSize: 18,
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: height * 0.01),
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
                                              items: <String>[
                                                ...AppValue.listKhuVuc
                                              ].map((String value) {
                                                return DropdownMenuItem<String>(
                                                  value: value,
                                                  child: Row(
                                                    children: [
                                                      SizedBox(
                                                        width: 140,
                                                        child: Text(
                                                          value,
                                                          textAlign:
                                                              TextAlign.right,
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
                                    SizedBox(height: height * 0.03),
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
                        } else if (isCounselor) {
                          log('vo consultant ne');
                          return showDialog(
                            context: context,
                            builder: (context) {
                              // String areaDropdow;
                              return StatefulBuilder(
                                builder: (context, setState) {
                                  return SimpleDialog(
                                    // key: _formKey,
                                    children: <Widget>[
                                      SizedBox(
                                        height: height * 0.01,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 20),
                                        child: Text(
                                          'Bộ lọc tìm kiếm',
                                          style: AppStyle.titleSearch.copyWith(
                                            fontSize: 20,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                      SizedBox(height: height * 0.015),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 20, right: 8),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              'Tìm bằng họ tên',
                                              overflow: TextOverflow.ellipsis,
                                              style:
                                                  AppStyle.bookDetail.copyWith(
                                                fontSize: 13,
                                              ),
                                            ),
                                            Expanded(child: SizedBox()),
                                            Checkbox(
                                              value: _findByNameCounselor,
                                              onChanged: (newValue) {
                                                log(newValue.toString());
                                                setState(() {
                                                  _findByNameCounselor =
                                                      newValue;
                                                });
                                              },
                                              checkColor: Colors.white,
                                              activeColor: Colors.green,
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 20, right: 8),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              'Tìm bằng địa chỉ email',
                                              overflow: TextOverflow.ellipsis,
                                              style:
                                                  AppStyle.bookDetail.copyWith(
                                                fontSize: 13,
                                              ),
                                            ),
                                            Expanded(child: SizedBox()),
                                            Checkbox(
                                              value: _findByEmailCounselor,
                                              onChanged: (newValue) {
                                                log(newValue.toString());
                                                setState(() {
                                                  _findByEmailCounselor =
                                                      newValue;
                                                });
                                              },
                                              checkColor: Colors.white,
                                              activeColor: Colors.green,
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 20, right: 8),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              'Tìm bằng số điện thoại',
                                              overflow: TextOverflow.ellipsis,
                                              style:
                                                  AppStyle.bookDetail.copyWith(
                                                fontSize: 13,
                                              ),
                                            ),
                                            Expanded(child: SizedBox()),
                                            Checkbox(
                                              value: _findByPhoneCounselor,
                                              onChanged: (newValue) {
                                                log(newValue.toString());
                                                setState(() {
                                                  _findByPhoneCounselor =
                                                      newValue;
                                                });
                                              },
                                              checkColor: Colors.white,
                                              activeColor: Colors.green,
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(height: height * 0.01),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 20),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            ElevatedButton(
                                              child: Text(
                                                'Hủy bỏ',
                                                style: TextStyle(
                                                  fontFamily:
                                                      AppFonts.montserrat,
                                                ),
                                              ),
                                              onPressed: () {
                                                // _findByEmailCounselor = false;
                                                // _findByNameCounselor = false;
                                                // _findByPhoneCounselor = false;
                                                (_tmpFindEmail)
                                                    ? _findByEmailCounselor =
                                                        true
                                                    : _findByEmailCounselor =
                                                        false;
                                                (_tmpFindName)
                                                    ? _findByNameCounselor =
                                                        true
                                                    : _findByNameCounselor =
                                                        false;
                                                (_tmpFindPhone)
                                                    ? _findByPhoneCounselor =
                                                        true
                                                    : _findByPhoneCounselor =
                                                        false;
                                                Navigator.of(context).pop();
                                              },
                                              style: ElevatedButton.styleFrom(
                                                primary: Color(0xFFEEEEEEE),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 10,
                                              // height: 1,
                                            ),
                                            ElevatedButton(
                                              child: Text(
                                                'Áp dụng',
                                                style: TextStyle(
                                                  fontFamily:
                                                      AppFonts.montserrat,
                                                ),
                                              ),
                                              onPressed: () {
                                                log('TAP AP DUNG email : $_findByEmailCounselor');
                                                log('TAP AP DUNG phone : $_findByPhoneCounselor');
                                                log('TAP AP DUNG name : $_findByNameCounselor');

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
                                },
                              );
                            },
                          );
                        } else {
                          log('vo univesity ne');
                          return showDialog(
                            context: context,
                            builder: (context) {
                              // String areaDropdow;
                              return StatefulBuilder(
                                builder: (context, setState) {
                                  return SimpleDialog(
                                    // key: _formKey,
                                    children: <Widget>[
                                      SizedBox(
                                        height: height * 0.01,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 20),
                                        child: Text(
                                          'Bộ lọc tìm kiếm',
                                          style: AppStyle.titleSearch.copyWith(
                                            fontSize: 20,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                      SizedBox(height: height * 0.015),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 20, right: 8),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              'Tìm bằng mã trường',
                                              overflow: TextOverflow.ellipsis,
                                              style:
                                                  AppStyle.bookDetail.copyWith(
                                                fontSize: 13,
                                              ),
                                            ),
                                            Expanded(child: SizedBox()),
                                            Checkbox(
                                              value: _findByMaTruong,
                                              onChanged: (newValue) {
                                                log(newValue.toString());
                                                setState(() {
                                                  _findByMaTruong = newValue;
                                                });
                                              },
                                              checkColor: Colors.white,
                                              activeColor: Colors.green,
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 20, right: 8),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              'Tìm bằng tên trường',
                                              overflow: TextOverflow.ellipsis,
                                              style:
                                                  AppStyle.bookDetail.copyWith(
                                                fontSize: 13,
                                              ),
                                            ),
                                            Expanded(child: SizedBox()),
                                            Checkbox(
                                              value: _findByTenTruong,
                                              onChanged: (newValue) {
                                                log(newValue.toString());
                                                setState(() {
                                                  _findByTenTruong = newValue;
                                                });
                                              },
                                              checkColor: Colors.white,
                                              activeColor: Colors.green,
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 20, right: 8),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              'Tìm bằng địa chỉ email',
                                              overflow: TextOverflow.ellipsis,
                                              style:
                                                  AppStyle.bookDetail.copyWith(
                                                fontSize: 13,
                                              ),
                                            ),
                                            Expanded(child: SizedBox()),
                                            Checkbox(
                                              value: _findByEmailTruong,
                                              onChanged: (newValue) {
                                                log(newValue.toString());
                                                setState(() {
                                                  _findByEmailTruong = newValue;
                                                });
                                              },
                                              checkColor: Colors.white,
                                              activeColor: Colors.green,
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 20, right: 8),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              'Tìm bằng số điện thoại',
                                              overflow: TextOverflow.ellipsis,
                                              style:
                                                  AppStyle.bookDetail.copyWith(
                                                fontSize: 13,
                                              ),
                                            ),
                                            Expanded(child: SizedBox()),
                                            Checkbox(
                                              value: _findBySdtTruong,
                                              onChanged: (newValue) {
                                                log(newValue.toString());
                                                setState(() {
                                                  _findBySdtTruong = newValue;
                                                });
                                              },
                                              checkColor: Colors.white,
                                              activeColor: Colors.green,
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(height: height * 0.01),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 20),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            ElevatedButton(
                                              child: Text(
                                                'Hủy bỏ',
                                                style: TextStyle(
                                                  fontFamily:
                                                      AppFonts.montserrat,
                                                ),
                                              ),
                                              onPressed: () {
                                                // _findByEmailCounselor = false;
                                                // _findByNameCounselor = false;
                                                // _findByPhoneCounselor = false;
                                                (_tmpFindEmailTruong)
                                                    ? _findByEmailTruong = true
                                                    : _findByEmailTruong =
                                                        false;
                                                (_tmpFindTenTruong)
                                                    ? _findByTenTruong = true
                                                    : _findByTenTruong = false;
                                                (_tmpFindSdtTruong)
                                                    ? _findBySdtTruong = true
                                                    : _findBySdtTruong = false;
                                                (_tmpFindMaTruong)
                                                    ? _findByMaTruong = true
                                                    : _findByMaTruong = false;
                                                Navigator.of(context).pop();
                                              },
                                              style: ElevatedButton.styleFrom(
                                                primary: Color(0xFFEEEEEEE),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 10,
                                              // height: 1,
                                            ),
                                            ElevatedButton(
                                              child: Text(
                                                'Áp dụng',
                                                style: TextStyle(
                                                  fontFamily:
                                                      AppFonts.montserrat,
                                                ),
                                              ),
                                              onPressed: () {
                                                log('TAP AP DUNG email : $_findByEmailCounselor');
                                                log('TAP AP DUNG phone : $_findByPhoneCounselor');
                                                log('TAP AP DUNG name : $_findByNameCounselor');

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
                                },
                              );
                            },
                          );
                        }
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
              color: Color(0xFF999999).withOpacity(0.6),
              blurRadius: 8,
            )
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    myFuture = _getList('');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final _paddingOS = MediaQuery.of(context).padding;
    final _sizeOS = MediaQuery.of(context).size;
    final _sizeHeight = _sizeOS.height - _paddingOS.bottom - _paddingOS.top;
    final _sizeWidth = _sizeOS.width - _paddingOS.left - _paddingOS.right;

    return FutureBuilder(
      future: myFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(
              color: Colors.black38,
            ),
          );
        } else if (snapshot.hasData) {
          log('snapshot has data'.toUpperCase());

          if (isCounselor) {
            Map<String, List<Counselor>> mapCounselor = snapshot.data;
            String numberOfPage = mapCounselor.keys.elementAt(0);
            List<Counselor> list = mapCounselor.entries.first.value;
            if (numberOfPage == 'Not found any counselor') {
              return ListView(
                children: [
                  CarouselWidget(),
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
                                  'Tư vấn',
                                  textAlign: TextAlign.center,
                                  style: AppStyle.typeSearch,
                                ),
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                boxShadow: [
                                  isTalkshow
                                      ? BoxShadow(
                                          blurRadius: 8,
                                          color: Colors.black26,
                                        )
                                      : BoxShadow(
                                          color: Color(0xFFEEEEEE),
                                        )
                                ],
                                border: Border.all(
                                    width: 0.15, color: Color(0xFFBBBBBB)),
                                color: isTalkshow
                                    ? Colors.white
                                    : Color(0xFFDDDDDD),
                              ),
                            ),
                            onTap: () {
                              log('TAP is talkshow');
                              log('university: $isTalkshow');
                              if (!isTalkshow) {
                                setState(() {
                                  isTalkshow = true;
                                  isCounselor = false;
                                  isUniversity = false;
                                  _currentPage = 1;
                                  myFuture = _getList('');
                                });
                              }
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
                                  'Diễn giả',
                                  textAlign: TextAlign.center,
                                  style: AppStyle.typeSearch,
                                ),
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                boxShadow: [
                                  isCounselor
                                      ? BoxShadow(
                                          blurRadius: 8,
                                          color: Color(0xFF999999)
                                              .withOpacity(0.6),
                                        )
                                      : BoxShadow(
                                          color: Color(0xFFEEEEEE),
                                        )
                                ],
                                border: Border.all(
                                    width: 0.15, color: Color(0xFFBBBBBB)),
                                color: isCounselor
                                    ? Colors.white
                                    : Color(0xFFDDDDDD),
                              ),
                            ),
                            onTap: () {
                              log('TAP is consultant');
                              log('university: $isCounselor');
                              if (!isCounselor) {
                                setState(() {
                                  isCounselor = true;
                                  isTalkshow = false;
                                  isUniversity = false;
                                });
                              }
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
                                  'Đại học',
                                  textAlign: TextAlign.center,
                                  style: AppStyle.typeSearch,
                                ),
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                boxShadow: [
                                  isUniversity
                                      ? BoxShadow(
                                          blurRadius: 8,
                                          color: Color(0xFF999999)
                                              .withOpacity(0.6),
                                        )
                                      : BoxShadow(
                                          color: Color(0xFFEEEEEE),
                                        )
                                ],
                                border: Border.all(
                                    width: 0.15, color: Color(0xFFBBBBBB)),
                                color: isUniversity
                                    ? Colors.white
                                    : Color(0xFFDDDDDD),
                              ),
                            ),
                            onTap: () {
                              log('TAP is university');
                              log('university: $isUniversity');
                              if (!isUniversity) {
                                setState(() {
                                  isUniversity = true;
                                  isTalkshow = false;
                                  isCounselor = false;
                                  _currentPage = 1;
                                  myFuture = _getList('');
                                });
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: _sizeHeight * 0.03),
                  _searchWidget(_sizeHeight, _sizeWidth),
                  SizedBox(height: _sizeHeight * 0.022),
                  Center(
                    child: Text(
                      'Not found any Counselor !',
                      style: AppStyle.titleSearch,
                    ),
                  ),
                  // Column(
                  //   children: [
                  //     _searchWidget(_sizeHeight, _sizeWidth),
                  //     ...GetListCounselor()
                  //         .getListCounselor(list, _sizeHeight, context),
                  //   ],
                  // ),
                  // Center(
                  //   child: Row(
                  //     mainAxisAlignment: MainAxisAlignment.center,
                  //     children: [
                  //       ..._paging(numberOfPage),
                  //     ],
                  //   ),
                  // ),
                  // SizedBox(
                  //   height: _sizeHeight * 0.022,
                  // ),
                ],
              );
            } else {
              return ListView(
                children: [
                  CarouselWidget(),
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
                                  'Tư vấn',
                                  textAlign: TextAlign.center,
                                  style: AppStyle.typeSearch,
                                ),
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                boxShadow: [
                                  isTalkshow
                                      ? BoxShadow(
                                          blurRadius: 8,
                                          color: Colors.black26,
                                        )
                                      : BoxShadow(
                                          color: Color(0xFFEEEEEE),
                                        )
                                ],
                                border: Border.all(
                                    width: 0.15, color: Color(0xFFBBBBBB)),
                                color: isTalkshow
                                    ? Colors.white
                                    : Color(0xFFDDDDDD),
                              ),
                            ),
                            onTap: () {
                              log('TAP is talkshow');
                              log('university: $isTalkshow');
                              if (!isTalkshow) {
                                setState(() {
                                  isTalkshow = true;
                                  isCounselor = false;
                                  isUniversity = false;
                                  _currentPage = 1;
                                  myFuture = _getList('');
                                });
                              }
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
                                  'Diễn giả',
                                  textAlign: TextAlign.center,
                                  style: AppStyle.typeSearch,
                                ),
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                boxShadow: [
                                  isCounselor
                                      ? BoxShadow(
                                          blurRadius: 8,
                                          color: Color(0xFF999999)
                                              .withOpacity(0.6),
                                        )
                                      : BoxShadow(
                                          color: Color(0xFFEEEEEE),
                                        )
                                ],
                                border: Border.all(
                                    width: 0.15, color: Color(0xFFBBBBBB)),
                                color: isCounselor
                                    ? Colors.white
                                    : Color(0xFFDDDDDD),
                              ),
                            ),
                            onTap: () {
                              log('TAP is consultant');
                              log('university: $isCounselor');
                              if (!isCounselor) {
                                setState(() {
                                  isCounselor = true;
                                  isTalkshow = false;
                                  isUniversity = false;
                                });
                              }
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
                                  'Đại học',
                                  textAlign: TextAlign.center,
                                  style: AppStyle.typeSearch,
                                ),
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                boxShadow: [
                                  isUniversity
                                      ? BoxShadow(
                                          blurRadius: 8,
                                          color: Color(0xFF999999)
                                              .withOpacity(0.6),
                                        )
                                      : BoxShadow(
                                          color: Color(0xFFEEEEEE),
                                        )
                                ],
                                border: Border.all(
                                    width: 0.15, color: Color(0xFFBBBBBB)),
                                color: isUniversity
                                    ? Colors.white
                                    : Color(0xFFDDDDDD),
                              ),
                            ),
                            onTap: () {
                              log('TAP is university');
                              log('university: $isUniversity');
                              if (!isUniversity) {
                                setState(() {
                                  isUniversity = true;
                                  isTalkshow = false;
                                  isCounselor = false;
                                  _currentPage = 1;
                                  myFuture = _getList('');
                                });
                              }
                              log('university: $isUniversity');
                              log('counselor: $isCounselor');
                              log('talkshow: $isTalkshow');
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: _sizeHeight * 0.03),
                  Column(
                    children: [
                      _searchWidget(_sizeHeight, _sizeWidth),
                      ...GetListCounselor()
                          .getListCounselor(list, _sizeHeight, context),
                    ],
                  ),
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ..._paging(numberOfPage),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: _sizeHeight * 0.022,
                  ),
                ],
              );
            }
          } else if (isTalkshow) {
            Map<String, List<Talkshow>> mapTalkshow = snapshot.data;
            String numberOfPage = mapTalkshow.keys.elementAt(0);
            List<Talkshow> list = mapTalkshow.entries.first.value;
            return ListView(
              children: [
                CarouselWidget(),
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
                                'Tư vấn',
                                textAlign: TextAlign.center,
                                style: AppStyle.typeSearch,
                              ),
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              boxShadow: [
                                isTalkshow
                                    ? BoxShadow(
                                        // offset: Offset(1.0, 1.0),
                                        blurRadius: 8,
                                        color: Colors.black26,
                                      )
                                    : BoxShadow(
                                        color: Color(0xFFEEEEEE),
                                      )
                              ],
                              border: Border.all(
                                  width: 0.15, color: Color(0xFFBBBBBB)),
                              color:
                                  isTalkshow ? Colors.white : Color(0xFFDDDDDD),
                            ),
                          ),
                          onTap: () {
                            log('TAP is talkshow');
                            log('university: $isTalkshow');
                            if (!isTalkshow) {
                              setState(() {
                                isTalkshow = true;
                                isCounselor = false;
                                isUniversity = false;
                              });
                            }
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
                                'Diễn giả',
                                textAlign: TextAlign.center,
                                style: AppStyle.typeSearch,
                              ),
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              boxShadow: [
                                isCounselor
                                    ? BoxShadow(
                                        blurRadius: 8,
                                        color:
                                            Color(0xFF999999).withOpacity(0.6),
                                      )
                                    : BoxShadow(
                                        color: Color(0xFFEEEEEE),
                                      )
                              ],
                              border: Border.all(
                                  width: 0.15, color: Color(0xFFBBBBBB)),
                              color: isCounselor
                                  ? Colors.white
                                  : Color(0xFFDDDDDD),
                            ),
                          ),
                          onTap: () {
                            log('TAP is consultant');
                            log('university: $isCounselor');
                            if (!isCounselor) {
                              setState(() {
                                isCounselor = true;
                                isTalkshow = false;
                                isUniversity = false;
                                _currentPage = 1;
                                myFuture = _getList('');
                              });
                            }
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
                                'Đại học',
                                textAlign: TextAlign.center,
                                style: AppStyle.typeSearch,
                              ),
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              boxShadow: [
                                isUniversity
                                    ? BoxShadow(
                                        blurRadius: 8,
                                        color:
                                            Color(0xFF999999).withOpacity(0.6),
                                      )
                                    : BoxShadow(
                                        color: Color(0xFFEEEEEE),
                                      )
                              ],
                              border: Border.all(
                                  width: 0.15, color: Color(0xFFBBBBBB)),
                              color: isUniversity
                                  ? Colors.white
                                  : Color(0xFFDDDDDD),
                            ),
                          ),
                          onTap: () {
                            log('TAP is university');
                            log('university: $isUniversity');
                            if (!isUniversity) {
                              setState(() {
                                isUniversity = true;
                                isTalkshow = false;
                                isCounselor = false;
                                _currentPage = 1;
                                myFuture = _getList('');
                              });
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: _sizeHeight * 0.03),
                Column(
                  children: [
                    _searchWidget(_sizeHeight, _sizeWidth),
                    ...GetListTalkshow()
                        .getListTalkshow(list, _sizeHeight, context)
                  ],
                ),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ..._paging(numberOfPage),
                    ],
                  ),
                ),
                SizedBox(
                  height: _sizeHeight * 0.022,
                ),
              ],
            );
          } else {
            log('VO IS UNIVERSITY');
            Map<String, List<University>> mapUniversity = snapshot.data;
            String numberOfPage = mapUniversity.keys.elementAt(0);
            List<University> list = mapUniversity.entries.first.value;
            return ListView(
              children: [
                CarouselWidget(),
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
                                'Tư vấn',
                                textAlign: TextAlign.center,
                                style: AppStyle.typeSearch,
                              ),
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              boxShadow: [
                                isTalkshow
                                    ? BoxShadow(
                                        blurRadius: 8,
                                        color: Colors.black26,
                                      )
                                    : BoxShadow(
                                        color: Color(0xFFEEEEEE),
                                      )
                              ],
                              border: Border.all(
                                  width: 0.15, color: Color(0xFFBBBBBB)),
                              color:
                                  isTalkshow ? Colors.white : Color(0xFFDDDDDD),
                            ),
                          ),
                          onTap: () {
                            log('TAP is talkshow');
                            log('university: $isTalkshow');
                            if (!isTalkshow) {
                              setState(() {
                                isTalkshow = true;
                                isCounselor = false;
                                isUniversity = false;
                                _currentPage = 1;
                                myFuture = _getList('');
                              });
                            }
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
                                'Diễn giả',
                                textAlign: TextAlign.center,
                                style: AppStyle.typeSearch,
                              ),
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              boxShadow: [
                                isCounselor
                                    ? BoxShadow(
                                        blurRadius: 8,
                                        color:
                                            Color(0xFF999999).withOpacity(0.6),
                                      )
                                    : BoxShadow(
                                        color: Color(0xFFEEEEEE),
                                      )
                              ],
                              border: Border.all(
                                  width: 0.15, color: Color(0xFFBBBBBB)),
                              color: isCounselor
                                  ? Colors.white
                                  : Color(0xFFDDDDDD),
                            ),
                          ),
                          onTap: () {
                            log('TAP is consultant');
                            log('university: $isCounselor');
                            if (!isCounselor) {
                              setState(() {
                                isCounselor = true;
                                isTalkshow = false;
                                isUniversity = false;
                                _currentPage = 1;
                                myFuture = _getList('');
                              });
                            }
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
                                'Đại học',
                                textAlign: TextAlign.center,
                                style: AppStyle.typeSearch,
                              ),
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              boxShadow: [
                                isUniversity
                                    ? BoxShadow(
                                        blurRadius: 8,
                                        color:
                                            Color(0xFF999999).withOpacity(0.6),
                                      )
                                    : BoxShadow(
                                        color: Color(0xFFEEEEEE),
                                      )
                              ],
                              border: Border.all(
                                  width: 0.15, color: Color(0xFFBBBBBB)),
                              color: isUniversity
                                  ? Colors.white
                                  : Color(0xFFDDDDDD),
                            ),
                          ),
                          onTap: () {
                            log('TAP is university');
                            log('university: $isUniversity');
                            if (!isUniversity) {
                              setState(() {
                                isUniversity = true;
                                isTalkshow = false;
                                isCounselor = false;
                              });
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: _sizeHeight * 0.03),
                Column(
                  children: [
                    _searchWidget(_sizeHeight, _sizeWidth),
                    ...GetListUniversity()
                        .getListUniversity(list, _sizeHeight, context),
                  ],
                ),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ..._paging(numberOfPage),
                    ],
                  ),
                ),
                SizedBox(
                  height: _sizeHeight * 0.022,
                ),
              ],
            );
          }
        } else if (snapshot.hasError) {
          log(snapshot.error.toString());
          return Center(
            child: Text('Snapshot has error !'),
          );
        } else {
          log('SAI ${snapshot.error.toString()}');
          return Center(
            child: Text('Có gì đó sai nè !'),
          );
        }
      },
    );
  }
}
