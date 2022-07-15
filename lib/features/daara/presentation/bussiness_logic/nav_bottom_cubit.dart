import 'package:flutter_bloc/flutter_bloc.dart';

class NavBottomCubit extends Cubit<int> {
  NavBottomCubit() : super(0);
  switchOnglet(int index) {
    emit(index);
  }
}
