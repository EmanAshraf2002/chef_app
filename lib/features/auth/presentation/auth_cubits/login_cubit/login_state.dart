
abstract class LoginState {}

class LoginInitial extends LoginState {}
class ChangeLoginPasswordSuffixIcon extends LoginState {}
class LoginLoadingState extends LoginState {}
class LoginFailureState extends LoginState {
  final String errorMessage;
  LoginFailureState ({ required this.errorMessage});
}
class LoginSuccessState extends LoginState {}
