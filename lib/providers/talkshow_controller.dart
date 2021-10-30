import 'dart:convert';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import '../models/talkshow.dart';
import '../values/app_value.dart';
import 'package:http/http.dart' as http;

class TalkshowController extends ChangeNotifier {
  List<Talkshow> _list;
  int _numberPage = 0;

  int get getNumberPage {
    int result = _numberPage;
    return result;
  }

  List<Talkshow> get list => _list;

  Future<Map<String, List<Talkshow>>> getListUniversity(
    String email,
    String fullName,
    String phone,
    int page,
    int limit,
  ) async {
    try {
      Map<String, List<Talkshow>> map;
      List<Talkshow> list = [];
      String token = await AppValue.getToken();
      log('TOKEN IN LOCAL : $token');

      Uri uri = Uri.parse(
        'http://40.81.193.10/api/counselor/getCounselors?Page=$page&Limit=$limit',
      );
      Map<String, String> headers = {'Authorization': 'Bearer $token'};
      final response = await http.get(
        uri,
        headers: headers,
      );
      log('status code get counselor : ${response.statusCode}');
      final data = await jsonDecode(response.body);
      log(data.toString());
      log('NUMBER PAGE : ${data['numPage']}');
      list = (data['counselors'] as List).map((newData) {
        log('newData : ${newData.toString()}');
        Talkshow talkshow = Talkshow(
          ID: newData['ID'] ?? '',
          counselor: newData['counselor'] ?? '',
          date: newData['date'] ?? '',
          description: newData['description'] ?? '',
          image: newData['image'] ?? '',
          major: newData['major'],
          price: newData['price'] ?? '',
          timeFinish: newData['timeFinish'] ?? '',
          timeStart: newData['timeStart'] ?? '',
        );
        return talkshow;
      }).toList();
      log('NUMBER PAGE : ${data['numPage']}');
      for (Talkshow i in list) {
        log('TEN : ${i.ID}');
      }

      map = {'${data['numPage']}': list};
      log('MAP ${map.entries.first.key}');
      log('MAP ${map.entries.first.value.toString()}');
      _numberPage = data['numPage'];
      _list = list;
      log(_list.length.toString());

      notifyListeners();
      return map;
    } catch (error) {
      log('SOMETHING WRONG in get lisst university! ${error.toString()}');
      // throw (error);
      return null;
    }
  }
}
