// ignore: duplicate_ignore
// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'global.dart';

class declaration extends StatefulWidget {
  const declaration({Key? key}) : super(key: key);

  @override
  State<declaration> createState() => _declarationState();
}

final GlobalKey<FormState> controller = GlobalKey<FormState>();
final TextEditingController descripation = TextEditingController();
final TextEditingController date2 = TextEditingController();
final TextEditingController place = TextEditingController();

class _declarationState extends State<declaration> {
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;

    TextStyle style = const TextStyle(
      color: Colors.blue,
      fontWeight: FontWeight.w600,
      fontSize: 20,
    );
    return Scaffold(
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
          "\nDeclaration",
          style: TextStyle(fontSize: 25, color: Colors.white),
        ),
        centerTitle: true,
      ),
      backgroundColor: Colors.white.withOpacity(0.8),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: 80,
              width: double.infinity,
              alignment: Alignment.center,
              color: Colors.blue,
            ),
            const SizedBox(height: 20),
            Container(
              height: h * 0.08,
              width: w * 0.9,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: const Radius.circular(10),
                    topRight: const Radius.circular(10),
                    bottomLeft: Radius.circular(global.bottomleft),
                    bottomRight: Radius.circular(global.bottomleft)),
                color: Colors.white,
              ),
              child: Row(
                children: <Widget>[
                  const SizedBox(width: 30),
                  Text("Declaration", style: style),
                  const Spacer(),
                  Switch(
                      value: global.isdeclaration,
                      onChanged: (val) {
                        setState(() {
                          if (val == false) {
                            global.bottomleft = 10;
                          } else {
                            global.bottomleft = 0;
                          }
                          global.isdeclaration = val;
                        });
                      }),
                  const SizedBox(width: 20),
                ],
              ),
            ),
            (global.isdeclaration == true)
                ? Form(
                    key: controller,
                    child: Container(
                      height: h * 0.5,
                      width: w * 0.9,
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(10),
                              bottomLeft: Radius.circular(10))),
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: Image.asset(
                                "assets/images/target.png",
                                height: 60,
                              ),
                            ),
                            const SizedBox(height: 20),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: TextFormField(
                                controller: descripation,
                                validator: (val) {
                                  if (val!.isEmpty) {
                                    return "Enter You descripation";
                                  }
                                  return null;
                                },
                                onSaved: (val) {
                                  setState(() {
                                    global.descripation2 = val;
                                  });
                                },
                                decoration: const InputDecoration(
                                    hintText: "Descripation",
                                    border: OutlineInputBorder()),
                              ),
                            ),
                            const SizedBox(height: 20),
                            const Divider(
                              thickness: 1,
                              color: Colors.black45,
                              endIndent: 20,
                              indent: 20,
                            ),
                            const SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: const [
                                Text(
                                  "Date        ",
                                  style: TextStyle(
                                      fontSize: 18, color: Colors.grey),
                                ),
                                Text(
                                  "           Place(Interview\n           venue/city)",
                                  style: TextStyle(
                                      fontSize: 18, color: Colors.grey),
                                ),
                              ],
                            ),
                            // ignore: prefer_const_constructors
                            SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                const SizedBox(width: 20),
                                Expanded(
                                  child: TextFormField(
                                    controller: date2,
                                    validator: (val) {
                                      if (val!.isEmpty) {
                                        return "Enter You Date";
                                      }
                                      return null;
                                    },
                                    onSaved: (val) {
                                      setState(() {
                                        global.date2 = val;
                                      });
                                    },
                                    maxLines: 1,
                                    decoration: const InputDecoration(
                                        hintText: "DD/MM//YYYY",
                                        border: OutlineInputBorder()),
                                    keyboardType:
                                        const TextInputType.numberWithOptions(),
                                  ),
                                ),
                                const SizedBox(width: 30),
                                Expanded(
                                  child: TextFormField(
                                    controller: place,
                                    validator: (val) {
                                      if (val!.isEmpty) {
                                        return "Enter You Place Name";
                                      }
                                      return null;
                                    },
                                    onSaved: (val) {
                                      setState(() {
                                        global.place = val;
                                      });
                                    },
                                    decoration: const InputDecoration(
                                        hintText: "Eg. surat",
                                        border: OutlineInputBorder()),
                                  ),
                                ),
                                const SizedBox(width: 20),
                              ],
                            ),
                            const SizedBox(height: 40),
                            Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 125),
                                child: SizedBox(
                                    width: 120,
                                    child: ElevatedButton(
                                        onPressed: () {
                                          if (controller.currentState!
                                              .validate()) {
                                            controller.currentState!.save();
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(const SnackBar(
                                                    content: Text(
                                                        "You Date Is Save")));
                                          }
                                        },
                                        child: const Text("SAVE")))),
                          ],
                        ),
                      ),
                    ),
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}
