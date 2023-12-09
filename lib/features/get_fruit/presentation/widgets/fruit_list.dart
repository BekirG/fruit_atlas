import 'package:flutter/material.dart';
import 'package:fruit_atlas/core/constants/constants.dart';
import 'package:fruit_atlas/features/get_fruit/presentation/riverpod/up_down_provider.dart';
import 'package:fruit_atlas/features/get_fruit/presentation/widgets/selection_image_overlay.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'fruit_wheel_scroll.dart';

/// Widget that displays a rotating wheel of fruits with navigation arrows.
class FruitListWidget extends StatefulWidget {
  const FruitListWidget({
    super.key,
  });

  @override
  State<FruitListWidget> createState() => _FruitListWidgetState();
}

class _FruitListWidgetState extends State<FruitListWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    
    return Stack(
      children: [
        Container(
          clipBehavior: Clip.antiAlias,
          width: MediaQuery.of(context).size.width * 0.25,
          height: MediaQuery.of(context).size.height * 0.8,
          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: const Color(0xff523A16).withOpacity(0.25),
                  blurRadius: 5,
                  offset: const Offset(8, 8),
                  spreadRadius: 0,
                ),
                BoxShadow(
                  color: const Color(0xffFFECDE).withOpacity(0.25),
                  blurRadius: 4,
                  offset: const Offset(0, 4),
                  spreadRadius: 0,
                ),
                BoxShadow(
                  color: const Color(0xff000000).withOpacity(0.25),
                  blurRadius: 4,
                  offset: const Offset(0, 4),
                  spreadRadius: 0,
                ),
              ],
              color: Colors.white,
              borderRadius: const BorderRadius.only(
                  bottomRight: Radius.circular(20),
                  topRight: Radius.circular(20))),
        ),
        const Positioned(
            top: 0,
            left: 0,
            right: 0,
            bottom: 0,
            child: Padding(
                padding: EdgeInsets.only(left: 1),
                child: SelectionImageOverlayContainer())),
        Positioned.fill(child: FruitListWheelScrollView()),
        Consumer(
          builder: (BuildContext context, WidgetRef ref, Widget? child) {
            final upDownNotifier = ref.watch(upDownProvider);
            final scrollControllerNotifier =
                ref.watch(scrollControllerProvider);
            return GestureDetector(
              onTap: () {
                upDownNotifier.decrementValue();
                scrollControllerNotifier.jumpToItem(upDownNotifier.getValue);
              },
              child: Container(
                width: MediaQuery.of(context).size.width * 0.25,
                height: 80,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(20),
                        topRight: Radius.circular(20))),
                child: Image.asset("assets/images/arrow.png"),
              ),
            );
          },
        ),
        Positioned(
          bottom: 0,
          child: Consumer(
            builder: (BuildContext context, WidgetRef ref, Widget? child) {
              final upDownNotifier = ref.watch(upDownProvider);
              final scrollControllerNotifier =
                  ref.watch(scrollControllerProvider);
              return GestureDetector(
                onTap: () {
                  upDownNotifier.incrementValue();
                  scrollControllerNotifier.jumpToItem(upDownNotifier.getValue);
                },
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.25,
                  height: 80,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(20),
                          topRight: Radius.circular(20))),
                  child: Image.asset("assets/images/arrow_2.png"),
                ),
              );
            },
          ),
        ),
        Positioned(
          top: 75,
          child: Container(
            alignment: Alignment.center,
            width: MediaQuery.of(context).size.width * 0.25,
            height: 2,
            color: AppColors.primaryLineColor.withOpacity(0.25),
          ),
        ),
        Positioned(
          top: 180,
          child: Container(
            alignment: Alignment.center,
            width: MediaQuery.of(context).size.width * 0.25,
            height: 2,
            color: AppColors.primaryLineColor.withOpacity(0.25),
          ),
        ),
        Positioned(
          bottom: 75,
          child: Container(
            alignment: Alignment.center,
            width: MediaQuery.of(context).size.width * 0.25,
            height: 2,
            color: AppColors.primaryLineColor.withOpacity(0.25),
          ),
        ),
        Positioned(
          bottom: 180,
          child: Container(
            alignment: Alignment.center,
            width: MediaQuery.of(context).size.width * 0.25,
            height: 2,
            color: AppColors.primaryLineColor.withOpacity(0.25),
          ),
        )
      ],
    );
  }
}
