import 'package:flutter/material.dart';
import 'package:template/authentication/auth.dart';
import 'package:template/pages/mainpage.dart';
import 'package:template/pages/signin.dart';
import 'package:template/pages/profile.dart';
import 'package:template/pages/signup.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Template App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  final String title = 'Home';

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  List<Widget> appBarButtons = [];
  late Widget child;

  @override
  Widget build(BuildContext context) {
    appBarButtons = [
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
      Spacer()
    ];
    return FutureBuilder<String?>(
      future: isAuthenticated(), // function where you call your api
      builder: (BuildContext context, AsyncSnapshot<String?> snapshot) {
        if (snapshot.connectionState != ConnectionState.done) {
          return CircularProgressIndicator(); // your widget while loading
        } else {
          if (snapshot.data != null) {
            appBarButtons.add(IconButton(
                onPressed: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => ProfilePage()));
                },
                icon: Icon(Icons.person)));
          } else {
            appBarButtons.addAll([
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
              )
            ]);
          }
          return MainPage(
            appBarButtons: Row(
              children: appBarButtons,
            ),
            child: Column(
              children: [],
            ),
          );
        }
      },
    );
  }
}
