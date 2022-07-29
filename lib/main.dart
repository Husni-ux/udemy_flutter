import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// import 'package:udemy_flutter/layout/ToDoApp/toDo_layout.dart';
// import 'package:udemy_flutter/modules/counter/counterScreen.dart';
// import 'package:udemy_flutter/modules/facebookLogin/facebooklogin.dart';
// import 'package:udemy_flutter/modules/home/home_screen.dart';
// import 'package:udemy_flutter/modules/login/login_screen.dart';
// import 'package:udemy_flutter/modules/twitter/twitter_sc.dart';
import 'package:udemy_flutter/shared/blocobserver.dart';
import 'package:udemy_flutter/shared/network/remote/dio_helper.dart';

//import 'package:udemy_flutter/table.dart';
import 'layout/news_app/news_layout/news_layout.dart';

//import 'modules/bmi/bmiCalculator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'layout/qrReader/qr_layout.dart';

//impor'modules/bmi/bmi_result_Scr.dart't';
//import 'modules/counter/coun.dart';
//import 'modules/counter/counterScreen.dart';
//im'modules/home/home_screen.dart'dart';
//import 'modules/login/login_screen.dart';
//import 'package:flutter/src/widgets/framework.dart' ;
//'modules/messenger/messengerDesign.dart'gn.dart';
//import 'package:flutter_screen/usersScreen.dart';

void main() {
  BlocOverrides.runZoned(
    () {},
    blocObserver: MyBlocObserver(),
  );
  DioHelper.init();
  runApp(App());
}

class App extends StatelessWidget {
  //constructor في البدابة يتم تنفيذال ثم يتم تنفيذ ال Build
  //build
  @override
  //what context mean ?
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: Colors.deepOrange,
        ),
        //primarySwatch: Colors.deepOrange,
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: AppBarTheme(
          iconTheme: IconThemeData(
            color: Colors.black,
          ),
          titleTextStyle: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 20.0,
          ),
          backgroundColor: Colors.white,
          elevation: 0.0,
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.white,
            statusBarIconBrightness: Brightness.dark,
          ),
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          selectedItemColor: Colors.deepOrange,
          type: BottomNavigationBarType.fixed,
          elevation: 20.0,
        ),
      ),
      home: Home(),
    );
  }
}
