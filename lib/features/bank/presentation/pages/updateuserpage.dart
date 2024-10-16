import 'package:bank/features/bank/data/datasources/logic.dart';
import 'package:bank/features/bank/presentation/widgets/mybutton.dart';
import 'package:bank/features/bank/presentation/widgets/mytextform.dart';
import 'package:flutter/material.dart';

class Updateuserpage extends StatefulWidget {
  Updateuserpage({super.key, required this.index});
  final int index;
  @override
  State<Updateuserpage> createState() => _UpdateuserpageState();
}

class _UpdateuserpageState extends State<Updateuserpage> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  GlobalKey<FormState> formkey = GlobalKey();
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    email.dispose();
    password.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Mytextform(controller: email, hint: "email"),
          Mytextform(controller: password, hint: "password"),
          Mybutton(
              textdata: "update user",
              myfun: () {
                updateuser(context, email, widget.index, password);
              })
        ],
      ),
    );
    ;
  }
}
