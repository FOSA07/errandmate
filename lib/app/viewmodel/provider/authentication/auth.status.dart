import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth.status.g.dart';

@Riverpod(keepAlive: true)
class AuthStatusNotifier extends _$AuthStatusNotifier {

  @override
  bool build () {
    return true;
  }
}