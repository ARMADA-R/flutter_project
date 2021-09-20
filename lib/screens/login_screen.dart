import 'package:experienceapp/generated/l10n.dart';
import 'package:experienceapp/screens/HomeScreen.dart';
import 'package:experienceapp/screens/forgetPassword.dart';
import 'package:experienceapp/screens/profileScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class LogInScreen extends StatefulWidget {
  const LogInScreen({Key? key, required this.title}) : super(key: key);
  final String title;
  static final String routeName = 'LogInScreen';

  @override
  _LogInScreenState createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {


  @override
  Widget build(BuildContext context) {
  var routeArg = ModalRoute.of(context)!.settings.arguments;
    return  Scaffold(
//          appBar: AppBar(
//
//          ),
          body:LayoutBuilder(builder:(context, constraints) {
            double width = constraints.maxWidth;
            return Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/school1.jpg',),
                  colorFilter: ColorFilter.mode(Colors.black45, BlendMode.darken),
                  fit: BoxFit.cover,
                ),
              ),
              child: Center(
                child: Container(
                  width: width * 0.7,
                  height: 400,
                  margin: EdgeInsets.all(20),
                  color: Colors.white60,
                  child: Form(

                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,

                      children: [
                        Text(S.of(context).login, style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
                        TextFormField(
                          textAlignVertical: TextAlignVertical.center,
                          textAlign: TextAlign.end,
                          decoration: InputDecoration(
                              labelText: S.of(context).email,
                              labelStyle: TextStyle(color: Colors.black),
                              hoverColor: Colors.black),
                          keyboardType: TextInputType.emailAddress,

                        ),
                        TextFormField(
                          textAlignVertical: TextAlignVertical.center,
                          textAlign: TextAlign.end,
                          decoration: InputDecoration(
                              labelText: S.of(context).password,
                              labelStyle: TextStyle(color : Colors.black),
                              hoverColor: Colors.black),
                          keyboardType: TextInputType.visiblePassword,
                        ),
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Colors.black45,
                                textStyle: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold)
                            ),
                          child: Text(S.of(context).login),
                          onPressed: () {
                              
                        },
                        ),

                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                primary: Colors.black45,
                                textStyle: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold)
                            ),

                            onPressed: (){
                              setState(() {
                                Navigator.pushNamed(context, ForgetPasswordScreen.routeName);
                              });

                            },
                            child: Text(S.of(context).ForgetPassword)),


                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                primary: Colors.black45,
                                textStyle: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold)
                            ),

                            onPressed: (){
                          setState(() {
                            Navigator.pushNamed(context, ProfileScreen.routeName);
                          });

                          },
                            child: Text(S.of(context).Profile))
                      ],
                    ),
                  ),
                ),
              ),
            );
          }
        ),
    );
  }
}
