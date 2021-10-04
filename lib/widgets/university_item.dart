import 'package:flutter/material.dart';
import 'package:mobile_customer/models/university.dart';
import 'package:mobile_customer/widgets/university_detail_item.dart';

class UniversityItem extends StatelessWidget {
  const UniversityItem();
  static const routeName = '/university-item';
  @override
  Widget build(BuildContext context) {
    List<University> listUniversity = [];
    listUniversity = University.createListUniversity();
    return ListView.builder(
      itemCount: listUniversity.length,
      itemBuilder: (context, index) {
        return UniversityDetailItem(listUniversity[index]);
      },
    );
  }
}
