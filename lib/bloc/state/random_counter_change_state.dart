import 'dart:math';

class RandomCounterChangeState {
  late int _currentRandomNumber = Random().nextInt(101);

  int get currentValue => _currentRandomNumber;

  RandomCounterChangeState init() {
    return RandomCounterChangeState().._currentRandomNumber = 0;
  }

  RandomCounterChangeState rdmBiggerThan(RandomCounterChangeState currentState) {
    return RandomCounterChangeState()
      .._currentRandomNumber = currentState.currentValue
      .._currentRandomNumber = Random(currentState.currentValue).nextInt(101);
  }

  RandomCounterChangeState rdmSmallerThan(RandomCounterChangeState currentState) {
    return RandomCounterChangeState()
      .._currentRandomNumber = currentState.currentValue
      .._currentRandomNumber = _currentRandomNumber == 0 ? 0 : Random().nextInt(currentState.currentValue + 1);
  }
}