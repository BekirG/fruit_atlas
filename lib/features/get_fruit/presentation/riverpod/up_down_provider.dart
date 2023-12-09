import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// A ChangeNotifier class representing a simple up-down counter state.
class UpDownNotifier extends ChangeNotifier {
  int _value = 0;

  /// Getter for the current counter value.
  int get getValue => _value;

  /// Setter for updating the counter value and notifying listeners.
  set setValue(int value) {
    _value = value;
    notifyListeners();
  }

  /// Increments the counter value by 1 and notifies listeners.
  void incrementValue() {
    _value++;
    notifyListeners();
  }

  /// Decrements the counter value by 1 and notifies listeners.
  void decrementValue() {
    _value--;
    notifyListeners();
  }
}

/// Provider for creating an instance of [UpDownNotifier].
final upDownProvider = ChangeNotifierProvider((ref) => UpDownNotifier());

/// Provider for creating an instance of [FixedExtentScrollController].
final scrollControllerProvider = Provider((ref) => FixedExtentScrollController());
