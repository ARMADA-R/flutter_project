import 'package:experienceapp/modules/app_determinants.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class AuthController{


  Future<bool> login(String username, String password) async{
    bool status = false;
    AppDeterminants appDeterminants = AppDeterminants();

    var url = Uri.parse('https://rafi.nobalaa.com/CodeSchoolSystem/Auth/Login');
    var response = await http.post(url, body: {'email': username, 'password': password});

    if(response.statusCode == 200){
      status = true;
      var jsonResponse =
      convert.jsonDecode(response.body) as Map<String, dynamic>;

      Map<String, dynamic> data = jsonResponse['data'];

      appDeterminants.setToken(data['token']);
      appDeterminants.setUserId(data['user_id']);
      appDeterminants.setUsername(data['username']);
      appDeterminants.setLoginAt(DateTime.now().millisecondsSinceEpoch.toString());
    }

    return status;
  }

}