import 'package:experienceapp/generated/l10n.dart';
import 'package:experienceapp/modules/User.dart';
import 'package:experienceapp/screens/HomeScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key, required this.title}) : super(key: key);
  final String title;
  static final String routeName = "ProfileScreen";
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Stack(
              children: [
                Image.asset('assets/images/school2.jpeg',
                  height: 400, width: double.infinity,
                fit: BoxFit.cover,
                ),
                Positioned(
                    top: 50, left: 20,
                    child: IconButton(
                      icon: Icon(Icons.menu),
                      iconSize: 30,
                      color: Colors.white54,
                      onPressed: (){},

                    ) )
              ],
            ),
           Padding(
             padding: const EdgeInsets.all(15.0),
             child: Text('{username: $User.username}',
             style: TextStyle(
               fontSize: 30,
               fontWeight: FontWeight.bold,
               letterSpacing: 1.5,
             ),

             ),
           ),

            

          ],
        ),
      ),
    );
  }
}
