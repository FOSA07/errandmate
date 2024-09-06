import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../data/controller/authentication/create.password.dart';
import '../../../view/helper/router.dart';
import '../../../view/widget/global.dialog.dart';

part 'create.password.g.dart';

@Riverpod(keepAlive: true)
class CreatePasswordNotifier extends _$CreatePasswordNotifier 
  with GlobalDialog, ViewRouter{

  Future createNewPassword ({
    required String hash,
    required String uid,
    required String newPassword
  }) async {
    state = const AsyncLoading();
    final result = await CreatePasswordController().
      createNewPassword(hash: hash, uid: uid, password: newPassword);
    state = AsyncValue.data(result);

    result.fold(
      (failure) => showAlertDialog(
        message: failure.message,
      ),
      (success) => showAlertDialog(
          message: success["message"],
          success: true,
          buttonText: 'Back to Login',
          onClose: () {
            goto('/auth/login');
          },
        )
    );
    
  }

  @override
  FutureOr build () async {
    return state;
  }
}