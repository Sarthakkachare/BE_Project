import 'SE_TE_BE_Education.dart';
import 'Starting_pages/customtext.dart';
import 'package:flutter/material.dart';

class SETEBE extends StatefulWidget {
  const SETEBE({Key? key}) : super(key: key);

  @override
  State<SETEBE> createState() => _SETEBEState();
}

class _SETEBEState extends State<SETEBE> {
  TextEditingController correspondenceAddressController =TextEditingController();
  TextEditingController permanentAddressController = TextEditingController();
  TextEditingController domicileController = TextEditingController();
  TextEditingController typeOfAddmissionController = TextEditingController();
  TextEditingController casteController = TextEditingController();
  TextEditingController annualIncomeController = TextEditingController();
  TextEditingController religionController = TextEditingController();
  TextEditingController placeOfBirthController = TextEditingController();
  TextEditingController previousCollegeController = TextEditingController();
  TextEditingController eligibilityNoController = TextEditingController();
  TextEditingController prnNoController = TextEditingController();

  void _navigateToNextScreen() {
    // Implement logic to handle the entered details.
    // For now, it prints the entered details to the console.

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const SETEBEEducation(),
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
        title: const Text("TSSM's BSCOER"),
        backgroundColor: const Color.fromARGB(255, 14, 154, 167),
      ),
      backgroundColor: const Color.fromARGB(255, 229, 253, 255),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            const Text(
              "Additional Details",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              "1. Address for Correspondence:",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Color.fromARGB(255, 74, 73, 73),
              ),
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: correspondenceAddressController,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                hintText: "Enter correspondence address...",
                hintStyle: const TextStyle(
                  fontWeight: FontWeight.w400,
                  color: Color.fromARGB(255, 66, 64, 64),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(45),
                ),
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              "2. Permanent Address:",
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
              ),
            const SizedBox(height: 10),
            const Text(
              "3. Domicile (State):",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Color.fromARGB(255, 74, 73, 73),
              ),
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: domicileController,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                hintText: "Enter domicile state...",
                hintStyle: const TextStyle(
                  fontWeight: FontWeight.w400,
                  color: Color.fromARGB(255, 66, 64, 64),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(45),
                ),
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              "4. Reserved Category:",
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
                hintText: "Select Addmission Type",
                hintStyle: const TextStyle(
                  fontWeight: FontWeight.w400,
                  color: Color.fromARGB(255, 66, 64, 64),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(45),
                ),
              ),
            ),
            const Text(
              "5. Reserved Category:",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Color.fromARGB(255, 74, 73, 73),
              ),
            ),
            const SizedBox(height: 10),
            DropdownButtonFormField<String>(
              value: casteController .text.isNotEmpty
                  ? casteController .text
                  : null,
              items: [
                "Open",
                "OBC",
                "NT",
                "SC",
                "ST",
                "VJ",
                "SBC",
              ].map((String category) {
                return DropdownMenuItem<String>(
                  value: category,
                  child: Text(category),
                );
              }).toList(),
              onChanged: (String? value) {
                if (value != null) {
                  setState(() {
                    casteController .text = value;
                  });
                }
              },
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                hintText: "Select Caste",
                hintStyle: const TextStyle(
                  fontWeight: FontWeight.w400,
                  color: Color.fromARGB(255, 66, 64, 64),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(45),
                ),
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              "6. Annual Income (In Rs.):",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Color.fromARGB(255, 74, 73, 73),
              ),
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: annualIncomeController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                hintText: "Enter annual income...",
                hintStyle: const TextStyle(
                  fontWeight: FontWeight.w400,
                  color: Color.fromARGB(255, 66, 64, 64),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(45),
                ),
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              "7. Religion:",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Color.fromARGB(255, 74, 73, 73),
              ),
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: religionController,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                hintText: "Enter religion...",
                hintStyle: const TextStyle(
                  fontWeight: FontWeight.w400,
                  color: Color.fromARGB(255, 66, 64, 64),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(45),
                ),
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              "8. Place of Birth:",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Color.fromARGB(255, 74, 73, 73),
              ),
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: placeOfBirthController,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                hintText: "Enter place of birth...",
                hintStyle: const TextStyle(
                  fontWeight: FontWeight.w400,
                  color: Color.fromARGB(255, 66, 64, 64),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(45),
                ),
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              "9. Previous College Attended (HSC/Diploma/BE):",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Color.fromARGB(255, 74, 73, 73),
              ),
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: previousCollegeController,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                hintText: "Enter previous college attended...",
                hintStyle: const TextStyle(
                  fontWeight: FontWeight.w400,
                  color: Color.fromARGB(255, 66, 64, 64),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(45),
                ),
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              "10. Eligibility No:",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Color.fromARGB(255, 74, 73, 73),
              ),
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: eligibilityNoController,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                hintText: "Enter eligibility number...",
                hintStyle: const TextStyle(
                  fontWeight: FontWeight.w400,
                  color: Color.fromARGB(255, 66, 64, 64),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(45),
                ),
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              "11.PRN No:",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Color.fromARGB(255, 74, 73, 73),
              ),
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: eligibilityNoController,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                hintText: "Enter PRN number...",
                hintStyle: const TextStyle(
                  fontWeight: FontWeight.w400,
                  color: Color.fromARGB(255, 66, 64, 64),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(45),
                ),
              ),
            ),
            const SizedBox(height: 25),
            Container(
              alignment: Alignment.bottomRight,
              child: ElevatedButton(
                onPressed: _navigateToNextScreen,
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
