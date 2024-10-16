import 'package:flutter_bloc/flutter_bloc.dart';

class Deleteusercubit extends Cubit<bool> {
  Deleteusercubit() : super(false);
  void invers(bool newval) {
    emit(newval);
  }
}
