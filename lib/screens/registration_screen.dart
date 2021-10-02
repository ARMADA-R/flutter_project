import 'package:experienceapp/Forms/RegistrationFields.dart';
import 'package:experienceapp/generated/l10n.dart';
import 'package:experienceapp/modules/AuthController.dart';
import 'package:experienceapp/screens/Form.dart';
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
                                  S.of(context).createAccount,
                                  style: TextStyle(fontSize: 30),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                TextFieldBlocBuilder(
                                  textFieldBloc: formBloc.city,
                                  decoration: InputDecoration(
                                    labelText: S.of(context).city,
                                    prefixIcon: Icon(Icons.text_fields),
                                  ),
                                ),
                                TextFieldBlocBuilder(
                                  textFieldBloc: formBloc.area,
                                  decoration: InputDecoration(
                                    labelText: S.of(context).area,
                                    prefixIcon: Icon(Icons.text_fields),
                                  ),
                                ),
                                TextFieldBlocBuilder(
                                  textFieldBloc: formBloc.phone,
                                  decoration: InputDecoration(
                                    labelText: S.of(context).phone,
                                    prefixIcon: Icon(Icons.text_fields),
                                  ),
                                ),
                                TextFieldBlocBuilder(
                                  textFieldBloc: formBloc.username,
                                  decoration: InputDecoration(
                                    labelText: S.of(context).username,
                                    prefixIcon: Icon(Icons.text_fields),
                                  ),
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
                                  decoration: InputDecoration(
                                    labelText: S.of(context).password,
                                    prefixIcon: Icon(Icons.text_fields),
                                  ),
                                ),
                                TextFieldBlocBuilder(
                                  textFieldBloc: formBloc.rePassword,
                                  decoration: InputDecoration(
                                    labelText: S.of(context).rePassword,
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
                                        child: Text(S.of(context).createAccount),
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








//    return Scaffold(
//      body: Container(
//            decoration: BoxDecoration(
//              image: DecorationImage(
//                image: AssetImage(
//                  'assets/images/school3.jpg',
//                ),
//                colorFilter: ColorFilter.mode(Colors.black45, BlendMode.darken),
//                fit: BoxFit.cover,
//              ),
//            ),
//            child: LayoutBuilder(
//              builder: (context, constraints) {
//                double width = constraints.maxWidth;
//                double height = constraints.maxHeight;
//                return Center(
//                  child: Container(
//                    width: width*0.7,
//                    color: Colors.white70,
//                    child: SingleChildScrollView(
//                      child: Center(
//                        child: Form(
//                          key: _formKey,
//                          child: Column(
//                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                            children: [
//                              Padding(
//                                padding: EdgeInsets.symmetric(vertical: height * 0.01),
//                                child: Text(
//                                  S.of(context).createAccount,
//                                  style: TextStyle(
//                                      fontSize: 30,
//                                      fontWeight: FontWeight.bold),
//                                ),
//                              ),
//                              Padding(
//                                padding: EdgeInsets.symmetric(
//                                    vertical: height * 0.01,
//                                    horizontal: width * 0.05),
//                                child: TextFormField(
//                                  controller: usernameController,
//                                  decoration: InputDecoration(
//                                    hintText: S.of(context).username,
//                                  ),
//                                  validator: (String? value) {
//                                    if (value == null || value.isEmpty) {
//                                      return S.of(context).ministerialNumber;
//                                    }
//                                    return null;
//                                  },
//                                ),
//                              ),
//                              Padding(
//                                padding: EdgeInsets.symmetric(
//                                    vertical: height * 0.01,
//                                    horizontal: width * 0.05),
//                                child: TextFormField(
//                                  controller: city,
//                                  decoration: InputDecoration(
//                                    hintText: S.of(context).city,
//                                  ),
//                                  validator: (String? value) {
//                                    if (value == null || value.isEmpty) {
//                                      return S.of(context).EnterSomeText;
//                                    }
//                                    return null;
//                                  },
//                                ),
//                              ),
//                              Padding(
//                                padding: EdgeInsets.symmetric(
//                                    vertical: height * 0.01,
//                                    horizontal: width * 0.05),
//                                child: TextFormField(
//                                  controller: area,
//                                  decoration: InputDecoration(
//                                    hintText: S
//                                        .of(context)
//                                        .area,
//                                  ),
//                                  validator: (String? value) {
//                                    if (value == null || value.isEmpty) {
//                                      return S
//                                          .of(context)
//                                          .EnterSomeText;
//                                    }
//                                    return null;
//                                  },
//                                ),
//                              ),
//                              Padding(
//                                padding: EdgeInsets.symmetric(
//                                    vertical: height * 0.01,
//                                    horizontal: width * 0.05),
//                                child: TextFormField(
//                                  controller: emailController,
//                                  decoration: InputDecoration(
//                                    hintText: S
//                                        .of(context)
//                                        .EnterYourEmail,
//                                  ),
//                                  validator: (String? value) {
//                                    if (value == null || value.isEmpty) {
//                                      return S
//                                          .of(context)
//                                          .EnterSomeText;
//                                    }
//                                    return null;
//                                  },
//                                ),
//                              ),
//                              Padding(
//                                padding: EdgeInsets.symmetric(
//                                    vertical: height * 0.01,
//                                    horizontal: width * 0.05),
//                                child: TextFormField(
//                                  controller: passwordController,
//                                  decoration: InputDecoration(
//                                    hintText: S
//                                        .of(context)
//                                        .password,
//                                  ),
//                                  validator: (String? value) {
//                                    if (value == null || value.isEmpty) {
//                                      return S
//                                          .of(context)
//                                          .EnterSomeText;
//                                    }
//                                    return null;
//                                  },
//                                ),
//                              ),
//                              Padding(
//                                padding: EdgeInsets.symmetric(
//                                    vertical: height * 0.01,
//                                    horizontal: width * 0.05),
//                                child: TextFormField(
//                                  controller: re_passwordController,
//                                  decoration: InputDecoration(
//                                    hintText: S
//                                        .of(context)
//                                        .rePassword,
//                                  ),
//                                  validator: (String? value) {
//                                    if (value == null || value.isEmpty) {
//                                      return S
//                                          .of(context)
//                                          .EnterSomeText;
//                                    }else if(re_passwordController.text != passwordController.text){
//                                      return S
//                                          .of(context)
//                                          .passAndRePAssDontMatch;
//                                    }
//                                    return null;
//                                  },
//                                ),
//                              ),
//                              Padding(
//                                padding: EdgeInsets.symmetric(
//                                    vertical: height * 0.01,
//                                    horizontal: width * 0.05),
//                                child: TextFormField(
//                                  controller: phone,
//                                  decoration: InputDecoration(
//                                    hintText: S
//                                        .of(context)
//                                        .phone,
//                                  ),
//                                  validator: (String? value) {
//                                    if (value == null || value.isEmpty) {
//                                      return S
//                                          .of(context)
//                                          .EnterSomeText;
//                                    }
//                                    return null;
//                                  },
//                                ),
//                              ),
//                              Padding(
//                                padding: EdgeInsets.symmetric(
//                                    vertical: height * 0.01,
//                                    horizontal: width * 0.05),
//                                child: ElevatedButton(
//                                  onPressed: () async {
//                                    // Validate will return true if the form is valid, or false if
//                                    // the form is invalid.
//                                    if (_formKey.currentState!.validate()) {
//                                          if(await AuthController().register(
//                                              city: city.text, area: area.text,
//                                              phone: phone.text,
//                                              email: emailController.text,
//                                              password: passwordController.text,
//                                              user_name: usernameController.text,
//                                              re_password: re_passwordController.text,
//                                          context: context)){
//                                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//                                             content: Text('Account created'))
//                                            );
//                                          }
//                                    }
//                                  },
//                                  child: Text(S.of(context).createAccount),
//                                ),
//                              ),
//                              Padding(
//                                padding: EdgeInsets.symmetric(
//                                    vertical: height * 0.01,
//                                    horizontal: width * 0.05),
//                                child: Row(
//                                  mainAxisAlignment: MainAxisAlignment.center,
//                                  children: [
//                                    ElevatedButton(
//                                      style: ElevatedButton.styleFrom(
//                                          primary: Colors.black45,
//                                          textStyle: TextStyle(
//                                              fontSize: 20,
//                                              fontWeight: FontWeight.bold)),
//                                      child: Text(S.of(context).login),
//                                      onPressed: () {
//                                        Navigator.pushNamed(context, LogInScreen2.routeName);
////
//                                      },
//                                    ),
//                                    Text(S
//                                        .of(context)
//                                        .doYouHaveAccount),
//                                  ],
//                                ),
//                              ),
//                              ElevatedButton(
//                                  style: ElevatedButton.styleFrom(
//                                      primary: Colors.black45,
//                                      textStyle: TextStyle(
//                                          fontSize: 17,
//                                          fontWeight: FontWeight.bold)),
//                                  onPressed: () {
//                                    setState(() {
//                                      Navigator.pushNamed(context, UserForm.routeName);
//                                    });
//                                  },
//                                  child: Text(S.of(context).home))
//                            ],
//                          ),
//                        ),
//                      ),
//                    ),
//                  ),
//
//                )
//               ;
//              }
//            )
//          ),
//          );
        }
  }


//LayoutBuilder(builder:(context, constraints) {
//double width = constraints.maxWidth;
//double height = constraints.maxHeight;
//
//return
