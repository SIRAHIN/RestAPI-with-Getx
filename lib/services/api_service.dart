import 'dart:convert';

import 'package:api_with_getx/model/user_model.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static getUserInfo() async {
    var url = "https://reqres.in/api/users?page=1";
    http.Response response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      return data;
    } else {
      return null;
    }
  }

  static allUserInfo () async{
  String url = "https://script.programmingwormhole.com/youtube/public/api/v1/posts";
    http.Response response = await http.get(Uri.parse(url));
    if(response.statusCode == 200){
      return response.body;
    } else {
     return null;
    }
  }
}
