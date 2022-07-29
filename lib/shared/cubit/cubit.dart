import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqflite/sqflite.dart';
import 'package:udemy_flutter/shared/cubit/states.dart';
import '../../models/archive_tasks/archive_tasks_screen.dart';
import '../../models/done_tasks/done_tasks_screen.dart';
import '../../models/new_tasks/tasksScreen.dart';

class ToDoCubit extends Cubit<ToDoStates> {
  ToDoCubit() : super(ToDoInitialState());

  static ToDoCubit get(context) => BlocProvider.of(context);
  var currentIndex = 0;
  Database database;


  List<Widget> toggleBetweenScreen = [
    NewTasksScreen(),
    DoneTasksScreen(),
    ArchiveTasksScreen(),
  ];

  List<String> titles = [
    'New Tasks',
    'Done Tasks',
    'Archive Tasks',
  ];

  void changeIndex(int index) {
    currentIndex = index;
    emit(ToDoChangeBottomNavBarState());
  }

  List<Map> newTasks = [];
  List<Map> doneTasks = [];
  List<Map> archiveTasks = [];

  void CreateDB() {
    openDatabase(
      'todo.db',
      version: 1,
      onCreate: (database, version) async {
        print("DATABASE CREATED");
        await database.execute(
            'CREATE TABLE tasks(id INTEGER PRIMARY KEY,title TEXT,date TEXT,time TEXT,status TEXT)');
        print("table created");
      },
      onOpen: (database) {
        getFromDb(database);
        print("database opened");
      },
    ).then((value) {
      database = value;
      emit(CreateDataBase());
    });
  }

  InsertToDB({
    @required String title,
    @required String time,
    @required String date,
  }) async {
    await database.transaction((txn) {
      txn.rawInsert(
          'INSERT INTO tasks(title, date, time, status) VALUES("$title", "$date","$time","new") ');
    }).then((value) {
      print('inserted successful');
      emit(InsertToDataBase());
      getFromDb(database);
    }).catchError((error) {
      print('Error ${error.toString()}');
    });
  }

  void getFromDb(database) {

    newTasks=[];
    doneTasks=[];
    archiveTasks=[];
    emit(GetDataBaseLoadingState());
    database.rawQuery('SELECT * FROM tasks ').then((value) {
      value.forEach((element) {
        if (element['status'] == 'new') {
          newTasks.add(element);
        } else if (element['status'] == 'done') {
          doneTasks.add(element);
        } else {
          archiveTasks.add(element);
        }
      });
      emit(GetFromDatabase());
    });
  }

  void updateData({@required String status, @required int id}) {
    database.rawUpdate('UPDATE tasks SET status = ? WHERE id = ?',
        ['$status', id]).then((value) {
      getFromDb(database);
      emit(UpdateDataBase());
    });
  }

  void deleteData({@required int id}) {
    database.rawDelete('DELETE FROM tasks WHERE id = ?', [id])
        .then((value) {
      getFromDb(database);
      emit(DeleteDataBase());
    });
  }

  bool isBottomSheetShown = false;
  IconData fabIcon = Icons.edit;

  void changeBottomSheetState(
      {@required bool isShow, @required IconData icon}) {
    isBottomSheetShown = isShow;
    fabIcon = icon;
    emit(ToDoChangeBottomSheetState());
  }

}
