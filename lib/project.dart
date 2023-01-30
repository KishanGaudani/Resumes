// ignore_for_file: non_constant_identifier_names, camel_case_types, prefer_const_constructors, duplicate_ignore

import 'package:flutter/material.dart';
import 'global.dart';

// ignore: camel_case_types
class project extends StatefulWidget {
  const project({Key? key}) : super(key: key);

  @override
  State<project> createState() => _projectState();
}

final GlobalKey<FormState> controller = GlobalKey<FormState>();
final TextEditingController project_title = TextEditingController();
final TextEditingController roles2 = TextEditingController();
final TextEditingController technologies = TextEditingController();
final TextEditingController description = TextEditingController();

class _projectState extends State<project> {
  Color c = Colors.grey;
  Color c__ = Colors.grey;
  Color flutter = Colors.grey;
  final TextStyle _new =
      TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: Colors.blue);
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          alignment: Alignment(0, 2),
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            setState(() {
              Navigator.of(context).pop();
            });
          },
        ),
        title: Text(
          "\nProjects",
          style: TextStyle(fontSize: 25, color: Colors.white),
        ),
        centerTitle: true,
      ),
      backgroundColor: Colors.white.withOpacity(0.85),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            Container(
              height: 80,
              width: double.infinity,
              alignment: Alignment.center,
              color: Colors.blue,
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Form(
                key: controller,
                child: Container(
                  height: h * 0.75122,
                  width: w,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 8),
                          Text("Project Title", style: _new),
                          SizedBox(height: 5),
                          TextFormField(
                            controller: project_title,
                            validator: (val) {
                              if (val!.isEmpty) {
                                return "Enter You Project Title";
                              }
                              return null;
                            },
                            onSaved: (val) {
                              setState(() {
                                global.project_title = val;
                              });
                            },
                            decoration: InputDecoration(
                                hintText: "Resume Builder App",
                                border: OutlineInputBorder()),
                          ),
                          SizedBox(height: 10),
                          Text("Technologies", style: _new),
                          Row(
                            children: [
                              Checkbox(
                                value: global.isc,
                                onChanged: (val) {
                                  setState(() {
                                    global.isc = val!;
                                    if (val == true) {
                                      c = Colors.blue;
                                    } else {
                                      c = Colors.grey;
                                    }
                                  });
                                },
                              ),
                              Text(
                                "C Programming",
                                style: _new.copyWith(color: c),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Checkbox(
                                value: global.isc__,
                                onChanged: (val) {
                                  setState(() {
                                    global.isc__ = val!;
                                    if (val == true) {
                                      c__ = Colors.blue;
                                    } else {
                                      c__ = Colors.grey;
                                    }
                                  });
                                },
                              ),
                              Text(
                                "C++",
                                style: _new.copyWith(color: c__),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Checkbox(
                                value: global.isflutter,
                                onChanged: (val) {
                                  setState(() {
                                    global.isflutter = val!;
                                    if (val == true) {
                                      flutter = Colors.blue;
                                    } else {
                                      flutter = Colors.grey;
                                    }
                                  });
                                },
                              ),
                              Text(
                                "Flutter",
                                style: _new.copyWith(color: flutter),
                              ),
                            ],
                          ),
                          Text("Roles", style: _new),
                          SizedBox(height: 6),
                          TextFormField(
                            controller: roles2,
                            validator: (val) {
                              if (val!.isEmpty) {
                                return "Enter You roles";
                              }
                              return null;
                            },
                            onSaved: (val) {
                              setState(() {
                                global.roles2 = val;
                              });
                            },
                            decoration: InputDecoration(
                                hintText:
                                    "Organize team members,Code\nanalysis",
                                border: OutlineInputBorder()),
                          ),
                          SizedBox(height: 15),
                          Text("Technologies", style: _new),
                          SizedBox(height: 4),
                          TextFormField(
                            controller: technologies,
                            validator: (val) {
                              if (val!.isEmpty) {
                                return "Enter You technologies";
                              }
                              return null;
                            },
                            onSaved: (val) {
                              setState(() {
                                global.technologies = val;
                              });
                            },
                            decoration: InputDecoration(
                                hintText: "5 - Programmers",
                                border: OutlineInputBorder()),
                          ),
                          SizedBox(height: 15),
                          Text("Project Description", style: _new),
                          SizedBox(height: 6),
                          TextFormField(
                            controller: description,
                            validator: (val) {
                              if (val!.isEmpty) {
                                return "Enter You description";
                              }
                              return null;
                            },
                            onSaved: (val) {
                              setState(() {
                                global.descripation = val;
                              });
                            },
                            decoration: const InputDecoration(
                                hintText: "Enter Your Project Description",
                                border: OutlineInputBorder()),
                          ),
                          const SizedBox(height: 15),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                  width: 120,
                                  child: ElevatedButton(
                                      onPressed: () {
                                        if (controller.currentState!
                                            .validate()) {
                                          controller.currentState!.save();
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(const SnackBar(
                                                  content: Text(
                                                      "You Data Is Save")));
                                        }
                                      },
                                      child: const Text("SAVE"))),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
