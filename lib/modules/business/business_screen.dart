import 'package:conditional_builder/conditional_builder.dart';
//import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy_flutter/layout/news_app/cubit/cubit.dart';
import 'package:udemy_flutter/layout/news_app/cubit/states.dart';

import '../../shared/components/components.dart';

//import '../../shared/components/components.dart';

class BusinrssScreen  extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewStates>(
      listener: (BuildContext context, state) {},
      builder: (BuildContext context, state) {
        var list = NewsCubit.get(context).business;
        return ConditionalBuilder(
          condition: state is! NewsGetBusinessLoadingState,
          builder: (context)=>
              ListView.separated(
                physics: BouncingScrollPhysics(),
              itemBuilder: (context,index)=>BuildArticleItem(list[index]),
              separatorBuilder: (context , index)=>myDivider(),
              itemCount: 10,
              ),
          fallback: (context)=>Center(child: CircularProgressIndicator()),
        );
      },

    );
  }
}
