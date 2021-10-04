import 'package:flutter/material.dart';

class SaveScreen extends StatefulWidget {
  const SaveScreen();
  static const routesName = '/save';
  @override
  _SaveScreenState createState() => _SaveScreenState();
}

class _SaveScreenState extends State<SaveScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(child: Text('SAVE')),
    );
  }
}
