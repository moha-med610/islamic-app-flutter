import 'package:flutter/material.dart';

class PrayerWidget extends StatelessWidget {
  const PrayerWidget({
    super.key,
    required this.title,
    required this.prayerTime,
  });

  final String title;
  final String prayerTime;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.all(5),
      padding: EdgeInsets.symmetric(vertical: 15, horizontal: 50),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey, width: 1.0),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        children: [
          Text(
            title,
            style: TextStyle(
              color: const Color.fromARGB(255, 197, 197, 197),
              fontSize: 15,
              fontWeight: FontWeight.w700,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 10),
          Text(
            prayerTime,
            style: TextStyle(
              color: Colors.white,
              fontSize: 12,
              fontWeight: FontWeight.w900,
            ),
          ),
        ],
      ),
    );
  }
}
