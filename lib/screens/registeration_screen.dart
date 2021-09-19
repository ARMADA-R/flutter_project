import 'package:experienceapp/generated/l10n.dart';
import 'package:experienceapp/screens/login_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyRegistrationScreen extends StatefulWidget{
  const MyRegistrationScreen({Key? key, required this.title}) : super(key: key);
  final String title;
  static final String routeName = 'MyRegistrationScreen';

  @override
  _MyRegistrationScreenState createState() => _MyRegistrationScreenState();
}

class _MyRegistrationScreenState extends State<MyRegistrationScreen> {
 String dropdownValue = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:LayoutBuilder(builder:(context, constraints) {
      double width = constraints.maxWidth;
      double height = constraints.maxHeight;

      return Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/school3.jpg',),
            colorFilter: ColorFilter.mode(Colors.black45, BlendMode.darken),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          child: Center(
            child: Container(
              width: width * 0.7,
              height: height,
              margin: EdgeInsets.all(20),
              color: Colors.white60,
              child: Form(

                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,

                  children: [
                    Text(S.of(context).createAccount, style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),

                    Container(
                      width: width*0.6,
                      color: Colors.white30,
                      child: TextFormField(
                        textAlignVertical: TextAlignVertical.center,
                        textAlign: TextAlign.end,
                        decoration: InputDecoration(
                            labelText: S.of(context).schoolName,
                            labelStyle: TextStyle(color: Colors.black),
                            hoverColor: Colors.black),
                        keyboardType: TextInputType.emailAddress,

                      ),
                    ),



                  Container(
                  width: width*0.6,
                  color: Colors.white30,
                  child: DropdownButton<String>(
                    value: dropdownValue,
                    style: const TextStyle(color: Colors.black),
                    onChanged: (String? newValue) {
                      setState(() {
                        dropdownValue = newValue!;
                      });
                    },
                    items: <String>[
                      S.of(context).learningType,
                      S.of(context).generalEducation,
                      S.of(context).memorization,
                      S.of(context).materials,]
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),


                    Container(
                      width: width*0.6,
                      color: Colors.white30,
                      child: TextFormField(
                        textAlignVertical: TextAlignVertical.center,
                        textAlign: TextAlign.end,
                        decoration: InputDecoration(
                            labelText: S.of(context).ministerialNumber,
                            labelStyle: TextStyle(color: Colors.black),
                            hoverColor: Colors.black),
                        keyboardType: TextInputType.emailAddress,

                      ),
                    ),
                    Container(
                      width: width*0.6,
                      color: Colors.white30,
                      child: TextFormField(
                        textAlignVertical: TextAlignVertical.center,
                        textAlign: TextAlign.end,
                        decoration: InputDecoration(
                            labelText: S.of(context).city,
                            labelStyle: TextStyle(color: Colors.black),
                            hoverColor: Colors.black),
                        keyboardType: TextInputType.emailAddress,

                      ),
                    ),
                    Container(
                      width: width*0.6,
                      color: Colors.white30,
                      child: TextFormField(
                        textAlignVertical: TextAlignVertical.center,
                        textAlign: TextAlign.end,
                        decoration: InputDecoration(
                            labelText: S.of(context).area,
                            labelStyle: TextStyle(color: Colors.black),
                            hoverColor: Colors.black),
                        keyboardType: TextInputType.emailAddress,

                      ),
                    ),




                    Container(
                      width: width*0.6,
                      color: Colors.white30,
                      child: TextFormField(
                        textAlignVertical: TextAlignVertical.center,
                        textAlign: TextAlign.end,
                        decoration: InputDecoration(
                            labelText: S.of(context).email,
                            labelStyle: TextStyle(color: Colors.black),
                            hoverColor: Colors.black),
                        keyboardType: TextInputType.emailAddress,

                      ),
                    ),
                    Container(
                      width: width*0.6,
                      color: Colors.white30,
                      child: TextFormField(
                        textAlignVertical: TextAlignVertical.center,
                        textAlign: TextAlign.end,
                        decoration: InputDecoration(
                            labelText: S.of(context).password,
                            labelStyle: TextStyle(color : Colors.black),
                            hoverColor: Colors.black),
                        keyboardType: TextInputType.visiblePassword,
                      ),
                    ),

                    Container(
                      width: width*0.6,
                      color: Colors.white30,
                      child: TextFormField(
                        textAlignVertical: TextAlignVertical.center,
                        textAlign: TextAlign.end,
                        decoration: InputDecoration(
                            labelText:S.of(context).rePassword,
                            labelStyle: TextStyle(color : Colors.black),
                            hoverColor: Colors.black),
                        keyboardType: TextInputType.visiblePassword,
                      ),
                    ),

                    Container(
                      width: width*0.6,
                      color: Colors.white30,
                      child: TextFormField(
                        textAlignVertical: TextAlignVertical.center,
                        textAlign: TextAlign.end,
                        decoration: InputDecoration(
                            labelText: S.of(context).phone,
                            labelStyle: TextStyle(color : Colors.black),
                            hoverColor: Colors.black),
                        keyboardType: TextInputType.number,
                      ),
                    ),

                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Colors.black45,
                            textStyle: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.bold)
                        ),

                        onPressed: (){
                          setState(() {
                        //    Navigator.pop(context);
                          });

                        },
                        child: Text(S.of(context).createAccount,)),



                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              primary: Colors.black45,
                              textStyle: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold)
                          ),
                          child: Text(S.of(context).login),
                          onPressed: () {
                            Navigator.pushNamed(context, LogInScreen.routeName,);
                          },
                        ),
                        Text(S.of(context).doYouHaveAccount),

                      ],
                    ),

                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Colors.black45,
                            textStyle: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.bold)
                        ),

                        onPressed: (){
                          setState(() {
                            Navigator.pop(context);
                          });

                        },
                        child: Text(S.of(context).home))
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    }
    ),

    );
  }
}