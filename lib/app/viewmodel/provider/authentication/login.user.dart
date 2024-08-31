import 'package:dartz/dartz.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../data/controller/authentication/login.dart';
import '../../../model/authentication/login.dart';
import '../../../view/widget/global.dialog.dart';
import 'login.user.form.dart';

part 'login.user.g.dart';

@Riverpod(keepAlive: true)
class LoginUserAccountNotifier extends _$LoginUserAccountNotifier with GlobalDialog{

  Future createUser () async {
    print("pressed");
    try{
      state = const AsyncLoading();
      UserLoginModel userModel = ref.read(loginUserFormNotifierProvider);
      final response = await LoginUserController().createUser(userModel: userModel);
      state = AsyncValue.data(response);

      response.fold(
        (failure) { 
          showAlertDialog(
            message: failure.message,
          );
        },
        (result) => showAlertDialog(
            message: 'success',
          )
      );
    }catch(e){
      state = AsyncValue.error(e, StackTrace.current);
      
      showAlertDialog(
        message: 'an error occured',
      );
    }
    

  }

  @override
  FutureOr build () async{
    return state;
  }
}