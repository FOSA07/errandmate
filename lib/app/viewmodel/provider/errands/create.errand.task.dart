
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../data/controller/errands/errands.dart';
import '../../../view/miscellaneous/global.dialog.dart';

part 'create.errand.task.g.dart';

@Riverpod(keepAlive: true)
class CreateErrandTaskNotifier extends _$CreateErrandTaskNotifier with GlobalDialog{

  Future createTask (
    String errandType,
    Map<String, dynamic> requestMap
  ) async {

    try{
      state = const AsyncLoading();
      final response = await ErrandsController().createErrandTask(errandType, requestMap);
      state = AsyncValue.data(response);

      response.fold(
        (failure) {
          showAlertDialog(
            message: failure.message,
          );
        },
        (result) async { 
          
          showAlertDialog(
            message: '$errandType created Successfull',
            success: true,
            // buttonText: 'Proceed',
            // onClose: () => goto('/features'),
          );
          
        }
      );
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.current);

      showAlertDialog(
        message: 'an error occured',
      );
    }

  }

  @override
  FutureOr build () => state;
}