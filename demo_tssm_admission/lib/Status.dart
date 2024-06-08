import 'Document.dart';
import 'FE_Form.dart';
import 'Parent.dart';
import 'Starting_pages/dummy1.dart';
import 'YearSelection.dart';
import 'profile.dart';
import 'package:flutter/material.dart';

class Status extends StatefulWidget {
  const Status({Key? key}) : super(key: key);

  @override
  State<Status> createState() => _StatusState();
}

class _StatusState extends State<Status> {
  int _currentStep = 0;

  final List<Step> _formSteps = const [
    Step(
      title: Text("Personal Details"),
      content: PersonalDetailsStep(),
    ),
    Step(
      title: Text("Parents Information"),
      content: ParentsInformationStep(),
    ),
    Step(
      title: Text("Additional Details"),
      content: AdditionalDetailsStep(),
    ),
    Step(
      title: Text("Document Uploadation"),
      content: DocumentUploadationStep(),
    ),
    Step(
      title: Text("Payment"),
      content: PaymentStep(),
    ),
  ];

  void _navigateToScreen(int index) {
    switch (index) {
      case 0:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const Personal()),
        );
        break;
      case 1:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const Parent()),
        );
        break;
      case 2:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const FEForm()),
        );
        break;
      case 3:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const Documents()),
        );
        break;
      // Add more cases for other steps if needed
    }
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 80.0,
          shadowColor: const Color.fromARGB(255, 136, 213, 212),
          elevation: 10,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30))),
          title: const Text("TSSM's BSCOER"),
          backgroundColor: const Color.fromARGB(255, 14, 154, 167),
        ),
        backgroundColor: const Color.fromARGB(255, 229, 253, 255),
        body: Stepper(
          currentStep: _currentStep,
          onStepContinue: () {
            if (_currentStep < _formSteps.length - 1) {
              setState(() {
                _currentStep += 1;
              });
            } else {
              // If on the last step, push a new screen onto the stack
              _navigateToScreen(_currentStep);
            }
          },
          onStepCancel: () {
            if (_currentStep > 0) {
              setState(() {
                _currentStep -= 1;
              });
            } else {
              // If on the first step, push a new screen onto the stack
              _navigateToScreen(_currentStep);
            }
          },
          steps: _formSteps,
        ),
        bottomNavigationBar: SizedBox(
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
                            MaterialPageRoute(
                                builder: (context) => const YearSelection()),
                          );
                        } else if (bottomIconNames[index] == 'Status') {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Status()),
                          );
                        } else if (bottomIconNames[index] == 'Profile') {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Profile()),
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
        ));
  }
}

class PersonalDetailsStep extends StatelessWidget {
  const PersonalDetailsStep({super.key});

  @override
  Widget build(BuildContext context) {
    // Implement the UI for collecting personal details
    return Container(
        // Your personal details form UI here
        );
  }
}

class ParentsInformationStep extends StatelessWidget {
  const ParentsInformationStep({super.key});

  @override
  Widget build(BuildContext context) {
    // Implement the UI for collecting parents' information
    return Container(
        // Your parents' information form UI here
        );
  }
}

class AdditionalDetailsStep extends StatelessWidget {
  const AdditionalDetailsStep({super.key});

  @override
  Widget build(BuildContext context) {
    // Implement the UI for collecting additional details
    return Container(
        // Your additional details form UI here
        );
  }
}

class DocumentUploadationStep extends StatelessWidget {
  const DocumentUploadationStep({super.key});

  @override
  Widget build(BuildContext context) {
    // Implement the UI for document uploadation
    return Container(
        // Your document uploadation form UI here
        );
  }
}

class PaymentStep extends StatelessWidget {
  const PaymentStep({super.key});

  @override
  Widget build(BuildContext context) {
    // Implement the UI for payment
    return Container(
        // Your payment form UI here
        );
  }
}
