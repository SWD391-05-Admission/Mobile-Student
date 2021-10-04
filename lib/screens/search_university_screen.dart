import 'package:flutter/material.dart';
import 'package:mobile_customer/models/university.dart';
import 'package:mobile_customer/values/app_fonts.dart';
import 'package:mobile_customer/values/app_styles.dart';
import 'package:mobile_customer/widgets/university_detail_item.dart';

class SearchUniversityScreen extends StatefulWidget {
  const SearchUniversityScreen();
  static const routeName = '/search-university-screen';
  @override
  _SearchUniversityScreenState createState() => _SearchUniversityScreenState();
}

class _SearchUniversityScreenState extends State<SearchUniversityScreen> {
  @override
  Widget build(BuildContext context) {
    List<University> listUniversity = [];
    listUniversity = University.createListUniversity();
    List<String> listKhuVuc = [
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
      'Công lập',
      'Dân lập',
      'Quân sự',
    ];
    List<String> listCapBacDaoTao = [
      'Trung cấp',
      'Cao đẳng',
      'Đại học',
      'Cao học',
    ];
    List<String> listNhomNghanh = [
      'D1',
      'A1',
      'B1',
      'A',
      'D',
      'B',
      'C',
      'E',
    ];
    final controller = TextEditingController();
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
          'Search University',
          style: AppStyle.titleSearchAppBar,
        ),
        centerTitle: true,
        flexibleSpace: Container(
          decoration: BoxDecoration(color: Colors.white),
        ),
      ),
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
                        print('VALUE : ${controller.text}');
                      },
                    ),
                  ),
                  Expanded(
                    child: TextField(
                      textAlign: TextAlign.start,
                      // controller: controller,
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
                      onChanged: (context) {
                        setState(() {
                          context = controller.text;
                        });
                      },
                      onSubmitted: (value) {
                        print('VALUE: $value');
                      },
                    ),
                  ),
                  controller.text.isNotEmpty
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
                                controller.clear();
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
                                  return SimpleDialog(
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
                                            Text('Area'),
                                            Expanded(child: SizedBox()),
                                            DropdownButton<String>(
                                              // value: khuVuc,
                                              items: <String>[...listKhuVuc]
                                                  .map((String value) {
                                                return DropdownMenuItem<String>(
                                                  value: value,
                                                  child: Text(value),
                                                );
                                              }).toList(),
                                              onChanged: (String newValue) {
                                                // setState(() {
                                                //   khuVuc = newValue;
                                                //   print(
                                                //       "VuLDT-DEBUG: khu vuc: $khuVuc");
                                                // });
                                              },
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
                                            Text('Type'),
                                            Expanded(child: SizedBox()),
                                            DropdownButton<String>(
                                              items: <String>[...listLoaiTruong]
                                                  .map((String value) {
                                                return DropdownMenuItem<String>(
                                                  value: value,
                                                  child: Text(value),
                                                );
                                              }).toList(),
                                              onChanged: (_) {},
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
                                            Text('Degree training'),
                                            Expanded(child: SizedBox()),
                                            DropdownButton<String>(
                                              items: <String>[
                                                ...listCapBacDaoTao
                                              ].map((String value) {
                                                return DropdownMenuItem<String>(
                                                  value: value,
                                                  child: Text(value),
                                                );
                                              }).toList(),
                                              onChanged: (_) {},
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
                                            Text('Industry group'),
                                            Expanded(child: SizedBox()),
                                            DropdownButton<String>(
                                              items: <String>[...listNhomNghanh]
                                                  .map((String value) {
                                                return DropdownMenuItem<String>(
                                                  value: value,
                                                  child: Text(value),
                                                );
                                              }).toList(),
                                              onChanged: (_) {},
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
                                                // FocusScope.of(context)
                                                //     .requestFocus(FocusNode());
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
                                                print('TAP AP DUNG');
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
              itemCount: listUniversity.length,
              itemBuilder: (context, index) {
                return UniversityDetailItem(listUniversity[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}
