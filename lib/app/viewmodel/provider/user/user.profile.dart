import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../data/controller/user/user.profile.dart';
import '../../../model/user/profile.dart';
import '../../../view/widget/global.dialog.dart';

part 'user.profile.g.dart';

@Riverpod(keepAlive: true)
class UserProfileNotifier extends _$UserProfileNotifier with GlobalDialog{

  Future fetchUserProfile () async {

    final result = await UserProfileController().getUserProfile();

    result.fold(
      (failure) => state = null,
      (userprofile) {
        state = userprofile;
      }
    );
  }

  UserProfileModel? build () {
    return state;
  }

  // set setUser(String token){
  //   state = token;
  // }
  
}