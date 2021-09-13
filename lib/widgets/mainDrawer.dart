import 'package:experienceapp/generated/l10n.dart';
import 'package:experienceapp/screens/registeration_screen.dart';
import 'package:flutter/material.dart';
import '/screens/login_screen.dart';
class MainDrawer extends StatelessWidget  {
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

  @override
  Widget build(BuildContext context) {
    return  Drawer(

        child: Column(
          children: [
            Container(
              height: 120,
              width: double.infinity,
              padding: EdgeInsets.all(20),
              alignment: Alignment.center,
              color: Colors.grey,
              child: Text(
                S.of(context).appTitle,
                style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 30,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
//            buildListTile('Log In', Icons.login,
//                    (){
//                print('vsdv');
//              //  Navigator.pushNamed(context, LogInScreen.routeName, );
//            }),
//            buildListTile('Sign Up', Icons.app_registration, (){}),
//            buildListTile('Log Out', Icons.logout, (){}),
          ListTile(
            leading: Icon(Icons.login),
            title: Text('Log In'),
            onTap: (){
              print('vdva');
              Navigator.pushNamed(context, LogInScreen.routeName, );
            },
          ),
            ListTile(
              leading: Icon(Icons.app_registration),
              title: Text('Sign Up'),
              onTap: (){
                print('vdva');
                Navigator.pushNamed(context, MyRegistrationScreen.routeName, );
              },
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text('Log Out'),
              onTap: (){
                print('vdva');
          //      Navigator.pushNamed(context, LogInScreen.routeName, );
              },

            ),
          ],
        ),
      );
  }
}
