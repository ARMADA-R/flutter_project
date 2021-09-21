import 'package:experienceapp/generated/l10n.dart';
import 'package:experienceapp/modules/AuthController.dart';
import 'package:experienceapp/screens/forgetPassword.dart';
import 'package:flutter/material.dart';
import '';
class UserForm extends StatefulWidget {
  const UserForm({Key? key, required this.title}) : super(key: key);
  final String title;
  static final String routeName = 'UserForm';

  @override
  _UserFormState createState() => _UserFormState();
}

class _UserFormState extends State<UserForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String dropdownValue= 'hello';

  @override
  Widget build(BuildContext context) {
    var routeArg = ModalRoute.of(context)!.settings.arguments;
    return  Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/school1.jpg',),
            colorFilter: ColorFilter.mode(Colors.black45, BlendMode.darken),
            fit: BoxFit.cover,
          ),
        ),
        child:LayoutBuilder(
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
                              padding: EdgeInsets.symmetric(vertical: height * 0.01,horizontal: width*0.08),
                              child: TextFormField(
                                decoration: const InputDecoration(
                                  hintText: "TheAddress",
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
                              padding: EdgeInsets.symmetric(vertical: height * 0.01,horizontal: width*0.08),
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
                                    S.of(context).TypeOfSending,
                                    S.of(context).TextMessage,
                                    S.of(context).WhatsApp,
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
                              padding: EdgeInsets.symmetric(vertical: height * 0.01,horizontal: width*0.08),
                              child: TextFormField(
                                textAlignVertical: TextAlignVertical.center,
                                maxLines: 5,
                                decoration: InputDecoration(
                                   hintText: S.of(context).Content, focusColor: Colors.black,
                                     ),
                                keyboardType: TextInputType.multiline,
                              ),
                            ),

                            Padding(
                              padding: EdgeInsets.symmetric(vertical: height * 0.01,horizontal: width*0.08),
                              child: ElevatedButton(
                                onPressed: () {
                                  // Validate will return true if the form is valid, or false if
                                  // the form is invalid.
                                  if (_formKey.currentState!.validate()) {
                                    AuthController; // Process data.
                                  }
                                },
                                child:  Text(S.of(context).Save),
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
