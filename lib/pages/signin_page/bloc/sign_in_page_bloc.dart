import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task1/common/constant/app_constant.dart';
import 'package:task1/common/constant/user_preferences.dart';
import 'package:task1/data/register_data.dart';
import 'package:task1/data/user_data.dart';

part 'sign_in_page_event.dart';
part 'sign_in_page_state.dart';

class SignInPageBloc extends Bloc<SignInPageEvent, SignInPageState> {
  SignInPageBloc() : super(SignInPageInitial()) {
    _onSignInSucess();
  }
  _onSignInSucess() {
    on<SignInPageNavigation>((event, emit) async {
      UserPreferences.setUserEmail(event.email);
      print("*******************REGISTER************************ ");
      print("$registerData");
      print("*******************REGISTER************************ ");
      final registerUser = registerData.firstWhere(
          (register) =>
              register['email'] == event.email &&
              register['password'] == event.password,
          orElse: () => {});
      final user = UserData.userSignIn.firstWhere(
        (user) =>
            user['email'] == event.email && user['password'] == event.password,
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
