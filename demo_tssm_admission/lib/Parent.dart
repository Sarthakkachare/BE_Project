import 'Starting_pages/customtext.dart';
import 'YearSelection.dart';
import 'package:flutter/material.dart';

import 'database/db.dart';
//import 'package:flutter_application_1/YearSelection.dart';
//import 'thirdscreen.dart';

class Parent extends StatefulWidget {
  const Parent({super.key});

  @override
  State<Parent> createState() => _ParentState();
}

class _ParentState extends State<Parent> {

  void _goToNextcreen() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const YearSelection(),
      ),
   );
  } 

  Future<void> saveData() async {
    Map<String, dynamic> parentInfo = {
      
  "fatherName": fatherNameController.text,
  "motherName": motherNameController.text,
  "fatherEmail": fatherEmailController.text,
  "motherEmail": motherEmailController.text,
  "fatherPhone": fatherPhoneController.text,
  "motherPhone": motherPhoneController.text,
    };

    print(parentInfo);

    await DatabaseMethods()
        .saveParentsInfo(parentInfo);
  }

  Future<void> nextButton() async {
    await saveData();
    _goToNextcreen();
  }

  TextEditingController firstNameController = TextEditingController();
  TextEditingController middleNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController fatherNameController = TextEditingController();
  TextEditingController motherNameController = TextEditingController();
  TextEditingController fatherEmailController = TextEditingController();
  TextEditingController motherEmailController = TextEditingController();
  TextEditingController fatherPhoneController = TextEditingController();
  TextEditingController motherPhoneController = TextEditingController();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (picked != null && picked != DateTime.now()) {
      dateController.text = "${picked.day}/${picked.month}/${picked.year}";
    }
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
        title: const Text("Parents Information",
        style: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.w500,
          color: Colors.white,
        ),),
       backgroundColor: const Color.fromARGB(255, 14, 154, 167),
      ),
      backgroundColor: const Color.fromARGB(255, 229, 253, 255),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Father's Information",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              const Text(
                "Father's Name",
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
                dynamicController: fatherNameController,
                hintText: "First Middle Last",
              ),
              const SizedBox(
                height: 25,
              ),
              const Text(
                "Father's Email",
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
                dynamicController: fatherEmailController,
                hintText: "abc@email.com",
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(
                height: 25,
              ),
              const Text(
                "Father's Phone",
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
                dynamicController: fatherPhoneController,
                hintText: "0000000000",
                keyboardType: TextInputType.phone,
              ),
              const SizedBox(
                height: 25,
              ),
              const Text(
                "Mother's Information",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              const Text(
                "Mother's Name",
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
                dynamicController: motherNameController,
                hintText: "First Name",
              ),
              const SizedBox(
                height: 25,
              ),
              const Text(
                "Mother's Email",
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
                dynamicController: motherEmailController,
                hintText: "xyv@email.com",
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(
                height: 25,
              ),
              const Text(
                "Mother's Phone",
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
                dynamicController: motherPhoneController,
                hintText: "0000000000",
                keyboardType: TextInputType.phone,
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
                    backgroundColor: const MaterialStatePropertyAll( Color.fromARGB(255, 116, 230, 240),),
                      fixedSize: const MaterialStatePropertyAll(Size(150, 50)),
                      shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(45)))),
                  child: const Text(
                    "Next",
                    style: TextStyle(fontSize: 20, color: Colors.black),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}