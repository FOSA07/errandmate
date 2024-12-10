import 'package:dartz/dartz.dart';
import 'package:errandmate/app/data/service/transport/transport.dart';
import 'package:errandmate/app/model/tranport.mode.model.dart';

import '../../core/exception/exception.dart';
import '../../utils/serviceLocator/service.locator.dart';

class TransaportModesController {
  static TransaportModesController? _instance;

  TransaportModesController._();

  factory TransaportModesController() =>
      _instance ??= TransaportModesController._();

  Future<Either<Failure, List<TransportMode>>> fetchTransaportModes() async {
    final transportMode = locator<TransaportMode>(
      instanceName: "TransaportModes",
    );

    var response = await transportMode.getTransaportModes();

    return response.fold((failure) {
      return Left(failure);
    }, (result) {
      List<TransportMode> transportModesData =
          (result.data["data"] as List<dynamic>)
              .map((item) => TransportMode.fromJson(item))
              .toList();

      // List<TransportMode> transportModesData = transaportModes
      //     .map((transportMode) => TransportMode(
      //           id: transportMode.id,
      //           instId: transportMode.instId,
      //           transportModeName: transportMode.transportModeName,
      //           createdAt: transportMode.createdAt,
      //           updatedAt: transportMode.updatedAt,
      //         ))
      //     .toList();

      return Right(transportModesData);
    });
  }
}
