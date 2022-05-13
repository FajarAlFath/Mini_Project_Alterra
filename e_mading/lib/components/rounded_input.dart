import 'package:flutter/material.dart';
import 'input.dart';
import 'constants.dart';

class RoundedInput extends StatelessWidget {
  const RoundedInput({super.key, required this.icon, required this.hint}) 
  ;

  final IconData icon;
  final String hint;

  @override
  Widget build(BuildContext context) {
    return InputContainer(
      child: TextField(
        cursorColor: KPrimaryColor,
        decoration: InputDecoration(
          icon: Icon(icon, color: KPrimaryColor,),
          hintText: hint,
          border: InputBorder.none
        ),
      ),
      );    
  }
}