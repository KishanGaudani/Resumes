// ignore_for_file: avoid_print, avoid_function_literals_in_foreach_calls

import 'package:flutter/material.dart';
import 'global.dart';

// ignore: camel_case_types
class technical extends StatefulWidget {
  const technical({Key? key}) : super(key: key);

  @override
  State<technical> createState() => _technicalState();
}

// ignore: camel_case_types
class _technicalState extends State<technical> {
  List<TextEditingController> textediting = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    textediting.add(TextEditingController());
    textediting.add(TextEditingController());
  }

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          alignment: const Alignment(0, 2),
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            setState(() {
              Navigator.of(context).pop();
            });
          },
        ),
        title: const Text(
          "\nTechnical Skills",
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
          const SizedBox(height: 30),
          Container(
            width: w * 0.9,
            height: h * 0.35,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  const SizedBox(height: 25),
                  const Text(
                    "Enter your skills",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.grey,
                        fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(height: 5),
                  ...textediting
                      .map((e) => Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Row(
                              children: [
                                const SizedBox(width: 30),
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
                                      decoration: const InputDecoration(
                                          hintText:
                                              "C Programing,Web Technical"),
                                    )),
                                Expanded(
                                    child: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      textediting.remove(e);
                                    });
                                  },
                                  icon: const Icon(
                                    Icons.delete_forever_outlined,
                                    size: 40,
                                  ),
                                )),
                                const SizedBox(width: 40),
                              ],
                            ),
                          ))
                      .toList(),
                ],
              ),
            ),
          ),
          const SizedBox(height: 25),
          SizedBox(
            width: w * 0.9,
            height: h * 0.06,
            child: OutlinedButton(
                onPressed: () {
                  setState(() {
                    textediting.add(TextEditingController());
                  });
                },
                child: const Icon(Icons.add)),
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: w * 0.9,
            height: h * 0.06,
            child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    textediting.forEach((e) {
                      global.Skils.add(e.text);
                    });
                    print(global.Skils);
                  });
                },
                child: const Text("SAVE")),
          ),
        ],
      ),
    );
  }
}
