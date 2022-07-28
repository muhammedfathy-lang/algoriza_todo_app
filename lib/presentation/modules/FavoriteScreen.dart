import 'package:flutter/Material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/cubit.dart';
import '../cubit/states.dart';
import '../widget/BuildItemTaskView/BuildFoundTasks.dart';
import '../widget/BuildItemTaskView/NoTasksFound.dart';

class FavoriteTasksScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CubitApp, statesApp>(
        listener: (context, state) {},
        builder: (context, state) {
          var tasks = CubitApp.get(context).FavoriteTasks;
          if (tasks.length == 0) {
            return NoTasksColumn();
          }
          else
            return ListView.separated(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemBuilder: (context, index) =>
                    BuildItemtask(tasks[index],context)
                , separatorBuilder: (context, index) =>
                Container(
                  color: Colors.grey[300],
                  width: double.infinity,
                  height: 1,
                ),
                itemCount: tasks.length);
        });
  }
}