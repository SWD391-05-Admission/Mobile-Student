import 'package:flutter/material.dart';
import 'package:mobile_customer/models/counselor.dart';
import 'package:mobile_customer/values/app_fonts.dart';
import 'package:mobile_customer/values/app_styles.dart';
import 'package:mobile_customer/widgets/search_widget.dart';

class GetListCounselor {
  List<Widget> getListCounselor(
      List<Counselor> list, double sizeHeight, BuildContext context) {
    List<Widget> listWidget = [];
    // listWidget.add(SearchWidget(nameSearch: 'counselor'));
    listWidget.add(SizedBox(height: sizeHeight * 0.015));
    listWidget.add(
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 170),
        child: Divider(
          color: Colors.black38,
        ),
      ),
    );
    listWidget.add(SizedBox(height: sizeHeight * 0.015));
    for (int i = 0; i < list.length; i++) {
      listWidget.add(
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              GestureDetector(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 7,
                        color: Color(0xFFBBBBBB),
                      )
                    ],
                    border: Border.all(width: 0.05, color: Colors.black),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        // borderRadius: BorderRadius.circular(4.0),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(4),
                          topRight: Radius.circular(4),
                        ),
                        child: Image.network(list[i].image),
                        // child: Image.network(
                        //     'https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg'),
                      ),
                      SizedBox(
                        height: sizeHeight * 0.01,
                      ),
                      // (list[i].description != '')
                      //     ? Padding(
                      //         padding:
                      //             const EdgeInsets.only(left: 10, right: 10),
                      //         child: Text(
                      //           '${list[i].description}',
                      //           maxLines: 2,
                      //           overflow: TextOverflow.ellipsis,
                      //           style: AppStyle.bookDetail,
                      //         ),
                      //       )
                      //     : SizedBox(),
                      // (list[i].description != '')
                      //     ? SizedBox(
                      //         height: sizeHeight * 0.003,
                      //       )
                      //     : SizedBox(),
                      (list[i].fullName != '')
                          ? Padding(
                              padding:
                                  const EdgeInsets.only(left: 10, right: 10),
                              child: RichText(
                                text: TextSpan(
                                  text: 'Họ và Tên : ',
                                  style: AppStyle.bookDetail.copyWith(
                                    color: Colors.black,
                                  ),
                                  children: <TextSpan>[
                                    TextSpan(
                                      text: '${list[i].fullName}',
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
                            )
                          : SizedBox(),
                      (list[i].email != '')
                          ? SizedBox(
                              height: sizeHeight * 0.003,
                            )
                          : SizedBox(),
                      (list[i].email != '')
                          ? Padding(
                              padding:
                                  const EdgeInsets.only(left: 10, right: 10),
                              child: RichText(
                                text: TextSpan(
                                  text: 'Email : ',
                                  style: AppStyle.bookDetail.copyWith(
                                    color: Colors.black,
                                  ),
                                  children: <TextSpan>[
                                    TextSpan(
                                      text: '${list[i].email}',
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
                            )
                          : SizedBox(),

                      (list[i].address != '')
                          ? SizedBox(
                              height: sizeHeight * 0.003,
                            )
                          : SizedBox(),
                      (list[i].address != '')
                          ? Padding(
                              padding:
                                  const EdgeInsets.only(left: 10, right: 10),
                              child: RichText(
                                text: TextSpan(
                                  text: 'Địa chỉ : ',
                                  style: AppStyle.bookDetail.copyWith(
                                    color: Colors.black,
                                  ),
                                  children: <TextSpan>[
                                    TextSpan(
                                      text: '${list[i].address}',
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
                            )
                          : SizedBox(),
                      (list[i].phone != '')
                          ? SizedBox(
                              height: sizeHeight * 0.003,
                            )
                          : SizedBox(),
                      Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: Row(
                          children: [
                            RichText(
                              text: TextSpan(
                                text: 'Số điện thoại : ',
                                style: AppStyle.bookDetail.copyWith(
                                  color: Colors.black,
                                ),
                                children: <TextSpan>[
                                  TextSpan(
                                    text: '${list[i].phone}',
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
                            Expanded(child: SizedBox()),
                            GestureDetector(
                              child: Text('Chi tiết >>',
                                  style: AppStyle.bookDetail
                                      .copyWith(color: Color(0xFF3366FF))),
                              onTap: () {
                                Navigator.of(context).pushNamed(
                                    '/counselor-detail-screen',
                                    arguments: list[i]);
                              },
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: sizeHeight * 0.01,
                      ),
                    ],
                  ),
                ),
                onTap: () {
                  Navigator.of(context).pushNamed('/counselor-detail-screen',
                      arguments: list[i]);
                },
              ),
              SizedBox(height: sizeHeight * 0.02),
            ],
          ),
        ),
      );
      (i < list.length - 1)
          ? listWidget.add(SizedBox(
              height: 8,
            ))
          : listWidget.add(SizedBox());
    }
    return listWidget;
  }
}
