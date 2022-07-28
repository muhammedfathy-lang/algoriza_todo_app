
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app_algoriza/presentation/cubit/cubit.dart';
import 'package:to_do_app_algoriza/presentation/pages/boardPages.dart';

void main(){
  runApp(Myapp());
}

class Myapp extends StatelessWidget {
  const Myapp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
      BlocProvider<CubitApp>(
          create: (BuildContext context )=>CubitApp()..createDatabase()
      ),
    ],
      child:  MaterialApp(
    home: boardscreen(),
    )
    );
  }
}
