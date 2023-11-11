import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:technical_test_okta/core/errors/failures.dart';
import 'package:technical_test_okta/core/static/dimens.dart';
import 'package:technical_test_okta/core/utils/app_settings.dart';

logMe(Object? obj, {String tag = 'log'}) {
  /* 
    use this for print something, its run only on debug mode.
  */
  if (kDebugMode) {
    print('$tag :$obj');
  }
}

String getErrorMessage(Failure failure) {
  switch (failure.runtimeType) {
    case ConnectionFailure:
      return 'No connection';
    case ServerFailure:
      return 'Server Error';
    default:
      return 'Unexpected error';
  }
}

// spacing
Widget smallVerticalSpacing() => const SizedBox(height: sizeSmall);
Widget smallHorizontalSpacing() => const SizedBox(width: sizeSmall);
Widget mediumVerticalSpacing() => const SizedBox(height: sizeMedium);
Widget mediumHorizontalSpacing() => const SizedBox(width: sizeMedium);
Widget largeVerticalSpacing() => const SizedBox(height: sizeLarge);
Widget largeHorizontalSpacing() => const SizedBox(width: sizeLarge);
Widget superLargeVerticalSpacing() => const SizedBox(height: 40);

showLoading() {
  SmartDialog.showLoading(
    msg: "Fetching data",
    backDismiss: false,
  );
}

dismissLoading() {
  SmartDialog.dismiss();
}

String mergeImageUrl(String urlImage) {
  return baseUrlImage + urlImage;
}
