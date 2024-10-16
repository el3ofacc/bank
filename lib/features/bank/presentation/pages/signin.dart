import 'package:bank/features/bank/data/datasources/logic.dart';
import 'package:bank/features/bank/presentation/widgets/mybutton.dart';
import 'package:bank/features/bank/presentation/widgets/mytextform.dart';
import 'package:flutter/material.dart';

class Signin extends StatefulWidget {
  const Signin({super.key});

  @override
  State<Signin> createState() => _SigninState();
}

class _SigninState extends State<Signin> {
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
      body: Form(
        key: formkey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(child: Text("sign in")),
            Mytextform(controller: email, hint: "email"),
            Mytextform(controller: password, hint: "password"),
            Mybutton(
                textdata: "Signin",
                myfun: () {
                  signin(context, formkey, email, password);
                })
          ],
        ),
      ),
    );
  }
}
