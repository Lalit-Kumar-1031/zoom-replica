import 'package:flutter/material.dart';
import 'package:zoom_replica/Utils/colors.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onpress;
  const CustomButton({Key? key, required this.text, required this.onpress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: ElevatedButton(
        onPressed: onpress,
        child: Text(
          text,
          style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),
        ),
        style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
              side: BorderSide(color: buttonColor)
            ),
            backgroundColor: buttonColor,minimumSize: Size(double.infinity, 50)),
      ),
    );
  }
}
