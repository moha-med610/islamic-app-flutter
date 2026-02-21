import 'package:flutter/material.dart';

class SurahWidget extends StatelessWidget {
  const SurahWidget({super.key, required this.ayah, required this.index});

  final String ayah;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: "$ayah ",
              style: const TextStyle(fontSize: 25, color: Colors.white),
            ),
            TextSpan(
              text: "(${index + 1})",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.teal.shade400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
