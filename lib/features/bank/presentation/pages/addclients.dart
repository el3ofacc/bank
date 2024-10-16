import 'package:bank/features/bank/data/datasources/logic.dart';
import 'package:bank/features/bank/presentation/widgets/mybutton.dart';
import 'package:bank/features/bank/presentation/widgets/mytextform.dart';
import 'package:flutter/material.dart';

class Addclients extends StatefulWidget {
  const Addclients({super.key});

  @override
  State<Addclients> createState() => _AddclientsState();
}

class _AddclientsState extends State<Addclients> {
  TextEditingController name = TextEditingController();
  TextEditingController balance = TextEditingController(); 
  GlobalKey<FormState> formkey = GlobalKey();
  @override 
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Form(
        key: formkey,
        child: Column(
          children: [
            Column(
              children: [
                Mytextform(controller: name, hint: "name"),
                Mytextform(controller: balance, hint: "balance"),
                Mybutton(
                    textdata: "add client",
                    myfun: () {
                      addclients(context, name, balance,clientslist);
                      
                    })
              ],
            ),
          ],
        ),
      ),
    );
  }
}
