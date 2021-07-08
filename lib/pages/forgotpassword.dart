import 'package:flutter/material.dart';
import 'package:template/pages/mainpage.dart';
import 'package:template/pages/signin.dart';
import 'package:template/pages/signup.dart';
import '../main.dart';

class ForgotPasswordPage extends StatefulWidget {
  ForgotPasswordPage({Key? key}) : super(key: key);

  @override
  _ForgotPasswordPageState createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: MainPage(
        appBarButtons: Row(
          children: [
            MaterialButton(
              onPressed: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => HomePage()));
              },
              child: Text(
                "Home",
                style: TextStyle(color: Colors.white),
              ),
              hoverColor: Colors.transparent,
              focusColor: Colors.transparent,
              highlightColor: Colors.transparent,
              splashColor: Colors.transparent,
              enableFeedback: false,
            ),
            Spacer(),
            Material(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)),
              child: MaterialButton(
                onPressed: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => SigninPage()));
                },
                child: Text(
                  "Signin",
                  style: TextStyle(color: Color.fromRGBO(56, 103, 214, 1.0)),
                ),
                hoverColor: Colors.transparent,
                focusColor: Colors.transparent,
                highlightColor: Colors.transparent,
                splashColor: Colors.transparent,
                enableFeedback: false,
              ),
            ),
            MaterialButton(
              onPressed: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => SignupPage()));
              },
              child: Text(
                "Signup",
                style: TextStyle(color: Colors.white),
              ),
              hoverColor: Colors.transparent,
              focusColor: Colors.transparent,
              highlightColor: Colors.transparent,
              splashColor: Colors.transparent,
              enableFeedback: false,
            ),
          ],
        ),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 120.0),
              width: 400,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(26),
                color: Colors.white,
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: 50,
                  ),
                  SizedBox(
                    width: 300,
                    child: TextFormField(
                        controller: emailController,
                        style:
                            TextStyle(color: Color.fromRGBO(56, 103, 214, 1.0)),
                        decoration: InputDecoration(
                          labelText: 'E-mail',
                          labelStyle: TextStyle(
                              color: Color.fromRGBO(56, 103, 214, 1.0)),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: const BorderRadius.all(
                              const Radius.circular(30.0),
                            ),
                            borderSide: BorderSide(
                                color: Color.fromRGBO(56, 103, 214, 1.0)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: const BorderRadius.all(
                              const Radius.circular(30.0),
                            ),
                            borderSide: BorderSide(
                                color: Color.fromRGBO(56, 103, 214, 1.0)),
                          ),
                        )),
                  ),
                  SizedBox(height: 10.0),
                  SizedBox(
                      height: 50.0,
                      width: 300,
                      child: TextButton(
                        onPressed: () async {
                          // send email to change password
                        },
                        child: Text("Send E-mail",
                            style: TextStyle(color: Colors.white)),
                        style: ElevatedButton.styleFrom(
                            primary: Color.fromRGBO(56, 103, 214, 1.0),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(32.0),
                            )),
                      )),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
