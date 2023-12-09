import 'dart:ui';

import 'package:flutter/material.dart';

/// A tile displayed in the wheel, representing a fruit image.
class WheelTile extends StatelessWidget {
  /// The URL of the fruit image.
  final String? fruitImgUrl;

  /// Constructs a `WheelTile` with the given [fruitImgUrl].
  const WheelTile({Key? key, required this.fruitImgUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Stack(
        children: [
          ClipRRect(
            child: ImageFiltered(
                    imageFilter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
                    child: Opacity(
                      opacity: 0.5,
                      child: Image.asset(
                        fruitImgUrl!,
                        width: 85,
                        height: 85,
                      ),
                    ),
                  )               
          ),      
              Image.asset(
                  fruitImgUrl!,
                  width: 80,
                  height: 80,
                )             
        ],
      ),
    );
  }
}
