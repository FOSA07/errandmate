import 'package:riverpod_annotation/riverpod_annotation.dart';


part 'errands.controller.g.dart';

@Riverpod(keepAlive: true)
class ErrandsPageControllerNotifier extends _$ErrandsPageControllerNotifier {

  @override
  int build(){
    return 0;
  }

  set setIndex(int index) {
    state = index;
  }
}
