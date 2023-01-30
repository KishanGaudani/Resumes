import 'dart:typed_data';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'global.dart';

// ignore: camel_case_types
class pdf extends StatefulWidget {
  const pdf({Key? key}) : super(key: key);

  @override
  State<pdf> createState() => _pdfState();
}

// ignore: camel_case_types
class _pdfState extends State<pdf> {
  final pdf = pw.Document();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    buildandsavepdf();
  }

  buildandsavepdf() async {
    pdf.addPage(
      pw.Page(
        build: (pw.Context context) => pw.Column(
          children: [
            pw.Text(
              "${global.name}",
              style: const pw.TextStyle(fontSize: 20),
            ),
            pw.Row(
              mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
                pw.Expanded(
                  flex: 3,
                  child: pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    children: [
                      pw.Text(
                        (global.name == null) ? "" : "${global.name}",
                        style: pw.TextStyle(
                          fontWeight: pw.FontWeight.bold,
                          fontSize: 18,
                          color: PdfColors.black,
                        ),
                      ),
                      pw.Text(
                        "${global.a == null ? "" : "${global.a}"}\n${global.b == null ? "" : "${global.b}"}\n${global.c == null ? "" : "${global.c}"}",
                        style: const pw.TextStyle(
                            fontSize: 18, color: PdfColors.black),
                      ),
                      pw.Row(children: [
                        pw.Text(
                          "Email : ",
                          style: pw.TextStyle(
                              fontWeight: pw.FontWeight.bold,
                              fontSize: 18,
                              color: PdfColors.black),
                        ),
                        pw.Text(
                          global.email == null ? "" : "${global.email}",
                          style: const pw.TextStyle(
                              fontSize: 18, color: PdfColors.black),
                        ),
                      ]),
                      pw.Row(
                        children: [
                          pw.Text(
                            "Mobile Number : ",
                            style: pw.TextStyle(
                                fontWeight: pw.FontWeight.bold,
                                fontSize: 18,
                                color: PdfColors.black),
                          ),
                          pw.Text(
                            global.phone == null ? "" : "${global.phone}",
                            style: const pw.TextStyle(
                                fontSize: 18, color: PdfColors.black),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                pw.Expanded(
                  child: pw.Column(
                    children: [
                      pw.Container(
                        height: 100,
                        width: 100,
                        decoration: const pw.BoxDecoration(
                          shape: pw.BoxShape.circle,
                        ),
                        alignment: pw.Alignment.center,
                        child: pw.Image(
                          pw.MemoryImage(
                            global.myimage!.readAsBytesSync(),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            pw.SizedBox(
              height: 20,
            ),
            pw.Text(
              "Carrier objective",
              style: pw.TextStyle(
                  color: PdfColors.black,
                  fontSize: 21,
                  fontWeight: pw.FontWeight.bold),
            ),
            pw.Divider(
              color: PdfColors.blue,
              thickness: 2,
            ),
            pw.SizedBox(
              height: 10,
            ),
            pw.Row(
              children: [
                pw.Text(
                  "Career Objective : ",
                  style: pw.TextStyle(
                      fontWeight: pw.FontWeight.bold,
                      fontSize: 18,
                      color: PdfColors.black),
                ),
                pw.Text(
                  global.car == null ? "" : "${global.car}",
                  style:
                      const pw.TextStyle(fontSize: 18, color: PdfColors.black),
                ),
              ],
            ),
            pw.Row(
              children: [
                pw.Text(
                  "Current Designation : ",
                  style: pw.TextStyle(
                      fontWeight: pw.FontWeight.bold,
                      fontSize: 18,
                      color: PdfColors.black),
                ),
                pw.Text(
                  global.Desi == null ? "" : "${global.Desi}",
                  style:
                      const pw.TextStyle(fontSize: 18, color: PdfColors.black),
                ),
              ],
            ),
            pw.SizedBox(
              height: 20,
            ),
            pw.Text(
              "Personal Details",
              style: pw.TextStyle(
                  color: PdfColors.black,
                  fontSize: 21,
                  fontWeight: pw.FontWeight.bold),
            ),
            pw.Divider(
              color: PdfColors.blue,
              thickness: 2,
            ),
            pw.SizedBox(
              height: 10,
            ),
            pw.Row(
              children: [
                pw.Text(
                  "Date Of Birth : ",
                  style: pw.TextStyle(
                      fontWeight: pw.FontWeight.bold,
                      fontSize: 18,
                      color: PdfColors.black),
                ),
                pw.Text(
                  global.dob == null ? "" : "${global.dob}",
                  style:
                      const pw.TextStyle(fontSize: 18, color: PdfColors.black),
                ),
              ],
            ),
            pw.Row(children: [
              pw.Text(
                "Marital Status : ",
                style: pw.TextStyle(
                    fontWeight: pw.FontWeight.bold,
                    fontSize: 18,
                    color: PdfColors.black),
              ),
              pw.Text(
                global.marital_status == null ? "" : "${global.marital_status}",
                style: const pw.TextStyle(fontSize: 18, color: PdfColors.black),
              ),
            ]),
            pw.Row(children: [
              pw.Text(
                "Languages Known : ",
                style: pw.TextStyle(
                    fontWeight: pw.FontWeight.bold,
                    fontSize: 18,
                    color: PdfColors.black),
              ),
              pw.Text(
                "${(global.isEnglish == false) ? "" : "English,"}${(global.isHindi == false) ? "" : "Hindi,"}${(global.isGujarati == false) ? "" : "Gujarati"}",
                style: const pw.TextStyle(fontSize: 18, color: PdfColors.black),
              ),
            ]),
            pw.Row(children: [
              pw.Text(
                "Nationality : ",
                style: pw.TextStyle(
                    fontWeight: pw.FontWeight.bold,
                    fontSize: 18,
                    color: PdfColors.black),
              ),
              pw.Text(
                global.nationality == null ? "" : "${global.nationality}",
                style: const pw.TextStyle(fontSize: 18, color: PdfColors.black),
              ),
            ]),
            pw.SizedBox(
              height: 20,
            ),
            pw.Text(
              "Education",
              style: pw.TextStyle(
                  color: PdfColors.black,
                  fontSize: 21,
                  fontWeight: pw.FontWeight.bold),
            ),
            pw.Divider(
              color: PdfColors.blue,
              thickness: 2,
            ),
            pw.SizedBox(
              height: 10,
            ),
            pw.Row(children: [
              pw.Text(
                "Course/Degree : ",
                style: pw.TextStyle(
                    fontWeight: pw.FontWeight.bold,
                    fontSize: 18,
                    color: PdfColors.black),
              ),
              pw.Text(
                global.degree == null ? "" : "${global.degree}",
                style: const pw.TextStyle(fontSize: 18, color: PdfColors.black),
              ),
            ]),
            pw.Row(
              children: [
                pw.Text(
                  "School/Collage/Institute : ",
                  style: pw.TextStyle(
                      fontWeight: pw.FontWeight.bold,
                      fontSize: 18,
                      color: PdfColors.black),
                ),
                pw.Text(
                  global.school == null ? "" : "${global.school}",
                  style:
                      const pw.TextStyle(fontSize: 18, color: PdfColors.black),
                ),
              ],
            ),
            pw.Row(children: [
              pw.Text(
                "School/Collage/Institute : ",
                style: pw.TextStyle(
                    fontWeight: pw.FontWeight.bold,
                    fontSize: 18,
                    color: PdfColors.black),
              ),
              pw.Text(
                global.school == null ? "" : "${global.school}",
                style: const pw.TextStyle(fontSize: 18, color: PdfColors.black),
              ),
            ]),
            pw.Row(children: [
              pw.Text(
                "Passing Year : ",
                style: pw.TextStyle(
                    fontWeight: pw.FontWeight.bold,
                    fontSize: 18,
                    color: PdfColors.black),
              ),
              pw.Text(
                global.year_is_passing == null
                    ? ""
                    : "${global.year_is_passing}",
                style: const pw.TextStyle(fontSize: 18, color: PdfColors.black),
              ),
            ]),
            pw.SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
    pdf.addPage(
      pw.Page(
        build: (pw.Context context) => pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: [
            pw.Text(
              "Experience",
              style: pw.TextStyle(
                  color: PdfColors.black,
                  fontSize: 21,
                  fontWeight: pw.FontWeight.bold),
            ),
            pw.Divider(
              color: PdfColors.blue,
              thickness: 2,
            ),
            pw.SizedBox(
              height: 10,
            ),
            pw.Row(children: [
              pw.Text(
                "Company Name : ",
                style: pw.TextStyle(
                    fontWeight: pw.FontWeight.bold,
                    fontSize: 18,
                    color: PdfColors.black),
              ),
              pw.Text(
                global.company_name == null ? "" : "${global.company_name}",
                style: const pw.TextStyle(fontSize: 18, color: PdfColors.black),
              ),
            ]),
            pw.Row(children: [
              pw.Text(
                "School/Collage/Institute : ",
                style: pw.TextStyle(
                    fontWeight: pw.FontWeight.bold,
                    fontSize: 18,
                    color: PdfColors.black),
              ),
              pw.Text(
                global.test == null ? "" : "${global.test}",
                style: const pw.TextStyle(fontSize: 18, color: PdfColors.black),
              ),
            ]),
            pw.Row(children: [
              pw.Text(
                "Employed Status : ",
                style: pw.TextStyle(
                    fontWeight: pw.FontWeight.bold,
                    fontSize: 18,
                    color: PdfColors.black),
              ),
              pw.Text(
                global.employed_status == null
                    ? ""
                    : "${global.employed_status}",
                style: const pw.TextStyle(fontSize: 18, color: PdfColors.black),
              ),
            ]),
            pw.Row(children: [
              pw.Text(
                "Joining Date : ",
                style: pw.TextStyle(
                    fontWeight: pw.FontWeight.bold,
                    fontSize: 18,
                    color: PdfColors.black),
              ),
              pw.Text(
                global.join_date == null ? "" : "${global.join_date}",
                style: const pw.TextStyle(fontSize: 18, color: PdfColors.black),
              ),
            ]),
            pw.Row(children: [
              pw.Text(
                "Exit Date : ",
                style: pw.TextStyle(
                    fontWeight: pw.FontWeight.bold,
                    fontSize: 18,
                    color: PdfColors.black),
              ),
              pw.Text(
                global.end_date == null ? "" : "${global.end_date}",
                style: const pw.TextStyle(fontSize: 18, color: PdfColors.black),
              ),
            ]),
            pw.SizedBox(
              height: 20,
            ),
            pw.Text(
              "Technical Skills",
              style: pw.TextStyle(
                  color: PdfColors.black,
                  fontSize: 21,
                  fontWeight: pw.FontWeight.bold),
            ),
            pw.Divider(
              color: PdfColors.blue,
              thickness: 2,
            ),
            pw.SizedBox(
              height: 10,
            ),
            pw.Row(children: [
              pw.Text(
                "Skills : ",
                style: pw.TextStyle(
                    fontWeight: pw.FontWeight.bold,
                    fontSize: 18,
                    color: PdfColors.black),
              ),
              pw.Text(
                // ignore: unnecessary_null_comparison
                global.Skils == null ? "" : "${global.Skils}",
                style: const pw.TextStyle(fontSize: 18, color: PdfColors.black),
              ),
            ]),
            pw.SizedBox(
              height: 20,
            ),
            pw.Text(
              "Interest / Hobbies",
              style: pw.TextStyle(
                  color: PdfColors.black,
                  fontSize: 21,
                  fontWeight: pw.FontWeight.bold),
            ),
            pw.Divider(
              color: PdfColors.blue,
              thickness: 2,
            ),
            pw.SizedBox(
              height: 10,
            ),
            pw.Text(
              "Projects",
              style: pw.TextStyle(
                  color: PdfColors.black,
                  fontSize: 21,
                  fontWeight: pw.FontWeight.bold),
            ),
            pw.Divider(
              color: PdfColors.blue,
              thickness: 2,
            ),
            pw.SizedBox(
              height: 10,
            ),
            pw.Row(children: [
              pw.Text(
                "Project Title : ",
                style: pw.TextStyle(
                    fontWeight: pw.FontWeight.bold,
                    fontSize: 18,
                    color: PdfColors.black),
              ),
              pw.Text(
                global.project_title == null ? "" : "${global.project_title}",
                style: const pw.TextStyle(fontSize: 18, color: PdfColors.black),
              ),
            ]),
            pw.Row(children: [
              pw.Text(
                "Technologies : ",
                style: pw.TextStyle(
                    fontWeight: pw.FontWeight.bold,
                    fontSize: 18,
                    color: PdfColors.black),
              ),
              pw.Text(
                "${(global.isc == false) ? "" : "C Programming,"}${(global.isc__ == false) ? "" : "C++,"}${(global.isflutter == false) ? "" : "Flutter"}",
                style: const pw.TextStyle(fontSize: 18, color: PdfColors.black),
              ),
            ]),
            pw.Row(children: [
              pw.Text(
                "Roles : ",
                style: pw.TextStyle(
                    fontWeight: pw.FontWeight.bold,
                    fontSize: 18,
                    color: PdfColors.black),
              ),
              pw.Text(
                global.roles2 == null ? "" : "${global.roles2}",
                style: const pw.TextStyle(fontSize: 18, color: PdfColors.black),
              ),
            ]),
            pw.Row(children: [
              pw.Text(
                "Technologies : ",
                style: pw.TextStyle(
                    fontWeight: pw.FontWeight.bold,
                    fontSize: 18,
                    color: PdfColors.black),
              ),
              pw.Text(
                global.technologies == null ? "" : "${global.technologies}",
                style: const pw.TextStyle(fontSize: 18, color: PdfColors.black),
              ),
            ]),
            pw.SizedBox(
              height: 20,
            ),
            pw.Text(
              "Achievements",
              style: pw.TextStyle(
                  color: PdfColors.black,
                  fontSize: 21,
                  fontWeight: pw.FontWeight.bold),
            ),
            pw.Divider(
              color: PdfColors.blue,
              thickness: 2,
            ),
            pw.SizedBox(
              height: 10,
            ),
            pw.Row(children: [
              pw.Text(
                "Achievements : ",
                style: pw.TextStyle(
                    fontWeight: pw.FontWeight.bold,
                    fontSize: 18,
                    color: PdfColors.black),
              ),
              pw.Text(
                // ignore: unnecessary_null_comparison
                global.Achivement == null ? "" : "${global.Achivement}",
                style: const pw.TextStyle(fontSize: 18, color: PdfColors.black),
              ),
            ]),
            pw.SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
    pdf.addPage(
      pw.Page(
        build: (pw.Context context) => pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: [
            pw.Text(
              "Reference",
              style: pw.TextStyle(
                  color: PdfColors.black,
                  fontSize: 21,
                  fontWeight: pw.FontWeight.bold),
            ),
            pw.Divider(
              color: PdfColors.blue,
              thickness: 2,
            ),
            pw.SizedBox(
              height: 10,
            ),
            pw.Row(children: [
              pw.Text(
                "Reference Name : ",
                style: pw.TextStyle(
                    fontWeight: pw.FontWeight.bold,
                    fontSize: 18,
                    color: PdfColors.black),
              ),
              pw.Text(
                global.refrence_name == null ? "" : "${global.refrence_name}",
                style: const pw.TextStyle(fontSize: 18, color: PdfColors.black),
              ),
            ]),
            pw.Row(children: [
              pw.Text(
                "Designation : ",
                style: pw.TextStyle(
                    fontWeight: pw.FontWeight.bold,
                    fontSize: 18,
                    color: PdfColors.black),
              ),
              pw.Text(
                global.desingnation == null ? "" : "${global.desingnation}",
                style: const pw.TextStyle(fontSize: 18, color: PdfColors.black),
              ),
            ]),
            pw.Row(children: [
              pw.Text(
                "Organization/Institute : ",
                style: pw.TextStyle(
                    fontWeight: pw.FontWeight.bold,
                    fontSize: 18,
                    color: PdfColors.black),
              ),
              pw.Text(
                global.institute == null ? "" : "${global.institute}",
                style: const pw.TextStyle(fontSize: 18, color: PdfColors.black),
              ),
            ]),
            pw.SizedBox(
              height: 20,
            ),
            pw.Text(
              "Declaration",
              style: pw.TextStyle(
                  color: PdfColors.black,
                  fontSize: 21,
                  fontWeight: pw.FontWeight.bold),
            ),
            pw.Divider(
              color: PdfColors.blue,
              thickness: 2,
            ),
            pw.SizedBox(
              height: 10,
            ),
            pw.Row(children: [
              pw.Text(
                "Description : ",
                style: pw.TextStyle(
                    fontWeight: pw.FontWeight.bold,
                    fontSize: 18,
                    color: PdfColors.black),
              ),
              pw.Text(
                global.descripation2 == null ? "" : "${global.descripation2}",
                style: const pw.TextStyle(fontSize: 18, color: PdfColors.black),
              ),
            ]),
            pw.Row(children: [
              pw.Text(
                "Date : ",
                style: pw.TextStyle(
                    fontWeight: pw.FontWeight.bold,
                    fontSize: 18,
                    color: PdfColors.black),
              ),
              pw.Text(
                global.date2 == null ? "" : "${global.date2}",
                style: const pw.TextStyle(fontSize: 18, color: PdfColors.black),
              ),
            ]),
            pw.Row(children: [
              pw.Text(
                "Place(interview venue) : ",
                style: pw.TextStyle(
                    fontWeight: pw.FontWeight.bold,
                    fontSize: 18,
                    color: PdfColors.black),
              ),
              pw.Text(
                global.place == null ? "" : "${global.place}",
                style: const pw.TextStyle(fontSize: 18, color: PdfColors.black),
              ),
            ]),
            pw.SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            CupertinoIcons.back,
            size: 30,
            color: Colors.white,
          ),
        ),
        toolbarHeight: 150,
        title: const Text(
          "PDF Preview",
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.w500,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () async {
              Uint8List data = await pdf.save();
              await Printing.layoutPdf(onLayout: (format) => data);
            },
            icon: const Icon(
              Icons.picture_as_pdf_outlined,
              size: 30,
            ),
          ),
          const SizedBox(
            width: 20,
          )
        ],
      ),
      body: Container(
        alignment: Alignment.center,
        child: GestureDetector(
          onTap: () async {
            Uint8List data = await pdf.save();
            await Printing.layoutPdf(onLayout: (format) => data);
          },
          child: const Icon(
            Icons.picture_as_pdf_outlined,
            size: 200,
          ),
        ),
      ),
      backgroundColor: Colors.grey.shade300,
    );
  }
}
