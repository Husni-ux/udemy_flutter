import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:udemy_flutter/layout/news_app/cubit/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy_flutter/modules/business/business_screen.dart';
import 'package:udemy_flutter/modules/science/science_screen.dart';
import 'package:udemy_flutter/modules/settings/settings_screen.dart';
import 'package:udemy_flutter/modules/sports/sports_screen.dart';

import '../../../shared/network/remote/dio_helper.dart';

class NewsCubit extends Cubit<NewStates>{

  NewsCubit() : super(NewsInitialState());

  static NewsCubit get(context) =>BlocProvider.of(context);

  List<BottomNavigationBarItem> bottomItem = [
  const BottomNavigationBarItem(
     icon: Icon(Icons.business_sharp),
     label: 'Business'
   ),
    const BottomNavigationBarItem(
     icon: Icon(Icons.science),
     label: 'Science'
   ),
    const BottomNavigationBarItem(
     icon: Icon(Icons.sports),
     label: 'Sports'
   ),
    const BottomNavigationBarItem(
     icon: Icon(Icons.settings),
     label: 'Settings'
   ),
  ];

  List<Widget> screens =[
    BusinrssScreen(),
    ScienceScreen(),
    SportsScreen(),
    SettingsScreen(),
  ];
  int currentInedx = 0;

  void changeBottomBarScreen (index){
    currentInedx = index;
    emit(NewsBottomNavState());
  }
  List<dynamic>business =[];

  void getBusiness(){
    emit(NewsGetBusinessLoadingState());
    DioHelper.getData(
      url: 'v2/top-headlines',
      query: {
        'country':'eg',
        'category':'business',
        'apiKey':'64dc4ac09c7140bc8d73151e446b88d4',
      },
    ).then((value) {
      //print(value.data['articles'][0]['title'].toString());
      business = value.data['articles'];
      print(business[0]['titles']);
      emit(NewsGetBusinessSuccessState());

    }).catchError((error){
      print(error.toString());
      emit(NewsErrorBusinessState(error.toString()));
    });
  }
}
