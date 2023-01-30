import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:resumes/pdf.dart';
import 'achievements.dart';
import 'declaration.dart';
import 'expriences.dart';
import 'hobbies.dart';
import 'personal.dart';
import 'carrier.dart';
import 'contact.dart';
import 'education.dart';
import 'global.dart';
import 'project.dart';
import 'reference.dart';
import 'technical.dart';

void main() {
  return runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    routes: {
      '/': (context) => const Home_Page(),
      'build': (context) => const build(),
      'contact': (context) => const contact(),
      'carrier': (context) => const carrier(),
      'personal': (context) => const personal(),
      'eduction': (context) => const eduction(),
      'experience': (context) => const experience(),
      'technical': (context) => const technical(),
      'hobbies': (context) => const hobbies(),
      'project': (context) => const project(),
      'achievement': (context) => const achievements(),
      'reference': (context) => const reference(),
      'declaration': (context) => const declaration(),
      'pdf': (context) => const pdf(),
    },
  ));
}

// ignore: camel_case_types
class Home_Page extends StatefulWidget {
  const Home_Page({Key? key}) : super(key: key);

  @override
  State<Home_Page> createState() => _Home_PageState();
}

// ignore: camel_case_types
class _Home_PageState extends State<Home_Page> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: const Text(
            "Resume Builder",
            style: TextStyle(
              fontSize: 25,
              color: Colors.white,
            ),
          ),
          centerTitle: true,
        ),
        body: Column(
          children: [
            Container(
              height: 100,
              width: double.infinity,
              color: Colors.blue,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: const [
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "RESUMES",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 170,
            ),
            const Icon(
              CupertinoIcons.cube_box,
              size: 60,
              color: Colors.black,
            ),
            const SizedBox(
              height: 60,
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "No Resume + Create New resume.",
              style: TextStyle(fontSize: 25, color: Colors.blue),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              Navigator.of(context).pushNamed('build');
            });
          },
          child: const Icon(
            CupertinoIcons.add,
            size: 30,
          ),
        ),
      ),
      onWillPop: () async => await showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Center(
            child: Text("You have a Exit"),
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop(true);
              },
              child: const Text(
                "YES",
              ),
            ),
            OutlinedButton(
              onPressed: () {
                Navigator.of(context).pop(false);
              },
              child: const Text(
                "NO",
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ignore: camel_case_types
class build extends StatefulWidget {
  const build({Key? key}) : super(key: key);

  @override
  State<build> createState() => _buildState();
}

// ignore: camel_case_types
class _buildState extends State<build> {
  List<Map<String, String>> bul = [
    {
      'image': "assets/images/contact-info.png",
      'name': "Contact Info",
    },
    {
      'image': "assets/images/briefcase.png",
      'name': "Carrier Objective",
    },
    {
      'image': "assets/images/user.png",
      'name': "Personal Details",
    },
    {
      'image': "assets/images/mortarboard.png",
      'name': "Education",
    },
    {
      'image': "assets/images/thinking.png",
      'name': "Experiences",
    },
    {
      'image': "assets/images/experience.png",
      'name': "Technical Skills",
    },
    {
      'image': "assets/images/open-book.png",
      'name': "Interest/Hobbies",
    },
    {
      'image': "assets/images/project.png",
      'name': "Projects",
    },
    {
      'image': "assets/images/achievement.png",
      'name': "Achievements",
    },
    {
      'image': "assets/images/handshake.png",
      'name': "References",
    },
    {
      'image': "assets/images/declaration.png",
      'name': "declaration",
    },
    {
      'image': "assets/images/pdf-file.png",
      'name': "pdf",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          alignment: const Alignment(0, 2),
          icon: const Icon(CupertinoIcons.arrow_down_left_square),
          onPressed: () {
            setState(() {
              Navigator.of(context).pop();
            });
          },
        ),
        title: const Text(
          "\nResume Builder",
          style: TextStyle(
            fontSize: 25,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            height: 100,
            width: double.infinity,
            color: Colors.blue,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: const [
                Text(
                  "Build Options",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          // ignore: prefer_const_constructors
          SizedBox(
            height: 2,
          ),
          SizedBox(
            height: 600,
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: bul
                    .map((e) => Column(
                          children: [
                            InkWell(
                              onTap: () {
                                setState(() {
                                  if (e['name'] == "Contact Info") {
                                    Navigator.of(context).pushNamed("contact");
                                  } else if (e['name'] == "Carrier Objective") {
                                    Navigator.of(context).pushNamed("carrier");
                                  } else if (e['name'] == "Personal Details") {
                                    global.marital_status = "marital";
                                    Navigator.of(context).pushNamed("personal");
                                  } else if (e['name'] == "Education") {
                                    Navigator.of(context).pushNamed("eduction");
                                  } else if (e['name'] == "Experiences") {
                                    // global.employed_status = "status";
                                    Navigator.of(context)
                                        .pushNamed("experience");
                                  } else if (e['name'] == "Technical Skills") {
                                    Navigator.of(context)
                                        .pushNamed("technical");
                                  } else if (e['name'] == "Interest/Hobbies") {
                                    Navigator.of(context).pushNamed("hobbies");
                                  } else if (e['name'] == "Projects") {
                                    Navigator.of(context).pushNamed("project");
                                  } else if (e['name'] == "Achievements") {
                                    Navigator.of(context)
                                        .pushNamed("achievement");
                                  } else if (e['name'] == "References") {
                                    Navigator.of(context)
                                        .pushNamed("reference");
                                  } else if (e['name'] == "declaration") {
                                    Navigator.of(context)
                                        .pushNamed("declaration");
                                  } else {
                                    Navigator.of(context).pushNamed("pdf");
                                  }
                                  // else if (e['name'] == "References") {
                                  // Navigator.of(context)
                                  //     .pushNamed("reference");
                                  // }
                                });
                              },
                              child: Ink(
                                color: Colors.white,
                                child: SizedBox(
                                  height: 65,
                                  width: double.infinity,
                                  child: Row(
                                    children: [
                                      const SizedBox(
                                        width: 20,
                                      ),
                                      Image.asset(
                                        "${e['image']}",
                                        height: 45,
                                      ),
                                      const SizedBox(
                                        width: 35,
                                      ),
                                      Text(
                                        "${e['name']}",
                                        style: const TextStyle(fontSize: 20),
                                      ),
                                      const Spacer(),
                                      const Icon(
                                          Icons.arrow_forward_ios_outlined),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 3,
                            ),
                            const Divider(
                              height: 5,
                              color: Colors.grey,
                            ),
                          ],
                        ))
                    .toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
