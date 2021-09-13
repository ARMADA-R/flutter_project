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
  String dropdownValue = 'نوع التعليم';
  List lst=['نوع التعليم','نظام عام','تحفيظ','نظام مقررات'];



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
                    Text('إنشاء حساب', style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),

                    Container(
                      width: width*0.6,
                      color: Colors.white30,
                      child: TextFormField(
                        textAlignVertical: TextAlignVertical.center,
                        textAlign: TextAlign.end,
                        decoration: InputDecoration(
                            labelText: 'اسم المدرسة',
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
                    items: <String>['نوع التعليم','نظام عام','تحفيظ','نظام مقررات']
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
                            labelText: 'الرقم الوزاري',
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
                            labelText: 'المدينة',
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
                            labelText: 'المنطقة',
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
                            labelText: 'البريد الإلكتروني',
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
                            labelText: 'كلمة المرور',
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
                            labelText: 'إعادة كلمة المرور',
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
                            labelText: 'الجوال',
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
                        child: Text('إنشاء حساب')),



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
                          child: Text('تسجيل الدخول'),
                          onPressed: () {
                            Navigator.pushNamed(context, LogInScreen.routeName,);
                          },
                        ),
                        Text('هل لديك حساب؟'),

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
                        child: Text('الرئيسية'))
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