import 'package:bank/features/bank/data/datasources/logic.dart';
import 'package:bank/features/bank/presentation/bloc/addusercubit.dart';
import 'package:bank/features/bank/presentation/bloc/deleteusercubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Deleteuserswich extends StatelessWidget {
  Deleteuserswich({super.key, required this.index});
  final int index;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<Deleteusercubit, bool>(
      builder: (context, state) {
        return SwitchListTile(
          value: state,
          onChanged: (newval) {
            if (!state && newval) {
              userslist[index].permission += 4;
            }
            if (state && !newval) {
              userslist[index].permission -= 4;
            }
            print(userslist[index].permission);
            context.read<Deleteusercubit>().invers(newval);
          },
          title: Text("allow delete users"),
        );
      },
    );
  }
}
