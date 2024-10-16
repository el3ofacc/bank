import 'package:flutter/material.dart';

class Mybutton extends StatelessWidget {
    Mybutton({super.key, required this.textdata, required this.myfun});
  final String textdata;
  final Function() myfun;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(//color: Colors.blue,
        width: double.infinity,height: 60,
        child: MaterialButton(onPressed: myfun, child: Text(textdata),
        color: Colors.blue,
      //  style:ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.blue)),
        )),
    );
  }
}
