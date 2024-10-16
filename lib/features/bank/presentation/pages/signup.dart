import 'dart:io';

import 'package:bank/features/bank/data/datasources/logic.dart';
import 'package:bank/features/bank/presentation/widgets/mybutton.dart';
import 'package:bank/features/bank/presentation/widgets/mytextform.dart';
import 'package:flutter/material.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
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
      body: ClipRRect(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40), topRight: Radius.circular(40)),
        child: Form(
          key: formkey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Text("Sign up"),
              ),
              Mytextform(controller: email, hint: "email"),
              Mytextform(controller: password, hint: "password"),
              Mybutton(
                  textdata: "Signup",
                  myfun: () {
                    signup(context, formkey, email, password);
                  })
            ],
          ),
        ),
      ),
    );
  }
}
