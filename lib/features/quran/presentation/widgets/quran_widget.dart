import 'package:flutter/material.dart';

class QuranWidget extends StatelessWidget {
  const QuranWidget({
    super.key,
    this.surahNo,
    required this.title,
    required this.subTitle,
    required this.onTap,
    this.isVisible = true,
  });

  final int? surahNo;
  final String title;
  final String subTitle;
  final VoidCallback onTap;
  final bool isVisible;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: ListTile(
        leading: Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            color: Colors.blueGrey,
            borderRadius: BorderRadius.circular(50),
          ),
          child: Center(
            child: Visibility(
              visible: isVisible,
              child: Text(
                surahNo.toString(),
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),

        title: Text(title, style: TextStyle(color: Colors.white, fontSize: 18)),
        subtitle: Text(
          "عدد الايات: $subTitle",
          style: TextStyle(
            color: Colors.white,
            fontSize: 12,
            fontWeight: FontWeight.w200,
          ),
        ),
      ),
    );
  }
}
