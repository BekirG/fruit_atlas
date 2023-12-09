import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_atlas/core/constants/constants.dart';
import 'package:fruit_atlas/features/get_fruit/presentation/bloc/fruit_bloc.dart';
import 'package:fruit_atlas/features/get_fruit/presentation/bloc/fruit_state.dart';

import 'fruit_info_text.dart';

/// Widget responsible for displaying detailed information about a selected fruit.
class FruitInfoWidget extends StatelessWidget {
  FruitInfoWidget({
    super.key,
  });

  final fruitName = FruitSelectionList.fruitNameList();
  final fruitImgUrl = FruitSelectionList.fruitImgUrlList();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 35),
      child: BlocBuilder<FruitBloc, FruitState>(
        builder: (context, fruitState) {
          if (fruitState is FruitLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (fruitState is FruitLoaded) {
            final imageUrl = fruitImgUrl[
                fruitName.indexOf(fruitState.result.name.toLowerCase())];
            return Column(
              key: const Key("fruit_data"),
              children: [
                Stack(
                  children: [
                    ClipRRect(
                      child: ImageFiltered(
                        imageFilter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                        child: Opacity(
                          opacity: 0.45,
                          child: imageUrl != null
                              ? Image.asset(
                                  imageUrl,
                                  width: 285,
                                  height: 285,
                                )
                              : const SizedBox(),
                        ),
                      ),
                    ),
                    imageUrl != null
                        ? Image.asset(
                            imageUrl,
                            width: 275,
                            height: 275,
                          )
                        : const SizedBox(),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    FruitInfoText(
                      text: null,
                      data: fruitState.result.name,
                      size: 40,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    FruitInfoText(
                      text: "Family",
                      data: fruitState.result.family,
                      size: 24,
                    ),
                    FruitInfoText(
                      text: "Order",
                      data: fruitState.result.order,
                      size: 24,
                    ),
                    FruitInfoText(
                      text: "Genus",
                      data: fruitState.result.genus,
                      size: 24,
                    ),
                    FruitInfoText(
                      text: "Calories",
                      data: fruitState.result.nutritions.calories.toString(),
                      size: 24,
                    ),
                    FruitInfoText(
                      text: "Fat",
                      data: fruitState.result.nutritions.fat.toString(),
                      size: 24,
                    ),
                    FruitInfoText(
                      text: "Sugar",
                      data: fruitState.result.nutritions.sugar.toString(),
                      size: 24,
                    ),
                    FruitInfoText(
                      text: "Carbohydrates",
                      data:
                          fruitState.result.nutritions.carbohydrates.toString(),
                      size: 24,
                    ),
                    FruitInfoText(
                      text: "Protein",
                      data: fruitState.result.nutritions.protein.toString(),
                      size: 24,
                    ),
                  ],
                ),
              ],
            );
          }
          if (fruitState is FruitLoadFailure) {
            if (fruitState.message == "An error has occured") {
              return Padding(
                padding: const EdgeInsets.only(top: 70),
                child: Center(
                    child: Image.asset(
                  "assets/images/error/not_found.png",
                  width: 240,
                  height: 240,
                )),
              );
            }
          }

          return const SizedBox();
        },
      ),
    );
  }
}
