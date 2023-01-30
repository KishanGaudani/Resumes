import 'package:flutter/material.dart';
import 'global.dart';

// ignore: camel_case_types
class experience extends StatefulWidget {
  const experience({Key? key}) : super(key: key);

  @override
  State<experience> createState() => _experienceState();
}

// ignore: non_constant_identifier_names
final GlobalKey<FormState> Controllerkey = GlobalKey<FormState>();
// ignore: non_constant_identifier_names
final TextEditingController company_name = TextEditingController();
final TextEditingController test = TextEditingController();
final TextEditingController roles = TextEditingController();
// ignore: non_constant_identifier_names
final TextEditingController join_date = TextEditingController();
// ignore: non_constant_identifier_names
final TextEditingController end_date = TextEditingController();

// ignore: camel_case_types
class _experienceState extends State<experience> {
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
          "\nExperiences",
          style: TextStyle(fontSize: 25, color: Colors.white),
        ),
        centerTitle: true,
      ),
      backgroundColor: Colors.white.withOpacity(0.8),
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
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const SizedBox(height: 30),
              Container(
                height: h * 0.74,
                width: w * 0.83,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Form(
                  key: Controllerkey,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        //Company Name
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 30, vertical: 15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 12),
                              Text(
                                "Company Name",
                                style: style.copyWith(fontSize: 18),
                              ),
                              const SizedBox(height: 5),
                              TextFormField(
                                controller: company_name,
                                validator: (val) {
                                  if (val!.isEmpty) {
                                    return "Enter you Company name";
                                  }
                                  return null;
                                },
                                onSaved: (val) {
                                  setState(() {
                                    global.company_name = val;
                                  });
                                },
                                decoration: const InputDecoration(
                                  hintText: "New Enterprise,San Francisco",
                                  border: OutlineInputBorder(),
                                ),
                              ),
                            ],
                          ),
                        ),
                        //School/College/Institute
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 30),
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
                                controller: test,
                                validator: (val) {
                                  if (val!.isEmpty) {
                                    return "Enter you Test";
                                  }
                                  return null;
                                },
                                onSaved: (val) {
                                  setState(() {
                                    global.test = val;
                                  });
                                },
                                decoration: const InputDecoration(
                                  hintText: "Quality Test Engineer ",
                                  border: OutlineInputBorder(),
                                ),
                              ),
                            ],
                          ),
                        ),
                        //Roles
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 30),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 20),
                              Text(
                                "Roles(Optional)",
                                style: style.copyWith(fontSize: 18),
                              ),
                              const SizedBox(height: 8),
                              TextFormField(
                                controller: roles,
                                validator: (val) {
                                  if (val!.isEmpty) {
                                    return "Enter you roles ";
                                  }
                                  return null;
                                },
                                onSaved: (val) {
                                  setState(() {
                                    global.roles = val;
                                  });
                                },
                                maxLines: 3,
                                decoration: const InputDecoration(
                                  hintText:
                                      "Working With Team member to come up with new concepts and product analysis...",
                                  border: OutlineInputBorder(),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 20),
                        //status
                        const Text(
                          "Employed States                                          ",
                          style: TextStyle(fontSize: 15),
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: RadioListTile(
                                  title: Text(
                                    "Previously Employed",
                                    style: style.copyWith(fontSize: 15),
                                  ),
                                  value: "previously Employed",
                                  groupValue: global.employed_status,
                                  onChanged: (val) {
                                    setState(() {
                                      global.employed_status = val;
                                    });
                                  }),
                            ),
                            Expanded(
                              child: RadioListTile(
                                  title: Text(
                                    "Currently Employed",
                                    style: style.copyWith(fontSize: 15),
                                  ),
                                  value: "Currently Employed",
                                  groupValue: global.employed_status1,
                                  onChanged: (val) {
                                    setState(() {
                                      global.employed_status1 = val;
                                    });
                                  }),
                            )
                          ],
                        ),
                        Container(
                          height: 1,
                          width: w * 0.7,
                          color: Colors.black,
                        ),
                        const SizedBox(height: 20),
                        (global.employed_status1 == "Currently Employed")
                            ? Column(
                                // crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                      "Date Joined                                                           "),
                                  const SizedBox(height: 10),
                                  // SizedBox(width: 20),
                                  Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 20),
                                        child: SizedBox(
                                          width: 130,
                                          child: TextFormField(
                                            controller: join_date,
                                            validator: (val) {
                                              if (val!.isEmpty) {
                                                return "Enter you join date";
                                              }
                                              return null;
                                            },
                                            onSaved: (val) {
                                              setState(() {
                                                global.join_date = val;
                                              });
                                            },
                                            decoration: const InputDecoration(
                                                hintText: "DD/MM/YYYY",
                                                border: OutlineInputBorder()),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),

                                  const SizedBox(height: 20),
                                  //save
                                  SizedBox(
                                      width: 100,
                                      child: ElevatedButton(
                                          onPressed: () {
                                            if (Controllerkey.currentState!
                                                .validate()) {
                                              Controllerkey.currentState!
                                                  .save();
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(const SnackBar(
                                                      content: Text(
                                                          "You Data Is Save")));
                                            }
                                          },
                                          child: const Text("SAVE"))),
                                ],
                              )
                            : Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: const [
                                      Text("   Date Joined  "),
                                      Text(
                                          "          Date Exit                        "),
                                    ],
                                  ),
                                  const SizedBox(height: 5),
                                  Row(
                                    children: [
                                      const SizedBox(width: 20),
                                      Expanded(
                                        child: TextFormField(
                                          controller: join_date,
                                          validator: (val) {
                                            if (val!.isEmpty) {
                                              return "Enter you Join date";
                                            }
                                            return null;
                                          },
                                          onSaved: (val) {
                                            setState(() {
                                              global.join_date = val;
                                            });
                                          },
                                          keyboardType: const TextInputType
                                              .numberWithOptions(),
                                          decoration: const InputDecoration(
                                            hintText: "DD/MM/YYYY",
                                            border: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    style: BorderStyle.solid)),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(width: 15),
                                      Expanded(
                                        child: TextFormField(
                                          controller: end_date,
                                          validator: (val) {
                                            if (val!.isEmpty) {
                                              return "Enter you end date";
                                            }
                                            return null;
                                          },
                                          onSaved: (val) {
                                            setState(() {
                                              global.end_date = val;
                                            });
                                          },
                                          keyboardType: const TextInputType
                                              .numberWithOptions(),
                                          decoration: const InputDecoration(
                                            hintText: "DD/MM/YYYY",
                                            border: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    style: BorderStyle.solid)),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(width: 18),
                                    ],
                                  ),
                                  const SizedBox(height: 20),
                                  //save
                                  SizedBox(
                                    width: 100,
                                    child: ElevatedButton(
                                      onPressed: () {
                                        if (Controllerkey.currentState!
                                            .validate()) {
                                          Controllerkey.currentState!.save();
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            const SnackBar(
                                              content: Text(
                                                "You Data Is Save",
                                              ),
                                            ),
                                          );
                                        }
                                      },
                                      child: const Text(
                                        "SAVE",
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                      ],
                    ),
                  ),
                ),
              ),
            ]),
          ],
        ),
      ),
    );
  }
}
