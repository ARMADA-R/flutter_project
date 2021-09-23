import 'package:experienceapp/modules/app_determinants.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class AuthController{
  AppDeterminants appDeterminants = AppDeterminants();

  Future<bool> Registrate({required String schoolName,
    required String city,
    required String area,required String phone,
    required String email,
    required String learningType,
    required String password,
    required String school_number,
    required String user_name,
    required String re_password,
  }) async{
     bool status = false;
    var url = Uri.parse('https://rafi.nobalaa.com/CodeSchoolSystem/Auth/Register');
    var response = await http.post(url, body: {
    'role': '2',
    'school_name':schoolName,
    'edcution_type':learningType,
    'school_number':school_number,
    'city':city,
    'area':area,
    'email':email,
    'username': user_name,
    'password': password,
    're_password':re_password,
    'phone':phone,
    });
    print(response.body);

    if(response.statusCode ==200){
      status= true;
    }
    return status;
  }


  Future<bool> login(String username, String password) async{
    bool status = false;

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