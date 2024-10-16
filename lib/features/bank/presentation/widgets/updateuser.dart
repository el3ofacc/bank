import 'package:bank/features/bank/data/datasources/logic.dart';
import 'package:bank/features/bank/presentation/bloc/addusercubit.dart';
import 'package:bank/features/bank/presentation/bloc/updateusercubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Updateuserswich extends StatelessWidget {
  Updateuserswich({super.key, required this.index});
  final int index;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<Updateusercubit, bool>(
      builder: (context, state) {
        return SwitchListTile(
          value: state,
          onChanged: (newval) {
            if (!state && newval) {
              userslist[index].permission += 8;
            }
            if (state && !newval) {
              userslist[index].permission -= 8;
            print(userslist[index].permission);
            }
            context.read<Updateusercubit>().invers(newval);
          },
          title: Text("allow update users"),
        );
      },
    );
  }
}
