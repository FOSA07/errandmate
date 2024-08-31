
import 'package:dartz/dartz.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../data/controller/departments.dart';
import '../../../model/department.dart';

part 'department.g.dart';

@Riverpod(keepAlive: true)
class DepartmentNotifier extends _$DepartmentNotifier {

  List<DepartmentModel> _departments = [];

  Future<void> fetchDepartments(
    {
      required String instId,
      required String facId
    }
  ) async {

    state = const AsyncLoading();
    final response = await DepartmentsController().fetchDepartments(
      instId: instId,
      facId: facId
    );

    response.fold(
        (failure) {
          state = AsyncValue.error(Left(failure), StackTrace.current);
        },
        (data) {
          setDepartments = data;
          state = AsyncValue.data(AsyncValue.data(Right(data)));
        },
      );

  }

  @override
  FutureOr<AsyncValue> build () {
    return Future(() => const AsyncValue.data(''),);
  }

  set setDepartments(List<DepartmentModel> departments) {
    _departments = departments;
  }

  List<DepartmentModel> get getDepartments => _departments;

  resetDepartments () {
    _departments = [];
  }
}