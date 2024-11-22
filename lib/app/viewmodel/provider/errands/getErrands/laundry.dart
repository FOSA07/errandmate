import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../data/controller/errands/errands.dart';
import '../../../../view/miscellaneous/global.snackbar.dart';

part 'laundry.g.dart';

@Riverpod(keepAlive: true)
class GetLaundryNotifier extends _$GetLaundryNotifier with GlobalSnackBar{

  Future getLaundryErrands() async{

    final result = await ErrandsController().getErrands("laundry");
    print(result);

    return result.fold(
      (failure) {
        showSnackbar();
        return null;
      },
      (success) => success);
  }

  @override
  Future build () async{
    return await getLaundryErrands();
  }
}