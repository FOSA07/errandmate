
import 'package:dartz/dartz.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../data/controller/faculties.dart';
import '../../../model/faculty.dart';

part 'faculty.g.dart';

@Riverpod(keepAlive: true)
class FacultyNotifier extends _$FacultyNotifier {

  List<FacultyModel> _faculties = [];

  Future<void> fetchFaculties(
    {
      required String instId,
      required String facId
    }
  ) async {

    state = const AsyncLoading();
    final response = await FacultiesController().fetchFaculties(
      instId: instId,
      facId: facId
    );

    response.fold(
        (failure) {
          state = AsyncValue.error(Left(failure), StackTrace.current);
        },
        (data) {
          setFaculties = data;
          state = AsyncValue.data(AsyncValue.data(Right(data)));
        },
      );

  }

  @override
  FutureOr<AsyncValue> build () {
    return Future(() => const AsyncValue.data(''),);
  }

  set setFaculties(List<FacultyModel> faculties) {
    _faculties = faculties;
  }

  List<FacultyModel> get getFaculties => _faculties;

  resetFaculties () {
    _faculties = [];   
  }
}