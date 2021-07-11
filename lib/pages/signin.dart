import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:template/authentication/auth.dart';
import 'package:template/pages/forgotpassword.dart';
import 'package:template/pages/mainpage.dart';
import 'package:template/pages/signup.dart';
import 'package:template/constants.dart';
import '../main.dart';

class SigninPage extends StatefulWidget {
  @override
  SigninPageState createState() => SigninPageState();
}

class SigninPageState extends State<SigninPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  String errorMessage = "";

  @override
  Widget build(BuildContext context) {
    return MainPage(
      appBarButtons: Row(
        children: [
          MaterialButton(
            onPressed: () {
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (context) => HomePage()));
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
        children: <Widget>[
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
                Text(
                  errorMessage,
                  style: TextStyle(color: Color.fromRGBO(235, 59, 90, 1.0)),
                ),
                SizedBox(
                  height: 30,
                ),
                SizedBox(
                  width: 300,
                  child: TextFormField(
                      controller: emailController,
                      style:
                          TextStyle(color: Color.fromRGBO(56, 103, 214, 1.0)),
                      decoration: InputDecoration(
                        labelText: 'Username or E-mail',
                        labelStyle:
                            TextStyle(color: Color.fromRGBO(56, 103, 214, 1.0)),
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
                SizedBox(height: 20.0),
                SizedBox(
                  width: 300,
                  child: TextFormField(
                    controller: passwordController,
                    obscureText: true,
                    autocorrect: false,
                    enableSuggestions: false,
                    style: TextStyle(color: Color.fromRGBO(56, 103, 214, 1.0)),
                    decoration: InputDecoration(
                      labelText: 'Password',
                      labelStyle:
                          TextStyle(color: Color.fromRGBO(56, 103, 214, 1.0)),
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
                    ),
                  ),
                ),
                SizedBox(height: 10.0),
                Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: EdgeInsets.only(right: 50),
                    child: TextButton(
                      child: Text("Forgot password?",
                          style: TextStyle(
                              color: Color.fromRGBO(56, 103, 214, 1.0))),
                      onPressed: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ForgotPasswordPage()));
                      },
                    ),
                  ),
                ),
                SizedBox(height: 10.0),
                SizedBox(
                    height: 50.0,
                    width: 300,
                    child: TextButton(
                      onPressed: () async {
                        String? res = await signin(
                            emailController.text, passwordController.text);
                        if (res != null) {
                          setState(() {
                            errorMessage = res;
                          });
                        } else {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HomePage()));
                        }
                      },
                      child:
                          Text("Login", style: TextStyle(color: Colors.white)),
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
    );
  }
}
