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
  static String? _schoolName;
  static String? _username;
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
    await initializeSchoolName();
    await initializeLoginAt();
    await initializeUserName();
    await Future.delayed(
      Duration(milliseconds: 400),
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

  setSchoolName(String schoolName) async {
    if (prefs == null) {
      prefs = await _prefs;
    }
    prefs!.setString('schoolName', schoolName);
    _schoolName = schoolName;
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

  get schoolName {
    if (_schoolName == null) {
      _schoolName = "en";
    }
    return _schoolName;
  }

  get userName{
    if (_username==null){
      _username ="";
    }
    return _username;
  }

  initializeUserName() async {
    if (prefs == null) {
      prefs = await _prefs;
    }
    _username = (prefs!.getString('username')) ?? "";
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

  initializeSchoolName() async {
    if (prefs == null) {
      prefs = await _prefs;
    }
    _schoolName = (prefs!.getString('schoolName')) ?? "";
  }

  initializeLoginAt() async {
    if (prefs == null) {
      prefs = await _prefs;
    }
    _loginAt = (prefs!.getString('loginAt')) ?? "";
  }
}
