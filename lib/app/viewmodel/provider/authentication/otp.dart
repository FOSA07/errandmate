import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../view/helper/router.dart';

import '../../../data/controller/authentication/otp.dart';
import '../../../view/miscellaneous/global.dialog.dart';

part 'otp.g.dart';

@Riverpod(keepAlive: true)
class OTPNotifier extends _$OTPNotifier with GlobalDialog, ViewRouter {
  Future sendOTP({
    required String tkn,
    required String uid,
    required String code
  }) async {
    state = const AsyncLoading();
    final response = await OTPController().sendOTP(
      tkn: tkn,
      uid: uid,
      code: code
    );

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

  Future verifyOTP({
    required String tkn,
    required String uid,
    required String code,
    required bool isFgtPassword,
  }) async {
    state = const AsyncLoading();
    final response = await OTPController().verifyOTP(
      tkn: tkn,
      uid: uid,
      code: code,
      isFgtPassword: isFgtPassword,
    );

    response.fold(
      (failure) {
        state = AsyncValue.error(failure.message, StackTrace.current);
        showAlertDialog(
          message: failure.message,
        );
      },
      (data) {
        String hash = data["resetUrl"].toString().split("=").last;
        state = AsyncValue.data(data);
        isFgtPassword ?
          goto('/auth/create-password/$hash/$uid') :
        showAlertDialog(
          message: "Account Verified Successfully",
          success: true,
          buttonText: 'Back to Login',
          onClose: () {
            goto('/auth/login');
          },
        );
      },
    );
  }

  @override
  FutureOr build() async {
    return state;
  }
}
