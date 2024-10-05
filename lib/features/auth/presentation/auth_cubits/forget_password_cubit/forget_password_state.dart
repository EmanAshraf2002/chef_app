
abstract class ForgetPasswordState {}

class ForgetPasswordInitial extends ForgetPasswordState {}
class ChangePasswordSuffixIcon extends ForgetPasswordState {}
class ChangePasswordConfirmationSuffixIcon extends ForgetPasswordState {}
class SendCodeLoading extends ForgetPasswordState {}
class SendCodeSuccess extends ForgetPasswordState {
  final String message;
  SendCodeSuccess({required this.message});
}
class SendCodeFailure extends ForgetPasswordState {
  final String errorMessage;
  SendCodeFailure({required this.errorMessage});
  }

class ResetCodeLoading extends ForgetPasswordState{}
class ResetCodeFailure extends ForgetPasswordState{
  final String errorMessage;
  ResetCodeFailure({required this.errorMessage});
}
class ResetCodeSuccess extends ForgetPasswordState{
  final String message;
  ResetCodeSuccess({required this.message});
}
