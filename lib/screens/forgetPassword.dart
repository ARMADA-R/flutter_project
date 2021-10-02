//import 'package:experienceapp/Forms/ForgetPasswordFields.dart';
//import 'package:experienceapp/generated/l10n.dart';
//import 'package:experienceapp/modules/AuthController.dart';
//import 'package:experienceapp/screens/HomeScreen.dart';
//import 'package:experienceapp/screens/loginScreenEx.dart';
//import 'package:experienceapp/screens/public_messages_forms.dart';
//import 'package:experienceapp/screens/registration_screen.dart';
//import 'package:flutter/cupertino.dart';
//import 'package:flutter/material.dart';
//import 'package:flutter_form_bloc/flutter_form_bloc.dart';
//class ForgetPasswordScreen extends StatelessWidget {
//  const ForgetPasswordScreen({Key? key, required this.title}) : super(key: key);
//  final String title;
//  static final String routeName = "ForgetPassword";
//
//
//  @override
//  Widget build(BuildContext context) {
//    var routeArg = ModalRoute.of(context)!.settings.arguments;
//    return BlocProvider(
//        create: (context) => ForgetPasswordFields(),
//        child: Builder(builder: (context) {
//          var formBloc = BlocProvider.of<ForgetPasswordFields>(context);
//          return Theme(
//            data: Theme.of(context).copyWith(
//              inputDecorationTheme: InputDecorationTheme(
//                border: OutlineInputBorder(
//                  borderRadius: BorderRadius.circular(20),
//                ),
//              ),
//            ),
//            child: Scaffold(
//              // appBar: AppBar(
//              //   title: Text(S.of(context).login),
//              //   centerTitle: true,
//              // ),
//              body: FormBlocListener<ForgetPasswordFields, String, String>(
//                onSubmitting: (context, state) async {
//                  var dataAsJson = state.toJson();
//
//                  if (await AuthController().resetPassword(
//                      dataAsJson['email'],
//                      context: context)) {
//                    Navigator.pushReplacementNamed(context, LogInScreen2.routeName);
//                  }
//                },
//                child: Center(
//                  child: ConstrainedBox(
//                    constraints: BoxConstraints(maxWidth: 600),
//                    child: Padding(
//                      padding: EdgeInsets.all(24.0),
//                      child: SingleChildScrollView(
//                        child: Column(
//                          children: <Widget>[
//                            Text(
//                              S.of(context).login,
//                              style: TextStyle(fontSize: 30),
//                            ),
//                            SizedBox(
//                              height: 10,
//                            ),
//                            TextFieldBlocBuilder(
//                              textFieldBloc: formBloc.email,
//                              decoration: InputDecoration(
//                                labelText: S.of(context).email,
//                                prefixIcon: Icon(Icons.text_fields),
//                              ),
//                            ),
//                            SizedBox(
//                              height: 30,
//                            ),
//                            Row(
//                              children: [
//                                Expanded(
//                                  child: OutlinedButton(
//                                    style: ButtonStyle(
//                                        padding: MaterialStateProperty.all<
//                                            EdgeInsets>(
//                                          EdgeInsets.symmetric(vertical: 25),
//                                        ),
//                                        shape: MaterialStateProperty.all<
//                                            RoundedRectangleBorder>(
//                                            RoundedRectangleBorder(
//                                                borderRadius:
//                                                BorderRadius.circular(20.0),
//                                                side: BorderSide(
//                                                    color: Colors.red)))),
//                                    onPressed: formBloc.submit,
//                                    child: Text(S.of(context).SendResetLink),
//                                  ),
//                                ),
//                              ],
//                            ),
//
//
//                          ],
//                        ),
//                      ),
//                    ),
//                  ),
//                ),
//              ),
//            ),
//          );
//        }));
//  }
//}















//import 'package:experienceapp/generated/l10n.dart';
//import 'package:experienceapp/modules/AuthController.dart';
//import 'package:experienceapp/screens/HomeScreen.dart';
//import 'package:experienceapp/screens/public_messages_forms.dart';
//import 'package:experienceapp/screens/registration_screen.dart';
//import 'package:flutter/cupertino.dart';
//import 'package:flutter/material.dart';
//class ForgetPasswordScreen extends StatefulWidget {
//  const ForgetPasswordScreen({Key? key, required this.title}) : super(key: key);
//  final String title;
//  static final String routeName = "ForgetPassword";
//
//  @override
//  _ForgetPasswordScreenState createState() => _ForgetPasswordScreenState();
//}
//
//class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
//  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
//
//
//
//  @override
//  Widget build(BuildContext context) {
//    var routeArg = ModalRoute.of(context)!.settings.arguments;
//    return  Scaffold(
////          appBar: AppBar(
////
////          ),
//      body: Container(
//          decoration: BoxDecoration(
//            image: DecorationImage(
//              image: AssetImage('assets/images/school1.jpg',),
//              colorFilter: ColorFilter.mode(Colors.black45, BlendMode.darken),
//              fit: BoxFit.cover,
//            ),
//          ),
//          child: LayoutBuilder(
//              builder: (context, constraints ) {
//                double width = constraints.maxWidth;
//                double height = constraints.maxHeight;
//                return Center(
//                    child: Container(
//                      width: width*0.7,
//                      height: height*0.5,
//                      child: Card(
//                        color: Colors.white70,
//                        child: Form(
//                          key: _formKey,
//                          child: Column(
//                            crossAxisAlignment: CrossAxisAlignment.center,
//                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                            children: [
//                              Padding(
//                                padding: const EdgeInsets.all(15),
//                                child: TextFormField(
//                                  decoration: const InputDecoration(
//                                    hintText: "EnterYourEmail",
//                                  ),
//                                  validator: (String? value){
//                                    if(value==null || value.isEmpty){
//                                      return S.of(context).EnterSomeText;
//                                    }
//                                    return null;
//                                  },
//                                ),
//                              ),
//                              Padding(
//                                padding: const EdgeInsets.symmetric(vertical: 16.0),
//                                child: ElevatedButton(
//                                  onPressed: () {
//                                    // Validate will return true if the form is valid, or false if
//                                    // the form is invalid.
//                                    if (_formKey.currentState!.validate()) {
//                                      Navigator.pushNamed(context, MyRegistrationScreen.routeName);
//                                     // AuthController; // Process data.
//                                    }
//                                  },
//                                  child:  Text(S.of(context).resetPassword),
//                                ),
//                              ),
//
//
//                            ],
//                          ),
//                        ),
//                      ),
//
//                    )
//                );
//              }
//          ),
//        ),
//    );
//      }
//}