import 'package:flutter/material.dart';
import 'package:kisanseva/screens/LoginScreen.dart';
import 'package:kisanseva/screens/SignUpScreen.dart';

class LoginScreen1 extends StatefulWidget {
  const LoginScreen1({Key? key}) : super(key: key);
  static const String id = 'Login';
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen1> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          body: Container(
            decoration:const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/farmer.jpg"),
                    fit: BoxFit.cover)),
            child: Padding(
                padding: const EdgeInsets.all(8.0),
                child:
                Column(mainAxisAlignment: MainAxisAlignment.start, children: [
                  Column(
                    children: [
                      Container(height: 30,),
                      /*const Text("Welcome to KesanSeva",
                          style: TextStyle(fontSize: 50)),*/

                      Container(
                        height: 550,
                      ),
                      Center(
                        child: ElevatedButton(

                          style: ElevatedButton.styleFrom(
                            primary: Colors.white,
                            fixedSize: const Size(150 ,40),
                            shape: const StadiumBorder(),
                          ),
                          child: const Text(
                            'Login',
                            style: TextStyle(fontSize: 20,
                            color: Colors.black
                            ),
                          ),
                          onPressed: () {
                            Navigator.pushNamed(context,LoginScreen.id);
                          },
                        ),
                      ),
                      Container(
                        height: 30,
                      ),
                      Center(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.white,
                            fixedSize: const Size(150 ,40),
                            shape: const StadiumBorder(),
                          ),
                          child: const Text('Sign-up',
                              style: TextStyle(fontSize: 20,
                              color: Colors.black
                              )),
                          onPressed: () {
                            Navigator.pushNamed(context,SignUpScreen.id);
                          },
                        ),
                      ),
                    ],
                  ),
                ])),
          )),
    );
  }
}