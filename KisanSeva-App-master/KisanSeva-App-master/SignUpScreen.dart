import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final formKey = GlobalKey<FormState>();

  final TextEditingController name = TextEditingController();
  final TextEditingController number = TextEditingController();
  final TextEditingController age = TextEditingController();
  final TextEditingController gender = TextEditingController();
  final TextEditingController address = TextEditingController();


  @override
  Widget build(BuildContext context) {
    String dropdownvalue = 'Male';

    // List of items in our dropdown menu
    var items = [
      'Male',
      'Female',
      'Other',
    ];
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'SignUp',
        theme: ThemeData(
          primarySwatch: Colors.cyan,
        ),
        home: Scaffold(
            key: _scaffoldKey,
            appBar: AppBar(
              title: Text('SignUp'),
            ),
            backgroundColor: Color(0xFFffffff),
            body: Center(
              child: Container(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Form(
                  key: formKey, //key for form
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Farmer Details",
                        style: TextStyle(fontSize: 20, color: Colors.black,
                        fontWeight: FontWeight.bold
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      TextFormField(
                        controller: name,
                        enableInteractiveSelection: false,
                        decoration:
                        InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                            BorderSide(color: Colors.black, width: 1.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                            BorderSide(color: Colors.black, width: 1.0),
                          ),
                          hintText: 'Enter your Full Name',
                        ),
                        maxLength: 25,
                      ),
                      TextFormField(
                        controller: number,
                        enableInteractiveSelection: false,
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
                        validator: (value) {
                          String patttern = r'(^[0-9]*$)';
                          RegExp regExp = new RegExp(patttern);
                          if (value?.length == 0) {
                            return "Mobile is Required";
                          } else if (!regExp.hasMatch(value!)) {
                            return "Mobile Number must be digits";
                          } else if (value.length != 10) {
                            return "Mobile number must 10 digits";
                          }
                          return null;
                        },
                      ),
                      TextFormField(
                        controller: age,
                        enableInteractiveSelection: false,
                        keyboardType: TextInputType.number,
                        decoration:
                        InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                            BorderSide(color: Colors.black, width: 1.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                            BorderSide(color: Colors.black, width: 1.0),
                          ),
                          hintText: 'Enter your Age',
                        ),
                        maxLength: 6,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Row(
                          children: [
                            Text("Select Your Gender",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold
                            ),
                            ),
                            SizedBox(width: 10),
                            DropdownButton(
                              // Initial Value
                              value: dropdownvalue,
                              // Down Arrow Icon
                              icon: const Icon(Icons.keyboard_arrow_down),

                              // Array list of items
                              items: items.map((String items) {
                                return DropdownMenuItem(
                                  value: items,
                                  child: Text(items),
                                );
                              }).toList(),
                              // After selecting the desired option,it will
                              // change button value to selected value
                              onChanged: (String? newValue) {
                                setState(() {
                                  dropdownvalue = newValue!;
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                      TextFormField(
                        controller: address,
                        enableInteractiveSelection: false,
                        decoration:
                        InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                            BorderSide(color: Colors.black, width: 1.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                            BorderSide(color: Colors.black, width: 1.0),
                          ),
                          hintText: 'Enter Address',
                        ),
                        maxLength: 50,
                      ),
                      SizedBox(
                        height: 5,
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
                      //     : Text("The otp ${_user!.otp.toString()}"),
                    ],
                  ),
                ),
              ),
            )));;
  }
}
