import 'package:experienceapp/generated/l10n.dart';
import 'package:experienceapp/modules/app_determinants.dart';
import 'package:experienceapp/screens/loginScreenEx.dart';
import 'package:experienceapp/screens/profileScreen.dart';
import 'package:experienceapp/screens/public_messages_forms.dart';
import 'package:experienceapp/screens/registration_screen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class MainDrawer extends StatelessWidget {
  _buildDrawer(Icon icon, String title, Function() onTap) {
    return ListTile(
      leading: icon,
      title: Text(
        title,
        style: TextStyle(fontSize: 20),
      ),
      onTap: onTap,
    );
  }

  @override
  initState(){
    initState();

  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Image(
                height: 300,
                width: double.infinity,
                image: AssetImage('assets/images/school1.jpg'),
                fit: BoxFit.cover,
              )
            ],
          ),
          _buildDrawer(Icon(Icons.dashboard), S.of(context).Profile, () {
        //    Navigator.pushReplacementNamed(context, ProfileScreen.routeName);
          }),
          _buildDrawer(
              Icon(Icons.description), S.of(context).PublicMessagesForms, () {
            Navigator.pushNamed(context, PublicMessagesForms.routeName);
          }),
          _buildDrawer(
              Icon(Icons.logout), S.of(context).logout, () {
                AppDeterminants().setUsername('');
                AppDeterminants().setToken('');
                AppDeterminants().setUserId('');
                Navigator.pushReplacementNamed(context, LogInScreen2.routeName);

          }),

        ],
      ),
    );
  }

//  Widget buildListTile(String title, IconData icon, Function tappingOn){
//    return ListTile(
//      leading: Icon(
//        icon,
//        size: 26,
//      ),
//
//      title: Text(
//        title,
//        style: TextStyle(fontSize: 24,
//            fontWeight: FontWeight.bold),
//      ),
//      onLongPress: tappingOn(),
//    );
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return  Drawer(
//        child: Column(
//          children: [
//            Container(
//              height: 120,
//              width: double.infinity,
//              padding: EdgeInsets.all(20),
//              alignment: Alignment.center,
//              color: Colors.grey,
//              child: Text(
//                S.of(context).appTitle,
//                style: TextStyle(
//                  fontWeight: FontWeight.w900,
//                  fontSize: 30,
//                ),
//              ),
//            ),
//            SizedBox(
//              height: 20,
//            ),
////            buildListTile('Log In', Icons.login,
////                    (){
////                print('vsdv');
////              //  Navigator.pushNamed(context, LogInScreen.routeName, );
////            }),
////            buildListTile('Sign Up', Icons.app_registration, (){}),
////            buildListTile('Log Out', Icons.logout, (){}),
//          ListTile(
//            leading: Icon(Icons.login),
//            title: Text(S.of(context).login),
//            onTap: (){
//              Navigator.pushNamed(context, LogInScreen.routeName, );
//            },
//          ),
//            ListTile(
//              leading: Icon(Icons.app_registration),
//              title: Text('Sign Up'),
//              onTap: (){
//                print('vdva');
//                Navigator.pushNamed(context, MyRegistrationScreen.routeName, );
//              },
//            ),
//            ListTile(
//              leading: Icon(Icons.logout),
//              title: Text(S.of(context).logout),
//              onTap: (){
//                print('vdva');
//          //      Navigator.pushNamed(context, LogInScreen.routeName, );
//              },
//
//            ),
//          ],
//        ),
//      );
//  }
}
