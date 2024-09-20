import 'dart:developer';

import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../data/controller/authentication/login.dart';
import '../../../model/authentication/login.dart';
import '../../../view/helper/router.dart';
import '../../../view/miscellaneous/global.dialog.dart';
import '../user/user.profile.dart';
import 'login.user.form.dart';

part 'login.user.g.dart';

@Riverpod(keepAlive: true)
class LoginUserAccountNotifier extends _$LoginUserAccountNotifier
    with GlobalDialog, ViewRouter {
  Future loginUser() async {
    try {
      state = const AsyncLoading();
      UserLoginModel userModel = ref.read(loginUserFormNotifierProvider);
      final response = await LoginUserController().login(userModel: userModel);
      log('state = $response');
      state = AsyncValue.data(response);

      response.fold(
        (failure) {
          showAlertDialog(
            message: failure.message,
          );
        },
        (result) async { 
          await ref.read(userProfileNotifierProvider.notifier).fetchUserProfile();
          
          showAlertDialog(
            message: 'Login Successfull',
            success: true,
            buttonText: 'Proceed',
            onClose: () => goto('/features'),
          );
          
        }
      );
    } catch (e) {
      log('e = $e');

      state = AsyncValue.error(e, StackTrace.current);

      showAlertDialog(
        message: 'an error occured',
      );
    }
  }

  @override
  FutureOr build() async {
    return state;
  }
}
