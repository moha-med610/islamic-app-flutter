import 'package:flutter/material.dart';
import 'package:islamic_app/core/service/cache_service.dart';
import 'package:islamic_app/features/Home/presentation/screens/home_screen.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: .center,
          children: [
            Spacer(),
            Image.asset("assets/icons/praying.png", width: 200),
            SizedBox(height: 20),
            Text(
              "رفيقك اليومي للعبادة",
              style: TextStyle(
                color: Colors.white,
                fontSize: 26,
                fontWeight: .w900,
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 35),
              child: Text(
                "اجمع بين قراءة القرآن، ومعرفة مواقيت الصلاة، في تطبيق واحد يساعدك على المحافظة على عبادتك.",
                style: TextStyle(
                  color: Colors.white54,
                  fontSize: 16,
                  fontWeight: .w600,
                ),
              ),
            ),
            Spacer(),
            GestureDetector(
              onTap: () async {
                await LocalDataService.setData("is_show_Onboarding", true);
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (_) => HomeScreen()),
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(20),
                ),
                width: double.infinity,
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.all(10),
                child: Text(
                  "Get Started",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
