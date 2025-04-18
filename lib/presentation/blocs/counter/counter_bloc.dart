import 'package:flutter_bloc/flutter_bloc.dart';
import 'counter_event.dart';
import 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(const CounterInitial(0)) {
    on<IncrementEvent>((event, emit) {
      if (state is CounterInitial) {
        final currentCount = (state as CounterInitial).count;
        emit(CounterInitial(currentCount + 1));
      }
    });
    on<DecrementEvent>((event, emit) {
      if (state is CounterInitial) {
        final currentCount = (state as CounterInitial).count;
        emit(CounterInitial(currentCount - 1));
      }
    });
  }
}
