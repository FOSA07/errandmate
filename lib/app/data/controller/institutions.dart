import 'package:dartz/dartz.dart';

import '../../core/exception/exception.dart';
import '../../model/institution.dart';
import '../../utils/serviceLocator/service.locator.dart';
import '../service/institution/institution.dart';

class InstitutionsController {

  static InstitutionsController? _instance;

  InstitutionsController._();

  factory InstitutionsController() => _instance ??= InstitutionsController._();

  Future<Either<Failure, List<InstitutionModel>>> fetchInstitutions() async {

    final institution = locator<Institution>(instanceName: "Institutions");

    var response = await institution.getInstitutions();

    return response.fold(
      (failure){
        return Left(failure);
      },
      (result){
        List<InstitutionModel> institutionsData = [];
        List<InstitutionModel> institutions = 
              (result.data["data"]["data"] as List)
              .map((item) => InstitutionModel.fromJson(item))
              .toList();
        
        for (var institution in institutions) {

          institutionsData.add(
            InstitutionModel(
              id: institution.id, 
              instName: institution.instName, 
              matricNoFormat: institution.matricNoFormat, 
              createdAt: institution.createdAt, 
              updatedAt: institution.updatedAt
            )
          );
        }

        return Right(institutionsData);
      }
    );
    
  }

}