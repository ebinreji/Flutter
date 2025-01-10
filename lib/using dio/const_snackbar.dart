import 'package:flutter/cupertino.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

void showCustomSnackBar(BuildContext context) {
  showTopSnackBar(
    Overlay.of(context),
    const CustomSnackBar.error(
      message: "Something went wrong",
    ),
  );
}
