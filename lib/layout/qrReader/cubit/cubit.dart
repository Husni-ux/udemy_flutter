import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:udemy_flutter/layout/qrReader/Scanner.dart';
import 'package:udemy_flutter/layout/qrReader/about/AboutScreen.dart';
import 'package:udemy_flutter/layout/qrReader/cubit/state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy_flutter/layout/qrReader/history.dart';

class QrCubit extends Cubit<QrState> {

  QrCubit() : super(QaReaderInitialState());

static QrCubit get(context)=>BlocProvider.of(context);

List<BottomNavigationBarItem>bottomItem=[
  const BottomNavigationBarItem(
      icon: Icon(Icons.qr_code),
      label: 'مسح'
  ),
  const BottomNavigationBarItem(
      icon: Icon(Icons.history),
      label: 'السجل'
  ),
  const BottomNavigationBarItem(
      icon: Icon(Icons.info_outline_rounded),
      label: 'حول التطبيق'
  ),
];
  List<String> titles = [
    'Scanners',
    'History',
    'Info',
  ];

List <Widget> Scr=[
  Scanner(),
  AboutScreen(),
  HistoryScreen(),

];

int currentIndex=0;

  void changeBottomBarScreen (index){
    currentIndex = index;
    emit(QrBottomNavState());
  }
}