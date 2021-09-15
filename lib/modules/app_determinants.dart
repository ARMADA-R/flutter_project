import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppDeterminants with ChangeNotifier {

Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
SharedPreferences? prefs ;
 setLang(String lang) async{
   SharedPreferences prefs = await _prefs;
   prefs.setString('lang', lang);
   notifyListeners();
 }


 get lang async{
    this.prefs = await _prefs;
   return (prefs!.getString('lang')) ?? "en";
 }


}