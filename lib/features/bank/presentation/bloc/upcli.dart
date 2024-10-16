import 'package:bank/features/bank/data/models/clients.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Upcli extends Cubit<List> {
  Upcli() : super([]);
  void update(int index, List mylist, dynamic clients) {
    mylist[index ] = clients;
    emit(mylist);
  }
}
  