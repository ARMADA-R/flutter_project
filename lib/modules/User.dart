class User {
  String? _userName;
  String? _email;
  String? _token;
  DateTime? _logInDate;

  set userName(String username) {
    _userName = username;
  }

  set email(String email) {
    _email = email;
  }


  set token(String token) {
    _token = token;
  }


  set logInDate(DateTime logInDate) {
    _logInDate = logInDate;
  }


 String get userName{
    return _userName!;
  }

 String get email{
    return _email!;
  }

 String get token{
    return _token!;
  }

 DateTime get logInDate{
    return _logInDate!;
  }


}