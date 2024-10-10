import 'package:chef_app/features/menue/presentation/views/menu_home.dart';
import 'package:chef_app/features/profile/presentation/views/profile_home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'home_state.dart';


class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  int currentIndex=0;
  List<Widget> screens= [const MenuHomeScreen(),const ProfileHomeScreen()];

  void changeIndex(index){
    currentIndex=index;
    emit(ChangeIndexState());
  }

}
