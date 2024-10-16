import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Readuserscubit extends Cubit<bool> {
  Readuserscubit() : super(false);
  void invers(bool newval) {
    emit(newval);
  }
}
