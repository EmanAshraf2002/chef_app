class ApiEndPoints{
  static String baseUrl='https://food-api-omega.vercel.app/api/v1/';
  static String chefSignIn='chef/signin';
  static String chefChangePassword='chef/change-password';
  static String changeForgottenPassword='chef/change-forgotten-password';
  static String chefDelete='chef/delete';
  static String chefGet='chef/get-chef/';
  static String sendCode='chef/send-code';
  static String updateChef='chef/update';
  static String logout='chef/logout';
  static String addMeal='meal/add-to-menu';
  static String updateMeal='chef/update-meal/';
  static String deleteMeal='meal/delete-meal/';
  static String getAllMeals='meal/get-meals';


  static String getChefDataEndpoint(id){
    return '$chefGet$id';
  }
  static String getAllChefMeals(id){
    return 'chef/get-chef/$id/meals';
  }
  static String getUpdateMealEndpoint(id){
    return '$updateMeal$id';
  }
  static String getDeleteMealEndpoint(id){
    return '$deleteMeal$id';
  }

}


class ApiKeys{
  static const  String errorMessage='ErrorMessage';
  static const String status='status';
  static const String email='email';
  static const String password='password';
  static const String confirmPassword='confirmPassword';
  static const String code='code';
  static const String id='id';
  static const String oldPass='oldPass';
  static const String newPass='newPass';
  static const String phone='phone';
  static const String location='location';
  static const String brandName='brandName';
  static const String minCharge='minCharge';
  static const String disc='disc';
  static const String profilePic='profilePic';
  static const String message='message';
  static const String token='token';
  static const String name='name';
  static const String description='description';
  static const String price='price';
  static const String category='category';
  static const String howToSell='howToSell';
  static const String mealImages='mealImages';


}