import 'package:demo_tssm_admission/Starting_pages/username.dart';

import 'YearSelection.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import 'Status.dart';
//import 'package:demo_tssm_admission/Starting_pages/username.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  String? _imagePath;

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _imagePath = pickedFile.path;
      }
    });
  }

  final List<IconData> bottomIcons = [
    Icons.home,
    Icons.notifications,
    Icons.person,
  ];

  final List<String> bottomIconNames = [
    'Home',
    'Status',
    'Profile',
  ];

  final TextEditingController contactController = TextEditingController(text: '1234567890');
  final TextEditingController emailController = TextEditingController(text: 'john.doe@example.com');
  final TextEditingController educationController = TextEditingController(text: 'Bachelor\'s Degree');
  final TextEditingController branchController = TextEditingController(text: 'Computer Science');
  final TextEditingController yearController = TextEditingController(text: 'Final Year');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        title: const Text("TSSM's BSCOER"),
        shadowColor: const Color.fromARGB(255, 136, 213, 212),
        elevation: 10,
      backgroundColor:  const Color.fromARGB(255, 14, 154, 167),
      ),
      backgroundColor: const Color.fromARGB(255, 215, 232, 247),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: _pickImage,
              child: CircleAvatar(
                radius: 80,
                backgroundImage: _imagePath != null
                    ? FileImage(File(_imagePath!)) as ImageProvider<Object>
                    : const AssetImage('lib/assets/Starting_Images/profile.jpeg'),
              ),
            ),
            const SizedBox(height: 20),
             Text(
              UserName.userName,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            TextFieldBox(label: 'Contact', controller: contactController),
            TextFieldBox(label: 'Email', controller: emailController),
            TextFieldBox(label: 'Education', controller: educationController),
            TextFieldBox(label: 'Branch', controller: branchController),
            TextFieldBox(label: 'Year', controller: yearController),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _saveChanges,
              child: const Text('Save Changes'),
            ),
          ],
        ),
      ),
      bottomNavigationBar:
 SizedBox(
  height: 67,
   child: BottomAppBar(
    color: const Color.fromARGB(255, 14, 154, 167),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: List.generate(bottomIcons.length, (index) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            GestureDetector(
              child: Icon(bottomIcons[index]),
              onTap: () {
                if (bottomIconNames[index] == 'Home') {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const YearSelection()),
                  );
                } else if (bottomIconNames[index] == 'Status') {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Status()),
                  );
                } else if (bottomIconNames[index] == 'Profile') {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Profile()),
                  );
                }
              },
             // tooltip: bottomIconNames[index],
            ),
            Text(
              bottomIconNames[index],
              style: const TextStyle(fontSize: 11),
            ),
          ],
        );
      }),
    ),
   ),
 )
    );
  }

  void _saveChanges() {
    // Implement your logic to save changes here
  }
}

class TextFieldBox extends StatelessWidget {
  final String label;
  final TextEditingController controller;

  const TextFieldBox({
    required this.label,
    required this.controller,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          TextField(
            controller: controller,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              isDense: true,
            ),
          ),
        ],
      ),
    );
  }
}
