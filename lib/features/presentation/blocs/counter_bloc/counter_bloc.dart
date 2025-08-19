import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {

  CounterBloc() : super(CounterState()) {

    on<CounterIncresed>(_onCounterIncresed) ;
    on<CounterReset>(_onCounterReset) ;
    

  }

  void _onCounterIncresed(CounterIncresed event, Emitter<CounterState> emit) {
        emit(state.copyWith(
        counter: state.counter + event.value,
        transactionCount: state.transactionCount + 1
      ));
}

  void _onCounterReset(CounterReset event, Emitter<CounterState> emit) {
        emit(state.copyWith(
        counter: 0
      ));
}

void increaseBy([int value = 1]) {
  add(CounterIncresed(value));
}

void resetCounter() {
  add(CounterReset());
}



}

