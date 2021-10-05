import 'package:flutter/material.dart';
import 'package:secure_chat/Screens/chats.dart';
import 'package:secure_chat/Screens/forgotpassword.dart';
import 'package:secure_chat/Screens/signin.dart';
import 'package:secure_chat/Res/colors.dart';
import 'package:secure_chat/Screens/home.dart';

void main() {
  runApp(MyApp());
}

// rgb(13,29,49)
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  final MaterialColor backcolor = CustomColor().backColor;
  final MaterialColor swatchcolor = CustomColor().swatchColor;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        "signin": (context) => SignIn(),
        "chat": (context) => Chat(),
        "forgotpassword": (context) => ForgotPassword(),
        "home": (context) => Home(),
      },
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: backcolor,
        primarySwatch: swatchcolor,
        shadowColor: Colors.white,
      ),
      home: SignIn(),
    );
  }
}
