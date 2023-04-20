import 'package:flutter/material.dart';
import 'palette.dart';

/// Creates a dialog loader
void showLoader(BuildContext context) {
  try {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => const Loader(),
    );
  } catch (e) {
    debugPrint(e.toString());
  }
}

class Loader extends StatelessWidget {
  const Loader({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        color: Palette.primary,
      ),
    );
  }
}
