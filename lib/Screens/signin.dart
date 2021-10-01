import 'package:flutter/material.dart';
import 'package:secure_chat/Res/colors.dart';
import 'package:http/http.dart' as http;

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  MaterialColor btnColor = CustomColor().backColor;
  TextEditingController nameController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  TextEditingController signupmailController = TextEditingController();
  TextEditingController signuppasswdController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    nameController.addListener(() {});
    numberController.addListener(() {});
    signuppasswdController.addListener(() {});
    signupmailController.addListener(() {});
  }

  void _onButtonPressed() {
    showModalBottomSheet(
        backgroundColor: Color.fromRGBO(13, 29, 49, 1),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
        isScrollControlled: true,
        context: context,
        builder: (context) {
          return Container(
              padding: EdgeInsets.symmetric(horizontal: 25),
              child: SingleChildScrollView(
                child: Column(
                  // mainAxisSize: MainAxisSize.max,
                  children: [
                    SizedBox(
                      height: 25,
                    ),
                    Text(
                      "Registration",
                      style: TextStyle(
                          color: Colors.white70,
                          decorationColor: Colors.white,
                          fontSize: 30),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: "Name ",
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white54)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white54)),
                        hintStyle: TextStyle(color: Colors.white54),
                        prefixIcon: Icon(
                          Icons.person_outline,
                          color: Colors.white70,
                        ),
                      ),
                      style: TextStyle(color: Color(0xfffafafa)),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: "Email",
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white54)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white54)),
                        hintStyle: TextStyle(color: Colors.white54),
                        prefixIcon: Icon(
                          Icons.mail_outline_rounded,
                          color: Colors.white70,
                        ),
                      ),
                      style: TextStyle(color: Color(0xfffafafa)),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: "Number",
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white54)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white54)),
                        hintStyle: TextStyle(color: Colors.white54),
                        prefixIcon: Icon(
                          Icons.call,
                          color: Colors.white70,
                        ),
                      ),
                      style: TextStyle(color: Color(0xfffafafa)),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    // Row(children: [
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: "Password",
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white54)),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white54)),
                        hintStyle: TextStyle(color: Colors.white54),
                        prefixIcon: Icon(
                          Icons.lock_outline_rounded,
                          color: Colors.white70,
                        ),
                      ),
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: true,
                      style: TextStyle(color: Color(0xfffafafa)),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    GestureDetector(
                      onTap: () {
                        Uri url = Uri.parse("http://127.0.0.1:8000/register/");
                        http.post(url, headers: {
                          "name": nameController.text,
                          "email": signupmailController.text,
                          "number": numberController.text,
                          "passwd": signuppasswdController.text,
                        });
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 20),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Color.fromRGBO(38, 55, 89, 1)),
                        alignment: Alignment.center,
                        child: Text(
                          "SignUp ",
                          style: TextStyle(
                            fontSize: 24,
                            color: Color(0xffffffff),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Divider(color: Colors.white54),
                    SizedBox(
                      height: 8,
                    ),
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                      Text("Already have an account?  ",
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 18,
                          )),
                      GestureDetector(
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                          child: Text(
                            "Login",
                            style: TextStyle(
                                color: Colors.white70,
                                decoration: TextDecoration.underline,
                                decorationColor: Colors.white,
                                fontSize: 16),
                          ))
                    ]),
                    SizedBox(
                      height: 30,
                    )
                  ],
                ),
              ));
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Chat Seguro"),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 65,
              ),
              Container(
                  height: 150,
                  width: 150,
                  decoration: BoxDecoration(),
                  child: Image.asset("assets/login.png")),
              SizedBox(
                height: 65,
              ),
              TextFormField(
                decoration: InputDecoration(
                  hintText: "Email",
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white54)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white54)),
                  hintStyle: TextStyle(color: Colors.white54),
                  prefixIcon: Icon(
                    Icons.person_outline,
                    color: Colors.white70,
                  ),
                ),
                style: TextStyle(color: Color(0xfffafafa)),
              ),
              SizedBox(
                height: 20,
              ),
              // Row(children: [
              TextFormField(
                decoration: InputDecoration(
                  hintText: "Password",
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white54)),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white54)),
                  hintStyle: TextStyle(color: Colors.white54),
                  prefixIcon: Icon(
                    Icons.lock_outline_rounded,
                    color: Colors.white70,
                  ),
                ),
                obscureText: true,
                style: TextStyle(color: Color(0xfffafafa)),
              ),
              SizedBox(
                height: 15,
              ),
              GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, "forgotpassword");
                  },
                  child:
                      Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                    Text(
                      "Forgot Password?",
                      style: TextStyle(
                          color: Colors.white70,
                          fontSize: 16,
                          decoration: TextDecoration.underline,
                          fontStyle: FontStyle.italic),
                    )
                  ])),
              SizedBox(
                height: 30,
              ),
              Container(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Color.fromRGBO(38, 55, 89, 1)),
                  alignment: Alignment.center,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Login ",
                          style: TextStyle(
                            fontSize: 24,
                            color: Color(0xffffffff),
                          ),
                        ),
                        Icon(
                          Icons.login,
                          color: Color(0xffffffff),
                        ),
                      ])),
              SizedBox(
                height: 20,
              ),
              Divider(
                color: Colors.white54,
              ),
              SizedBox(
                height: 8,
              ),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Text("Don't have an account?  ",
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 18,
                    )),
                GestureDetector(
                    onTap: () {
                      Navigator.pushReplacementNamed(context, "home");
                      // _onButtonPressed();
                    },
                    child: Text(
                      "Sign Up",
                      style: TextStyle(
                          color: Colors.white70,
                          decoration: TextDecoration.underline,
                          decorationColor: Colors.white,
                          fontSize: 16),
                    ))
              ]),
              SizedBox(
                height: 20,
              )
            ],
          ),
        ),
      ),
    );
  }
}
