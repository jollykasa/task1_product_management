part of 'signup_page_bloc.dart';

sealed class SignupPageEvent extends Equatable {
  const SignupPageEvent();

  @override
  List<Object> get props => [];
}

class RegisterAddEvent extends SignupPageEvent {
  final String fullname;
  final String email;
  final String password;
  const RegisterAddEvent(
      {required this.fullname, required this.email, required this.password});
}
