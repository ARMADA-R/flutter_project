import 'package:experienceapp/generated/l10n.dart';
import 'package:flutter/material.dart';
import '../widgets/mainDrawer.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';

class MySchool extends StatefulWidget {
  const MySchool({Key? key, required this.title}) : super(key: key);
  final String title;
  static final String routeName = 'MySchool';

  @override
  _MySchoolState createState() => _MySchoolState();
}

class _MySchoolState extends State<MySchool> {
  var isExpanded = false;
  var isExpanded1 = false;
  var isExpanded2 = false;
  var isExpanded3 = false;
  var isExpanded4 = false;
  @override
  Widget build(BuildContext context) {
    final routeArg1 = ModalRoute.of(context)!.settings.arguments;

    return Scaffold(
        backgroundColor: Colors.black26,
        appBar: AppBar(
          title: Text(S.of(context).homeScreenTitle),
          centerTitle: true,
          backgroundColor: Colors.black12,
          elevation: 40,
          automaticallyImplyLeading: true,


        ),
        drawer: MainDrawer(),
        
        body:LayoutBuilder(builder:(context, constraints) {
          double width = constraints.maxWidth;
          return SingleChildScrollView (
            child: Column(
              children:<Widget> [
                ImageSlideshow(
                  width: double.infinity,
                  height: 400,
                  initialPage: 0,
                  indicatorColor: Colors.blue,
                  indicatorBackgroundColor: Colors.grey,
                  onPageChanged: (value) {
                    debugPrint('Page changed: $value');
                  },
                  autoPlayInterval: 3000,
                  isLoop: true,
                  children: [
                    Image.asset(
                      'images/school1.jpg',
                      fit: BoxFit.cover,
                    ),
                    Image.asset(
                      'images/school2.jpeg',
                      fit: BoxFit.cover,
                    ),
                    Image.asset(
                      'images/school3.jpg',
                      fit: BoxFit.cover,
                    ),
                  ],
                ),

                Container(
                  margin: EdgeInsets.all(20),
                  color: Colors.transparent,
                  height: 200,
                  width: width,
                  padding: EdgeInsets.all(30),

                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          color: Colors.black12,
                          elevation: 10,
                          child:
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text('خدمات متنوعة',style: TextStyle(fontSize: 25,),),
                                  Text('أنشطة ومناسبات', style: TextStyle(fontSize: 20,)),
                                ],
                              ),
                              Icon(Icons.event, size: 70,)
                            ],
                          ),
                        ),
                        Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          color: Colors.black12,
                          elevation: 10,

                          child:
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text('تتبع أولياء الأمور', style: TextStyle(fontSize: 25,),),
                                  Text('تتبع طفلك وتواصل مع الإداريين', style: TextStyle(fontSize: 20,)),
                                ],),
                              Icon(Icons.format_indent_decrease, size: 70,)
                            ],
                          ),),
                        Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          color: Colors.black12,
                          elevation: 10,
                          child:
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text('تعليم الأطفال', style: TextStyle(fontSize: 25,),),
                                  Text('مناهج حديثة وكوادر مؤهلة', style: TextStyle(fontSize: 20,)),
                                ],),
                              Icon(Icons.highlight_rounded, size: 70,)
                            ],
                          ),),

                      ],
                    ),
                  ),


                Container(
                  margin: EdgeInsets.all(20),
                  padding: EdgeInsets.all(20),
                  height: 250,
                  width: width*0.9,
                  color: Colors.black12,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,

                    children: [
                      ListTile(
                        title: Text('النشأة والتأسيس', textAlign: TextAlign.end, style: TextStyle(fontSize: 30,),),
                        trailing: IconButton(
                          icon: Icon(isExpanded ? Icons.expand_less : Icons.expand_more),
                          onPressed: (){
                            setState(() {
                              isExpanded = !isExpanded;
                            });
                          },
                        ),
                      ),
                      if(isExpanded) Container(
                        height: 50,
                        child: ListView(
                          children: <Widget>[
                            Text('تأسس نظام المبرمجون لإدارة المدارس في عام 2020، على يد نخبة من ذوي الكفاءات لإدارة تجمع من المدارس.',
                              textAlign: TextAlign.end,
                              style: TextStyle(fontSize: 20,),),
                          ],
                        ) ,
                      ),


                      ListTile(
                        title: Text('أهدافنا',textAlign: TextAlign.end, style: TextStyle(fontSize: 30,),),
                        trailing: IconButton(
                          icon: Icon(isExpanded1 ? Icons.expand_less : Icons.expand_more),
                          onPressed: (){
                            setState(() {
                              isExpanded1 = !isExpanded1;
                            });
                          },
                        ),
                      ),
                      if(isExpanded1) Container(height: 50,
                        child: ListView(
                          children: <Widget>[
                            Text('نهدف إلى تحقيق حلقة تواصل بين الأهل والمدرسة لتحقيق أفضل النتائج التي تصب في مصلحة الطلاب في المقام الأول.',
                              textAlign: TextAlign.end,
                              style: TextStyle(fontSize: 20,),),
                          ],
                        ) ,
                      ),



                      ListTile(
                        title: Text('تطلعاتنا',textAlign: TextAlign.end, style: TextStyle(fontSize: 30,),),
                        trailing: IconButton(
                          icon: Icon(isExpanded2 ? Icons.expand_less : Icons.expand_more),
                          onPressed: (){
                            setState(() {
                              isExpanded2 = !isExpanded2;
                            });
                          },
                        ),
                      ),
                      if(isExpanded2) Container(height: 50,
                        child: ListView(
                          children: <Widget>[
                            Text('نتطلع إلى بناء جيل متميز من الطلاب القادرين على رفع سوية المجتمع على جميع الأصعدة العلمية والأدبية والفنية.',
                              textAlign: TextAlign.end,
                              style: TextStyle(fontSize: 20,),),
                          ],
                        ) ,
                      ),

                    ],
                  ),
                ),

                Container(
                  margin: EdgeInsets.all(20),
                  padding: EdgeInsets.all(20),
                  height: 200,
                  width: width*0.9,
                  color: Colors.black12,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text('معلومات التواصل', style: TextStyle(fontSize: 30),),
                      Text(':رقم الجوال', style: TextStyle(fontSize: 20),),
                      SizedBox(height: 10,),
                      Text('0955662256', style: TextStyle(fontSize: 25),),
                    ],
                  ),
                ),

                Container(
                  width: width*0.9,
                  height: 400,
                  margin: EdgeInsets.all(20),
                  color: Colors.black12,
                  child: Form(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text('أرسل رسالة', style: TextStyle(fontSize: 40),),
                          TextFormField(
                            textAlignVertical: TextAlignVertical.center,
                            textAlign: TextAlign.end,
                            decoration: InputDecoration(
                                hintTextDirection: TextDirection.ltr,
                                labelText:'البريد الإلكتروني',
                                focusColor: Colors.black,
                                hoverColor: Colors.black ),
                            keyboardType: TextInputType.emailAddress,
                          ),
                          TextFormField(
                            textAlignVertical: TextAlignVertical.center,
                            textAlign: TextAlign.end,
                            decoration: InputDecoration(
                                hintTextDirection: TextDirection.ltr,
                                labelText:'عنوان الرسالة',
                                focusColor: Colors.black,
                                hoverColor: Colors.black ),
                            keyboardType: TextInputType.emailAddress,
                          ),
                          TextFormField(
                            textAlignVertical: TextAlignVertical.center,
                            textAlign: TextAlign.end,
                            maxLines: 5,
                            decoration: InputDecoration(
                                hintTextDirection: TextDirection.ltr,
                                labelText:'نص الرسالة',
                                focusColor: Colors.black,
                                hoverColor: Colors.black ),
                            keyboardType: TextInputType.multiline,
                          ),
                        ],
                      )),
                ),



                Container(
                  margin: EdgeInsets.all(20),
                  padding: EdgeInsets.all(20),
                  height: 400,
                  width: width*0.9,
                  color: Colors.black12,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,

                    children: [
                      Text('الدعم', style: TextStyle(fontSize: 40),),
                      ListTile(
                        title: Text('خدمة المساعدة عن بعد',textAlign: TextAlign.end, style: TextStyle(fontSize: 30,),),
                        trailing: IconButton(
                          icon: Icon(isExpanded3 ? Icons.expand_less : Icons.expand_more),
                          onPressed: (){
                            setState(() {
                              isExpanded3 = !isExpanded3;
                            });
                          },
                        ),
                      ),
                      if(isExpanded3) Container(height: 50,
                        child: ListView(
                          children: <Widget>[
                            Text('فضلا قم بتحميل البرنامج من الرابط ادناه طريقة تحميل البرنامج من الرابط التالي (انسخ الرابط والصق بالمتصف) https://youtu.be/vqOa2vjRoE0 بعد ظهور صفحة البيانات ارسل البيانات لجوال الدعم الفني 0569533398 وعدم اغلاق البيانات التي تظهر حتي يتم الانتهاء من العمل .',
                              textAlign: TextAlign.end,
                              style: TextStyle(fontSize: 20,),),
                          ],
                        ) ,
                      ),



                      ListTile(
                        title: Text('AnyDisc',textAlign: TextAlign.end, style: TextStyle(fontSize: 30,),),
                        trailing: IconButton(
                          icon: Icon(isExpanded4 ? Icons.expand_less : Icons.expand_more),
                          onPressed: (){
                            setState(() {
                              isExpanded4 = !isExpanded4;
                            });
                          },
                        ),
                      ),
                      if(isExpanded4) Container(height: 50,
                        child: ListView(
                          children: <Widget>[
                            Text('حمل البرنامج من الرابط ادناه سيتم تحميل البرنامج في الاسفل يسار من الشريط قم بالضغط مرتين على الملف ستظهر صفحة وعلى اقصي اليسار رقم مكون من 9 خانات مثل 580905776 ارسل الرقم لجوال الدعم الفني واتس 0569533398 وعدم اغلاق الصفحة حتي انتهاء العمل',
                              textAlign: TextAlign.end,
                              style: TextStyle(fontSize: 20,),),
                          ],
                        ) ,
                      ),

                    ],
                  ),
                ),

              ],
            ),
          );
        }
        ) ,
      );
  }
}