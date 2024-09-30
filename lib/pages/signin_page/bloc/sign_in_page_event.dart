part of 'sign_in_page_bloc.dart';

sealed class SignInPageEvent extends Equatable {
  const SignInPageEvent();

  @override
  List<Object> get props => [];
}

class SignInPageNavigation extends SignInPageEvent {
  String email;
  String password;
  SignInPageNavigation({required this.email, required this.password});
  @override
  List<Object> get props => [email, password];
}
