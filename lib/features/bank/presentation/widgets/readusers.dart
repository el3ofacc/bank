import 'package:bank/features/bank/data/datasources/logic.dart';
import 'package:bank/features/bank/presentation/bloc/addusercubit.dart';
import 'package:bank/features/bank/presentation/bloc/readuserscubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Readusers extends StatelessWidget {
  Readusers({super.key, required this.index});
  final int index;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<Readuserscubit, bool>(
      builder: (context, state) {
        return SwitchListTile(
          onChanged: (newval) {
            if (!state && newval) {
              userslist[index].permission += 1;
            }
            if (state && !newval) {
              userslist[index].permission -= 1;
            print(userslist[index].permission);
            }
            context.read<Readuserscubit>().invers(newval);
          },
          title: Text("allow read users"),
          value: state,
        );
      },
    );
  }
}
