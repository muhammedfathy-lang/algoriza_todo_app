import 'package:flutter/Material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/cubit.dart';
import '../cubit/states.dart';
import '../widget/BuildItemTaskView/BuildFoundTasks.dart';

class uncompleteScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CubitApp, statesApp>(
        listener: (context, state) {},
        builder: (context, state) {
          var uncompletetasks = CubitApp.get(context).UncompleteTasks;
          if (uncompletetasks.length == 0) {
            return CircularProgressIndicator();
          } else
            return ListView.separated(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemBuilder: (context, index) =>
                BuildItemtask(uncompletetasks[index], context)
                , separatorBuilder: (context, index) =>
                    Container(
                      color: Colors.grey[300],
                      width: double.infinity,
                      height: 1,
                    ),
                itemCount: uncompletetasks.length);
        });
  }
}