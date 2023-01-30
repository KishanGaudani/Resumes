import 'package:flutter/material.dart';
import 'package:resumes/global.dart';

// ignore: camel_case_types
class carrier extends StatefulWidget {
  const carrier({Key? key}) : super(key: key);

  @override
  State<carrier> createState() => _carrierState();
}

// ignore: non_constant_identifier_names
final GlobalKey<FormState> Controllerkey = GlobalKey<FormState>();
final TextEditingController car = TextEditingController();
// ignore: non_constant_identifier_names
final TextEditingController Desi = TextEditingController();

// ignore: camel_case_types
class _carrierState extends State<carrier> {
  @override
  Widget build(BuildContext context) {
    TextStyle style = const TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.bold,
      fontSize: 20,
    );
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          // ignore: prefer_const_constructors
          alignment: Alignment(0, 2),
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            setState(() {
              Navigator.of(context).pop();
            });
          },
        ),
        title: const Text(
          "\nCarrier Objective",
          style: TextStyle(fontSize: 25, color: Colors.white),
        ),
        centerTitle: true,
      ),
      backgroundColor: Colors.white.withOpacity(0.8),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Form(
          key: Controllerkey,
          child: Column(children: [
            Container(
              height: 80,
              width: double.infinity,
              alignment: Alignment.center,
              color: Colors.blue,
            ),
            const SizedBox(height: 30),
            //career objective
            Container(
              height: h * 0.32,
              width: w * 0.89,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 40, vertical: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Carrier Objective", style: style),
                        const SizedBox(height: 5),
                        TextFormField(
                          controller: car,
                          validator: (val) {
                            if (val!.isEmpty) {
                              return "Enter you Carrier";
                            }
                            return null;
                          },
                          onSaved: (val) {
                            global.car = val;
                          },
                          maxLines: 7,
                          decoration: const InputDecoration(
                            hintText: "Description",
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 25),
            //current designation
            Container(
              height: h * 0.2,
              width: w * 0.89,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 40, vertical: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Current Designation(Experienced\nCandidate",
                          style: style.copyWith(fontSize: 18),
                        ),
                        const SizedBox(height: 5),
                        TextFormField(
                          controller: Desi,
                          maxLines: 1,
                          validator: (val) {
                            if (val!.isEmpty) {
                              return "Enter you Designation";
                            }
                            return null;
                          },
                          decoration: const InputDecoration(
                            hintText: "Software Engineer",
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
            SizedBox(
              width: 150,
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
            ),
          ]),
        ),
      ),
    );
  }
}
