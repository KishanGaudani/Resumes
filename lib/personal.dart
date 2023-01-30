import 'package:flutter/material.dart';
import 'global.dart';

// ignore: camel_case_types
class personal extends StatefulWidget {
  const personal({Key? key}) : super(key: key);

  @override
  State<personal> createState() => _personalState();
}

// ignore: non_constant_identifier_names
final GlobalKey<FormState> Controllerkey = GlobalKey<FormState>();
final TextEditingController dob = TextEditingController();
final TextEditingController nationality = TextEditingController();

Color eng = Colors.grey;
Color guj = Colors.grey;
Color hindi = Colors.grey;

// ignore: camel_case_types
class _personalState extends State<personal> {
  @override
  Widget build(BuildContext context) {
    TextStyle style = const TextStyle(
      color: Colors.blue,
      fontWeight: FontWeight.w600,
      fontSize: 20,
    );

    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
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
          "\nPersonal Details",
          style: TextStyle(fontSize: 25, color: Colors.white),
        ),
        centerTitle: true,
      ),
      backgroundColor: Colors.white.withOpacity(0.85),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            Container(
              height: 80,
              width: double.infinity,
              alignment: Alignment.center,
              color: Colors.blue,
            ),
            const SizedBox(height: 30),
            Form(
              key: Controllerkey,
              child: Container(
                height: h * 0.7,
                width: w * 0.9,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      //DOB
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 40, vertical: 5),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "DOB",
                              style: style,
                            ),
                            const SizedBox(height: 5),
                            TextFormField(
                              controller: dob,
                              maxLength: 10,
                              keyboardType: TextInputType.datetime,
                              validator: (val) {
                                if (val!.isEmpty) {
                                  return "Enter you dob";
                                }
                                return null;
                              },
                              onSaved: (val) {
                                setState(() {
                                  global.dob = val;
                                });
                              },
                              decoration: const InputDecoration(
                                hintText: "   DD/MM/YYYY",
                                border: OutlineInputBorder(),
                              ),
                            ),
                          ],
                        ),
                      ),
                      //Marital Status
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 40),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Marital Status",
                              style: style,
                            ),
                            RadioListTile(
                                title: Text(
                                  "Single",
                                  style: style.copyWith(fontSize: 18),
                                ),
                                value: "Single",
                                groupValue: global.marital_status,
                                onChanged: (val) {
                                  setState(() {
                                    global.marital_status = val;
                                  });
                                }),
                            RadioListTile(
                                title: Text(
                                  "Married",
                                  style: style.copyWith(fontSize: 18),
                                ),
                                value: "Married",
                                groupValue: global.marital_status,
                                onChanged: (val) {
                                  setState(() {
                                    global.marital_status = val;
                                  });
                                }),
                          ],
                        ),
                      ),
                      const SizedBox(height: 5),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 40),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Languages Known",
                              style: style,
                            ),
                            CheckboxListTile(
                                controlAffinity:
                                    ListTileControlAffinity.leading,
                                title: Text(
                                  "English",
                                  style:
                                      style.copyWith(fontSize: 18, color: eng),
                                ),
                                value: global.isEnglish,
                                onChanged: (val) {
                                  setState(() {
                                    global.isEnglish = val!;
                                    if (val == true) {
                                      eng = Colors.blue;
                                    } else {
                                      eng = Colors.grey;
                                    }
                                  });
                                }),
                            CheckboxListTile(
                                controlAffinity:
                                    ListTileControlAffinity.leading,
                                title: Text(
                                  "Gujarati",
                                  style:
                                      style.copyWith(fontSize: 18, color: guj),
                                ),
                                value: global.isGujarati,
                                onChanged: (val) {
                                  setState(() {
                                    global.isGujarati = val!;
                                    if (val == true) {
                                      guj = Colors.blue;
                                    } else {
                                      guj = Colors.grey;
                                    }
                                  });
                                }),
                            CheckboxListTile(
                                controlAffinity:
                                    ListTileControlAffinity.leading,
                                title: Text(
                                  "Hindi",
                                  style: style.copyWith(
                                      fontSize: 18, color: hindi),
                                ),
                                value: global.isHindi,
                                onChanged: (val) {
                                  setState(() {
                                    global.isHindi = val!;
                                    if (val == true) {
                                      hindi = Colors.blue;
                                    } else {
                                      hindi = Colors.grey;
                                    }
                                  });
                                }),
                          ],
                        ),
                      ),
                      //nationality
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 40),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Nationality",
                              style: style,
                            ),
                            const SizedBox(height: 5),
                            TextFormField(
                              controller: nationality,
                              validator: (val) {
                                if (val!.isEmpty) {
                                  return "Enter you nationality";
                                }
                                return null;
                              },
                              onSaved: (val) {
                                setState(() {
                                  global.nationality = val!;
                                });
                              },
                              decoration: const InputDecoration(
                                hintText: "   Indian",
                                border: OutlineInputBorder(),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 8, width: 20),
                      SizedBox(
                        width: 120,
                        height: 40,
                        child: ElevatedButton(
                            onPressed: () {
                              setState(() {
                                if (Controllerkey.currentState!.validate()) {
                                  Controllerkey.currentState!.save();
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(const SnackBar(
                                    content: Text("You Data is Save"),
                                    behavior: SnackBarBehavior.floating,
                                  ));
                                }
                              });
                            },
                            child: const Text("SAVE")),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
