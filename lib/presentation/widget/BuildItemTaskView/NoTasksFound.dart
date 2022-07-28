
import 'package:flutter/Material.dart';

Widget NoTasksColumn(){
  return
    Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.menu,
            color:Colors.grey ,
            size: 35,
          ),
          SizedBox(height: 10,),
          Text('No Thanks Yet, Please add some tasks',
            style: TextStyle(
                color: Colors.grey,
                fontWeight: FontWeight.bold,
                fontSize: 16
            ),)
        ],),
    );
}
