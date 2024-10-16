import 'package:bank/features/bank/data/datasources/logic.dart';
import 'package:bank/features/bank/presentation/bloc/addusercubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Adduserswich extends StatelessWidget {
  Adduserswich({super.key, required this.index});
  final int index;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<Addusercubit, bool>(
      builder: (context, state) {
        return SwitchListTile(
          value: state,
          onChanged: (newval) {
            if (!state && newval) {
              userslist[index].permission += 2;
            }
            if (state && !newval) {
              userslist[index].permission -= 2;
            }
          //  userslist[index].permission += state ? 2 : -2;
            print(userslist[index].permission);
            context.read<Addusercubit>().invers(newval);
          },
          title: Text("allow add users"),
        );
        ;
      },
    );
  }
}
