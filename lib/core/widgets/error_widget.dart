import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:islamic_app/core/errors/error_model.dart';
import 'package:islamic_app/core/errors/failure.dart';
import 'package:islamic_app/features/quran/presentation/controllers/cubit/quran_cubit.dart';

class ErrorView extends StatelessWidget {
  const ErrorView({super.key});

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
              onPressed: () {
                context.read<QuranCubit>().getQuran();
              },
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
