import 'package:bank/features/bank/data/datasources/logic.dart';
import 'package:bank/features/bank/presentation/pages/addingpage.dart';
import 'package:bank/features/bank/presentation/pages/updatepage.dart';
import 'package:bank/features/bank/presentation/pages/withdrawpage.dart';
import 'package:flutter/material.dart';

class Clientspage extends StatelessWidget {
  const Clientspage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: ListView.builder(
            itemCount: clientslist.length,
            itemBuilder: (context, index) {
              return Dismissible(
                key: Key(clientslist[index].name),
                onDismissed: (direction) {
                  delete(context, clientslist[index], clientslist);
                },
                child: Column(
                  children: [
                    InkWell(
                      onLongPress: () {
                        showmessage("update", context, () {
                          Navigator.of(context).pop();
                          navigate(context, () => Updatepage(index: index));
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Card(
                          color: Colors.indigo[200],
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child:
                                    Text("name : ${clientslist[index].name}"),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                    "balance : ${clientslist[index].balance}"),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () {
                            navigate(context, () => Withdrawpage(index: index));
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Card(
                              color: Colors.blue,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text("withdraw"),
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            navigate(context, () => Addbalance(index: index));
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Card(
                              color: Colors.blue,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text("add"),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    Divider()
                  ],
                ),
              );
            }));
  }
}
