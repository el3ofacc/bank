import 'package:bank/features/bank/presentation/bloc/addusercubit.dart';
import 'package:bank/features/bank/presentation/bloc/delcli.dart';
import 'package:bank/features/bank/presentation/bloc/deleteusercubit.dart';
import 'package:bank/features/bank/presentation/bloc/filling.dart';
import 'package:bank/features/bank/presentation/bloc/readuserscubit.dart';
import 'package:bank/features/bank/presentation/bloc/upcli.dart';
import 'package:bank/features/bank/presentation/bloc/updateusercubit.dart';
import 'package:bank/features/bank/presentation/pages/homepage.dart';
import 'package:bank/features/bank/presentation/pages/signup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
late SharedPreferences stored ;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
stored= await SharedPreferences.getInstance();
  int? id = await stored.getInt("id");
  runApp(Myapp(id: id,));
}

class Myapp extends StatelessWidget {
  Myapp({super.key,required this.id});

  final int? id;
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => Filling(),
        ),
 BlocProvider(
  create: (context) => Delcli(),
 
 ),BlocProvider(
  create: (context) => Upcli(),
 
 ),
 BlocProvider(
  create: (context) => Addusercubit(),
   
 ),
 BlocProvider(
  create: (context) => Readuserscubit(),
   
 ),
 BlocProvider(
  create: (context) => Deleteusercubit(),
   
 ),
  BlocProvider(
  create: (context) => Updateusercubit(),
   
 )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: id == 1 ? Homepage() : Signup(),
      ),
    );
  }
}
