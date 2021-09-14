import 'package:flutter/cupertino.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:flutter/material.dart';


class IntroScreen extends StatefulWidget {
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
        next: Text('Next'),
        skip: Text('Skip'),
        done: Text('Done'),
        onDone: (){

        },
        onSkip: (){

        },
         pages: [
           PageViewModel(
             image: Image.asset('images/school1.jpg') ,
             title: 'SMS',
             body: 'Welcome',
             footer: Text('fsd'),
             decoration: const PageDecoration(
               pageColor:  Colors.black26,
             ),
           ),
           PageViewModel(
             image: Image.asset('images/school2.jpg') ,
             title: 'SMS',
             body: 'Welcome',
             footer: Text('fsd'),
             decoration: const PageDecoration(
               pageColor:  Colors.black26,
             ),
           ),

         ],
      ),
    );
  }
}
