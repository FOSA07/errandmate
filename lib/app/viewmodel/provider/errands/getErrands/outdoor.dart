import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../data/controller/errands/errands.dart';
import '../../../../view/miscellaneous/global.snackbar.dart';

part 'outdoor.g.dart';

@Riverpod(keepAlive: true)
class GetOutdoorNotifier extends _$GetOutdoorNotifier with GlobalSnackBar{

  Future getOutdoorErrands() async{

    final result = await ErrandsController().getErrands("outdoor");


    return result.fold(
      (failure) {
        showSnackbar();
      },
      (success) => success);
  }

  @override
  Future build () async{
    return await getOutdoorErrands();
  }
}