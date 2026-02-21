import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:islamic_app/features/quran/presentation/widgets/quran_widget.dart';
import 'package:skeletonizer/skeletonizer.dart';

class SkeltonLoadingWidget extends StatelessWidget {
  const SkeltonLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: true,
      effect: ShimmerEffect(baseColor: Colors.grey.shade800),
      child: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return QuranWidget(
            isVisible: false,
            title: "Surah Loading",
            subTitle: "120",
            onTap: () {},
          );
        },
      ),
    );
  }
}
