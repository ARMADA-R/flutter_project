class User {
  String? _userName;
  String? _email;
  String? _token;
  DateTime? _logInDate;
  String? _schoolName;
  String? _city;
  String? _area;

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

  set schoolName(String schoolName) {
    _schoolName = schoolName;
  }

  set city(String city) {
    _city = city;
  }

  set area(String area){
    _area =area;
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

  String get schoolName{
    return _schoolName!;
  }

  String get city{
    return _city!;
  }

  String get area{
    return _area!;
  }

}