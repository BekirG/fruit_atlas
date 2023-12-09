import 'package:flutter/material.dart';
import 'package:fruit_atlas/core/constants/constants.dart';

/// A reusable widget for displaying fruit-related information as text.
class FruitInfoText extends StatelessWidget {
  const FruitInfoText({
    super.key,
    required this.text,
    required this.data,
    required this.size,
  });

  /// The optional text label to display before the data.
  final String? text;

  /// The data to be displayed.
  final String data;

  /// The font size of the text.
  final double size;

  @override
  Widget build(BuildContext context) {
    // Combine text label and data if the text label is provided.
    String textControl = text != null ? "$text: $data" : data;

    return Text(
      textControl,
      style: TextStyle(
        color: AppColors.primaryLineColor,
        fontFamily: "Oxygen",
        fontWeight: FontWeight.bold,
        fontSize: size,
      ),
    );
  }
}
