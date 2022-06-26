import 'package:flutter/material.dart';
import 'dart:math';

int? moist;

class WaterIrrigation extends StatefulWidget {
  static const String id = 'waterIrrigation_screen';
  const WaterIrrigation({Key? key}) : super(key: key);

  @override
  State<WaterIrrigation> createState() => WaterIrrigationState();
}

class WaterIrrigationState extends State<WaterIrrigation> {

  void initState(){
    super.initState();
    moist =Random().nextInt(100);
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(icon: Icon(Icons.arrow_back,), onPressed: () { Navigator.pop(context); },),
          title: Text("Water Irrigation"),

        ),
        body: Container(
          decoration:const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/crop1.jpg"),
                  fit: BoxFit.cover)),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Center(
              child: Container(
                height: 150,
                width: 260,
                child: Card(
                  elevation: 20,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  color:Color.fromRGBO(255, 255, 230, 1),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(height: 10,),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0,right: 8.0,top: 8.0),
                            child: Text("Soil Moisture : ",
                              style: TextStyle(fontSize: 20,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0,right: 8.0,top: 8.0),
                            child: Text(moist.toString(),
                              style: TextStyle(fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Text("Content",
                          style: TextStyle(fontSize: 20,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ),
                      SizedBox(height: 10),

                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: moist!<=30 ?Text("Please give water to crops",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w400
                        ),
                        )
                        :Text("Water level is maintained",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w400
                          ),
                        )
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),

      ),
    );
  }
}
