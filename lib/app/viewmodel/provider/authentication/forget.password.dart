
import 'package:dartz/dartz.dart';
import 'package:errandmate/app/data/controller/authentication/forget.password.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../view/helper/router.dart';
import '../../../view/widget/global.dialog.dart';

part 'forget.password.g.dart';

@Riverpod(keepAlive: true)
class ForgetPasswordNotifier extends _$ForgetPasswordNotifier
    with GlobalDialog, ViewRouter {
  Future recoverPassword({required String email}) async {
    try {
      state = const AsyncLoading();
      final response =
          await ForgetPasswordController().resetPassword(email: email);
      state = AsyncValue.data(response);

      response.fold(
          (failure) => showAlertDialog(
                message: failure.message,
              ), (result) {
        final uri = Uri.parse(result["data"]["verifyUrl"]);
        String tk = uri.queryParameters['tkn']!;
        goto('/auth/otp/$tk/${result["data"]["userid"]}/true');
      });
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
      return Left(e.toString());
    }
  }

  @override
  FutureOr build() async {
    return state;
  }
}
