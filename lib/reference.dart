import 'package:flutter/material.dart';
import 'global.dart';

// ignore: camel_case_types
class reference extends StatefulWidget {
  const reference({Key? key}) : super(key: key);

  @override
  State<reference> createState() => _referenceState();
}

final GlobalKey<FormState> controller = GlobalKey<FormState>();
// ignore: non_constant_identifier_names
final TextEditingController refrence_name = TextEditingController();
final TextEditingController desingnation = TextEditingController();
final TextEditingController organization = TextEditingController();

// ignore: camel_case_types
class _referenceState extends State<reference> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    // ignore: prefer_const_constructors
    TextStyle detailstyle = TextStyle(
      color: Colors.blue,
      fontWeight: FontWeight.w600,
      fontSize: 22,
    );

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
          "\nReferences",
          style: TextStyle(fontSize: 25, color: Colors.white),
        ),
        centerTitle: true,
      ),
      backgroundColor: Colors.white.withOpacity(0.85),
      body: SingleChildScrollView(
          child: Column(children: [
        Container(
          height: 80,
          width: double.infinity,
          alignment: Alignment.center,
          color: Colors.blue,
        ),
        const SizedBox(height: 30),
        Form(
          key: controller,
          child: Container(
            width: width * 0.9,
            height: height * 0.5,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 15),
                  Text(
                    "Reference Name",
                    style: detailstyle,
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: refrence_name,
                    onSaved: (val) {
                      setState(() {
                        global.refrence_name = val;
                      });
                    },
                    style: const TextStyle(fontSize: 22),
                    // ignore: prefer_const_constructors
                    decoration: InputDecoration(
                        hintStyle: const TextStyle(fontSize: 18),
                        hintText: "Suresh shah",
                        // ignore: prefer_const_constructors
                        border: OutlineInputBorder()),
                  ),
                  // ignore: prefer_const_constructors
                  SizedBox(height: 15),
                  Text(
                    "Desingnation",
                    style: detailstyle,
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: desingnation,
                    onSaved: (val) {
                      setState(() {
                        global.desingnation = val;
                      });
                    },
                    style: const TextStyle(fontSize: 22),
                    decoration: const InputDecoration(
                        hintText: "Marketing Manager,ID-323232",
                        hintStyle: TextStyle(fontSize: 18),
                        border: OutlineInputBorder()),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    "Organization/Institute",
                    style: detailstyle,
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: organization,
                    onSaved: (val) {
                      setState(() {
                        global.organization = val;
                      });
                    },
                    style: const TextStyle(fontSize: 22),
                    decoration: const InputDecoration(
                        hintText: "Green Energy Pvs.Ltd",
                        hintStyle: TextStyle(fontSize: 18),
                        border: OutlineInputBorder()),
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
                controller.currentState!.save();
                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("You data Is Save")));
              },
              child: const Text("SAVE")),
        ),
      ])),
    );
  }
}
