import 'package:fruit_atlas/features/get_fruit/domain/usecases/get_fruit_usecase.dart';
import 'package:fruit_atlas/features/get_fruit/presentation/bloc/fruit_event.dart';
import 'package:fruit_atlas/features/get_fruit/presentation/bloc/fruit_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';


/// BLoC (Business Logic Component) class responsible for managing the state of fruit-related features.
///
/// Extends [Bloc] and uses [FruitEvent] and [FruitState] for handling events and managing the state.
class FruitBloc extends Bloc<FruitEvent, FruitState> {
  final GetFruitUseCase _getFruitUseCase;

  /// Constructs a [FruitBloc] instance with the given [GetFruitUseCase].
  FruitBloc(this._getFruitUseCase) : super(FruitEmpty()) {
    // Initializes the BLoC with the initial state of FruitEmpty.

    on<OnFruitChanged>((event, emit) async {
      emit(FruitLoading());
      final result = await _getFruitUseCase.execute(event.fruitName);

      // Processes the OnFruitChanged event, emits appropriate states based on the result.

      result.fold(
        (failure) {
          emit(FruitLoadFailure(failure.message));
        },
        (data) {
          emit(FruitLoaded(data));
        },
      );
    },
    // Debounces the events to avoid rapid firing of requests.
    transformer: debounce(const Duration(milliseconds: 500)),
    );
  }
}

/// EventTransformer for debouncing events.
EventTransformer<T> debounce<T>(Duration duration) {
  return (events, mapper) => events.debounceTime(duration).flatMap(mapper);
}

