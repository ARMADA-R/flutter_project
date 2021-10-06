
import 'package:flutter/material.dart';

class PagesBackground extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constrains) {
      return Opacity(
        opacity: 0.1,
        child: Container(
          child: Center(
            child: Icon(
              Icons.school,
              color: Colors.blue[300],
              size: constrains.maxWidth * 0.6,
            ),
          ),
        ),
      );
    });
  }

}