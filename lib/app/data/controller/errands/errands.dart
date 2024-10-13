import 'package:dartz/dartz.dart';
import 'package:errandmate/app/utils/serviceLocator/service.locator.dart';

import '../../../core/exception/exception.dart';
import '../../service/errands/errands.dart';

class ErrandsController {

  static ErrandsController? _instance;

  ErrandsController._();

  factory ErrandsController () => _instance ??= ErrandsController._();

  Future<Either<Failure, List>> getErrands (String taskType) async {

    final getService = locator<Errands>(instanceName: "GetErrandsService");

    final result = await getService.getAvailableErrands(taskType);

    return result.fold(
      (failure) => Left(failure),
      (success) {
        return Right(success.data["data"]["data"]);
      });
  }

  Future<Either<Failure, Object>> createErrandTask (String errandType, Map<String, dynamic> requestMap) async {

    final getService = locator<Errands>(instanceName: "CreateErrandTaskService");

    final result = await getService.createErrandTask(errandType, requestMap);

    return result.fold(
      (failure) => Left(failure), 
      (success) => Right(success.data)
    );
  }
}