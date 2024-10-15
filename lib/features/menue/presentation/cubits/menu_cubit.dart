import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'menu_state.dart';

class MenuCubit extends Cubit<MenuState> {
  MenuCubit() : super(MenuInitial());

XFile? image;
TextEditingController mealNameController=TextEditingController();
TextEditingController mealPriceController=TextEditingController();
TextEditingController mealDescriptionController=TextEditingController();
TextEditingController mealQuantityController=TextEditingController();
GlobalKey<FormState> addToMenuKey=GlobalKey();
List categoryList=[
  'Beef',
  'Chicken',
  'Fish',
  'Seafood',
  'Pork',
  'Lamb',
  'Vegetarian',
  'Vegan',
  'Gluten-free',
];
String selectedCategory='Beef';

void changeItem(item){
  selectedCategory=item;
  emit(ChangeItemState());
}

String groupVal='quantity';
void changeGroupValue(value){
  groupVal=value;
  emit(ChangeGroupValState());
}

}
