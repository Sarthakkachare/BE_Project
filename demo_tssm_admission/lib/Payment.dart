// ignore_for_file: library_private_types_in_public_api

import 'package:demo_tssm_admission/Starting_pages/HomePage.dart';
import 'package:demo_tssm_admission/YearSelection.dart';
import 'package:flutter/material.dart';

class Payment extends StatefulWidget {
  const Payment({super.key});

  @override
  _PaymentState createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            setState(() {
              Navigator.push(context, MaterialPageRoute(builder: (context) => YearSelection()));
            });
          },
          child: Icon(Icons.arrow_back)),
        toolbarHeight: 80,
        shadowColor: const Color.fromARGB(255, 136, 213, 212),
        elevation: 10,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30))),
        title: const Text("Payments",
        style: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.w500,
          color: Colors.white,
        ),),
       backgroundColor: const Color.fromARGB(255, 14, 154, 167),
      ),
      backgroundColor: const Color.fromARGB(255, 229, 253, 255),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Display total fees and remaining fees
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Total Fees:",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
                Text(
                  "₹XXXXX",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
           
            Container(
              height: 1,
              width: 500,
              color: Colors.black,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Remaining Fees:",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
                Text(
                  "₹XXXXX",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            // Display UPI QR Code
            Image.asset(
              "lib/assets/Starting_Images/paytmqrjupiter.jpg",
              height: 200,
              width: 200,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 20),
            // Download Button
            ElevatedButton(
              onPressed: () {
                // Add logic to download the QR code
              },
              child: const Text("Download QR Code"),
            ),
            const SizedBox(height: 20),
            // Amount you're paying TextField
            const SizedBox(
              height: 50,
              child: TextField(
                decoration: InputDecoration(
                  labelText: "Amount you're paying",
                  labelStyle: TextStyle(
                    fontSize: 13
                  ),
                  border: OutlineInputBorder(),
                ),
              ),
            ),

            const SizedBox(height: 20),
            // Enter your UPI ID TextField
            const SizedBox(
              height: 50,
              child: TextField(
                decoration: InputDecoration(
                  labelText: "Enter your UPI ID",
                  labelStyle: TextStyle(
                    fontSize: 13
                  ),
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            const SizedBox(height: 20),
            // Payment Options
            const Text(
              "Payment Options:",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // Google Pay
                InkWell(
                  onTap: () {
                    // Add logic for Google Pay payment
                  },
                  child: Image.asset(
                    "lib/assets/Starting_Images/gpay2.png",
                    height: 80,
                    width: 80,
                  ),
                ),
                // Paytm
                InkWell(
                  onTap: () {
                    // Add logic for Paytm payment
                  },
                  child: Image.asset(
                    "lib/assets/Starting_Images/Paytm2.png",
                    height: 80,
                    width: 80,
                  ),
                ),
                // PhonePe
                InkWell(
                  onTap: () {
                    // Add logic for PhonePe payment
                  },
                  child: Image.asset(
                    "lib/assets/Starting_Images/pp.png",
                    height: 60,
                    width: 60,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}