import 'package:experienceapp/generated/l10n.dart';
import 'package:experienceapp/modules/AuthController.dart';
import 'package:experienceapp/screens/HomeScreen.dart';
import 'package:experienceapp/screens/public_messages_forms.dart';
import 'package:experienceapp/screens/registeration_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({Key? key, required this.title}) : super(key: key);
  final String title;
  static final String routeName = "ForgetPassword";

  @override
  _ForgetPasswordScreenState createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();



  @override
  Widget build(BuildContext context) {
    var routeArg = ModalRoute.of(context)!.settings.arguments;
    return  Scaffold(
//          appBar: AppBar(
//
//          ),
      body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/school1.jpg',),
              colorFilter: ColorFilter.mode(Colors.black45, BlendMode.darken),
              fit: BoxFit.cover,
            ),
          ),
          child: LayoutBuilder(
              builder: (context, constraints ) {
                double width = constraints.maxWidth;
                double height = constraints.maxHeight;
                return Center(
                    child: Container(
                      width: width*0.7,
                      height: height*0.5,
                      child: Card(
                        color: Colors.white70,
                        child: Form(
                          key: _formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(15),
                                child: TextFormField(
                                  decoration: const InputDecoration(
                                    hintText: "EnterYourEmail",
                                  ),
                                  validator: (String? value){
                                    if(value==null || value.isEmpty){
                                      return S.of(context).EnterSomeText;
                                    }
                                    return null;
                                  },
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 16.0),
                                child: ElevatedButton(
                                  onPressed: () {
                                    // Validate will return true if the form is valid, or false if
                                    // the form is invalid.
                                    if (_formKey.currentState!.validate()) {
                                      Navigator.pushNamed(context, MyRegistrationScreen.routeName);
                                     // AuthController; // Process data.
                                    }
                                  },
                                  child:  Text(S.of(context).resetPassword),
                                ),
                              ),


                            ],
                          ),
                        ),
                      ),

                    )
                );
              }
          ),
        ),
    );
      }
}