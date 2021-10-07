import 'package:experienceapp/Forms/RegistrationFields.dart';
import 'package:experienceapp/generated/l10n.dart';
import 'package:experienceapp/modules/AuthController.dart';
import 'package:experienceapp/screens/loginScreenEx.dart';
import 'package:experienceapp/widgets/Clipper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';

class MyRegistrationScreen extends StatefulWidget {
  const MyRegistrationScreen({Key? key, required this.title}) : super(key: key);
  final String title;
  static final String routeName = 'RegistrationScreen';

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
    return BlocProvider(
        create: (context) => RegistrationFields(),
        child: Builder(builder: (context) {
          var formBloc = BlocProvider.of<RegistrationFields>(context);
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
                backgroundColor: Colors.white,
                elevation: 0,
                automaticallyImplyLeading: true,
                leading: BackButton(color: Colors.black26,),
              ),
              backgroundColor: Colors.blue[100],
              body: Stack(
                children: [
                  ClipPath(
                      clipper: Clipper(),
                      child: Container(
                        color: Colors.white,
                      )
                  ),
                  FormBlocListener<RegistrationFields, String, String>(
                    onSubmitting: (context, state) async {
                      var dataAsJson = state.toJson();

                      if (await AuthController().register(
                          city: dataAsJson["city"],
                          area: dataAsJson["area"],
                          phone: dataAsJson["phone"],
                          user_name: dataAsJson["username"],
                          email: dataAsJson["email"],
                          password: dataAsJson["password"],
                          re_password: dataAsJson["rePassword"],
                          context: context)) {
//                    Navigator.pushNamed(context, .routeName);
                      }
                    },
                    child: Center(
                      child: ConstrainedBox(
                        constraints: BoxConstraints(maxWidth: 600),
                        child: Padding(
                          padding: EdgeInsets.all(24.0),
                          child: SingleChildScrollView(
                            child: Column(
                              children: <Widget>[
                                Text(
                                  S
                                      .of(context)
                                      .createAccount,
                                  style: TextStyle(fontSize: 30),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                TextFieldBlocBuilder(
                                  textFieldBloc: formBloc.city,
                                  decoration: InputDecoration(
                                    labelText: S
                                        .of(context)
                                        .city,
                                    prefixIcon: Icon(Icons.text_fields),
                                  ),
                                ),
                                TextFieldBlocBuilder(
                                  textFieldBloc: formBloc.area,
                                  decoration: InputDecoration(
                                    labelText: S
                                        .of(context)
                                        .area,
                                    prefixIcon: Icon(Icons.text_fields),
                                  ),
                                ),
                                TextFieldBlocBuilder(
                                  textFieldBloc: formBloc.phone,
                                  decoration: InputDecoration(
                                    labelText: S
                                        .of(context)
                                        .phone,
                                    prefixIcon: Icon(Icons.text_fields),
                                  ),
                                ),
                                TextFieldBlocBuilder(
                                  textFieldBloc: formBloc.username,
                                  decoration: InputDecoration(
                                    labelText: S
                                        .of(context)
                                        .username,
                                    prefixIcon: Icon(Icons.text_fields),
                                  ),
                                ),
                                TextFieldBlocBuilder(
                                  textFieldBloc: formBloc.email,
                                  decoration: InputDecoration(
                                    labelText: S
                                        .of(context)
                                        .email,
                                    prefixIcon: Icon(Icons.text_fields),
                                  ),
                                ),
                                TextFieldBlocBuilder(
                                  textFieldBloc: formBloc.password,
                                  suffixButton: SuffixButton.obscureText,
                                  decoration: InputDecoration(
                                    labelText: S
                                        .of(context)
                                        .password,
                                    prefixIcon: Icon(Icons.text_fields),
                                  ),
                                ),
                                TextFieldBlocBuilder(
                                  textFieldBloc: formBloc.rePassword,
                                  suffixButton: SuffixButton.obscureText,
                                  decoration: InputDecoration(
                                    labelText: S
                                        .of(context)
                                        .rePassword,
                                    prefixIcon: Icon(Icons.text_fields),
                                  ),
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      child: OutlinedButton(
                                        style: ButtonStyle(
                                            padding:
                                            MaterialStateProperty.all<
                                                EdgeInsets>(
                                              EdgeInsets.symmetric(
                                                  vertical: 25),
                                            ),
                                            shape: MaterialStateProperty.all<
                                                RoundedRectangleBorder>(
                                                RoundedRectangleBorder(
                                                    borderRadius:
                                                    BorderRadius.circular(20.0),
                                                    side: BorderSide(
                                                        color: Colors.red)))),
                                        onPressed: formBloc.submit,
                                        child: Text(S
                                            .of(context)
                                            .createAccount),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        }));
  }
}
