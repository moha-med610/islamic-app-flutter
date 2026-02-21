import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islamic_app/core/utils/time_formatter.dart';
import 'package:islamic_app/core/widgets/error_widget.dart';
import 'package:islamic_app/features/prayers/presentation/controllers/cubit/prayer_cubit.dart';
import 'package:islamic_app/features/prayers/presentation/widgets/date_widget.dart';
import 'package:islamic_app/features/prayers/presentation/widgets/prayer_skelton_loading_widget.dart';
import 'package:islamic_app/features/prayers/presentation/widgets/preyer_widget.dart';

class PrayerScreen extends StatelessWidget {
  const PrayerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<PrayerCubit, PrayerState>(
          builder: (BuildContext context, state) {
            log(state.toString());
            if (state is PrayerLoading) {
              return const PrayerSkeltonLoadingWidget();
            }

            if (state is PrayerError) {
              return ErrorView(() {
                context.read<PrayerCubit>().getPrayerTimes();
              });
            }

            if (state is PrayerSuccess) {
              final time = state.data;
              return Padding(
                padding: const EdgeInsets.all(10),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      DateWidget(),
                      SizedBox(height: 10),
                      GridView(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 5,
                              mainAxisSpacing: 3,
                              childAspectRatio: 1.3,
                            ),
                        children: [
                          PrayerWidget(
                            title: "الفجر",
                            prayerTime: TimeFormatter.to12Hour(time.fajr),
                          ),
                          PrayerWidget(
                            title: "الشروق",
                            prayerTime: TimeFormatter.to12Hour(time.sunrise),
                          ),
                          PrayerWidget(
                            title: "الظهر",
                            prayerTime: TimeFormatter.to12Hour(time.dhuhr),
                          ),
                          PrayerWidget(
                            title: "العصر",
                            prayerTime: TimeFormatter.to12Hour(time.asr),
                          ),
                          PrayerWidget(
                            title: "المغرب",
                            prayerTime: TimeFormatter.to12Hour(time.maghrib),
                          ),
                          PrayerWidget(
                            title: "العشاء",
                            prayerTime: TimeFormatter.to12Hour(time.isha),
                          ),
                          PrayerWidget(
                            title: "الامساك",
                            prayerTime: TimeFormatter.to12Hour(time.imsak),
                          ),
                          PrayerWidget(
                            title: "منتصف الليل",
                            prayerTime: TimeFormatter.to12Hour(time.midnight),
                          ),
                          PrayerWidget(
                            title: "الربع الاول",
                            prayerTime: TimeFormatter.to12Hour(time.firstThird),
                          ),
                          PrayerWidget(
                            title: "الربع الاخير",
                            prayerTime: TimeFormatter.to12Hour(time.lastThird),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
