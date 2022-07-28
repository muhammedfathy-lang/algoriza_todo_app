
import 'dart:ui';

import 'package:flutter/Material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqflite/sqflite.dart';
import 'package:to_do_app_algoriza/presentation/cubit/states.dart';

import '../modules/FavoriteScreen.dart';
import '../modules/completeTaskView.dart';
import '../modules/tasks.dart';
import '../modules/uncomplete.dart';

class CubitApp extends Cubit<statesApp>{
  CubitApp() : super(initialState());

  List<Widget> screens = [
    allTasksScreen(),
    completeScreen(),
    uncompleteScreen(),
    FavoriteTasksScreen(),
  ];

  Color allColorText =Colors.black ;
  Color completeColorText =Colors.grey;
  Color uncompleteColorText =Colors.grey;
  Color favoriteColorText =Colors.grey;
  Color colorIcon =Colors.white;
  Color colorBoxdecorationOfTasks =Colors.redAccent;
  IconData TaskIcon =Icons.check;


  List<Map> newtasks = [];
  List<Map> Completetasks = [];
  List<Map> UncompleteTasks = [];
  List<Map> FavoriteTasks = [];

  late Database database;

  static CubitApp get(context) =>BlocProvider.of(context);
  int current_indexScreen=0 ;
  void changeIndexScreenViewTabBar(int index) {
   current_indexScreen=index;
    emit(ChangeScreenviewTabBar());
  }

  void changeColorTabBarText(int indexstate){

  if(indexstate==0){
       changeColorAllTabBarText( indexstate);
  }
     else if(indexstate==1){
       changeColorCompleteTabBarText( indexstate);
    }
    else if(indexstate==2){
       changeColorUnCompleteTabBarText( indexstate);
    }
    else if(indexstate==3){
       changeColorFavoriteTabBarText( indexstate);
    }
    emit(ChangeColorTextTabBarState());
  }
  void changeColorAllTabBarText(int indexstate){
    allColorText =Colors.black ;
    completeColorText =Colors.grey;
    uncompleteColorText =Colors.grey;
    favoriteColorText =Colors.grey;
  }
  void changeColorCompleteTabBarText(int indexstate){
    allColorText =Colors.grey ;
    completeColorText =Colors.black;
    uncompleteColorText =Colors.grey;
    favoriteColorText =Colors.grey;
  }
  void changeColorUnCompleteTabBarText(int indexstate){
    allColorText =Colors.grey ;
    completeColorText =Colors.grey;
    uncompleteColorText =Colors.black;
    favoriteColorText =Colors.grey;
  }
  void changeColorFavoriteTabBarText(int indexstate){
    allColorText =Colors.grey ;
    completeColorText =Colors.grey;
    uncompleteColorText =Colors.grey;
    favoriteColorText =Colors.black;

  }

  void createDatabase() {
    openDatabase('todo.db', version: 1, onCreate: (database, version) {
      database.execute(
          'CREATE TABLE TASKS (ID INTEGER PRIMARY KEY ,title TEXT,date TEXT,time TEXT ,endtime TEXT ,status TEXT)')
          .then((value) {
        print('creation is done');
      }).catchError((error) {
        print('creation error is ${error.toString()}');
      });
    }, onOpen: (database) {
      getDataFromDatabase(database);
      print('database open');
    }).then((value) {
      database = value;
      print('bnm//////////////////');
      emit(AppCreateDatabase());
    });
  }
  void getDataFromDatabase(database) {
    newtasks=[];
    Completetasks=[];
    UncompleteTasks=[];
    database.rawQuery('SELECT * FROM TASKS').then((value) {
      //
      print ('valuertrgfgdfsdffdfsddf${value}');
      value.forEach((element) {
        if (element['status'] == 'New') {
          newtasks.add(element);
          print('new ${element}');
        } else if (element['status'] == 'done') {
          print('done ${element}');
          Completetasks.add(element);
        } else {
          UncompleteTasks.add(element);
          print('else'+element);
        }
        print('okay');
      });
      emit(AppGetDatabase());
    });
  }
 void InserttoDatabase(
      {required String title,
        required String time,
        required String endtime,
        required String date,
        }) async {
   await database.transaction((txn)async {
     txn.rawInsert('INSERT INTO TASKS(title,time,endtime,date,status)VALUES'
          '("$title","$time","$endtime","$date","New")')
          .then((value) {
        emit(AppInsertDatabase());
        print('$value successfully');
        getDataFromDatabase(database);
        return value;
      });
    });
  }
  void DeleteData({ required int id}) async {
    //.rawDelete('DELETE FROM Test WHERE name = ?', ['another name']);
    database.rawUpdate(
        'DELETE FROM TASKS WHERE ID = ?', [id,]).then((value) {
      print(value);
      getDataFromDatabase(database);
      emit(AppDeleteDatabase());
    });
  }
  void UpdateData({required String status, required int id}) async {
    database.rawUpdate(
        'UPDATE TASKS SET status=? WHERE ID=?', ['$status', id]).then((value) {
      print(value);
      getDataFromDatabase(database);
      emit(AppUpdateDatabase());
    });
  }
  Widget changePropertyIconCheck(status){
    print('///////////////////////////////////////');
    print('status id $status');
    if(status=='done'){
     return Container(
       height: 25,
       width: 25,
       decoration: BoxDecoration(
           color: Colors.redAccent,
           borderRadius: BorderRadius.circular(7),
           border: Border.all(
               color: Colors.red, width: 2)
       ),
       child: Icon(
         TaskIcon, color: Colors.white, size: 15,),
     );
    }
    else if(status=='New'){
      TaskIcon=Icons.check_box_outline_blank ;
      colorBoxdecorationOfTasks = Colors.white;
      return Container(
        height: 25,
        width: 25,
        decoration: BoxDecoration(
            color: colorBoxdecorationOfTasks,
            borderRadius: BorderRadius.circular(7),
            border: Border.all(
                color: Colors.red, width: 2)
        ),
        child: Icon(
         TaskIcon, color: Colors.white, size: 15,),
      );
    }
    else {
      TaskIcon=Icons.check_box_outline_blank ;
      colorBoxdecorationOfTasks = Colors.redAccent;
      return Container(
        height: 25,
        width: 25,
        decoration: BoxDecoration(
            color: Colors.redAccent,
            borderRadius: BorderRadius.circular(7),
            border: Border.all(
                color: Colors.red, width: 2)
        ),
        child: Icon(
          TaskIcon, color: Colors.white, size: 15,),
      );
    }

  }

}