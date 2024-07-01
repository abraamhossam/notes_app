import 'package:flutter/material.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/helper/size_config.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.text,
    required this.onpressed,
  });
  final String text;
  final VoidCallback onpressed;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        minimumSize: Size(
          SizeConfig.width!,
          SizeConfig.height! * 0.06,
        ),
        backgroundColor: kPrimaryColor,
      ),
      onPressed: onpressed,
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.black,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
