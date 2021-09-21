import 'package:experienceapp/generated/l10n.dart';
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

  String dropdownValue= 'hello';

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
                                  decoration: InputDecoration(
                                    hintText: S
                                        .of(context)
                                        .schoolName,
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
                                child: Container(
                                  width: width*0.7,
                                  child: DropdownButton<String>(
                                    value: dropdownValue,
                                    style: const TextStyle(color: Colors.black),
                                    onChanged: (String? newValue) {
                                      setState(() {
                                        dropdownValue = newValue!;
                                      });
                                    },
                                    items: <String>[
                                      'hello',
                                      S.of(context).learningType,
                                      S.of(context).generalEducation,
                                      S.of(context).memorization,
                                      S.of(context).materials,
                                    ].map<DropdownMenuItem<String>>((
                                        String value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: Text(value),
                                      );
                                    }).toList(),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: height * 0.01,
                                    horizontal: width * 0.05),
                                child: TextFormField(
                                  decoration: InputDecoration(
                                    hintText: S
                                        .of(context)
                                        .EnterYourEmail,
                                  ),
                                  validator: (String? value) {
                                    if (value == null || value.isEmpty) {
                                      return S
                                          .of(context)
                                          .ministerialNumber;
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
                                  decoration: InputDecoration(
                                    hintText: S
                                        .of(context)
                                        .city,
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
                                  onPressed: () {
                                    // Validate will return true if the form is valid, or false if
                                    // the form is invalid.
                                    if (_formKey.currentState!.validate()) {
                                      //    AuthController; // Process data.
                                    }
                                  },
                                  child: Text(S
                                      .of(context)
                                      .createAccount),
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
                                      child: Text(S
                                          .of(context)
                                          .login),
                                      onPressed: () {
                                        Navigator.pushNamed(
                                          context,
                                          LogInScreen.routeName,
                                        );
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
