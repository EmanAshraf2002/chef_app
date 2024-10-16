import 'package:chef_app/features/menue/data/models/meal_model.dart';
import 'package:chef_app/features/menue/data/repositry/menu_repos.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'menu_state.dart';

class MenuCubit extends Cubit<MenuState> {
  MenuCubit(this.menuRepo) : super(MenuInitial());
final MenuRepository menuRepo;
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

void addDish() async{
  emit(AddDishLoadingState());
  final res= await menuRepo.addDishToMenu(
      image: image!,
      mealName:mealNameController.text,
      mealDesc: mealDescriptionController.text,
      mealPrice:double.parse(mealPriceController.text) ,
      mealCat:selectedCategory,
      howToSell: groupVal);
   res.fold(
           (error) => emit(AddDishFailureState()),
           (meal) =>emit(AddDishSuccessState()) );

}

void deleteMeal(id) async{
    emit(DeleteMealLoadingState());
    final res= await menuRepo.deleteDishFromMenu(mealId:id);
    res.fold(
            (error) => emit(DeleteMealFailureState()),
            (message) =>emit(DeleteMealSuccessState()) );

  }

List<MealModel> meals=[];
void getChefMeals() async{
    emit(GetAllChefMealsLoadingState());
    final res= await menuRepo.getChefMeals();
    res.fold(
            (error) => emit(GetAllChefMealsFailureState()),
            (allMeals) {
                  meals=allMeals.meals;
                  emit(GetAllChefMealsSuccessState());
            }
          );

  }



}
