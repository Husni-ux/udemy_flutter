// ignore_for_file: avoid_print
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:udemy_flutter/models/archive_tasks/archive_tasks_screen.dart';
import 'package:udemy_flutter/models/done_tasks/done_tasks_screen.dart';
import 'package:udemy_flutter/models/new_tasks/tasksScreen.dart';
import 'package:sqflite/sqflite.dart';
import 'package:udemy_flutter/shared/components/components.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:intl/intl.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:conditional_builder/conditional_builder.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy_flutter/shared/cubit/cubit.dart';
import 'package:udemy_flutter/shared/cubit/states.dart';

import '../../shared/components/constants.dart';

//1. create db
//2. create tables
//3. open database
//4. insert to db
//5.delete form db
//6.get from db
//7. update from db

//بما انه العملية راح تاخد وقت بس بالنهاية راح ييجي تنفذها ف هي ان شاء الله راح تيجي ف بستخدم Future
// Future<String> getName() async {
//   return 'Husni Tabazah';
// }
class HomeLayout extends StatelessWidget {
  var timeController = TextEditingController();
  var dateController = TextEditingController();
  var titleController = TextEditingController();
  var scaffoldKey = GlobalKey<ScaffoldState>();
  var formKey = GlobalKey<FormState>();



  HomeLayout({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(

      //عشان يكون شكله كانه تم حفظه داخل متغير بحط بعده ..
      create: (BuildContext context) => ToDoCubit()..CreateDB(),
      child: BlocConsumer<ToDoCubit, ToDoStates>(
        listener: (context, ToDoStates state) {
          if (state is InsertToDataBase) {
            Navigator.pop(context);
          }
        },
        builder: (context, ToDoStates state) {
          ToDoCubit cubit = ToDoCubit.get(context);

          return Scaffold(
            key: scaffoldKey,
            appBar: AppBar(
              backgroundColor: HexColor("#150d44"),
              title: Text(
                cubit.titles[cubit.currentIndex],
              ),
              actions: [
              ],
            ),
            body: ConditionalBuilder(
              condition: state is! GetDataBaseLoadingState,
              builder: (context) =>
                  cubit.toggleBetweenScreen[cubit.currentIndex],
              fallback: (context) => Center(child: CircularProgressIndicator()),
            ),
            floatingActionButton: FloatingActionButton(
              backgroundColor: Colors.pinkAccent,
              onPressed: () {
                if (cubit.isBottomSheetShown) {
                  if (formKey.currentState.validate()) {
                  cubit.InsertToDB(
                        title: titleController.text,
                        time: timeController.text,
                        date: dateController.text);
                    // insertToDb(
                    //   title: titleController.text,
                    //   date: dateController.text,
                    //   time: timeController.text,
                    // ).then((value) {
                    //   getFromDb(database).then((value) {
                    //     Navigator.pop(context);
                    //     // setState((){
                    //     //   isBottomSheetShown = false;
                    //     //   setState(() {
                    //     //     fabIcon = Icons.edit;
                    //     //   });
                    //     //   tasks =value;
                    //     // });
                    //   });
                    // });
                  }
                } else {
                  scaffoldKey.currentState
                      .showBottomSheet(
                        (context) => Container(
                          padding: EdgeInsets.all(20.0),
                          color: Colors.white,
                          child: Form(
                            key: formKey,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                TextFormField(
                                  keyboardType: TextInputType.text,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    labelText: "Task Title",
                                    prefixIcon: Icon(Icons.title),
                                  ),
                                  controller: titleController,
                                  validator: (valu) {
                                    if (valu.isEmpty) {
                                      return 'Title canot be empty';
                                    } else {
                                      return null;
                                    }
                                  },
                                  onTap: () {},
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                TextFormField(
                                  keyboardType: TextInputType.datetime,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    labelText: "Task Time",
                                    prefixIcon: Icon(Icons.watch_later_rounded),
                                  ),
                                  controller: timeController,
                                  validator: (valu) {
                                    if (valu.isEmpty) {
                                      return 'Time canot be empty';
                                    } else {
                                      return null;
                                    }
                                  },
                                  onTap: () {
                                    showTimePicker(
                                            context: context,
                                            initialTime: TimeOfDay.now())
                                        .then((valu) {
                                      timeController.text =
                                          valu.format(context).toString();
                                    });
                                  },
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                TextFormField(
                                  keyboardType: TextInputType.datetime,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    labelText: "Task date",
                                    prefixIcon: Icon(Icons.date_range_rounded),
                                  ),
                                  controller: dateController,
                                  validator: (valu) {
                                    if (valu.isEmpty) {
                                      return 'Date canot be empty';
                                    } else {
                                      return null;
                                    }
                                  },
                                  onTap: () {
                                    showDatePicker(
                                      context: context,
                                      initialDate: DateTime.now(),
                                      firstDate: DateTime.now(),
                                      lastDate: DateTime.parse('2022-12-30'),
                                    ).then((valu) {
                                      dateController.text = DateFormat.yMMMd()
                                          .format(valu)
                                          .toString();
                                      print(DateFormat.yMMMd().format(valu));
                                    });

                                  },

                                ),
                                // defaultFormField(
                                //
                                //   controller: titleController,
                                //   type: TextInputType.text,
                                //    onTap: () {
                                //    },
                                //   validate: (String value) {
                                //     if (value.isEmpty) {
                                //       return 'title must not be empty';
                                //     }
                                //     return null;
                                //   },
                                //   label: 'Task Title',
                                //   prefix: Icons.title,
                                // ),
                                // SizedBox(
                                //   height: 15.0,
                                // ),
                                // defaultFormField(
                                //   border: OutlineInputBorder(
                                //     borderSide:
                                //     BorderSide(color: Colors.pinkAccent),
                                //   ),
                                //   controller: timeController,
                                //   // isClickable:false,
                                //   type: TextInputType.datetime,
                                //   onTap: () {
                                //     showTimePicker(
                                //         context: context,
                                //         initialTime: TimeOfDay.now())
                                //         .then((value) {
                                //       timeController.text =
                                //           value.format(context).toString();
                                //       print(value.format(context));
                                //     });
                                //   },
                                //   validate: (String value) {
                                //     if (value.isEmpty) {
                                //       return 'time must not be empty';
                                //     }
                                //     return null;
                                //   },
                                //   label: 'Task time',
                                //   prefix: Icons.watch_later,
                                // ),
                                // SizedBox(
                                //   height: 15.0,
                                // ),
                                // defaultFormField(
                                //   border: OutlineInputBorder(
                                //     borderSide:
                                //     BorderSide(color: Colors.pinkAccent),
                                //   ),
                                //   controller: dateController,
                                //   //isClickable:false,
                                //   type: TextInputType.datetime,
                                //   onTap: () {
                                //     showDatePicker(
                                //       context: context,
                                //       initialDate: DateTime.now(),
                                //       firstDate: DateTime.now(),
                                //       lastDate: DateTime.parse('2022-12-30'),
                                //     ).then((value) {
                                //       dateController.text = DateFormat.yMMMd()
                                //           .format(value)
                                //           .toString();
                                //       print(DateFormat.yMMMd().format(value));
                                //     });
                                //   },
                                //   validate: (String value) {
                                //     if (value.isEmpty) {
                                //       return 'date must not be empty';
                                //     }
                                //     return null;
                                //   },
                                //   label: 'Task Date',
                                //   prefix: Icons.calendar_month,
                                // ),
                              ],
                            ),
                          ),
                        ),
                        elevation: 15.0,
                      )
                      .closed
                      .then((valu) {
                    cubit.changeBottomSheetState(
                        isShow: false, icon: Icons.edit);
                    cubit.isBottomSheetShown = false;
                  });
                  cubit.changeBottomSheetState(isShow: true, icon: Icons.add);
                }
              },
              child: Icon(cubit.fabIcon),
            ),
            bottomNavigationBar: CurvedNavigationBar(
              backgroundColor: Colors.white,
              color: Colors.pink,
              buttonBackgroundColor: Colors.white,
              animationDuration: Duration(milliseconds: 300),
              items: [
                Icon(
                  Icons.menu,
                  size: 18,
                  color: Colors.black,
                ),
                Icon(
                  Icons.done,
                  size: 18,
                  color: Colors.black,
                ),
                Icon(
                  Icons.archive_outlined,
                  size: 18,
                  color: Colors.black,
                ),
              ],
              onTap: (index) {
                cubit.changeIndex(index);

                // setState(() {
                //   currentIndex = index;
                // });
                //cubit.currentIndex =index;
              },

              //   type: BottomNavigationBarType.fixed,
              //   currentIndex: currentIndex,
              //   onTap: (index) {
              //     setState(() {
              //       currentIndex = index;
              //     });
              //   },
              //   //showSelectedLabels: false,
              //   //backgroundColor: Colors.yellowAccent,
              //   items: [
              //     BottomNavigationBarItem(
              //       icon: Icon(Icons.menu),
              //       label: 'Tasks',
              //     ),
              //     BottomNavigationBarItem(
              //       icon: Icon(Icons.check),
              //       label: 'Done',
              //     ),
              //     BottomNavigationBarItem(
              //       icon: Icon(Icons.archive_outlined),
              //       label: 'Archived',
              //     ),
              //   ],
              // ),
              //body: ,
            ),
          );
        },
      ),
    );
  }
}
