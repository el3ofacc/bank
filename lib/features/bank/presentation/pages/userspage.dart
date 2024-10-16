import 'package:bank/features/bank/data/datasources/logic.dart';
import 'package:bank/features/bank/data/models/users.dart';
import 'package:bank/features/bank/presentation/pages/updateuserpage.dart';
import 'package:flutter/material.dart';

class Userspage extends StatelessWidget {
  const Userspage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body:  ListView.builder(
        itemCount: userslist.length,
        itemBuilder: (context,index){
        return
         Dismissible(
              key: Key(userslist[index].email),
              onDismissed: (direction) {
                delete(context, userslist[index], userslist);
              },
              child: InkWell(
                onLongPress: () {
                  showmessage("update user", context, () {
                    navigate(context, () => Updateuserpage(index:index ,));
                  });
                },
                child: Card(
                  color: Colors.indigo[200],
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("name : ${userslist[index].email}"),
                  ),
                ),
              ),
            );

      })
    );
  }
}
 