import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:udemy_flutter/shared/cubit/cubit.dart';
import 'package:udemy_flutter/shared/cubit/states.dart';
import '../../shared/components/components.dart';
import '../../shared/components/constants.dart';

class NewTasksScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return BlocConsumer<ToDoCubit ,ToDoStates >(
      listener: (BuildContext context, state) {  },
      builder: (BuildContext context, state) {
        var tasks =   ToDoCubit.get(context).newTasks;
        return ConditionalBuilder(
          condition: tasks.length>0,
          builder: (BuildContext context)=>   ListView.separated(
              itemBuilder: (context , index)=>buildTaskItem(tasks[index],context),
              separatorBuilder:  (context , index)=>Container(
                width: double.infinity,
                height: 1.0,
                color: Colors.grey[300],
              ),
              itemCount: tasks.length),
          fallback: (context) =>Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Icon(Icons.add,
                size: 75.0,
                color: Colors.pinkAccent,
                ),

              Text(
                'Add some taske'
                ,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30.0,

                ),
              ),
              ],
            ),
          ),


        );
      },

    );
  }
}
