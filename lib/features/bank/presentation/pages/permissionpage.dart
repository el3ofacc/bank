import 'package:bank/features/bank/data/datasources/logic.dart';
import 'package:bank/features/bank/presentation/widgets/adduserswich.dart';
import 'package:bank/features/bank/presentation/widgets/deleteuserswich.dart';
import 'package:bank/features/bank/presentation/widgets/readusers.dart';
import 'package:bank/features/bank/presentation/widgets/updateuser.dart';
import 'package:flutter/material.dart';

class Permissionpage extends StatelessWidget {
  const Permissionpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(
        itemCount: userslist.length-1,
        itemBuilder: (context, index) {
        return Card(
          child: Column(
            children: [
              Text("name : ${userslist[index+1].email}"),
              Readusers(index: index+1,),
               Adduserswich(index: index+1,),
               Deleteuserswich(index: index+1,),
               Updateuserswich(index: index+1,),

            ],
          ),
        );
      }),
    );
  }
}
