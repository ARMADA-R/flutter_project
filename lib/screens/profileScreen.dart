import 'package:experienceapp/generated/l10n.dart';
import 'package:experienceapp/modules/User.dart';
import 'package:experienceapp/modules/app_determinants.dart';
import 'package:experienceapp/screens/HomeScreen.dart';
import 'package:experienceapp/widgets/mainDrawer.dart';
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
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: MainDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Stack(
              children: [
                Image.asset('assets/images/school1.jpg',
                  height: 300, width: double.infinity,
                fit: BoxFit.cover,
                ),
                Positioned(
                    top: 50, left: 20,
                    child: IconButton(
                      icon: Icon(Icons.menu),
                      iconSize: 30,
                      color: Colors.white54,
                      onPressed: (){
                        setState(() {
                          _scaffoldKey.currentState!.openDrawer();
                        });
                      },

                    )
                )
              ],
            ),
           Padding(
             padding: const EdgeInsets.all(15.0),
             child: Center(
               child: Container(
                 child: Column(
                   children: [
                     Card(
                       child: Text('${S.of(context).schoolName}:',
                         style:TextStyle(fontSize: 30, fontWeight: FontWeight.bold) ,
                       ),
                     ),
                     Card(
                       child: Text('${S.of(context).city}:',
                         style:TextStyle(fontSize: 30, fontWeight: FontWeight.bold) ,
                       ),
                     ),
                     Card(
                       child: Text('${S.of(context).area}:',
                         style:TextStyle(fontSize: 30, fontWeight: FontWeight.bold) ,
                       ),
                     ),
                     Card(
                       child: Text('${S.of(context).phone}:',
                         style:TextStyle(fontSize: 30, fontWeight: FontWeight.bold) ,
                       ),
                     ),
                     Card(
                       child: Text('${S.of(context).password}:',
                         style:TextStyle(fontSize: 30, fontWeight: FontWeight.bold) ,
                       ),
                     ),
                   ],
                 ),
               ),
             ),

             ),
           ]
        ),
        ),
      );
  }
}
