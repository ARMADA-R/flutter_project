import 'package:experienceapp/generated/l10n.dart';
import 'package:experienceapp/modules/app_determinants.dart';
import 'package:experienceapp/screens/loginScreenEx.dart';
import 'package:flutter/cupertino.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class IntroScreen extends StatefulWidget {
  const IntroScreen({Key? key, required this.title}) : super(key: key);
  final String title;
  static final String routeName = 'IntroScreen';


  @override
  IntroScreenState createState() => IntroScreenState();
}

class IntroScreenState extends State<IntroScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        body: IntroductionScreen(
          showDoneButton: true,
          showSkipButton: true,
          showNextButton: true,
          next: Text(S.of(context).Next),
          skip: Text(S.of(context).Skip),
          done: Text(S.of(context).Done),
          onDone: (){
           Provider.of<AppDeterminants>(context, listen: false).setFirstLunch();
           Navigator.pushReplacementNamed(context, LogInScreen.routeName,);

          },
          onSkip: (){
            Provider.of<AppDeterminants>(context, listen: false).setFirstLunch();
            Navigator.pushReplacementNamed(context, LogInScreen.routeName,);
          },
          pages: [
            PageViewModel(
              image: Image.asset('images/school1.jpg', width: 600, height: 600,) ,
              title: S.of(context).appTitle,
              body: S.of(context).Welcome,
              footer: Text(''),
              decoration: const PageDecoration(
                pageColor:  Colors.white54,
                bodyTextStyle: TextStyle(fontSize: 30),
                titleTextStyle: TextStyle(fontSize: 45),
              ),
            ),
            PageViewModel(
              image: Image.asset('images/school2.jpeg', width: 600, height: 600,) ,
              title: S.of(context).followingUpChildrensEducation,
              body: S.of(context).followUpYourChildrenAndContactWithManagement,
              footer: Text(''),
              decoration: const PageDecoration(
                pageColor:  Colors.white54,
                bodyTextStyle: TextStyle(fontSize: 30),
                titleTextStyle: TextStyle(fontSize: 45),
              ),
            ),

            PageViewModel(
              image: Image.asset('images/school3.jpg', width: 600, height: 600,) ,
              title: S.of(context).childrenseducation,
              body: S.of(context).newCurriculumAndQualifiedStaff,
              footer: Text(''),
              decoration: const PageDecoration(
                pageColor:  Colors.white54,
                bodyTextStyle: TextStyle(fontSize: 30),
                titleTextStyle: TextStyle(fontSize: 45),
              ),
            ),
            PageViewModel(
              image: Image.asset('images/school4.jpg', width: 600, height: 600,) ,
              title: S.of(context).variousServices,
              body: S.of(context).ActivitiesAndEvents,

              footer: Text(''),
              decoration: const PageDecoration(
                pageColor:  Colors.white54,
                bodyTextStyle: TextStyle(fontSize: 30),
                titleTextStyle: TextStyle(fontSize: 45),
              ),
            ),
          ],
        ),
      );
  }
}
