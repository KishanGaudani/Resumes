// ignore_for_file: prefer_const_constructors, camel_case_types, avoid_print, avoid_function_literals_in_foreach_calls

import 'package:flutter/material.dart';
import 'global.dart';

class achievements extends StatefulWidget {
  const achievements({Key? key}) : super(key: key);

  @override
  State<achievements> createState() => _achievementsState();
}

class _achievementsState extends State<achievements> {
  List<TextEditingController> achivements = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    achivements.add(TextEditingController());
    achivements.add(TextEditingController());
  }

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            setState(() {
              Navigator.of(context).pop();
            });
          },
        ),
        title: Text(
          "achievement",
          style: TextStyle(fontSize: 25, color: Colors.white),
        ),
        centerTitle: true,
      ),
      backgroundColor: Colors.white.withOpacity(0.85),
      body: Column(
        children: [
          Container(
            height: 80,
            width: double.infinity,
            alignment: Alignment.center,
            color: Colors.blue,
          ),
          SizedBox(height: 30),
          Container(
            width: w * 0.9,
            height: h * 0.35,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 25),
                  Text(
                    "Enter your skills",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.grey,
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(height: 5),
                  ...achivements
                      .map((e) => Padding(
                            padding: EdgeInsets.symmetric(vertical: 10),
                            child: Row(
                              children: [
                                SizedBox(width: 30),
                                Expanded(
                                    flex: 6,
                                    child: TextFormField(
                                      controller: e,
                                      validator: (val) {
                                        if (val!.isEmpty) {
                                          return "Enter You Skills";
                                        }
                                        return null;
                                      },
                                      onSaved: (val) {
                                        setState(() {});
                                      },
                                      decoration: InputDecoration(
                                          hintText:
                                              "C Programing,Web Technical"),
                                    )),
                                Expanded(
                                    child: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      achivements.remove(e);
                                    });
                                  },
                                  icon: Icon(
                                    Icons.delete_forever_outlined,
                                    size: 40,
                                  ),
                                )),
                                SizedBox(width: 40),
                              ],
                            ),
                          ))
                      .toList(),
                ],
              ),
            ),
          ),
          SizedBox(height: 25),
          SizedBox(
            width: w * 0.9,
            height: h * 0.06,
            child: OutlinedButton(
                onPressed: () {
                  setState(() {
                    achivements.add(TextEditingController());
                  });
                },
                child: Icon(Icons.add)),
          ),
          SizedBox(height: 20),
          SizedBox(
            width: w * 0.9,
            height: h * 0.06,
            child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    achivements.forEach((e) {
                      global.Achivement.add(e.text);
                    });

                    print(global.Achivement);
                  });
                },
                child: Text("SAVE")),
          ),
        ],
      ),
    );
  }
}
