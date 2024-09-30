import 'package:flutter/material.dart';
import 'package:test_1/controller/user_provider.dart';

class GenderButton extends StatelessWidget {
  final Gender gender;
   const GenderButton({
    
    super.key,
    required this.gender
  });

  @override
  Widget build(BuildContext context) {
    IconData iconData;
    String text;
    if (gender == Gender.male) {
      text = 'Male';
      iconData = Icons.male;
    } else {
      text = 'Female';
      iconData = Icons.female;
    }
    return Container(
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: const Color.fromARGB(255, 20, 14, 41),
          borderRadius: BorderRadius.circular(15)),
      // height: 150,
      child:  Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Icon(
            iconData,
            color: Colors.white,
            size: 50,
          ),
          Text(
            text,
            style: const TextStyle(color: Colors.white, fontSize: 20),
          )
        ],
      ),
    );
  }
}
