import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../model/user/user.dart';

part 'user.g.dart';

@Riverpod(keepAlive: true)
class UserDataNotifier extends _$UserDataNotifier{

  Future fetchUser () async {

  }

  UserModel build () {
    return state;
  }

  set setUser(UserModel user){
    state = user;
  }
  
}