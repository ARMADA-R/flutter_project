import 'package:experienceapp/Forms/LoginFields.dart';
import 'package:experienceapp/Forms/LoginFields.dart';
import 'package:experienceapp/Forms/LoginFields.dart';
import 'package:experienceapp/generated/l10n.dart';
import 'package:experienceapp/modules/AuthController.dart';
import 'package:experienceapp/screens/SchoolExamTable.dart';
import 'package:experienceapp/screens/forgetPassword.dart';
import 'package:experienceapp/screens/registration_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';

class LogInScreen2 extends StatelessWidget {
  const LogInScreen2({Key? key}) : super(key: key);
  static final String routeName = 'LogInScreen2';


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
              appBar: AppBar(
                title: Text(S.of(context).login),
                centerTitle: true,
              ),
              body: FormBlocListener<LoginFields, String, String>(
                onSubmitting: (context, state) async {
                  var dataAsJson = state.toJson();

                  if (await AuthController().login(
                      dataAsJson['email'], dataAsJson['password'],
                      context: context)) {
                    Navigator.pushNamed(context, SchoolExamsTable.routeName);
                  }
                },
                child: Padding(
                  padding: EdgeInsets.all(24.0),
                  child: Column(
                    children: <Widget>[
                      TextFieldBlocBuilder(
                        textFieldBloc: formBloc.email,
                        decoration: InputDecoration(
                          labelText: 'Your Email',
                          prefixIcon: Icon(Icons.text_fields),
                        ),
                      ),
                      TextFieldBlocBuilder(
                        textFieldBloc: formBloc.password,
                        decoration: InputDecoration(
                          labelText: 'Your Password',
                          prefixIcon: Icon(Icons.text_fields),
                        ),
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: OutlinedButton(
                              style: ButtonStyle(
                                  padding:
                                      MaterialStateProperty.all<EdgeInsets>(
                                    EdgeInsets.symmetric(vertical: 25),
                                  ),
                                  shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20.0),
                                          side:
                                              BorderSide(color: Colors.red)))),
                              onPressed: formBloc.submit,
                              child: Text(S.of(context).login),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        }));
  }
}
