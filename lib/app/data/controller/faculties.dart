import 'package:dartz/dartz.dart';

import '../../core/exception/exception.dart';
import '../../model/faculty.dart';
import '../../utils/serviceLocator/service.locator.dart';
import '../service/institution/institution.dart';

class FacultiesController {

  static FacultiesController? _instance;

  FacultiesController._();

  factory FacultiesController() => _instance ??= FacultiesController._();

  Future<Either<Failure, List<FacultyModel>>> fetchFaculties(
    {
      required String instId,
      required String facId
    }
  ) async {

    final faculty = locator<Institution>(instanceName: "Faculties");

    var response = await faculty.getFaculties(
      facId: facId,
      instId: instId
    );

    return response.fold(
      (failure){
        return Left(failure);
      },
      (result){
        List<FacultyModel> faculties = 
              (result.data["data"]["faculties"] as List<dynamic>)
              .map((item) => FacultyModel.fromJson(item))
              .toList();
        
        List<FacultyModel> facultiesData = faculties.map((faculty) => FacultyModel(
          id: faculty.id,
          instId: faculty.instId,
          facultyName: faculty.facultyName,
          createdAt: faculty.createdAt,
          updatedAt: faculty.updatedAt,
        )).toList();


        return Right(facultiesData);
      }
    );
    
  }

}