import 'package:flutter/material.dart';

class ColorIteamNotActive extends StatelessWidget {
  const ColorIteamNotActive({
    super.key,
    this.ontap,
    required this.color,
  });
  final VoidCallback? ontap;
  final int color;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Padding(
        padding: const EdgeInsets.only(
          left: 24,
        ),
        child: CircleAvatar(
          radius: 32,
          backgroundColor: Color(color),
        ),
      ),
    );
  }
}
