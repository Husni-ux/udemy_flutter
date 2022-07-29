import 'package:flutter_bloc/flutter_bloc.dart';

abstract class ToDoStates{}

class ToDoInitialState extends ToDoStates{}

class ToDoChangeBottomNavBarState extends ToDoStates{}

class CreateDataBase extends ToDoStates{}

class InsertToDataBase extends ToDoStates{}

class GetFromDatabase extends ToDoStates{}

class ToDoChangeBottomSheetState extends ToDoStates{}

class GetDataBaseLoadingState extends ToDoStates{}

class UpdateDataBase extends ToDoStates{}

class DeleteDataBase extends ToDoStates{}
