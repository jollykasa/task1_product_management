import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:task1/data/register_data.dart';

part 'signup_page_event.dart';
part 'signup_page_state.dart';

class SignupPageBloc extends Bloc<SignupPageEvent, SignupPageState> {
  SignupPageBloc() : super(SignupPageInitial()) {
    _onAddRegister();
  }
  _onAddRegister() {
    on<RegisterAddEvent>((event, emit) {
      registerData.add({
        'fullname': event.fullname,
        'email': event.email,
        'password': event.password,
      });
      print("*****************Sign Up BLOC************************");
      print(registerData);
      print("*****************Sign Up BLOC************************");
    });
  }
}
