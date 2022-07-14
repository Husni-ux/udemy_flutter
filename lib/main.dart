import 'package:flutter/material.dart';
import 'package:udemy_flutter/modules/facebookLogin/facebooklogin.dart';
import 'package:udemy_flutter/modules/home/home_screen.dart';
import 'package:udemy_flutter/modules/login/login_screen.dart';
import 'package:udemy_flutter/modules/twitter/twitter_sc.dart';
import 'modules/bmi/bmiCalculator.dart';
//impor'modules/bmi/bmi_result_Scr.dart't';
//import 'modules/counter/coun.dart';
//import 'modules/counter/counterScreen.dart';
//im'modules/home/home_screen.dart'dart';
//import 'modules/login/login_screen.dart';
//import 'package:flutter/src/widgets/framework.dart' ;
//'modules/messenger/messengerDesign.dart'gn.dart';
//import 'package:flutter_screen/usersScreen.dart';

void main() => runApp(App());

class App extends StatelessWidget{
  //constructor في البدابة يتم تنفيذال ثم يتم تنفيذ ال Build
  //build
  @override
  //what context mean ?
  Widget build(BuildContext context){
    return MaterialApp(
debugShowCheckedModeBanner: false,

      home: SafeArea(
        child:LoginScreenFacebook(
        ),
      ),


    );
  }
}
