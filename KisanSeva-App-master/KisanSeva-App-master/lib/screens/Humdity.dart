import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

String? temp = '80';
String? hum = '1.0';
String? w2;

final _firestore = FirebaseFirestore.instance;

class Humidity extends StatefulWidget {
  static const String id = 'humidity_screen';

  Humidity(String? w1, {Key? key}) : super(key: key) {
    w2 = w1;
  }


  @override
  State<Humidity> createState() => _HumidityState();
}

class _HumidityState extends State<Humidity> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back,), onPressed: () {
            Navigator.pop(context);
          },),
          title: const Text("Tracking Temp And Humidity"),
        ),
        body: Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/humidity.jpg"),
                    fit: BoxFit.cover)),
            child: StreamBuilder<QuerySnapshot>(
              stream: _firestore.collection('outputDevices').snapshots(),
              builder: (context, snapshot) {
                // print('Re Check');
                if (!snapshot.hasData) {
                  return const Center(
                    child: CircularProgressIndicator(
                      backgroundColor: Colors.lightBlueAccent,
                    ),
                  );
                }
                final messages = snapshot.data!.docs;
                final temp = messages[0].get('Temperature');
                final humid = messages[0].get('Humidity');
                return dhtCard(temp: temp, humid: humid,);
              },
            ),
        ),

      ),
    );
  }
}

class dhtCard extends StatelessWidget {
  dhtCard({required this.temp, required this.humid});

  final String temp;
  final String humid;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Center(
        child: Container(
          height: 150,
          width: 200,
          child: Card(
            elevation: 20,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            color: const Color.fromRGBO(255, 255, 230, 1),
            child: Column(
              children: <Widget>[
                const SizedBox(height: 10,),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(top: 8.0, bottom: 8.0),
                      child: Text("Temperature: ",
                        style: TextStyle(fontSize: 20,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                      child: Text(temp.toString()+'℃',
                        style: const TextStyle(fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children:  [
                    const Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Text("Humidity: ",
                        style: TextStyle(fontSize: 20,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(humid.toString()+'%',
                        style: const TextStyle(fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
