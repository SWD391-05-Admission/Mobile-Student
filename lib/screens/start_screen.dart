import 'package:flutter/material.dart';
import 'package:mobile_customer/values/app_colors.dart';
import 'package:mobile_customer/widgets/bottom_bar_widget.dart';

class StartScreen extends StatefulWidget {
  const StartScreen();

  @override
  _StartScreenState createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  @override
  Widget build(BuildContext context) {
    return buildBody(context);
  }

  Widget buildBody(BuildContext context) {
    const AssetImage _backgroundImage = AssetImage('assets/images/load.png');
    return FutureBuilder(
      future: _loading(),
      builder: (context, snapshot) {
        return Scaffold(
          body: Center(
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: _backgroundImage,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Center(
                  child: CircularProgressIndicator(
                    color: AppColors.black54,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Future<String> _loading() async {
    await Future.delayed(Duration(milliseconds: 2500)).then(
      (value) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (BuildContext context) {
              return BottomBar();
            },
          ),
        );
      },
    );
    return null;
  }
}
