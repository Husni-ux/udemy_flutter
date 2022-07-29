abstract class CounterSates {}

class CounterInitialState extends CounterSates {}

class CounterPlusState extends CounterSates {
  final int counter;

  CounterPlusState(this.counter);
}

class CounterMinusState extends CounterSates {
  final int counter;

  CounterMinusState(this.counter);
}
