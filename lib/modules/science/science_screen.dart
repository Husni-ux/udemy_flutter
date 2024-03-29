import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy_flutter/layout/news_app/cubit/cubit.dart';
import 'package:udemy_flutter/shared/components/components.dart';

import '../../layout/news_app/cubit/states.dart';

class ScienceScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return BlocConsumer<NewsCubit, NewStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var list = NewsCubit.get(context).business;
        return ConditionalBuilder(
          condition: list is!NewsGetScienceLoadingState,
          builder: (context) =>
             ListView.separated(
               physics: BouncingScrollPhysics(),
                itemBuilder: (context,index)=>BuildArticleItem(list[index]),
                separatorBuilder:(context,index)=> myDivider(),
                itemCount: 10
             ),
        fallback: (context)=>Center(child: CircularProgressIndicator()),
        );
      },

    );
  }
}
