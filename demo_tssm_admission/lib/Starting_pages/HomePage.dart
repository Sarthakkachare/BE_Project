//import 'package:demo_tssm_admission/Starting_pages/Login_Page.dart';
import 'package:demo_tssm_admission/Starting_pages/username.dart';

import '../Parent.dart';
import 'package:flutter/material.dart';

import '../database/db.dart';
//import 'Login_Page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double _scale = 1.0;
  double _textscale = 1.0;


  void _goToSecondScreen() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const Parent(),
      ),
    );
  }

  // Controller for the first name text field
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _midNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _mobNoController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _genderController = TextEditingController();

  Future<void> saveData() async {
    Map<String, dynamic> personalInfo = {
      "FirstName": _firstNameController.text,
      "MiddleName": _midNameController.text,
      "LastName": _lastNameController.text,
      "MobileNumber": _mobNoController.text,
      "Gender": _dateController.text,
      "Date": _dateController.text,
    };

    await DatabaseMethods()
        .savePersonalInfo(personalInfo);
  }

  Future<void> nextButton() async {
    await saveData();
    _goToSecondScreen();
  }

// Variable to store selected gender

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (picked != null && picked != DateTime.now()) {
      _dateController.text = "${picked.day}/${picked.month}/${picked.year}";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80.0,
        shadowColor: const Color.fromARGB(255, 136, 213, 212),
        elevation: 15,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30))),
        title:  Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text(
            UserName.userName,
            style: const TextStyle(
              color: Color.fromARGB(255, 248, 249, 249),
              fontSize: 30,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 14, 154, 167),
      ),
      backgroundColor: const Color.fromARGB(255, 229, 253, 255),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 20, left: 40.0),
              child: Text(
                "Welcome to",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 2.0),
              ),
            ),
            const SizedBox(
              width: 600,
              child: Padding(
                padding: EdgeInsets.only(top: 10.0, left: 100),
                child: Text(
                  "TSSM'S BSCOER",
                  style: TextStyle(
                    shadows: [
                      Shadow(
                          blurRadius: 20,
                          color: Color.fromARGB(255, 70, 70, 71),
                          offset: Offset(10, 10))
                    ],
                    fontWeight: FontWeight.bold,
                    fontSize: 36,
                    color: Color.fromARGB(255, 6, 27, 132),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Center(
              child: MouseRegion(
                onEnter: (event) {
                  setState(() {
                    _scale = 1.02; // Adjust the zoom factor as needed
                  });
                },
                onExit: (event) {
                  setState(() {
                    _scale = 1.0; // Reset the scale factor
                  });
                },
                child: Transform.scale(
                  scale: _scale,
                  child: Image.asset(
                    "lib/assets/Starting_Images/about_Organization.jpg",
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: MouseRegion(
                onEnter: (event) {
                  setState(() {
                    _textscale = 1.02; // Adjust the zoom factor as needed
                  });
                },
                onExit: (event) {
                  setState(() {
                    _textscale = 1.0; // Reset the scale factor
                  });
                },
                child: Transform.scale(
                  scale: _textscale,
                  child: const Text(
                    "Today marks the beginning of your new journey into the sea of learning, and it starts right here at our college.",
                    style: TextStyle(
                      color: Colors.pink,
                      fontStyle: FontStyle.italic,
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 30, left: 20),
              child: Text(
                "Personal Information",
                style: TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(40.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFormField(
                    controller: _firstNameController,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      labelText: 'First Name',
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        gapPadding: 7,
                        borderSide: const BorderSide(
                            color: Color.fromARGB(255, 5, 118, 120),
                            width: 1.5),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: _midNameController,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      labelText: 'Middle Name',
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        gapPadding: 7,
                        borderSide: const BorderSide(
                            color: Color.fromARGB(255, 5, 118, 120),
                            width: 1.5),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: _lastNameController,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      labelText: 'Last Name',
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        gapPadding: 7,
                        borderSide: const BorderSide(
                            color: Color.fromARGB(255, 5, 118, 120),
                            width: 1.5),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: _mobNoController,
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      prefixIcon: const Icon(Icons.phone),
                      labelText: 'Student Mobile No.',
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        gapPadding: 7,
                        borderSide: const BorderSide(
                            color: Color.fromARGB(255, 5, 118, 120),
                            width: 1.5),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  DropdownButtonFormField<String>(
                    value: null,
                    items: ["Male", "Female", "Other"]
                        .map((String value) => DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            ))
                        .toList(),
                    onChanged: (String? value) {
                      _genderController.text = value!;
                    },
                    decoration: InputDecoration(
                      hintText: 'Select Gender',
                      filled: true,
                      fillColor: Colors.white,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        gapPadding: 7,
                        borderSide: const BorderSide(
                            color: Color.fromARGB(255, 5, 118, 120),
                            width: 1.5),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: _dateController,
                    readOnly: true,
                    onTap: () => _selectDate(context),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      labelText: "Select Date",
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        gapPadding: 7,
                        borderSide: const BorderSide(
                            color: Color.fromARGB(255, 5, 118, 120),
                            width: 1.5),
                      ),
                      suffixIcon: const Icon(Icons.date_range_outlined),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Container(
                    alignment: Alignment.bottomRight,
                    //padding: const EdgeInsets.only(right: 20),
                    child: ElevatedButton(
                      onPressed: nextButton,
                      style: ButtonStyle(
                          backgroundColor: const MaterialStatePropertyAll(
                            Color.fromARGB(255, 116, 230, 240),
                          ),
                          shadowColor:
                              const MaterialStatePropertyAll(Colors.blue),
                          fixedSize:
                              const MaterialStatePropertyAll(Size(150, 50)),
                          shape: MaterialStatePropertyAll(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(45)))),
                      child: const Text(
                        "Next",
                        style: TextStyle(fontSize: 20, color: Colors.black),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
