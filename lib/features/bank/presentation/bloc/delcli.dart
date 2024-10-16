import 'package:bank/features/bank/data/models/clients.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Delcli extends Cubit<List> {
  Delcli() : super([]);
  void delete(List mylist, dynamic clients) {
    mylist.remove(clients);
    emit(mylist);
  }
}
