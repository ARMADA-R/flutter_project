import 'package:experienceapp/generated/l10n.dart';
import 'package:experienceapp/modules/AuthController.dart';
import 'package:experienceapp/screens/Form.dart';
import 'package:experienceapp/screens/login_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyRegistrationScreen extends StatefulWidget {
  const MyRegistrationScreen({Key? key, required this.title}) : super(key: key);
  final String title;
  static final String routeName = 'MyRegistrationScreen';

  @override
  _MyRegistrationScreenState createState() => _MyRegistrationScreenState();
}

class _MyRegistrationScreenState extends State<MyRegistrationScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final re_passwordController = TextEditingController();
  final usernameController = TextEditingController();
  final phone = TextEditingController();
  final city = TextEditingController();
  final area = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  'assets/images/school3.jpg',
                ),
                colorFilter: ColorFilter.mode(Colors.black45, BlendMode.darken),
                fit: BoxFit.cover,
              ),
            ),
            child: LayoutBuilder(
              builder: (context, constraints) {
                double width = constraints.maxWidth;
                double height = constraints.maxHeight;
                return Center(
                  child: Container(
                    width: width*0.7,
                    color: Colors.white70,
                    child: SingleChildScrollView(
                      child: Center(
                        child: Form(
                          key: _formKey,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(vertical: height * 0.01),
                                child: Text(
                                  S.of(context).createAccount,
                                  style: TextStyle(
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: height * 0.01,
                                    horizontal: width * 0.05),
                                child: TextFormField(
                                  controller: usernameController,
                                  decoration: InputDecoration(
                                    hintText: S.of(context).username,
                                  ),
                                  validator: (String? value) {
                                    if (value == null || value.isEmpty) {
                                      return S.of(context).ministerialNumber;
                                    }
                                    return null;
                                  },
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: height * 0.01,
                                    horizontal: width * 0.05),
                                child: TextFormField(
                                  controller: city,
                                  decoration: InputDecoration(
                                    hintText: S.of(context).city,
                                  ),
                                  validator: (String? value) {
                                    if (value == null || value.isEmpty) {
                                      return S.of(context).EnterSomeText;
                                    }
                                    return null;
                                  },
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: height * 0.01,
                                    horizontal: width * 0.05),
                                child: TextFormField(
                                  controller: area,
                                  decoration: InputDecoration(
                                    hintText: S
                                        .of(context)
                                        .area,
                                  ),
                                  validator: (String? value) {
                                    if (value == null || value.isEmpty) {
                                      return S
                                          .of(context)
                                          .EnterSomeText;
                                    }
                                    return null;
                                  },
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: height * 0.01,
                                    horizontal: width * 0.05),
                                child: TextFormField(
                                  controller: emailController,
                                  decoration: InputDecoration(
                                    hintText: S
                                        .of(context)
                                        .EnterYourEmail,
                                  ),
                                  validator: (String? value) {
                                    if (value == null || value.isEmpty) {
                                      return S
                                          .of(context)
                                          .EnterSomeText;
                                    }
                                    return null;
                                  },
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: height * 0.01,
                                    horizontal: width * 0.05),
                                child: TextFormField(
                                  controller: passwordController,
                                  decoration: InputDecoration(
                                    hintText: S
                                        .of(context)
                                        .password,
                                  ),
                                  validator: (String? value) {
                                    if (value == null || value.isEmpty) {
                                      return S
                                          .of(context)
                                          .EnterSomeText;
                                    }
                                    return null;
                                  },
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: height * 0.01,
                                    horizontal: width * 0.05),
                                child: TextFormField(
                                  controller: re_passwordController,
                                  decoration: InputDecoration(
                                    hintText: S
                                        .of(context)
                                        .rePassword,
                                  ),
                                  validator: (String? value) {
                                    if (value == null || value.isEmpty) {
                                      return S
                                          .of(context)
                                          .EnterSomeText;
                                    }else if(re_passwordController.text != passwordController.text){
                                      return S
                                          .of(context)
                                          .passAndRePAssDontMatch;
                                    }
                                    return null;
                                  },
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: height * 0.01,
                                    horizontal: width * 0.05),
                                child: TextFormField(
                                  controller: phone,
                                  decoration: InputDecoration(
                                    hintText: S
                                        .of(context)
                                        .phone,
                                  ),
                                  validator: (String? value) {
                                    if (value == null || value.isEmpty) {
                                      return S
                                          .of(context)
                                          .EnterSomeText;
                                    }
                                    return null;
                                  },
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: height * 0.01,
                                    horizontal: width * 0.05),
                                child: ElevatedButton(
                                  onPressed: () async {
                                    // Validate will return true if the form is valid, or false if
                                    // the form is invalid.
                                    if (_formKey.currentState!.validate()) {
                                          if(await AuthController().Registrate(
                                              city: city.text, area: area.text,
                                              phone: phone.text,
                                              email: emailController.text,
                                              password: passwordController.text,
                                              user_name: usernameController.text,
                                              re_password: re_passwordController.text,
                                          context: context)){
                                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                             content: Text('Account created'))
                                            );
                                          }
                                    }
                                  },
                                  child: Text(S.of(context).createAccount),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: height * 0.01,
                                    horizontal: width * 0.05),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          primary: Colors.black45,
                                          textStyle: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold)),
                                      child: Text(S.of(context).login),
                                      onPressed: () {
                                        Navigator.pushNamed(context, LogInScreen.routeName);
//
                                      },
                                    ),
                                    Text(S
                                        .of(context)
                                        .doYouHaveAccount),
                                  ],
                                ),
                              ),
                              ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      primary: Colors.black45,
                                      textStyle: TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold)),
                                  onPressed: () {
                                    setState(() {
                                      Navigator.pushNamed(context, UserForm.routeName);
                                    });
                                  },
                                  child: Text(S.of(context).home))
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),

                )
               ;
              }
            )
          ),
          );
        }
  }


//LayoutBuilder(builder:(context, constraints) {
//double width = constraints.maxWidth;
//double height = constraints.maxHeight;
//
//return
