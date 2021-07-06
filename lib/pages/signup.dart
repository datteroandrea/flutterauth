import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:template/authentication/auth.dart';
import 'package:template/pages/mainpage.dart';
import 'package:template/pages/signin.dart';

import '../constants.dart';
import '../main.dart';

class SignupPage extends StatefulWidget {
  @override
  SignupPageState createState() => SignupPageState();
}

class SignupPageState extends State<SignupPage> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MainPage(
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
                  SizedBox(
                    width: 300,
                    child: TextFormField(
                        controller: usernameController,
                        style:
                            TextStyle(color: Color.fromRGBO(56, 103, 214, 1.0)),
                        decoration: InputDecoration(
                          labelText: 'Username',
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
                  SizedBox(
                    height: 20,
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
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: 300,
                    child: TextFormField(
                      controller: passwordController,
                      obscureText: true,
                      autocorrect: false,
                      enableSuggestions: false,
                      style:
                          TextStyle(color: Color.fromRGBO(56, 103, 214, 1.0)),
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
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: 300,
                    child: TextFormField(
                      controller: confirmPasswordController,
                      obscureText: true,
                      autocorrect: false,
                      enableSuggestions: false,
                      style:
                          TextStyle(color: Color.fromRGBO(56, 103, 214, 1.0)),
                      decoration: InputDecoration(
                        labelText: 'Confirm Password',
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
                  SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: 50.0,
                    width: 300,
                    child: TextButton(
                      onPressed: () async {
                        String email = emailController.text;
                        String username = usernameController.text;
                        String password = passwordController.text;
                        String confirmPassword = confirmPasswordController.text;
                        RegExp regExp = new RegExp(
                          r"^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$",
                          caseSensitive: false,
                          multiLine: false,
                        );
                        if (password.compareTo(confirmPassword) == 0 &&
                            regExp.hasMatch(password)) {
                          // password match the regex and are equal
                          signup(username, email, password);
                        } else {
                          // password doesn't match the regex or the passwords are different
                          print(password);
                          print("Errore password non valida");
                        }
                      },
                      child: Text("Sign up!",
                          style: TextStyle(color: Colors.white)),
                      style: ElevatedButton.styleFrom(
                          primary: Color.fromRGBO(56, 103, 214, 1.0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(32.0),
                          )),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            )
          ],
        ));
  }
}
