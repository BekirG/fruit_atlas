import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../core/constants/constants.dart';
import '../bloc/fruit_bloc.dart';
import '../bloc/fruit_event.dart';
import '../riverpod/up_down_provider.dart';

/// A widget that provides a search functionality for fruits.
class SearchWidget extends StatefulWidget {
  const SearchWidget({
    super.key,
  });

  @override
  State<SearchWidget> createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  final _textEditingController = TextEditingController();
  final _focusNode = FocusNode();
  final fruitName = FruitSelectionList.fruitNameList();

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Container(
        //height: 50,
        decoration: BoxDecoration(
            border: Border.all(
              color: AppColors.primaryLineColor,
              width: 2,
            ),
            boxShadow: [
              BoxShadow(
                color: AppColors.primaryLineColor.withOpacity(0.20),
                offset: const Offset(1, 1),
                blurRadius: 4,
                spreadRadius: 2,
              )
            ],
            color: Colors.white,
            borderRadius: const BorderRadius.all(Radius.circular(12))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 5),
              child: GestureDetector(
                onTap: () {
                  context
                      .read<FruitBloc>()
                      .add(OnFruitChanged(_textEditingController.text));
                },
                child: const Icon(
                  Icons.search,
                  color: AppColors.primaryLineColor,
                  size: 30,
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 4),
                child: Consumer(
                  builder:
                      (BuildContext context, WidgetRef ref, Widget? child) {
                    return TextField(
                      key: const Key("searchFruit"),
                      focusNode: _focusNode,
                      controller: _textEditingController,                   
                      style: const TextStyle(
                          color: AppColors.primaryLineColor,
                          fontFamily: "Oxygen",
                          decoration: TextDecoration.none,
                          fontSize: 14),
                      decoration: const InputDecoration(
                        hintText: "Search fruit...",
                        hintStyle: TextStyle(
                          color: AppColors.primaryLineColor,
                          fontFamily: "Oxygen",
                        ),
                        border: InputBorder.none,
                      ),
                      onSubmitted: (query) {
                        final scrollControllerNotifier =
                            ref.read(scrollControllerProvider);
                        scrollControllerNotifier
                            .jumpToItem(fruitName.indexOf(query.toLowerCase()));
                        context
                            .read<FruitBloc>()
                            .add(OnFruitChanged(query.toLowerCase()));
                        _textEditingController.text = "";
                      },
                      onChanged: (query) {},
                    );
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 5),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    _textEditingController.text = "";
                    _focusNode.unfocus();
                  });
                },
                child: const Icon(
                  Icons.cancel_outlined,
                  color: AppColors.primaryLineColor,
                  size: 30,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
