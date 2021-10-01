import 'package:flutter/material.dart';

class CustomColor extends StatelessWidget {

  MaterialColor backColor = MaterialColor(0xff0d1d31, const <int, Color>{
    50:Color.fromRGBO(13, 29, 49, .1),
    100:Color.fromRGBO(13, 29, 49, .2),
    200:Color.fromRGBO(13, 29, 49, .3),
    300:Color.fromRGBO(13, 29, 49, .4),
    400:Color.fromRGBO(13, 29, 49, .5),
    500:Color.fromRGBO(13, 29, 49, .6),
    600:Color.fromRGBO(13, 29, 49, .7),
    700:Color.fromRGBO(13, 29, 49, .8),
    800:Color.fromRGBO(13, 29, 49, .9),
  },
  );

  MaterialColor swatchColor = MaterialColor(0xff0c0d13, const <int, Color>{
    50: Color.fromRGBO(12, 13, 19, .1),
    100: Color.fromRGBO(12, 13, 19, .2),
    200: Color.fromRGBO(12, 13, 19, .3),
    300: Color.fromRGBO(12, 13, 19, .4),
    400: Color.fromRGBO(12, 13, 19, .5),
    500: Color.fromRGBO(12, 13, 19, .6),
    600: Color.fromRGBO(12, 13, 19, .7),
    700: Color.fromRGBO(12, 13, 19, .8),
    800: Color.fromRGBO(12, 13, 19, .9),
  },
  );
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
