import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Updateusercubit extends Cubit<bool> {
  Updateusercubit() : super(false);
  void invers(bool neval) {
    emit(neval);
  }
}
