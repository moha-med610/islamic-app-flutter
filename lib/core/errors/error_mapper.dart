import 'package:flutter/material.dart';
import 'package:islamic_app/core/errors/error_model.dart';
import 'package:islamic_app/core/errors/failure.dart';

extension ErrorMapper on Failure {
  ErrorModel toView() {
    if (this is ServerFailure) {
      return ErrorModel(message: "خطأ في الخادم", icon: Icons.error);
    }

    if (this is NetworkError) {
      return ErrorModel(
        message: "تحقق من اتصالاك بالانترنت و اعد المحاوله",
        icon: Icons.wifi_off,
      );
    }

    return ErrorModel(message: "حدث خطأ ما!", icon: Icons.error);
  }
}
