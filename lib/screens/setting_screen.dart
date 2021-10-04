import 'package:flutter/material.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen();
  static const routesName = '/setting';
  @override
  _SettingScreenState createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(child: Text('SETTING')),
    );
  }
}
