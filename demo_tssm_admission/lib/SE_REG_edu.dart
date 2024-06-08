import 'Payment.dart';
import 'Starting_pages/customtext.dart';
import 'package:flutter/material.dart';

import 'database/db.dart';

class SEEducation extends StatefulWidget {
  const SEEducation({Key? key}) : super(key: key);

  @override
  State<SEEducation> createState() => _SEEducationState();
}

class _SEEducationState extends State<SEEducation> {
  final TextEditingController _FEsem1Con = TextEditingController();
  final TextEditingController _FEsem2Con = TextEditingController();

  void _navigateToNextScreen() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const Payment(),
      ),
    );
  }

  Future<void> saveData() async {
    Map<String, dynamic> formData = {
      "FEsem1": _FEsem1Con.text,
      "FEsem2": _FEsem2Con.text,
    };

    print(formData);

    await DatabaseMethods().savefeMarks(formData);
  }

  Future<void> nextButton() async {
    await saveData();
    _navigateToNextScreen();
  }

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
          "Academic Records",
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
              "About Education",
              style: TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 9, 106, 103),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              "FE Marks:",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Color.fromARGB(255, 74, 73, 73),
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              "1. 1st Sem :",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Color.fromARGB(255, 74, 73, 73),
              ),
            ),
            const SizedBox(height: 10),
            MyTextField(
              // Use the appropriate controller for English marks
              // For example, create a new TextEditingController if needed
              //controller: englishMarksController,
              dynamicController: _FEsem1Con,
              hintText: "Enter CGPA/SGPA",
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 10),
            const Text(
              "2. 2nd Sem:",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Color.fromARGB(255, 74, 73, 73),
              ),
            ),
            const SizedBox(height: 10),
            MyTextField(
              dynamicController: _FEsem2Con,
              hintText: "Enter CGPA/SGPA",
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 20),
            Container(
              alignment: Alignment.bottomRight,
              child: ElevatedButton(
                onPressed: nextButton,
                style: ButtonStyle(
                  backgroundColor: const MaterialStatePropertyAll(
                    Color.fromARGB(255, 116, 230, 240),
                  ),
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
