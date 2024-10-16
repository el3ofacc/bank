 

import 'package:bank/features/bank/data/datasources/logic.dart';
import 'package:bank/features/bank/presentation/widgets/mybutton.dart';
import 'package:bank/features/bank/presentation/widgets/mytextform.dart';
import 'package:flutter/material.dart';

class Addbalance extends StatefulWidget {
  Addbalance({super.key, required this.index});
  int index;
  @override
  State<Addbalance> createState() => _AddbalanceState();
}

class _AddbalanceState extends State<Addbalance> {
  TextEditingController balance = TextEditingController();
  GlobalKey<FormState> formkey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Form(
        key: formkey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Mytextform(controller: balance, hint: "balance"),
            Mybutton(
                textdata: "add",
                myfun: () {
                  addtobalance(formkey, balance, widget.index, context);
                })
          ],
        ),
      ),
    );
  }
}
