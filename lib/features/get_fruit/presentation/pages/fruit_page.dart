import 'package:flutter/material.dart';
import '../widgets/fruit_info.dart';
import '../widgets/fruit_list.dart';
import '../widgets/search.dart';

/// A StatelessWidget representing the main page for displaying fruit-related information.
class FruitPage extends StatelessWidget {
  const FruitPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 44, right: 29, left: 29),
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Column(
                      children: [
                        // Widget for searching fruit information.
                        SearchWidget(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20, bottom: 15),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Widget for displaying a list of fruits.
                      const FruitListWidget(),
                      
                      // Widget for displaying detailed information about a selected fruit.
                      FruitInfoWidget(),
                    ],
                  ),
                )
              ],
            )
          ],
        )
      ],
    );
  }
}

