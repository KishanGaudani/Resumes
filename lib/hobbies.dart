// ignore_for_file: avoid_function_literals_in_foreach_calls, avoid_print

import 'package:flutter/material.dart';
import 'global.dart';

// ignore: camel_case_types
class hobbies extends StatefulWidget {
  const hobbies({Key? key}) : super(key: key);

  @override
  State<hobbies> createState() => _hobbiesState();
}

// ignore: camel_case_types
class _hobbiesState extends State<hobbies> {
  List<TextEditingController> hobbie = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    hobbie.add(TextEditingController());
    hobbie.add(TextEditingController());
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
          "\nInterest/Hobbies",
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
                  ...hobbie
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
                                            "Enter your Hobbies / Interest",
                                      ),
                                    )),
                                Expanded(
                                    child: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      hobbie.remove(e);
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
          SizedBox(
            width: w * 0.9,
            height: h * 0.06,
            child: OutlinedButton(
                onPressed: () {
                  setState(() {
                    hobbie.add(TextEditingController());
                  });
                },
                child: const Icon(Icons.add)),
          ),
          const SizedBox(height: 25),
          const SizedBox(height: 20),
          SizedBox(
            width: w * 0.9,
            height: h * 0.06,
            child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    hobbie.forEach((e) {
                      global.hobbies2.add(e.text);
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
