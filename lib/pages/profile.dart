import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:template/api/ProfileApi.dart';
import 'package:template/authentication/auth.dart';
import 'package:template/pages/mainpage.dart';

import '../main.dart';

class ProfilePage extends StatefulWidget {
  @override
  ProfilePageState createState() => ProfilePageState();
}

class ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getProfile(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.connectionState != ConnectionState.done) {
            return CircularProgressIndicator(); // your widget while loading
          } else {
            print(snapshot.data);
            return MainPage(
                appBarButtons: Row(
                  children: [
                    MaterialButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HomePage()));
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
                    IconButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ProfilePage()));
                        },
                        icon: Icon(Icons.person))
                  ],
                ),
                child: Column(
                  children: [],
                ));
          }
        });
  }
}
