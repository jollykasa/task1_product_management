part of 'signup_page_bloc.dart';

sealed class SignupPageState extends Equatable {
  const SignupPageState();
  
  @override
  List<Object> get props => [];
}

final class SignupPageInitial extends SignupPageState {}
