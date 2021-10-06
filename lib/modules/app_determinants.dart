import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'AuthController.dart';

class AppDeterminants with ChangeNotifier {
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  SharedPreferences? prefs;
  static String? _lang;
  static String? _userId;
  static String? _token;
  static String? _loginAt;
  static String? _schoolsIds;
  static String? _username;
  static String? _email;
  static bool? _lunchedForFirst;

  static final AppDeterminants _appDeterminants = AppDeterminants._internal();

  factory AppDeterminants() {
    return _appDeterminants;
  }
  AppDeterminants._internal();

  Future initializeAll() async {
    await initializeIsLunchesStatus();
    await initializeLang();
    await initializeToken();
    await initializeUserId();
    await initializeSchoolsIDs();
    await initializeLoginAt();
    await initializeUserName();
    await initializeEmail();
    await Future.delayed(
      Duration(milliseconds: 800),
    );
    return true;
  }

  setLang(String lang) async {
    if (prefs == null) {
      prefs = await _prefs;
    }
    prefs!.setString('lang', lang);
    _lang = lang;
    notifyListeners();
  }

  setUsername(String username) async {
    if (prefs == null) {
      prefs = await _prefs;
    }
    prefs!.setString('username', username);
    _username = username;
    notifyListeners();
  }

  setEmail(String email) async {
    if (prefs == null) {
      prefs = await _prefs;
    }
    prefs!.setString('email', email);
    _email = email;
    notifyListeners();
  }

  setFirstLunch() async {
    if (prefs == null) {
      prefs = await _prefs;
    }
    prefs!.setBool('lunchedForFirst', true);
    _lunchedForFirst = true;
    notifyListeners();
  }

  setToken(String token) async {
    if (prefs == null) {
      prefs = await _prefs;
    }
    prefs!.setString('token', token);
    _token = token;
    notifyListeners();
  }

  setUserId(String userId) async {
    if (prefs == null) {
      prefs = await _prefs;
    }
    prefs!.setString('userId', userId);
    _userId = userId;
    notifyListeners();
  }

  setSchoolsIDs(String schoolsIds) async {
    if (prefs == null) {
      prefs = await _prefs;
    }
    prefs!.setString('schoolsIds', schoolsIds);
    _schoolsIds = schoolsIds;
    notifyListeners();
  }

  setLoginAt(String loginAt) async {
    if (prefs == null) {
      prefs = await _prefs;
    }
    prefs!.setString('loginAt', loginAt);
    _loginAt = loginAt;
    notifyListeners();
  }

  String get loginAt {
    if (_loginAt == null) {
      _loginAt = "";
    }
    return _loginAt!;
  }

  bool get isLunched {
    if (_lunchedForFirst == null) {
      _lunchedForFirst = false;
    }
    return _lunchedForFirst!;
  }

  get lang {
    if (_lang == null) {
      _lang = "en";
    }
    print(_lang);
    return _lang;
  }

  get token {
    if (_token == null) {
      _token = "en";
    }
    return _token;
  }

  get userId {
    if (_userId == null) {
      _userId = "en";
    }
    return _userId;
  }

  get schoolsIds {
    if (_schoolsIds == null) {
      _schoolsIds = "";
    }
    return _schoolsIds;
  }

  get userName {
    if (_username == null) {
      _username = "";
    }
    return _username;
  }

  get email {
    if (_email == null) {
      _email = "";
    }
    return _email;
  }

  initializeUserName() async {
    if (prefs == null) {
      prefs = await _prefs;
    }
    _username = (prefs!.getString('username')) ?? "";
  }

  initializeEmail() async {
    if (prefs == null) {
      prefs = await _prefs;
    }
    _email = (prefs!.getString('email')) ?? "";
  }

  initializeIsLunchesStatus() async {
    if (prefs == null) {
      prefs = await _prefs;
    }
    _lunchedForFirst = (prefs!.getBool('lunchedForFirst')) ?? false;
  }

  initializeLang() async {
    if (prefs == null) {
      prefs = await _prefs;
    }
    _lang = (prefs!.getString('lang')) ?? "en";
  }

  initializeToken() async {
    if (prefs == null) {
      prefs = await _prefs;
    }
    _token = (prefs!.getString('token')) ?? "";
  }

  initializeUserId() async {
    if (prefs == null) {
      prefs = await _prefs;
    }
    _userId = (prefs!.getString('userId')) ?? "";
  }

  initializeSchoolsIDs() async {
    if (prefs == null) {
      prefs = await _prefs;
    }
    _schoolsIds = (prefs!.getString('schoolsIds')) ?? "";
  }

  initializeLoginAt() async {
    if (prefs == null) {
      prefs = await _prefs;
    }
    _loginAt = (prefs!.getString('loginAt')) ?? "";
  }
}
