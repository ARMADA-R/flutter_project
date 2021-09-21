import 'package:experienceapp/generated/l10n.dart';
import 'package:experienceapp/modules/AuthController.dart';
import 'package:experienceapp/screens/forgetPassword.dart';
import 'package:experienceapp/screens/profileScreen.dart';
import 'package:flutter/material.dart';
import '';

class LogInScreen extends StatefulWidget {
  const LogInScreen({Key? key, required this.title}) : super(key: key);
  final String title;
  static final String routeName = 'LogInScreen';

  @override
  _LogInScreenState createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              'assets/images/school1.jpg',
            ),
            colorFilter: ColorFilter.mode(Colors.black45, BlendMode.darken),
            fit: BoxFit.cover,
          ),
        ),
        child: LayoutBuilder(builder: (context, constraints) {
          double width = constraints.maxWidth;
          double height = constraints.maxHeight;
          return Center(
              child: Container(
            width: width * 0.7,
            height: height * 0.6,
            child: Card(
              color: Colors.white70,
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          left: width * 0.05, right: width * 0.05, bottom: 10),
                      child: TextFormField(
                        controller: emailController,
                        decoration: InputDecoration(
                          hintText: S.of(context).EnterYourEmail,
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return S.of(context).EnterSomeText;
                          }
                          if (!value.contains('@')) {
                            return 'Email is invalid, must contain @';
                          }
                          if (!value.contains('.')) {
                            return 'Email is invalid, must contain .';
                          }
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: width * 0.05, right: width * 0.05, bottom: 10),
                      child: TextFormField(
                        controller: passwordController,
                        decoration: InputDecoration(
                          hintText: S.of(context).password,
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
                      padding: EdgeInsets.only(
                          left: width * 0.05,
                          right: width * 0.05,
                          bottom: 10,
                          top: 10),
                      child: ElevatedButton(
                        onPressed: () async {
                          // Validate will return true if the form is valid, or false if
                          // the form is invalid.
                          if (_formKey.currentState!.validate()) {
                            if (await AuthController().login(
                                emailController.text,
                                passwordController.text)) {
                              Navigator.pushReplacementNamed(
                                  context, ProfileScreen.routeName);
                            }
                          }
                        },
                        child: Text(S.of(context).login),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: width * 0.05, right: width * 0.05, bottom: 10,),
                      child: TextButton(
                          style: ElevatedButton.styleFrom(
//                              primary: Colors.black45,
                              textStyle: TextStyle(
                                  fontSize: 10)),
                          onPressed: () {
                            setState(() {
                              Navigator.pushNamed(
                                  context, ForgetPasswordScreen.routeName);
                            });
                          },
                          child: Text(S.of(context).ForgetPassword)),
                    )
                  ],
                ),
              ),
            ),
          ));
        }),
      ),
    );
  }
}
//Container(
//width: width * 0.7,
//height: 400,
//margin: EdgeInsets.all(20),
//color: Colors.white60,
//child: Form(
//
//child: Column(
//mainAxisAlignment: MainAxisAlignment.spaceBetween,
//
//children: [
//Text(S.of(context).login, style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
//TextFormField(
//textAlignVertical: TextAlignVertical.center,
//textAlign: TextAlign.end,
//decoration: InputDecoration(
//labelText: S.of(context).email,
//labelStyle: TextStyle(color: Colors.black),
//hoverColor: Colors.black),
//keyboardType: TextInputType.emailAddress,
//
//),
//TextFormField(
//textAlignVertical: TextAlignVertical.center,
//textAlign: TextAlign.end,
//decoration: InputDecoration(
//labelText: S.of(context).password,
//labelStyle: TextStyle(color : Colors.black),
//hoverColor: Colors.black),
//keyboardType: TextInputType.visiblePassword,
//),
//ElevatedButton(
//style: ElevatedButton.styleFrom(
//primary: Colors.black45,
//textStyle: TextStyle(
//fontSize: 20,
//fontWeight: FontWeight.bold)
//),
//child: Text(S.of(context).login),
//onPressed: () {
//
//},
//),
//
//ElevatedButton(
//style: ElevatedButton.styleFrom(
//primary: Colors.black45,
//textStyle: TextStyle(
//fontSize: 17,
//fontWeight: FontWeight.bold)
//),
//
//onPressed: (){
//setState(() {
//Navigator.pushNamed(context, ForgetPasswordScreen.routeName);
//});
//
//},
//child: Text(S.of(context).ForgetPassword)),
//
//
//ElevatedButton(
//style: ElevatedButton.styleFrom(
//primary: Colors.black45,
//textStyle: TextStyle(
//fontSize: 17,
//fontWeight: FontWeight.bold)
//),
//
//onPressed: (){
//setState(() {
//Navigator.pushNamed(context, ProfileScreen.routeName);
//});
//
//},
//child: Text(S.of(context).Profile))
//],
//),
//),
//),
