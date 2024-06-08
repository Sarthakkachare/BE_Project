import "dart:core";

import "package:flutter/material.dart";

// ignore: must_be_immutable
class MyTextField extends StatelessWidget {
  String? labelText;
  String? hintText;
  TextInputType? keyboardType;
  Icon? suffixIcon;
  void onTap;

  TextEditingController dynamicController;

  MyTextField(
      {required this.dynamicController,
       this.labelText,
       this.hintText, 
       this.keyboardType,
       this.suffixIcon,
       this.onTap,
      }
      );
      
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      
      controller: dynamicController,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        
        labelText: labelText,
        hintText: hintText,
        hintStyle: const TextStyle(
          fontWeight: FontWeight.w400,
          color: Color.fromARGB(255, 66, 64, 64),
        ),
        filled: true,
        fillColor: Colors.white,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          gapPadding: 7,
          borderSide: const BorderSide(
              color: Color.fromARGB(255, 5, 118, 120), width: 1.5),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius:BorderRadius.circular(10),
          gapPadding: 7,
          borderSide: const BorderSide(
            color: Colors.pink, 
            width: 1.5
          ),
        )
      ),
    );
  }
}
