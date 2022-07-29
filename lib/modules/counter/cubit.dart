import 'package:bloc/bloc.dart';
import 'package:udemy_flutter/modules/counter/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterCubit extends Cubit<CounterSates> {
  CounterCubit() : super(CounterInitialState());

// to be more easily when use this cubit in many place
  static CounterCubit get(context)=>BlocProvider.of(context);
int counter =1;
void minus(){
  counter--;
emit(CounterMinusState(counter));
}
void plus(){
  counter++;
  emit(CounterMinusState(counter));
}
}