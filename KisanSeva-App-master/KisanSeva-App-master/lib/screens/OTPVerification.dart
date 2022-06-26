import 'package:flutter/material.dart';

String? contact1;
class OTPVerification extends StatefulWidget {
  OTPVerification(String contact){
    contact1 = contact;
  }



  @override
  State<OTPVerification> createState() => _OTPVerificationState();
}

class _OTPVerificationState extends State<OTPVerification> {
  final TextEditingController otp1 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Login',
        theme: ThemeData(
          primarySwatch: Colors.indigo,
        ),
        home: Scaffold(
            appBar: AppBar(
              title: Text('Login'),
            ),
            backgroundColor: Color(0xFFffffff),
            body: Center(
              child: Container(
                height: 300,
                padding: const EdgeInsets.only(left: 40, right: 40),
                child: Form(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Farmer",
                        style: TextStyle(fontSize: 30, color: Colors.black),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      TextFormField(
                        //controller: phoneNumber,
                        initialValue: contact1,
                        //enabled: false,
                        readOnly: true,
                        keyboardType: TextInputType.number,
                        decoration:
                        //InputDecoration(labelText: "Enter your Number"),
                        InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                            BorderSide(color: Colors.black, width: 1.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                            BorderSide(color: Colors.black, width: 1.0),
                          ),
                          hintText: '10 Digit Contact No',
                        ),
                        maxLength: 10,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        controller: otp1,
                        obscureText: true,
                        decoration:
                        //InputDecoration(labelText: "Enter your Number"),
                        InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                            BorderSide(color: Colors.black, width: 1.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                            BorderSide(color: Colors.black, width: 1.0),
                          ),
                          hintText: 'Enter Password',
                        ),
                        maxLength: 20,
                        validator: (value) {},
                      ),
                      ElevatedButton(
                          child: Text('Submit'),
                          onPressed: () async {

                            setState(() {

                            });
                          },
                          style: ElevatedButton.styleFrom(
                            // background color
                              primary: Colors.red[900],
                              padding: EdgeInsets.symmetric(
                                horizontal: 50,
                                vertical: 15,
                              ))),
                      // _user == null
                      //     ? Container()
                      //     : Text("The otp ${_user!.token.toString()}"),
                    ],
                  ),
                ),
              ),
            )));;
  }
}
