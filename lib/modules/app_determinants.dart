import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppDeterminants with ChangeNotifier {
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  SharedPreferences? prefs;
  static String? _lang;
  static bool? _lunchedForFirst;
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

  get isLunched async {
    if(_lunchedForFirst == null) {
      this.prefs = await _prefs;
      return (prefs!.getBool('lunchedForFirst')) ?? false;
    } else {
      return _lunchedForFirst;
    }
  }

  get lang async {
    if(_lang == null) {
      this.prefs = await _prefs;
      return (prefs!.getString('lang')) ?? "en";
    }else
      return _lang;


  }
}
