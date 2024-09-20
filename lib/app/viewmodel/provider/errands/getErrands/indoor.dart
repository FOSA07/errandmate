import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../data/controller/errands/errands.dart';
import '../../../../view/miscellaneous/global.snackbar.dart';

part 'indoor.g.dart';

@Riverpod(keepAlive: true)
class GetIndoorNotifier extends _$GetIndoorNotifier with GlobalSnackBar{

  Future getIndoorErrands() async{

    final result = await ErrandsController().getErrands("indoor");

    return result.fold(
      (failure) {
        showSnackbar(action: () {
          ref.invalidate(getIndoorNotifierProvider);
          hideSnackbar();
        },);
        return null;
      },
      (success) => success);
  }

  @override
  Future build () async{
    return await getIndoorErrands();
  }
}