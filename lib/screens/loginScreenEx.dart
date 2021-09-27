import 'package:experienceapp/generated/l10n.dart';
import 'package:experienceapp/modules/AuthController.dart';
import 'package:experienceapp/screens/SchoolExamTable.dart';
import 'package:experienceapp/screens/forgetPassword.dart';
import 'package:experienceapp/screens/registration_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';

class AllFieldsFormBloc extends FormBloc<String, String> {
  final email = TextFieldBloc();
  final passWord = TextFieldBloc();

  AllFieldsFormBloc() {
    addFieldBlocs(fieldBlocs: [
      email,
      passWord,
    ]);
  }
  @override
  void onSubmitting() async {
    try {
      await Future<void>.delayed(Duration(milliseconds: 500));
      emitSuccess(canSubmitAgain: true);
    } catch (e) {
      emitFailure();
    }
  }
}

class LogInScreen2 extends StatefulWidget {
  const LogInScreen2({Key? key, required this.title}) : super(key: key);
  final String title;
  static final String routeName = 'LogInScreen2';

  @override
  _LogInScreen2State createState() => _LogInScreen2State();
}

class _LogInScreen2State extends State<LogInScreen2> {
  var formBloc;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => AllFieldsFormBloc(),
        child: Builder(builder: (context) {
          formBloc = formBloc ??BlocProvider.of<AllFieldsFormBloc>(context);
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
                  centerTitle: true,),
//              floatingActionButton: FloatingActionButton.extended(
//                  onPressed: formBloc.submit, label: Text('submit')),
              body: FormBlocListener<AllFieldsFormBloc, String, String>(
                onSubmitting: (context, state) async {
                  if (_formKey.currentState!.validate()) {
                    if (await AuthController().login(
                      emailController.text,
                      passwordController.text,
                      context: context,
                    )) {
                      Navigator.pushNamed(context, SchoolExamsTable.routeName);
                    }
                  }
                },
                onSuccess: (context, state) {
//                        LoadingDialog.hide(context);

//                        Navigator.of(context).pushReplacement(
//                        MaterialPageRoute(builder: (_) => SuccessScreen()));
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
                        textFieldBloc: formBloc.passWord,
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
                                          side: BorderSide(
                                              color: Colors.red)))),
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
