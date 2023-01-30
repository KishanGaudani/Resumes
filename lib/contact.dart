// ignore_for_file: sized_box_for_whitespace

import 'dart:io';
import 'global.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

// ignore: camel_case_types
class contact extends StatefulWidget {
  const contact({Key? key}) : super(key: key);

  @override
  State<contact> createState() => _contactState();
}

// ignore: non_constant_identifier_names
double contact_border = 3;
// ignore: non_constant_identifier_names
double photo_border = 0;

final ImagePicker piker = ImagePicker();
File? imgFile;

// ignore: non_constant_identifier_names
final GlobalKey<FormState> Controllerkey = GlobalKey<FormState>();
TextEditingController name = TextEditingController();
TextEditingController email = TextEditingController();
TextEditingController phone = TextEditingController();
TextEditingController a = TextEditingController();
TextEditingController b = TextEditingController();
TextEditingController c = TextEditingController();

// ignore: camel_case_types
class _contactState extends State<contact> {
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;

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
          "\nResume Workspace",
          style: TextStyle(fontSize: 25, color: Colors.white),
        ),
        centerTitle: true,
      ),
      backgroundColor: Colors.white.withOpacity(0.85),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        contact_border = 3;
                        photo_border = 0;
                      });
                    },
                    child: Container(
                      height: 80,
                      width: double.infinity,
                      alignment: const Alignment(0, 0.8),
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          border: Border.lerp(
                              Border(
                                  bottom: BorderSide(
                                      width: contact_border,
                                      color: Colors.white.withOpacity(0.9))),
                              const Border(),
                              0)),
                      child: const Text(
                        "Contact",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: Colors.white),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        contact_border = 0;
                        photo_border = 3;
                      });
                    },
                    child: Container(
                      height: 80,
                      width: double.infinity,
                      alignment: const Alignment(0, 0.8),
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          border: Border.lerp(
                              Border(
                                  bottom: BorderSide(
                                      width: photo_border,
                                      color: Colors.white.withOpacity(0.9))),
                              const Border(),
                              0)),
                      child: const Text(
                        "Photo",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            (photo_border == 3)
                ? Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(25),
                        child: Container(
                          height: h * 0.3,
                          width: w,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10)),
                          child: Stack(
                            alignment: const Alignment(0.9, 1.1),
                            children: [
                              CircleAvatar(
                                backgroundImage: (imgFile != null)
                                    ? FileImage(imgFile!)
                                    : null,
                                radius: 80,
                                child: (imgFile != null)
                                    ? const Text("")
                                    : const Text("ADD"),
                              ),
                              FloatingActionButton(
                                mini: true,
                                onPressed: () {
                                  showGeneralDialog(
                                    context: context,
                                    pageBuilder: (context, _, __) => Scaffold(
                                      backgroundColor: Colors.black,
                                      body: Container(
                                        alignment: Alignment.center,
                                        child: Column(
                                          children: [
                                            const Spacer(),
                                            Container(
                                              width: w * 0.90,
                                              height: h * 0.2,
                                              alignment: Alignment.center,
                                              decoration: const BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.vertical(
                                                    top: Radius.circular(20),
                                                    bottom: Radius.circular(20),
                                                  )),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Row(
                                                    children: [
                                                      const SizedBox(width: 30),
                                                      InkWell(
                                                        onTap: () async {
                                                          XFile? image =
                                                              await piker.pickImage(
                                                                  source:
                                                                      ImageSource
                                                                          .camera);
                                                          global.memoryImage =
                                                              await image!
                                                                  .readAsBytes();

                                                          setState(() {
                                                            imgFile = File(image
                                                                .path); // ignore: unnecessary_non_null_assertion
                                                            global.myimage =
                                                                imgFile;
                                                            Navigator.of(
                                                                    context)
                                                                .pop();
                                                          });
                                                        },
                                                        child: Image.asset(
                                                            "assets/images/photo-camera-interface-symbol-for-button.png",
                                                            height: 70),
                                                      ),
                                                      const Spacer(),
                                                      InkWell(
                                                        onTap: () async {
                                                          XFile? image =
                                                              await piker.pickImage(
                                                                  source: ImageSource
                                                                      .gallery);
                                                          global.memoryImage =
                                                              await image!
                                                                  .readAsBytes();
                                                          setState(() {
                                                            imgFile = File(image
                                                                .path); // ignore: unnecessary_non_null_assertion
                                                            global.myimage =
                                                                imgFile;
                                                            Navigator.of(
                                                                    context)
                                                                .pop();
                                                          });
                                                        },
                                                        child: Image.asset(
                                                            "assets/images/image-gallery.png",
                                                            height: 70),
                                                      ),
                                                      const SizedBox(width: 30),
                                                    ],
                                                  ),
                                                  Row(
                                                    children: const [
                                                      SizedBox(width: 30),
                                                      Text(
                                                        "camera",
                                                        style: TextStyle(
                                                            fontSize: 20),
                                                      ),
                                                      Spacer(),
                                                      Text(
                                                        "gallery ",
                                                        style: TextStyle(
                                                            fontSize: 20),
                                                      ),
                                                      SizedBox(width: 30),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                            const SizedBox(height: 20),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                },
                                child: const Icon(Icons.add),
                              )
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      (imgFile == null)
                          ? Container()
                          : SizedBox(
                              width: 100,
                              child: ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    imgFile = null;
                                    global.myimage = null;
                                  });
                                },
                                child: const Text("Reset"),
                              ),
                            ),
                    ],
                  )
                : Padding(
                    padding: const EdgeInsets.all(25),
                    child: Container(
                      height: h * 0.60,
                      width: w,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Form(
                        key: Controllerkey,
                        child: Padding(
                          padding: const EdgeInsets.all(20),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Image.asset(
                                    "assets/images/user.png",
                                    height: 40,
                                  ),
                                  const Spacer(),
                                  Container(
                                    height: 50,
                                    width: w * 0.6,
                                    child: TextFormField(
                                      controller: name,
                                      validator: (val) {
                                        if (val!.isEmpty) {
                                          return "please enter you name";
                                        }
                                        return null;
                                      },
                                      onSaved: (val) {
                                        setState(() {
                                          global.name = val;
                                        });
                                      },
                                      decoration: const InputDecoration(
                                          hintText: "Name"),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 15),
                              Row(
                                children: [
                                  Image.asset(
                                    "assets/images/email.png",
                                    height: 40,
                                  ),
                                  const Spacer(),
                                  Container(
                                    height: 50,
                                    width: w * 0.6,
                                    child: TextFormField(
                                      controller: email,
                                      onSaved: (val) {
                                        setState(() {
                                          global.email = val;
                                        });
                                      },
                                      validator: (val) {
                                        if (val!.isEmpty) {
                                          return "please enter you email";
                                        }
                                        return null;
                                      },
                                      decoration: const InputDecoration(
                                          hintText: "Email"),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 15),
                              Row(
                                children: [
                                  Image.asset(
                                    "assets/images/telephone.png",
                                    height: 40,
                                  ),
                                  const Spacer(),
                                  Container(
                                    height: 50,
                                    width: w * 0.6,
                                    child: TextFormField(
                                      controller: phone,
                                      onSaved: (val) {
                                        setState(() {
                                          global.phone = val;
                                        });
                                      },
                                      validator: (val) {
                                        if (val!.isEmpty) {
                                          return "please enter you phone number";
                                        } else if (val.length != 10) {
                                          return "enter valid number";
                                        }
                                        return null;
                                      },
                                      keyboardType: const TextInputType
                                          .numberWithOptions(),
                                      decoration: const InputDecoration(
                                          hintText: "Phone"),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 15),
                              Row(
                                children: [
                                  Image.asset(
                                    "assets/images/location.png",
                                    height: 40,
                                  ),
                                  const Spacer(),
                                  Container(
                                    height: 50,
                                    width: w * 0.6,
                                    child: TextFormField(
                                      controller: a,
                                      onSaved: (val) {
                                        setState(() {
                                          global.a = val;
                                        });
                                      },
                                      validator: (val) {
                                        if (val!.isEmpty) {
                                          return "please enter you address";
                                        }
                                        return null;
                                      },
                                      decoration: const InputDecoration(
                                          hintText:
                                              "Address (Street,Building No)"),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 15),
                              Row(
                                children: [
                                  const Spacer(),
                                  Container(
                                    height: 50,
                                    width: w * 0.6,
                                    child: TextFormField(
                                      controller: b,
                                      onSaved: (val) {
                                        setState(() {
                                          global.b = val;
                                        });
                                      },
                                      decoration: const InputDecoration(
                                          hintText: "Address Line 2"),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 15),
                              Row(
                                children: [
                                  const Spacer(),
                                  Container(
                                    height: 50,
                                    width: w * 0.6,
                                    child: TextFormField(
                                      controller: c,
                                      onSaved: (val) {
                                        setState(() {
                                          global.c = val;
                                        });
                                      },
                                      decoration: const InputDecoration(
                                          hintText: "Address Line 3"),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 25),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  ElevatedButton(
                                      onPressed: () {
                                        setState(() {
                                          if (Controllerkey.currentState!
                                              .validate()) {
                                            Controllerkey.currentState!.save();
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(const SnackBar(
                                              content: Text("You Data is Save"),
                                              behavior:
                                                  SnackBarBehavior.floating,
                                            ));
                                          }
                                        });
                                      },
                                      child: const Text("SAVE")),
                                  ElevatedButton(
                                      onPressed: () {
                                        name.clear();
                                        email.clear();
                                        phone.clear();
                                        a.clear();
                                        b.clear();
                                        c.clear();

                                        setState(() {
                                          global.name = '';
                                          global.phone = '';
                                          global.email = '';
                                          global.a = '';
                                          global.b = '';
                                          global.c = '';
                                        });
                                      },
                                      child: const Text("RESET"))
                                ],
                              ),
                            ],
                          ),
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
