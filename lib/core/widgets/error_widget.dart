import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';

class ErrorView extends StatelessWidget {
  const ErrorView(this.onButtonTap, {super.key});
  final VoidCallback onButtonTap;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            HugeIcon(
              icon: HugeIcons.strokeRoundedWifiError01,
              color: Colors.white,
              size: 100,
            ),
            SizedBox(height: 10),
            Text(
              "حدث خطأ ما من فضلك حاول مره اخري",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
              textAlign: TextAlign.center,
              maxLines: 3,
            ),
            SizedBox(height: 30),

            CupertinoButton(
              onPressed: onButtonTap,
              color: Colors.blue,
              child: Text(
                "حاول مره اخري",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
