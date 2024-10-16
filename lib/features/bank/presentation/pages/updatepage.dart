import 'package:bank/features/bank/data/datasources/logic.dart';
import 'package:bank/features/bank/presentation/pages/clientspage.dart';
import 'package:bank/features/bank/presentation/widgets/mybutton.dart';
import 'package:bank/features/bank/presentation/widgets/mytextform.dart';
import 'package:flutter/material.dart';

class Updatepage extends StatefulWidget {
  Updatepage({super.key, required this.index});
  final int index;
  @override
  State<Updatepage> createState() => _UpdatepageState();
}

class _UpdatepageState extends State<Updatepage> {
  TextEditingController name = TextEditingController();
  TextEditingController balance = TextEditingController();
  GlobalKey<FormState> formkey = GlobalKey();
  @override
  void dispose() {
    super.dispose();
    name.dispose();
    balance.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Mytextform(controller: name, hint: "name"),
          Mytextform(controller: balance, hint: "balnce"),
          Mybutton(
              textdata: "update",
              myfun: () {
                update(context, widget.index, name, balance,clientslist);
              
              })
        ],
      ),
    );
  }
}
