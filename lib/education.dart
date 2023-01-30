import 'package:flutter/material.dart';
import 'global.dart';

// ignore: camel_case_types
class eduction extends StatefulWidget {
  const eduction({Key? key}) : super(key: key);

  @override
  State<eduction> createState() => _eductionState();
}

// ignore: non_constant_identifier_names
final GlobalKey<FormState> Controllerkey = GlobalKey<FormState>();
final TextEditingController degree = TextEditingController();
final TextEditingController school = TextEditingController();
final TextEditingController institute = TextEditingController();
// ignore: non_constant_identifier_names
final TextEditingController year_is_passing = TextEditingController();

// ignore: camel_case_types
class _eductionState extends State<eduction> {
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
          "\nEducation",
          style: TextStyle(fontSize: 25, color: Colors.white),
        ),
        centerTitle: true,
      ),
      backgroundColor: Colors.white.withOpacity(0.7),
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
                height: h * 0.55,
                width: w * 0.83,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      //Course/Degree
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 40, vertical: 15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 10),
                            Text(
                              "Course/Degree",
                              style: style.copyWith(fontSize: 18),
                            ),
                            const SizedBox(height: 5),
                            TextFormField(
                              controller: degree,
                              validator: (val) {
                                if (val!.isEmpty) {
                                  return "Enter you Degree";
                                }
                                return null;
                              },
                              onSaved: (val) {
                                setState(() {
                                  global.degree = val;
                                });
                              },
                              decoration: const InputDecoration(
                                hintText: "B. Tech Information Technology",
                                border: OutlineInputBorder(),
                              ),
                            ),
                          ],
                        ),
                      ),
                      //School/College/Institute
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 40),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 10),
                            Text(
                              "School/College/Institute",
                              style: style.copyWith(fontSize: 18),
                            ),
                            const SizedBox(height: 5),
                            TextFormField(
                              controller: school,
                              validator: (val) {
                                if (val!.isEmpty) {
                                  return "Enter you School or College or institute";
                                }
                                return null;
                              },
                              onSaved: (val) {
                                setState(() {
                                  global.school = val;
                                });
                              },
                              decoration: const InputDecoration(
                                hintText: "Bhagavan Mahavir University ",
                                border: OutlineInputBorder(),
                              ),
                            ),
                          ],
                        ),
                      ),
                      //School/College/Institute result
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 40),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 20),
                            Text(
                              "School/College/Institute",
                              style: style.copyWith(fontSize: 18),
                            ),
                            const SizedBox(height: 5),
                            TextFormField(
                              controller: institute,
                              validator: (val) {
                                if (val!.isEmpty) {
                                  return "Enter you result";
                                }
                                return null;
                              },
                              onSaved: (val) {
                                setState(() {
                                  global.institute = val;
                                });
                              },
                              keyboardType:
                                  const TextInputType.numberWithOptions(),
                              decoration: const InputDecoration(
                                hintText: "70% (or) 7.0 CGPA",
                                border: OutlineInputBorder(),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 40),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Year Of Pass",
                              style: style.copyWith(fontSize: 18),
                            ),
                            const SizedBox(height: 5),
                            TextFormField(
                              validator: (val) {
                                if (val!.isEmpty) {
                                  return "Enter year is passing";
                                }
                                return null;
                              },
                              onSaved: (val) {
                                setState(() {
                                  global.year_is_passing = val;
                                });
                              },
                              keyboardType:
                                  const TextInputType.numberWithOptions(),
                              decoration: const InputDecoration(
                                hintText: "2019",
                                border: OutlineInputBorder(),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: 100,
              child: ElevatedButton(
                  onPressed: () {
                    if (Controllerkey.currentState!.validate()) {
                      Controllerkey.currentState!.save();
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("You Data Is Save"),
                          behavior: SnackBarBehavior.floating,
                        ),
                      );
                    }
                  },
                  child: const Text("SAVE")),
            ),
          ],
        ),
      ),
    );
  }
}
