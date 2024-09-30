import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:task1/common/constant/user_preferences.dart';
import 'package:task1/data/register_data.dart';
import 'package:task1/data/user_data.dart';
import 'package:crypto/crypto.dart';
part 'sign_in_page_event.dart';
part 'sign_in_page_state.dart';

class SignInPageBloc extends Bloc<SignInPageEvent, SignInPageState> {
  SignInPageBloc() : super(SignInPageInitial()) {
    _onSignInSucess();
  }
  _onSignInSucess() {
    on<SignInPageNavigation>((event, emit) async {
      UserPreferences.setUserEmail(event.email);
      UserPreferences.isSetUserLoggedIn(true);
      final passwordEncoder =
          md5.convert(utf8.encode(event.password)).toString();
      print("*******************REGISTER************************ ");
      print(passwordEncoder);
      print("$registerData");
      print("*******************REGISTER************************ ");
      final registerUser = registerData.firstWhere(
          (register) =>
              register['email'] == event.email &&
              register['password'] == passwordEncoder,
          orElse: () => {});
      final user = UserData.userSignIn.firstWhere(
        (user) =>
            user['email'] == event.email && user['password'] == passwordEncoder,
        orElse: () => {},
      );
      if (user.isNotEmpty || registerUser.isNotEmpty) {
        emit(SignInSuccessState(message: "Sign In Success"));
      } else {
        emit(SignInErrorState(
            errorMessage: "Email or Password is incorrect. Please try again"));
      }
    });
  }
}
