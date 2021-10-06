import 'package:experienceapp/generated/l10n.dart';
import 'package:experienceapp/screens/loginScreenEx.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intro_views_flutter/intro_views_flutter.dart';

class IntroScreen extends StatelessWidget {
   IntroScreen({Key? key, required this.title}) : super(key: key);
  final String title;
  static final String routeName = 'IntroScreen';

  final page = [
    PageViewModel(
      pageColor: Colors.black26,
      iconImageAssetPath: 'images/educate-child8.jpg',
      bubbleBackgroundColor: Colors.black26,
      body: Text(
        S().Welcome,
        style: TextStyle(color: Colors.black),
      ),
      title: Text(S().appTitle,
        style: TextStyle(color: Colors.black,),

      ),
      mainImage: Image.asset(
        'images/educate-child8.jpg',
        height: 500.0,
        width: 500.0,
        alignment: Alignment.center,
      ),
//      textStyle: TextStyle(fontFamily: 'MyFont', color: Colors.black),
    ),
    PageViewModel(
      pageColor: Color(0xFFB2EAF2),
      iconImageAssetPath: 'images/educate-child5.jpg',

      bubbleBackgroundColor: Colors.white30,
      body: Text(
             S().followUpYourChildrenAndContactWithManagement,
        style: TextStyle(color: Colors.blueGrey,),

      ),
      title: Text(S().followingUpChildrensEducation,
        style: TextStyle(color: Colors.blueGrey, fontSize: 30,
      ),
      ),
      mainImage: Image.asset(
        'images/educate-child5.jpg',
        height: 500.0,
        width: 500.0,
        alignment: Alignment.center,
      ),
      textStyle: TextStyle(fontFamily: 'MyFont', color: Colors.white),
    ),

    PageViewModel(
      pageColor: Color(0xFFFFE38F),
      // pageColor: Color(0xFFCE93D8),
      iconImageAssetPath: 'images/educate-child6.jpg',
      bubbleBackgroundColor: Colors.black26,
      body: Text(
         S().newCurriculumAndQualifiedStaff,
        style: TextStyle(color: Colors.brown),

      ),
      title: Text(S().childrenseducation,
        style: TextStyle(color: Colors.brown,  fontSize: 30,),


      ),
      mainImage: Image.asset(
        'images/educate-child6.jpg',
        height: 500.0,
        width: 500.0,
        alignment: Alignment.center,
      ),
//      textStyle: TextStyle(fontFamily: 'MyFont', color: Colors.white),
    ),

    PageViewModel(
      pageColor: Color(0xFFE1BEE7),
      iconImageAssetPath: 'images/educate-child7.jpg',
      bubbleBackgroundColor: Colors.black26,
      body: Text(
        S().ActivitiesAndEvents,
        style: TextStyle(color: Colors.blueGrey),

      ),
      title: Text(S().variousServices,
        style: TextStyle(color: Colors.blueGrey,  fontSize: 30,),
      ),
      mainImage: Image.asset(
        'images/educate-child7.jpg',
        height: 500.0,
        width: 500.0,
        alignment: Alignment.center,
      ),
//      textStyle: TextStyle(fontFamily: 'MyFont', color: Colors.white),
    ),



  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Builder(
          builder: (context) => IntroViewsFlutter(
            page,
            showNextButton: true,
            showBackButton: true,
            onTapDoneButton: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => LogInScreen()),
              );
            },
            onTapSkipButton: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => LogInScreen()),
              );
            },
            pageButtonTextStyles: const TextStyle(
              color: Colors.white,
              fontSize: 18.0,
            ),
          ),
        ),
    );
  }
}
//  IntroScreenState createState() => IntroScreenState();


//class IntroScreenState extends State<IntroScreen> {
//  @override
//  Widget build(BuildContext context) {
//    return  Scaffold(
//        body: IntroductionScreen(
//          showDoneButton: true,
//          showSkipButton: true,
//          showNextButton: true,
//          next: Text(S.of(context).Next),
//          skip: Text(S.of(context).Skip),
//          done: Text(S.of(context).Done),
//          onDone: (){
//           Provider.of<AppDeterminants>(context, listen: false).setFirstLunch();
//           Navigator.pushReplacementNamed(context, LogInScreen.routeName,);
//
//          },
//          onSkip: (){
//            Provider.of<AppDeterminants>(context, listen: false).setFirstLunch();
//            Navigator.pushReplacementNamed(context, LogInScreen.routeName,);
//          },
//          pages: [
//            PageViewModel(
//              image: Image.asset('images/school1.jpg', width: 600, height: 600,) ,
//              title: S.of(context).appTitle,
//              body: S.of(context).Welcome,
//              footer: Text(''),
//              decoration: const PageDecoration(
//                pageColor:  Colors.white54,
//                bodyTextStyle: TextStyle(fontSize: 30),
//                titleTextStyle: TextStyle(fontSize: 45),
//              ),
//            ),
//            PageViewModel(
//              image: Image.asset('images/school2.jpeg', width: 600, height: 600,) ,
//              title: S.of(context).followingUpChildrensEducation,
//              body: S.of(context).followUpYourChildrenAndContactWithManagement,
//              footer: Text(''),
//              decoration: const PageDecoration(
//                pageColor:  Colors.white54,
//                bodyTextStyle: TextStyle(fontSize: 30),
//                titleTextStyle: TextStyle(fontSize: 45),
//              ),
//            ),
//
//            PageViewModel(
//              image: Image.asset('images/school3.jpg', width: 600, height: 600,) ,
//              title: S.of(context).childrenseducation,
//              body: S.of(context).newCurriculumAndQualifiedStaff,
//              footer: Text(''),
//              decoration: const PageDecoration(
//                pageColor:  Colors.white54,
//                bodyTextStyle: TextStyle(fontSize: 30),
//                titleTextStyle: TextStyle(fontSize: 45),
//              ),
//            ),
//            PageViewModel(
//              image: Image.asset('images/school4.jpg', width: 600, height: 600,) ,
//              title: S.of(context).variousServices,
//              body: S.of(context).ActivitiesAndEvents,
//
//              footer: Text(''),
//              decoration: const PageDecoration(
//                pageColor:  Colors.white54,
//                bodyTextStyle: TextStyle(fontSize: 30),
//                titleTextStyle: TextStyle(fontSize: 45),
//              ),
//            ),
//          ],
//        ),
//      );
//  }
//}
