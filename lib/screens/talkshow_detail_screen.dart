import 'package:flutter/material.dart';
import 'package:mobile_customer/models/talkshow.dart';
import 'package:mobile_customer/values/app_fonts.dart';
import 'package:mobile_customer/values/app_styles.dart';

class TalkshowDetailScreen extends StatelessWidget {
  const TalkshowDetailScreen();
  static const routeName = '/talkshow-detail-screen';

  @override
  Widget build(BuildContext context) {
    final double _sizeHeight = MediaQuery.of(context).size.height -
        MediaQuery.of(context).padding.top -
        MediaQuery.of(context).padding.bottom;
    Talkshow talkshow = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Detail Talkshow',
          style: AppStyle.titleSearch,
        ),
        flexibleSpace:
            Container(decoration: BoxDecoration(color: Colors.white)),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: Image.network(talkshow.image),
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
                    'Description: ${talkshow.description}',
                    style: AppStyle.desciptionStyle,
                  ),
                  Text(
                    'Time start: ${talkshow.timeStart}',
                    style: AppStyle.desciptionStyle,
                  ),
                  Text(
                    'Time finish: ${talkshow.timeFinish}',
                    style: AppStyle.desciptionStyle,
                  ),
                  Text(
                    'ID talkshow: ${talkshow.ID}',
                    style: AppStyle.desciptionStyle,
                  ),
                  Text(
                    'Name speaker: ${talkshow.speaker.fullName}',
                    style: AppStyle.desciptionStyle,
                  ),
                  Text(
                    'ID talkshow: ${talkshow.ID}',
                    style: AppStyle.desciptionStyle,
                  ),
                  Text(
                    'Talkshow price: ${talkshow.price}',
                    style: AppStyle.desciptionStyle,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Color(0xFFDDDDDD),
                          ),
                          onPressed: () {},
                          child: Text('Book now'),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
