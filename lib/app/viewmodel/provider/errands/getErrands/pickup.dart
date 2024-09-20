import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../data/controller/errands/errands.dart';

part 'pickup.g.dart';

@Riverpod(keepAlive: true)
class GetPickupNotifier extends _$GetPickupNotifier {

  Future getPickupErrands() async{

    final result = await ErrandsController().getErrands("pickup");


    return result.fold(
      (failure) {
        return null;
      },
      (success) => success);
  }

  @override
  Future build () async{
    return await getPickupErrands();
  }
}