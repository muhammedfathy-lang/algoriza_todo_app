import 'package:flutter/Material.dart';

import '../../cubit/cubit.dart';

Widget BuildItemtask(Map model,context) {
  return Dismissible(
    key: Key(model['ID'].toString()),
      child:  Padding(
        padding: const EdgeInsets.only(top: 30.0, left: 40),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CubitApp.get(context).changePropertyIconCheck(model['status']),
            SizedBox(width: 20,),
            Text('${model['title']}', style: TextStyle(fontSize: 17),)
          ],
        ),
      ),
    onDismissed:(direction) {
      CubitApp.get(context).DeleteData(id: model['ID']);
    }
  );
}
