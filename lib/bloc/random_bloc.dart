import 'package:bloc/bloc.dart';
import 'package:flutter_with_bloc/bloc/event/random_counter_change_event.dart';
import 'package:flutter_with_bloc/bloc/state/random_counter_change_state.dart';

enum RandomCounterEvent {rdmBiggerThan, rdmSmallerThan}

class RandomCounterChangeBloc extends Bloc<RandomCounterChangeEvent, RandomCounterChangeState> {
  RandomCounterChangeBloc() : super(RandomCounterChangeState()..init()) {
    on<RandomCounterBiggerThanEvent>((event, emit) => emit(state.rdmBiggerThan(state)));
    on<RandomCounterSmallerThanEvent>((event, emit) => emit(state.rdmSmallerThan(state)));
  }
}