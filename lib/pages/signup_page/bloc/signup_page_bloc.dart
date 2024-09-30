import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:task1/data/register_data.dart';
import 'package:crypto/crypto.dart';
part 'signup_page_event.dart';
part 'signup_page_state.dart';

class SignupPageBloc extends Bloc<SignupPageEvent, SignupPageState> {
  SignupPageBloc() : super(SignupPageInitial()) {
    _onAddRegister();
  }
  _onAddRegister() {
    on<RegisterAddEvent>((event, emit) {
      final passwordEncoder =
          md5.convert(utf8.encode(event.password)).toString();
      print("**************ENCODE******************");
      print(passwordEncoder);
      print("**************ENCODE******************");
      registerData.add({
        'fullname': event.fullname,
        'email': event.email,
        'password': passwordEncoder,
      });
      if (registerData.isNotEmpty) {
        emit(const SignupPageSuccessState(message: "SignUp Successfully"));
      } else {
        emit(const SignupPageErrorState(
            errormessage: "Error has occur.Please try again"));
      }
    });
  }
}
