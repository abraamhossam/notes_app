import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
    required this.text,
    this.icon,
    this.onpressed,
  });
  final String text;
  final IconData? icon;
  final VoidCallback? onpressed;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style: const TextStyle(
            fontSize: 30,
          ),
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: Colors.white.withOpacity(0.05),
          ),
          child: IconButton(
            icon: Icon(
              icon,
              size: 26,
            ),
            onPressed: onpressed,
          ),
        ),
      ],
    );
  }
}
