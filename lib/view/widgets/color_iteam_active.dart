import 'package:flutter/material.dart';

class ColorIteamActive extends StatelessWidget {
  const ColorIteamActive({
    super.key,
    this.ontap,
    required this.color,
  });
  final VoidCallback? ontap;
  final int color;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 24,
      ),
      child: GestureDetector(
        onTap: ontap,
        child: CircleAvatar(
          radius: 35,
          backgroundColor: Colors.white,
          child: CircleAvatar(
            radius: 32,
            backgroundColor: Color(color),
          ),
        ),
      ),
    );
  }
}
