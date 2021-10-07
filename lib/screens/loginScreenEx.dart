import 'package:experienceapp/Forms/LoginFields.dart';
import 'package:experienceapp/Forms/LoginFields.dart';
import 'package:experienceapp/Forms/LoginFields.dart';
import 'package:experienceapp/generated/l10n.dart';
import 'package:experienceapp/modules/AuthController.dart';
import 'package:experienceapp/screens/SchoolExamTable.dart';
import 'package:experienceapp/screens/registration_screen.dart';
import 'package:experienceapp/widgets/Clipper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:url_launcher/url_launcher.dart';

class LogInScreen extends StatelessWidget {
  LogInScreen({Key? key}) : super(key: key);
  static final String routeName = 'LogInScreen2';

  String forgetPasswordLink =
      "https://rafi.nobalaa.com/CodeSchoolSystem/password/forget";

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => LoginFields(),
        child: Builder(builder: (context) {
          var formBloc = BlocProvider.of<LoginFields>(context);
          return Theme(
            data: Theme.of(context).copyWith(
              inputDecorationTheme: InputDecorationTheme(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            child: Scaffold(
              backgroundColor: Colors.blue[100],
              // appBar: AppBar(
              //   title: Text(S.of(context).login),
              //   centerTitle: true,
              // ),
              body: Stack(
                children: [
                  ClipPath(
                      clipper: Clipper(),
                      child: Container(
                        color: Colors.white,
                      )
                  ),
                  FormBlocListener<LoginFields, String, String>(
                    onSubmitting: (context, state) async {
                      var dataAsJson = state.toJson();

                      if (await AuthController().login(
                          dataAsJson['email'], dataAsJson['password'],
                          context: context)) {
                        Navigator.pushNamed(context, SchoolExamsTable.routeName);
                      }
                    },
                    child: StreamBuilder<Object>(
                      stream: null,
                      builder: (context, snapshot) {
                        return Center(
                          child: ConstrainedBox(
                            constraints: BoxConstraints(maxWidth: 600),
                            child: Padding(
                              padding: EdgeInsets.all(24.0),
                              child: SingleChildScrollView(
                                child: Column(
                                  children: <Widget>[
                                    Text(
                                      S.of(context).login,
                                      style: TextStyle(fontSize: 30),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    TextFieldBlocBuilder(
                                      textFieldBloc: formBloc.email,
                                      decoration: InputDecoration(
                                        labelText: S.of(context).email,
                                        prefixIcon: Icon(Icons.text_fields),
                                      ),
                                    ),
                                    TextFieldBlocBuilder(
                                      textFieldBloc: formBloc.password,
                                      suffixButton: SuffixButton.obscureText,
                                      decoration: InputDecoration(
                                        labelText: S.of(context).password,
                                        prefixIcon: Icon(Icons.text_fields),
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        TextButton(
                                            onPressed: () async {
                                              var urllaunchable = await canLaunch(
                                                  forgetPasswordLink); //canLaunch is from url_launcher package
                                              if (urllaunchable) {
                                                await launch(
                                                    forgetPasswordLink); //launch is from url_launcher package to launch URL
                                              } else {
                                                print("URL can't be launched.");
                                              }
                                            },
                                            child: Text(S.of(context).ForgetPassword)),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 30,
                                    ),
                                    Row(
                                      children: [
                                        Expanded(
                                          child: OutlinedButton(
                                            style: ButtonStyle(
                                                padding: MaterialStateProperty.all<
                                                    EdgeInsets>(
                                                  EdgeInsets.symmetric(vertical: 25),
                                                ),
                                                shape: MaterialStateProperty.all<
                                                        RoundedRectangleBorder>(
                                                    RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius.circular(20.0),
                                                        side: BorderSide(
                                                            color: Colors.red)))),
                                            onPressed: formBloc.submit,
                                            child: Text(S.of(context).login),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Align(
                                      alignment: Alignment.bottomCenter,
                                      heightFactor: 4,
                                      child: Row(
                                        children: [
                                          Expanded(
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Text(S.of(context).DontHaveAnAccount),
                                                Row(
                                                  children: [
                                                    TextButton(
                                                      onPressed: () {
                                                        Navigator.pushNamed(
                                                            context,
                                                            MyRegistrationScreen
                                                                .routeName);
                                                      },
                                                      child: Text(
                                                        S.of(context).createAccount,
                                                        softWrap: false,
                                                        textAlign: TextAlign.center,
                                                        overflow: TextOverflow.visible,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      }
                    ),
                  ),
                ],
              ),
            ),
          );
        }));
  }
}
