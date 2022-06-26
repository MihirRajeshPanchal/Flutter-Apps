import 'package:flutter/material.dart';
import 'package:kisanseva/Modules/details.dart';

class FertilizerSuggest extends StatefulWidget {
  const FertilizerSuggest({ Key? key }) : super(key: key);

  @override
  State<FertilizerSuggest> createState() => _FertilizerSuggestState();
}

class _FertilizerSuggestState extends State<FertilizerSuggest> {
  Extradetails e1=Extradetails();
  final _fertilizerEditingController = TextEditingController();
  final _fertilizerseasonEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Fertilizer suggestions"),
          leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: (){},
              color: Colors.white),

        ),
        body: Card(
          elevation: 20,
          color: Colors.amber,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Text("Which fertilizer should i use?"),
                Row(
                    children: [
                      const Text("Gap name"),
                      Container(
                        width: 50,
                        child: TextFormField(
                          controller: _fertilizerEditingController ,
                        ),
                      ),
                    ]),
                Row(
                  children: [
                    Container(height: 10),
                    const Text("Season"),
                    Container(
                      width: 50,
                      child: TextFormField(
                        controller: _fertilizerseasonEditingController ,
                      ),
                    ),
                  ],
                ),
                ElevatedButton(onPressed: (){},child:const Text("Get Fertilizers"),)
              ],
            ),),
        )
    );


  }
}