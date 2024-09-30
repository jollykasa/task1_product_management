part of 'signup_page_bloc.dart';

sealed class SignupPageState extends Equatable {
  const SignupPageState();

  @override
  List<Object> get props => [];
}

final class SignupPageInitial extends SignupPageState {}

class SignupPageSuccessState extends SignupPageState {
  final String message;
  const SignupPageSuccessState({required this.message});

  @override
  List<Object> get props => [message];
}

class SignupPageErrorState extends SignupPageState {
  final String errormessage;
  const SignupPageErrorState({required this.errormessage});

  @override
  List<Object> get props => [errormessage];
}
