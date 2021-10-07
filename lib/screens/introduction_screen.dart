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
    return Scaffold(
      body: IntroductionScreen(
        showDoneButton: true,
        showSkipButton: true,
        showNextButton: true,
        globalBackgroundColor: Color(0xfff5f5f5),
        next: Text(S.of(context).Next),
        skip: Text(S.of(context).Skip),
        done: Text(S.of(context).Done),
        onDone: () {
          Provider.of<AppDeterminants>(context, listen: false).setFirstLunch();
          Navigator.pushReplacementNamed(
            context,
            LogInScreen.routeName,
          );
        },
        onSkip: () {
          Provider.of<AppDeterminants>(context, listen: false).setFirstLunch();
          Navigator.pushReplacementNamed(
            context,
            LogInScreen.routeName,
          );
        },
        pages: [
          PageViewModel(
            bodyWidget: ConstrainedBox(
              constraints: BoxConstraints(minHeight: 380),
              child: Container(
                child: Image.asset(
                  'assets/images/new/sch10.png',
                  fit: BoxFit.fitHeight,
                ),
              ),
            ),
            title: '',
            footer: Center(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                    S.of(context).appTitle,
                    style: TextStyle(fontSize: 45),
                  ),
                  Text(
                    'منصة تواصل اولياء الامور والمدارس',
//                    S.of(context).Welcome,
                    style: TextStyle(
                      fontSize: 30,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
          PageViewModel(
            bodyWidget: ConstrainedBox(
              constraints: BoxConstraints(minHeight: 380),
              child: Container(
                child: Image.asset(
                  'assets/images/new/sch1.jpg',
                  fit: BoxFit.fitHeight,
                ),
              ),
            ),
            title: '',
            footer: Center(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                    'تتبع أولياء الأمور',
                    style: TextStyle(fontSize: 45),
                  ),
                  Text(
                    'تتبع طفلك وتواصل مع الإداريين',
//                    S.of(context).Welcome,
                    style: TextStyle(
                      fontSize: 30,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),

          PageViewModel(
            bodyWidget: ConstrainedBox(
              constraints: BoxConstraints(minHeight: 380),
              child: Container(
                child: Image.asset(
                  'assets/images/new/sch7.png',
                  fit: BoxFit.contain,
                ),
              ),
            ),
            title: '',
            footer: Container(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      'تعليم الأطفال',
                      style: TextStyle(fontSize: 45),
                    ),
                    Text(
                      'مناهج حديثة وكوادر مؤهلة',
//                    S.of(context).Welcome,
                      style: TextStyle(
                        fontSize: 30,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
          ),
          PageViewModel(
            bodyWidget: LayoutBuilder(builder: (context, constrains) {
              return ConstrainedBox(
                constraints: BoxConstraints(minHeight: 380),
                child: Container(
                  child: Image.asset(
                    'assets/images/new/sch11.png',
                    fit: BoxFit.contain,
                  ),
                ),
              );
            }),
            title: '',
            footer: Center(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                    'خدمات متنوعة',
                    style: TextStyle(fontSize: 45),
                  ),
                  Text(
                    'أنشطة ومناسبات',
                    style: TextStyle(
                      fontSize: 30,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
//
        ],
      ),
    );
  }
}
