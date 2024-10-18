
abstract class SignUpState {}

class SignUpInitial extends SignUpState {}
class SignUpLoadingState extends SignUpState {}
class SignUpSuccessState extends SignUpState {}
class SignUpFailureState extends SignUpState {}
class ChangeSignUpPasswordSuffixIcon extends SignUpState {}
class ChangePasswordConfirmationSuffixIcon extends SignUpState {}
