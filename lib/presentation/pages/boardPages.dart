
import 'package:flutter/Material.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app_algoriza/presentation/cubit/cubit.dart';
import 'package:to_do_app_algoriza/presentation/pages/add_task_Pages.dart';

import '../cubit/states.dart';

class boardscreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CubitApp,statesApp>(

          builder: (BuildContext context, state) {
            return DefaultTabController(
                length: 4,
                child: Scaffold(
                  backgroundColor: Colors.white,
                  appBar: AppBar(
                    backgroundColor: Colors.white,
                    elevation: 0,
                    title: (Text(
                      'Board', style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                        color: Colors.black
                    ),)),

                    actions: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Icon(Icons.search, color: Colors.black54,),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Icon(Icons.notifications_none_outlined,
                            color: Colors.black54),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 30.0, left: 10),
                        child: Icon(Icons.menu, color: Colors.black54),
                      ),
                    ],
                  ),

                  body: Column(
                    children: [

                      Container(
                        width: double.infinity,
                        height: 2,
                        color: Colors.grey[300],
                      ),
                      SizedBox(height: 20,),
                      TabBar(
                        isScrollable: true,
                        indicatorColor: Colors.black,
                        labelColor: Colors.black,
                        tabs: [
                          Container(
                            height: 30,
                            child: Text('All', style: TextStyle(
                                color: CubitApp.get(context).allColorText),),),
                          Container(
                            height: 30,
                            child: Text('Completed', style: TextStyle(
                                color: CubitApp.get(context).completeColorText),),),
                          Container(
                            height: 30,
                            child: Text('Uncompleted', style: TextStyle(
                                color: CubitApp.get(context).uncompleteColorText),),),
                          Container(
                            height: 30,
                            child: Text('Favorite', style: TextStyle(
                                color: CubitApp.get(context).favoriteColorText),),),
                        ],
                        onTap: (value) {
                          CubitApp.get(context).changeColorTabBarText(value);
                          CubitApp.get(context).changeIndexScreenViewTabBar(value);


                        },
                      ),

                      Container(
                        width: double.infinity,
                        height: 2,
                        color: Colors.grey[300],
                      ),

                      // TabBarView(
                      //
                      //   children: [
                      //   Container(
                      //     color: Colors.blue,
                      //     width: 10,
                      //     height: 10,
                      //   ),
                      //   Container(
                      //     color: Colors.green,
                      //     width: 10,
                      //     height: 10,
                      //   ),
                      //   Container(
                      //     color: Colors.yellow,
                      //     width: 10,
                      //     height: 10,
                      //   ),
                      //   Container(
                      //     color: Colors.red,
                      //     width: 10,
                      //     height: 10,
                      //   ),
                      //
                      //   ],
                      // ),

                      // Padding(
                      //   padding: const EdgeInsets.only(top: 30.0, left: 40),
                      //   child: Row(
                      //     mainAxisAlignment: MainAxisAlignment.start,
                      //     children: [
                      //       Container(
                      //         height: 25,
                      //         width: 25,
                      //         decoration: BoxDecoration(
                      //             color: Colors.redAccent,
                      //             borderRadius: BorderRadius.circular(7),
                      //             border: Border.all(
                      //                 color: Colors.red, width: 2)
                      //         ),
                      //         child: Icon(
                      //           Icons.check, color: Colors.white, size: 15,),
                      //       ),
                      //       SizedBox(width: 20,),
                      //       Text('design', style: TextStyle(fontSize: 17),)
                      //     ],
                      //   ),
                      // ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(40.0),
                              child: Container(
                                height: 50,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: Colors.green[400]
                                ),
                                child: TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context, MaterialPageRoute(builder:
                                        (context) => addTask()));
                                  },
                                  child: Text('Add a task',
                                    style: TextStyle(color: Colors.white),),
                                ),
                              ),

                            ),
                          ],
                        ),
                      ),

                    ],
                  ),
                ));

  });}
}
