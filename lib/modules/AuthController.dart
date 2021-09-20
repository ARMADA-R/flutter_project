import 'package:http/http.dart' as http;

class AuthController{


  Future<bool> login(String username, String password) async{
    bool status = false;

    var url = Uri.parse('https://new.arsail.net/CodeSchoolSystem/Auth/Login');
    var response = await http.post(url, body: {'email': username, 'password': password});
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    return status;
  }

}