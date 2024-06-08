import 'FE_Education.dart';
import 'Starting_pages/customtext.dart';
import 'package:flutter/material.dart';

import 'database/db.dart';

class FEForm extends StatefulWidget {
  const FEForm({Key? key}) : super(key: key);

  @override
  State<FEForm> createState() => _FEFormState();
}

class _FEFormState extends State<FEForm> {
  TextEditingController correspondenceAddressController =
      TextEditingController();
  TextEditingController permanentAddressController = TextEditingController();
  TextEditingController domicileController = TextEditingController();
  TextEditingController typeOfAddmissionController = TextEditingController();
  TextEditingController casteController = TextEditingController();
  TextEditingController annualIncomeController = TextEditingController();
  TextEditingController religionController = TextEditingController();
  TextEditingController placeOfBirthController = TextEditingController();
  TextEditingController previousCollegeController = TextEditingController();
  TextEditingController eligibilityNoController = TextEditingController();

  void _navigateToNextScreen() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const FEEducation(),
      ),
    );

    print('Correspondence Address: ${correspondenceAddressController.text}');
    print('Permanent Address: ${permanentAddressController.text}');
    print('Domicile (State): ${domicileController.text}');
    print('Reserved Category: ${typeOfAddmissionController.text}');
    print('Caste: ${casteController.text}');
    print('Annual Income: ${annualIncomeController.text}');
    print('Religion: ${religionController.text}');
    print('Place of Birth: ${placeOfBirthController.text}');
    print('Previous College Attended: ${previousCollegeController.text}');
    print('Eligibility No.: ${eligibilityNoController.text}');
  }

  final TextEditingController branchselection = TextEditingController();
  final TextEditingController yearController = TextEditingController();

  Future<void> saveData() async {
    Map<String, dynamic> formData = {
      "branchSelection": branchselection.text,
      "year": yearController.text,
      "correspondenceAddress": correspondenceAddressController.text,
      "permanentAddress": permanentAddressController.text,
      "domicile": domicileController.text,
      "Reserved Category": typeOfAddmissionController.text,
      "caste": casteController.text,
      "annualIncome": annualIncomeController.text,
      "religion": religionController.text,
      "placeOfBirth": placeOfBirthController.text,
      "previousCollege": previousCollegeController.text,
      "eligibilityNo": eligibilityNoController.text,
    };

    print("object");
    print(formData);
    print("object");

    await DatabaseMethods().savefirstYearAdditionalDetails(formData);
  }

  Future<void> nextButton() async {
    print("In next");
    await saveData();
    print("In next");
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
                fontWeight: FontWeight.w800,
                color: Color.fromARGB(255, 5, 83, 83),
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
            SizedBox(
              height: 10,
            ),
            MyTextField(
              dynamicController: yearController,
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
              value: branchselection.text.isNotEmpty
                  ? branchselection.text
                  : null,
              items: [
                "Computer",
                "Electronic And Telecommunication",
                "Civil",
                "Electrical",
                "Mechanical",
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
                  hintText: "Select Addmission Type",
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
              "3. Address for Correspondence:",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Color.fromARGB(255, 74, 73, 73),
              ),
            ),
            const SizedBox(height: 10),
            MyTextField(
              dynamicController: correspondenceAddressController,
              hintText: "Enter correspondence address...",
              keyboardType: TextInputType.streetAddress,
            ),
            const SizedBox(height: 10),
            const Text(
              "4. Permanent Address:",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Color.fromARGB(255, 74, 73, 73),
              ),
            ),
            const SizedBox(height: 10),
            MyTextField(
              dynamicController: permanentAddressController,
              hintText: "Enter permanent address...",
              keyboardType: TextInputType.streetAddress,
            ),
            const SizedBox(height: 10),
            const Text(
              "5. Domicile (State):",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Color.fromARGB(255, 74, 73, 73),
              ),
            ),
            const SizedBox(height: 10),
            MyTextField(
              dynamicController: domicileController,
              hintText: "Enter domicile state...",
              keyboardType: TextInputType.name,
            ),
            const SizedBox(height: 10),
            const Text(
              "6. Reserved Category:",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Color.fromARGB(255, 74, 73, 73),
              ),
            ),
            const SizedBox(height: 10),
            DropdownButtonFormField<String>(
              value: typeOfAddmissionController.text.isNotEmpty
                  ? typeOfAddmissionController.text
                  : null,
              items: [
                "CAP",
                "MGMT",
                "Open",
                "OBC",
                "NT",
                "VJ",
                "SBC",
                "ESBC",
                "TFWS",
              ].map((String category) {
                return DropdownMenuItem<String>(
                  value: category,
                  child: Text(category),
                );
              }).toList(),
              onChanged: (String? value) {
                if (value != null) {
                  setState(() {
                    typeOfAddmissionController.text = value;
                  });
                }
              },
              decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: "Select Category",
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
            const SizedBox(height: 10),
            const Text(
              "7. Annual Income (In Rs.):",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Color.fromARGB(255, 74, 73, 73),
              ),
            ),
            const SizedBox(height: 10),
            MyTextField(
              dynamicController: annualIncomeController,
              keyboardType: TextInputType.number,
              hintText: "Enter annual income...",
              
            ),
            const SizedBox(height: 10),
            const Text(
              "8. Religion:",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Color.fromARGB(255, 74, 73, 73),
              ),
            ),
            const SizedBox(height: 10),
            MyTextField(
              dynamicController: religionController,
              hintText: "Enter religion...",
              keyboardType: TextInputType.name
            ),
            const SizedBox(height: 10),
            const Text(
              "9. Place of Birth:",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Color.fromARGB(255, 74, 73, 73),
              ),
            ),
            const SizedBox(height: 10),
            MyTextField(
              dynamicController: placeOfBirthController,
              hintText: "Enter place of birth...",
              keyboardType: TextInputType.datetime,
            ),
            const SizedBox(height: 10),
            const Text(
              "10. Previous College Attended (HSC/Diploma/BE):",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Color.fromARGB(255, 74, 73, 73),
              ),
            ),
            const SizedBox(height: 10),
            MyTextField(
              dynamicController: previousCollegeController,
              hintText: "Enter Name of previous college attended...",
              keyboardType: TextInputType.name,
            ),
            const SizedBox(height: 10),
            const Text(
              "11. Eligibility No:",
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
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 25),
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
