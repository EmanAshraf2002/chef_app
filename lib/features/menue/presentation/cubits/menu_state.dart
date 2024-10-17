
abstract class MenuState {}

class MenuInitial extends MenuState {}
class ChangeItemState extends MenuState {}
class ChangeGroupValState extends MenuState {}
class AddDishLoadingState extends MenuState {}
class AddDishSuccessState extends MenuState {}
class AddDishFailureState extends MenuState {}
class DeleteMealLoadingState extends MenuState {}
class DeleteMealSuccessState extends MenuState {}
class DeleteMealFailureState extends MenuState {}
class GetAllChefMealsLoadingState extends MenuState {}
class GetAllChefMealsSuccessState extends MenuState {}
class GetAllChefMealsFailureState extends MenuState {}
class TakeImageFromUser extends MenuState {}
