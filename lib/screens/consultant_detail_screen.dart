import 'package:flutter/material.dart';
import 'package:mobile_customer/models/user.dart';
import 'package:mobile_customer/values/app_fonts.dart';

class ConsultantDetailScreen extends StatelessWidget {
  const ConsultantDetailScreen();
  static const routeName = '/consultant-detail-screen';

  @override
  Widget build(BuildContext context) {
    final double _sizeHeight = MediaQuery.of(context).size.height -
        MediaQuery.of(context).padding.top -
        MediaQuery.of(context).padding.bottom;
    User user = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text(user.fullName),
        flexibleSpace:
            Container(decoration: BoxDecoration(color: Colors.white)),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: Image.network(user.image),
            ),
            SizedBox(
              height: _sizeHeight * 0.007,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Description: ${user.description}',
                    style: TextStyle(
                      fontFamily: AppFonts.poppins,
                      fontSize: 18,
                      // fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text('Address: ${user.address}'),
                  Text('Birthday: ${user.birthday}'),
                  Text('Email: ${user.email}'),
                  Text('Phone: ${user.phone}'),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
