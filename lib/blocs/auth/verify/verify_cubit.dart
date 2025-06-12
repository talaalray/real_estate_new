import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../crud.dart';
import 'verify_state.dart';
import '../../../constans/links_api.dart';

class VerifyCubit extends Cubit<VerifyState> {
  final Crud crud;

  VerifyCubit(this.crud) : super(VerifyInitial());

  Future<void> verifyCode(String email, String code) async {
    if (code.length != 4) {
      emit(const VerifyFailure("يجب أن يتكون الكود من 4 أرقام"));
      return;
    }

    emit(VerifyLoading());

    try {
      final response = await crud.postRequest(
        AppLink.verify,
        {
          "email": email,
          "otp": code,
        },
      );

      print("Verify Response: $response");

      if (response == null) {
        emit(const VerifyFailure("لا توجد استجابة من الخادم"));
        return;
      }

      if (response['status'] == "success" ||
          response['success'] == true ||
          response['verified'] == true) {
        emit(VerifySuccess());
      } else {
        final errorMsg = response['message'] ??
            response['error'] ??
            "فشل التحقق من الكود";
        emit(VerifyFailure(errorMsg.toString()));
      }
    } catch (e) {
      print("Verify Error: $e");
      emit(VerifyFailure("حدث خطأ في الاتصال: ${e.toString()}"));
    }
  }
}
