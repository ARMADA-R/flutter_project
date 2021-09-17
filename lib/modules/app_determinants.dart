import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppDeterminants with ChangeNotifier {

  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  static String? _lang;
  static bool? _lunchedForFirst;


  static final AppDeterminants _appDeterminants = AppDeterminants._internal();

  factory AppDeterminants() {
    return _appDeterminants;
  }
  AppDeterminants._internal();

  Future initializeAll() async{
    await initializeIsLunchesStatus();
    await initializeLang();
    await Future.delayed(Duration(milliseconds: 1500),);
    return true;

  }


  setLang(String lang) async {
    SharedPreferences prefs = await _prefs;
    prefs.setString('lang', lang);
    _lang = lang;
    notifyListeners();
  }

  setFirstLunch() async {
    SharedPreferences prefs = await _prefs;
    prefs.setBool('lunchedForFirst', true);
    _lunchedForFirst = true;
    notifyListeners();
  }

  bool get isLunched {
    if(_lunchedForFirst == null) {
      _lunchedForFirst = false;
    }
      return _lunchedForFirst!;
  }

  get lang {
    if(_lang == null) {
      _lang = "en";
    }
      return _lang;
  }


  initializeIsLunchesStatus() async {
    SharedPreferences prefs= await _prefs;
      _lunchedForFirst = (prefs.getBool('lunchedForFirst')) ?? false;
  }

  initializeLang() async {
    SharedPreferences prefs = await _prefs;
      _lang = (prefs.getString('lang')) ?? "en";
  }
}
