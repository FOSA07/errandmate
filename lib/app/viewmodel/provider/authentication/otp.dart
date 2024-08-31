import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../data/controller/authentication/otp.dart';
import '../../../view/widget/global.dialog.dart';

part 'otp.g.dart';

@Riverpod(keepAlive: true)
class OTPNotifier extends _$OTPNotifier with GlobalDialog{

  Future sendOTP({required String tkn}) async {
      state = const AsyncLoading();
      final response = await OTPController().sendOTP(tkn: tkn);
      
      response.fold(
        (failure) {
          state = AsyncValue.error(failure.message, StackTrace.current);
          showAlertDialog(
            message: failure.message,
          );
        },
        (data) {
          state = AsyncValue.data(data);
        },
      );

  }

  Future verifyOTP ({required String tkn, required String uid, required String code}) async{

    state = const AsyncLoading();
    final response = await OTPController().verifyOTP(tkn: tkn, uid: uid, code: code);

    response.fold(
      (failure) {
        state = AsyncValue.error(failure.message, StackTrace.current);
        showAlertDialog(
          message: failure.message,
        );
      },
      (data) {
        state = AsyncValue.data(data);
        showAlertDialog(
          message: "Account Verified Successfully"
        );
      },
    );
  }

  @override
  FutureOr build() async {
    return state;
  }
}