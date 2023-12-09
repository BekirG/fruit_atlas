import 'package:flutter/material.dart';

/// A container that displays an overlay image for the selection area.
class SelectionImageOverlayContainer extends StatelessWidget {
  const SelectionImageOverlayContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(left: 10),
        child: SizedBox(
          width: 140,
          height: 140,
          child: Image.asset("assets/images/picker_container.png"),
        ),
      ),
    );
  }
}
