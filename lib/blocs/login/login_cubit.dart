import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:real_estate/blocs/signup/signup_state.dart';
import 'package:real_estate/constans/links_api.dart';

import '../../crud.dart';

class LoginCubit extends Cubit<SignupState> {
  final Crud crud;

  LoginCubit(this.crud) : super(SignupInitial());

  Future<void> login({
    required String email,
    required String password,
  }) async {
    emit(SignupLoading());
    try {
      final response = await crud.postRequest(
        AppLink.login,
        {
          "identifier": email,
          "password": password,
        },
      );
      print("login response: $response");
      if (response != null && response['status'] == "success") {
        emit(SignupSuccess());
      } else {
        String errorMessage = "حدث خطأ أثناء تسجيل الدخول";
        if (response != null) {
          if (response.containsKey('message')) {
            errorMessage = response['message'];
          } else if (response.containsKey('error')) {
            errorMessage = response['error'];
          }
        }
        emit(SignupFailure(errorMessage));
      }
    } catch (e) {
      emit(SignupFailure(e.toString()));
    }
  }
}
