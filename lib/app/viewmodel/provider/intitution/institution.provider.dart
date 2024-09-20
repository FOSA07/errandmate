import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../data/controller/institutions.dart';
import '../../../model/institution.dart';
import '../../../view/helper/router.dart';
import '../../../view/miscellaneous/global.dialog.dart';

part 'institution.provider.g.dart';

@Riverpod(keepAlive: true)
class InstitutionNotifier extends _$InstitutionNotifier with GlobalDialog, ViewRouter{
  List<InstitutionModel>? _institutions;

  Future fetchInstitutions() async {
      state = const AsyncLoading();
      final response = await InstitutionsController().fetchInstitutions();
      
      response.fold(
        (failure) {
          state = AsyncValue.error(failure.message, StackTrace.current);
          showAlertDialog(
            message: failure.message,
          );
        },
        (data) {
          setInstitutions = data;
          state = AsyncValue.data(data);
          goto(
            '/errandmate',
            canBack: false,
          );
        },
      );

  }

  @override
  FutureOr build() async {
    return await fetchInstitutions();
  }
  
  set setInstitutions(List<InstitutionModel> institutions) {
    _institutions = institutions;
  }

  List<InstitutionModel>? get getInstitutions => _institutions;
}
