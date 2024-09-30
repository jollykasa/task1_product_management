part of 'sign_in_page_bloc.dart';

sealed class SignInPageState extends Equatable {
  const SignInPageState();

  @override
  List<Object> get props => [];
}

final class SignInPageInitial extends SignInPageState {}

class SignInSuccessState extends SignInPageState {
  String message;
  SignInSuccessState({required this.message});
  @override
  List<Object> get props => [message];
}

class SignInErrorState extends SignInPageState {
  String errorMessage;
  SignInErrorState({required this.errorMessage});
  @override
  List<Object> get props => [errorMessage];
}
