import 'package:flutter/material.dart';
import 'package:islamic_app/features/prayers/presentation/widgets/preyer_widget.dart';
import 'package:skeletonizer/skeletonizer.dart';

class PrayerSkeltonLoadingWidget extends StatelessWidget {
  const PrayerSkeltonLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: true,
      effect: ShimmerEffect(baseColor: Colors.grey.shade800),
      child: GridView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 5,
          mainAxisSpacing: 3,
          childAspectRatio: 1.3,
        ),
        itemCount: 11,
        itemBuilder: (BuildContext context, int index) {
          return PrayerWidget(title: "---------", prayerTime: "--:--");
        },
      ),
    );
  }
}
