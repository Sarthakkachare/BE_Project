
import 'SE_REG_edu.dart';
import 'Starting_pages/customtext.dart';
import 'package:flutter/material.dart';

import 'database/db.dart';

// ignore: camel_case_types
class SE_regular extends StatefulWidget {
  const SE_regular({super.key});

  @override
  State createState() => _SE_redular();
}

class _SE_redular extends State {

  void _navigateToNextScreen() {

        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>const  SEEducation(),
            ),
          );
  }

  Future<void> saveData() async {
    Map<String, dynamic> seRegularAdmissionDetails = {
  "branchSelection": branchselection.text,
  "year": _yearController.text,
  "firstYear": _firstyearController.text,
  "regularAdmission": _regularadmissionController.text,
  "provisionalAdmission": _provisionaladmissionController.text,
  "transferAdmission": _transferadmissionController.text,
  "prevCollegeName": _prevCollegeName.text,
  "eligibilityNo": eligibilityNoController.text,
  "prnNo": prnNoController.text,
};

    print(seRegularAdmissionDetails);

    await DatabaseMethods()
        .saveseRegularAdmissionDetails(seRegularAdmissionDetails);
  }

  Future<void> nextButton() async {
    await saveData();
    _navigateToNextScreen();
  }

  final TextEditingController branchselection = TextEditingController();
  final TextEditingController _yearController = TextEditingController();
  final TextEditingController _firstyearController = TextEditingController();
  final TextEditingController _regularadmissionController = TextEditingController();
  final TextEditingController _provisionaladmissionController = TextEditingController();
  final TextEditingController _transferadmissionController = TextEditingController();
  final TextEditingController _prevCollegeName = TextEditingController();
  final TextEditingController eligibilityNoController = TextEditingController();
  final TextEditingController prnNoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        shadowColor: const Color.fromARGB(255, 136, 213, 212),
        elevation: 15,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30))),
        title: const Text(
          "Additional Information",
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 14, 154, 167),
      ),
      backgroundColor: const Color.fromARGB(255, 229, 253, 255),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            const Text(
              "Additional Details",
              style: TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 9, 106, 103),
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              "1. Enter Academic Year:",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Color.fromARGB(255, 74, 73, 73),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            MyTextField(
              dynamicController: _yearController,
              hintText: 'Enter academic year',
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 10),
            const Text(
              "2. Select Branch:",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Color.fromARGB(255, 74, 73, 73),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            DropdownButtonFormField<String>(
              value:
                  branchselection.text.isNotEmpty ? branchselection.text : null,
              items: [
                "Computer Science",
                "Electrical",
                "Electronics and Telecommunication",
                "Civil",
                "Mechanical",
                "Information Technology",
                "Artificial Intelligence",
              ].map((String category) {
                return DropdownMenuItem<String>(
                  value: category,
                  child: Text(category),
                );
              }).toList(),
              onChanged: (String? value) {
                if (value != null) {
                  setState(() {
                    branchselection.text = value;
                  });
                }
              },
              decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: "Select Branch",
                  hintStyle: const TextStyle(
                    fontWeight: FontWeight.w400,
                    color: Color.fromARGB(255, 66, 64, 64),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    gapPadding: 7,
                    borderSide: const BorderSide(
                        color: Color.fromARGB(255, 5, 118, 120), width: 1.5),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    gapPadding: 7,
                    borderSide:
                        const BorderSide(color: Colors.pink, width: 1.5),
                  )),
            ),
            const SizedBox(
              height: 10,
            ),
             const Text(
              "3. Enter Year of admission in first time in college : ",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Color.fromARGB(255, 74, 73, 73),
              ),
            ),
            
            const SizedBox(
              height: 10,
            ),
            MyTextField(
              dynamicController: _firstyearController,
              hintText: 'Enter Year of Admission',
              keyboardType: TextInputType.number,
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "4. Do you have regular admission? ",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Color.fromARGB(255, 74, 73, 73),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            DropdownButtonFormField<String>(
              value:
                  _regularadmissionController.text.isNotEmpty ? _regularadmissionController.text : null,
              items: [
                "Yes",
                "No",
                
              ].map((String category) {
                return DropdownMenuItem<String>(
                  value: category,
                  child: Text(category),
                );
              }).toList(),
              onChanged: (String? value) {
                if (value != null) {
                  setState(() {
                    _regularadmissionController.text = value;
                  });
                }
              },
              decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: "Select Option",
                  hintStyle: const TextStyle(
                    fontWeight: FontWeight.w400,
                    color: Color.fromARGB(255, 66, 64, 64),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    gapPadding: 7,
                    borderSide: const BorderSide(
                        color: Color.fromARGB(255, 5, 118, 120), width: 1.5),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    gapPadding: 7,
                    borderSide:
                        const BorderSide(color: Colors.pink, width: 1.5),
                  )),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "5. Do you have Provisional admission? ",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Color.fromARGB(255, 74, 73, 73),
              ),
            ),
               const SizedBox(
              height: 10,
            ),
             DropdownButtonFormField<String>(
              value:
                  _provisionaladmissionController.text.isNotEmpty ? _provisionaladmissionController.text : null,
              items: [
                "Yes",
                "No",
                
              ].map((String category) {
                return DropdownMenuItem<String>(
                  value: category,
                  child: Text(category),
                );
              }).toList(),
              onChanged: (String? value) {
                if (value != null) {
                  setState(() {
                    _provisionaladmissionController.text = value;
                  });
                }
              },
              decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: "Select Option",
                  hintStyle: const TextStyle(
                    fontWeight: FontWeight.w400,
                    color: Color.fromARGB(255, 66, 64, 64),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    gapPadding: 7,
                    borderSide: const BorderSide(
                        color: Color.fromARGB(255, 5, 118, 120), width: 1.5),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    gapPadding: 7,
                    borderSide:
                        const BorderSide(color: Colors.pink, width: 1.5),
                  )),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "6. Do you have Transfer admission? ",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Color.fromARGB(255, 74, 73, 73),
              ),
            ),
               const SizedBox(
              height: 10,
            ),
             DropdownButtonFormField<String>(
              value:
                  _transferadmissionController.text.isNotEmpty ? _transferadmissionController.text : null,
              items: [
                "Yes",
                "No",
                
              ].map((String category) {
                return DropdownMenuItem<String>(
                  value: category,
                  child: Text(category),
                );
              }).toList(),
              onChanged: (String? value) {
                if (value != null) {
                  setState(() {
                    _transferadmissionController.text = value;
                  });
                }
              },
              decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: "Select Option",
                  hintStyle: const TextStyle(
                    fontWeight: FontWeight.w400,
                    color: Color.fromARGB(255, 66, 64, 64),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    gapPadding: 7,
                    borderSide: const BorderSide(
                        color: Color.fromARGB(255, 5, 118, 120), width: 1.5),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    gapPadding: 7,
                    borderSide:
                        const BorderSide(color: Colors.pink, width: 1.5),
                  )),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "7. Previous College Name (HSC/Diploma/BE) ",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Color.fromARGB(255, 74, 73, 73),
              ),
            ), const SizedBox(
              height: 10,
            ),
            MyTextField(
              dynamicController: _prevCollegeName,
              hintText: 'Enter previous college Name',
            ),
            const SizedBox(
              height: 10,
            ),
             const Text(
              "8. Eligibility No:",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Color.fromARGB(255, 74, 73, 73),
              ),
            ),
            const SizedBox(height: 10),
            MyTextField(
              dynamicController: eligibilityNoController,
              hintText: "Enter eligibility number...",
            ),
            const SizedBox(height: 10),
            const Text(
              "9.PRN No:",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Color.fromARGB(255, 74, 73, 73),
              ),
            ),
            const SizedBox(height: 10),
            MyTextField(
              dynamicController: prnNoController,
              hintText: "Enter PRN number...",
            ),
            const SizedBox(height: 25),
            Container(
              alignment: Alignment.bottomRight,
              child: ElevatedButton(
                onPressed: nextButton,
                style: ButtonStyle(
                  backgroundColor: const MaterialStatePropertyAll( Color.fromARGB(255, 116, 230, 240),),
                  fixedSize: const MaterialStatePropertyAll(Size(150, 50)),
                  shape: MaterialStatePropertyAll(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(45),
                    ),
                  ),
                ),
                child: const Text(
                  "Next",
                  style: TextStyle(fontSize: 20, color: Colors.black),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

