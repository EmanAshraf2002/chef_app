import 'package:chef_app/core/database/api/api_consumer.dart';
import 'package:chef_app/core/database/api/api_endPoints.dart';
import 'package:chef_app/core/database/cache/cache_helper.dart';
import 'package:chef_app/core/database/exceptions/handel_exception.dart';
import 'package:chef_app/core/services/service_locator.dart';
import 'package:chef_app/core/utilis/commons.dart';
import 'package:chef_app/features/menue/data/models/meal_model.dart';
import 'package:dartz/dartz.dart';
import 'package:image_picker/image_picker.dart';

class MenuRepository{

 Future<Either<String,String>> addDishToMenu({
   required XFile image,
   required String mealName,
   required String mealDesc,
   required double mealPrice,
   required String mealCat,
   required String howToSell, }) async{

   try {
     final response =await sl<ApiConsumer>().post(
       ApiEndPoints.addMeal,
       isFormData:true,
       data: {
         ApiKeys.mealImages:await uploadImageToApi(image),
         ApiKeys.name:mealName,
         ApiKeys.description:mealDesc,
         ApiKeys.price:mealPrice,
         ApiKeys.category:mealCat,
         ApiKeys.howToSell:howToSell,

       }
     );
     return(Right(response[ApiKeys.message]));
   }
   on ServerException catch (e) {
     return(Left(e.errorModel.errorMessage));

   }

}


 Future<Either<String,String>> deleteDishFromMenu({
   required String mealId}) async{

   try {
     final response =await sl<ApiConsumer>().delete(
         ApiEndPoints.getDeleteMealEndpoint(mealId),
     );
     return(Right(response[ApiKeys.message]));
   }
   on ServerException catch (e) {
     return(Left(e.errorModel.errorMessage));

   }

 }


 Future<Either<String,GetAllMealsModel>> getChefMeals() async{

   try {
     final response =await sl<ApiConsumer>().get(
       ApiEndPoints.getAllChefMeals(sl<CacheHelper>().getData(key:ApiKeys.id)),
     );
     return(Right(GetAllMealsModel.fromJson(response)));
   }
   on ServerException catch (e) {
     return(Left(e.errorModel.errorMessage));

   }

 }


}