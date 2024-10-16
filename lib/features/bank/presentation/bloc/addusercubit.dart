import 'package:flutter_bloc/flutter_bloc.dart';

class Addusercubit extends Cubit<bool> {
  Addusercubit() : super(false);
  void invers( bool newvalue) {
 
    emit(newvalue);
  }
}
