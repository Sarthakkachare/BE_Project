import 'package:flutter/material.dart';
import '../Parent.dart';


class Personal extends StatefulWidget {
  const Personal({super.key});

  @override
  State<Personal> createState() => _PersonalState();
}

class _PersonalState extends State<Personal> {
  void _goToSecondScreen() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const Parent(),
      ),
    );
  }

  TextEditingController dateController = TextEditingController();

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
        title: const Text("TSSM's BSCOER"),
        backgroundColor: Colors.blue,
      ),
      backgroundColor: const Color.fromARGB(255, 215, 232, 247),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Personal Information",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              const Text(
                "First Name",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Color.fromARGB(255, 74, 73, 73),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: "Sarthak",
                  hintStyle: const TextStyle(
                      fontWeight: FontWeight.w400,
                      color: Color.fromARGB(255, 66, 64, 64)),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(45),
                  ),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              const Text(
                "Middle Name",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Color.fromARGB(255, 74, 73, 73),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: "Sandeep",
                  hintStyle: const TextStyle(
                      fontWeight: FontWeight.w400,
                      color: Color.fromARGB(255, 66, 64, 64)),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(45),
                  ),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              const Text(
                "Last Name",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Color.fromARGB(255, 74, 73, 73),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: "Kachare",
                  hintStyle: const TextStyle(
                      fontWeight: FontWeight.w400,
                      color: Color.fromARGB(255, 66, 64, 64)),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(45),
                  ),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              const Text(
                "Mobile Number",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Color.fromARGB(255, 74, 73, 73),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: "0000000000",
                  hintStyle: const TextStyle(
                      fontWeight: FontWeight.w400,
                      color: Color.fromARGB(255, 66, 64, 64)),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(45),
                  ),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              const Text(
                "Gender",
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
                value: null,
                items: ["Male", "Female", "Not to say"]
                    .map((String value) => DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        ))
                    .toList(),
                onChanged: (String? value) {
                  // Handle the selection
                },
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(45),
                  ),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              const Text(
                "Date of Birth",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Color.fromARGB(255, 74, 73, 73),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: dateController,
                readOnly: true,
                onTap: () => _selectDate(context),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: "Select Date",
                  hintStyle: const TextStyle(
                    fontWeight: FontWeight.w400,
                    color: Color.fromARGB(255, 66, 64, 64),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(45),
                  ),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              Container(
                alignment: Alignment.bottomRight,
                //padding: const EdgeInsets.only(right: 20),
                child: ElevatedButton(
                  onPressed: _goToSecondScreen,
                  style: ButtonStyle(
                      fixedSize: const MaterialStatePropertyAll(Size(150, 50)),
                      shape: MaterialStatePropertyAll(RoundedRectangleBorder(
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
      ),
    );
  }
}
