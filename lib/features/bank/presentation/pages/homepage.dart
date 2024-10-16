import 'package:bank/features/bank/data/datasources/logic.dart';
import 'package:bank/features/bank/presentation/widgets/mybutton.dart';
import 'package:flutter/material.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: GridView(
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200, mainAxisSpacing: 10, crossAxisSpacing: 10),
        children: [
          for (var i in enbank.values)
            Mybutton(
                textdata: i.name,
                myfun: () {
                  performprogram(i.index,context);
                })
        ],
      ),
    );
  }
}
