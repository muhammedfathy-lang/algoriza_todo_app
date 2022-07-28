import 'package:flutter/Material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:to_do_app_algoriza/presentation/cubit/cubit.dart';

import '../cubit/states.dart';

class addTask extends StatelessWidget {
  var titlecontroller = TextEditingController();
  var datecontroller = TextEditingController();
  var startTimecontroller = TextEditingController();
  var endTimecontroller = TextEditingController();
  var reminderTimecontroller = TextEditingController();
  var rebetTimecontroller = TextEditingController();
  var formdkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {

        return  BlocConsumer<CubitApp,statesApp>(
        listener: (context , state){
        },
        builder: (context , state){
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              backgroundColor: Colors.white,
              elevation: 0,
              title: Text('Add task',
                style: TextStyle(
                    color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold
                ),),
              leading:  Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: TextButton(
                    onPressed: (){
                      Navigator.pop(context);
                    },
                    child: Icon(Icons.arrow_back_ios,size: 15,color: Colors.black,)),
              ),
            ),
            body: SingleChildScrollView(
              child: Column(

                children: [
                  Container(
                    width: double.infinity,
                    height: 2,
                    color: Colors.grey[300],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 35.0,top: 5,right: 35),
                    child: Form(
                      key: formdkey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 20,),
                          Text('Title',style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15
                          ),),
                          SizedBox(height: 5,),
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.grey[200],
                                borderRadius: BorderRadius.circular(15)
                            ),
                            child: TextFormField(
                              controller: titlecontroller,
                              decoration: const InputDecoration(
                                labelText: "Design team meeting",
                                labelStyle: TextStyle(
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.grey),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white54, width: 2.0),
                                  borderRadius: BorderRadius.all(Radius.circular(15.0)),
                                ),
                              ),

                            ),
                          ),
                          SizedBox(height: 20,),
                          Text('Deadline',style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15
                          ),),
                          SizedBox(height: 5,),
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.grey[200],
                                borderRadius: BorderRadius.circular(15)
                            ),
                            child: TextFormField(
                              controller: datecontroller,
                              decoration: const InputDecoration(
                                labelText: "2021-02-28",
                                labelStyle: TextStyle(
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.grey),
                                suffixIcon: Icon(Icons.keyboard_arrow_down,size: 30,color: Colors.grey,),

                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white54, width: 2.0),
                                  borderRadius: BorderRadius.all(Radius.circular(15.0)),
                                ),
                              ),
                              validator:(value) {
                                if (value!.isEmpty){
                                  return 'date must not be empty';
                                }
                              },
                              onTap: (){
                                showDatePicker(context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime.now(),
                                    lastDate: DateTime.parse('3000-12-31')).then((value) => {
                                  datecontroller.text= DateFormat('dd-MM-yyyy').format(value!)
                                });
                              },
                            ),
                          ),
                          SizedBox(height: 20,),
                          Row(
                            children: [

                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Start time',style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15
                                    ),),
                                    SizedBox(height: 10,),
                                    Container(
                                      decoration: BoxDecoration(
                                          color: Colors.grey[200],
                                          borderRadius: BorderRadius.circular(15)
                                      ),
                                      child: TextFormField(
                                        controller: startTimecontroller,
                                        keyboardType: TextInputType.datetime,
                                        decoration: InputDecoration(
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(color: Colors.white54, width: 2.0),
                                          ),
                                          suffixIcon: Icon(Icons.watch_later_outlined),
                                          labelText: '11.00 Am',
                                        ),
                                        validator:(value) {
                                          if (value!.isEmpty){
                                            return 'time must not be empty';
                                          }
                                        },
                                        onTap: (){
                                          showTimePicker(context: context,
                                              initialTime: TimeOfDay.now()).then((value) => {
                                            startTimecontroller.text=value!.format(context)
                                          });
                                        },

                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(width: 15,),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('End time',style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15
                                    ),),
                                    SizedBox(height: 10,),
                                    Container(
                                      decoration: BoxDecoration(
                                          color: Colors.grey[200],
                                          borderRadius: BorderRadius.circular(15)
                                      ),
                                      child: TextFormField(
                                        controller: endTimecontroller,
                                        keyboardType: TextInputType.datetime,
                                        decoration: InputDecoration(
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(color: Colors.white54, width: 2.0),
                                          ),
                                          suffixIcon: Icon(Icons.watch_later_outlined),
                                          labelText: '14.00 Pm',
                                        ),
                                        validator:(value) {
                                          if (value!.isEmpty){
                                            return 'time must not be empty';
                                          }
                                        },
                                        onTap: (){
                                          showTimePicker(context: context,
                                              initialTime: TimeOfDay.now()).then((value) => {
                                            endTimecontroller.text=value!.format(context)
                                          });
                                        },

                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 20,),
                          Text('Remind',style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15
                          ),),
                          SizedBox(height: 5,),
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.grey[200],
                                borderRadius: BorderRadius.circular(15)
                            ),
                            child: TextFormField(

                              controller: reminderTimecontroller,
                              decoration: const InputDecoration(
                                labelText: "10 minutes early",
                                labelStyle: TextStyle(
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.grey),
                                suffixIcon: Icon(Icons.keyboard_arrow_down,size: 30,color: Colors.grey,),

                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white54, width: 2.0),
                                  borderRadius: BorderRadius.all(Radius.circular(15.0)),
                                ),
                              ),
                              validator:(value) {
                                if (value!.isEmpty){
                                  return 'Reminder must not be empty';
                                }
                              },
                              onTap: (){
                                showTimePicker(context: context,
                                    initialTime: TimeOfDay.now()).then((value) => {
                                  reminderTimecontroller.text=value!.format(context)
                                });
                              },
                            ),
                          ),
                          Text('Repeat',style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15
                          ),),
                          SizedBox(height: 5,),
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.grey[200],
                                borderRadius: BorderRadius.circular(15)
                            ),
                            child: TextFormField(
                              controller: rebetTimecontroller,
                              decoration: const InputDecoration(
                                labelText: "Weakly",
                                labelStyle: TextStyle(
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.grey),
                                suffixIcon: Icon(Icons.keyboard_arrow_down,size: 30,color: Colors.grey,),

                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white54, width: 2.0),
                                  borderRadius: BorderRadius.all(Radius.circular(15.0)),
                                ),
                              ),
                              validator:(value) {
                                if (value!.isEmpty){
                                  return 'Repeat must not be empty';
                                }
                              },
                              onTap: (){
                                showTimePicker(context: context,
                                    initialTime: TimeOfDay.now()).then((value) => {
                                  rebetTimecontroller.text=value!.format(context)
                                });
                              },
                            ),
                          ),
                          SizedBox(height: 20,),
                          Column(crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Container(
                                height: 50,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: Colors.green[400],
                                ),
                                child: TextButton(
                                  onPressed: () {
                                   if(formdkey.currentState!.validate()) {
                                     CubitApp.get(context).InserttoDatabase(
                                       title: titlecontroller.text,
                                       time: startTimecontroller.text,
                                       endtime: endTimecontroller.text,
                                       date: datecontroller.text,);
                                     print('hi thith error'+datecontroller.text);
                                   }
                                    },
                                  child: Text('Create a task',
                                    style: TextStyle(color: Colors.white),),
                                ),
                              ),
                            ],
                          )

                        ],
                      ),
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
