import 'package:bank/features/bank/data/datasources/logic.dart';
import 'package:bank/features/bank/data/models/users.dart';
import 'package:flutter/material.dart';

class Usersetingpage extends StatelessWidget {
  const Usersetingpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: ListView(
          children: [
            for (enuser user in enuser.values)
              InkWell(
                onTap: () {
                  performuserstates(user.index,context);
                },
                child: Card(
                  color: Colors.indigo[200],
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Center(child: Text("${user.name}")),
                  ),
                ),
              )
          ],
        ));
  }
}
   