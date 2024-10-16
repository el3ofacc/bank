import 'package:flutter_bloc/flutter_bloc.dart';

class Filling extends Cubit<List> {
  Filling() : super([]);
  void fill(List mylist,dynamic value) {
    mylist.add(value);
    emit(mylist);
  }
}
 