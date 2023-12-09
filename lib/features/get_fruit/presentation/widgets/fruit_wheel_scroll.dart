import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_atlas/core/constants/constants.dart';
import 'package:fruit_atlas/features/get_fruit/presentation/widgets/wheel_tile.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:fruit_atlas/features/get_fruit/presentation/riverpod/up_down_provider.dart';
import '../bloc/fruit_bloc.dart';
import '../bloc/fruit_event.dart';

/// A widget that displays a wheel of fruits in a scrollable list.
class FruitListWheelScrollView extends StatelessWidget {
  FruitListWheelScrollView({
    super.key,
  });

  final fruitList = FruitSelectionList.fruitImgUrlList();
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (BuildContext context, WidgetRef ref, Widget? child) {
        final scrollControllerNotifier = ref.watch(scrollControllerProvider);

        return ListWheelScrollView.useDelegate(
          key: const Key('list_wheel_scroll_view'),
          controller: scrollControllerNotifier,
          scrollBehavior: MyBehavior(),
          itemExtent: 120,
          diameterRatio: 100,
          useMagnifier: true,
          onSelectedItemChanged: (index) {          
            final fruitName = FruitSelectionList.fruitNameList();
            scrollControllerNotifier.jumpToItem(index);
            final upDownNotifier = ref.read(upDownProvider);
            upDownNotifier.setValue = index;
            context.read<FruitBloc>().add(OnFruitChanged(fruitName[index]));
          },
          childDelegate: ListWheelChildLoopingListDelegate(
            children: fruitList.map((item) {            
                return WheelTile(
                  key: Key('wheel_tile_${fruitList.indexOf(item)}'),
                  fruitImgUrl: item,
                );
            }).toList(),
          ),
        );
      },
    );
  }
}

class MyBehavior extends ScrollBehavior {
  @override
  Widget buildOverscrollIndicator(
      BuildContext context, Widget child, ScrollableDetails details) {
    return child;
  }
}
