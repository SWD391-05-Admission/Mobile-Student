import 'package:flutter/material.dart';
import 'package:mobile_customer/models/university.dart';
import 'package:mobile_customer/values/app_fonts.dart';

class UniversityDetailScreen extends StatelessWidget {
  const UniversityDetailScreen();
  static const routeName = '/university-detail-screen';

  @override
  Widget build(BuildContext context) {
    final double _sizeHeight = MediaQuery.of(context).size.height -
        MediaQuery.of(context).padding.top -
        MediaQuery.of(context).padding.bottom;
    University university = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text(university.name),
        flexibleSpace:
            Container(decoration: BoxDecoration(color: Colors.white)),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Container(
            //   child: Image.network(university.description),
            // ),
            // SizedBox(
            //   height: _sizeHeight * 0.007,
            // ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Description: ${university.description}',
                    style: TextStyle(
                      fontFamily: AppFonts.poppins,
                      fontSize: 18,
                      // fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text('Code university: ${university.code}'),
                  Text('Description: ${university.description}'),
                  Text('Email: ${university.email}'),
                  Text('Facebook: ${university.facebook}'),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
