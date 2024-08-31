import 'package:dartz/dartz.dart';

import '../../core/exception/exception.dart';
import '../../model/department.dart';
import '../../utils/serviceLocator/service.locator.dart';
import '../service/institution/institution.dart';

class DepartmentsController {

  static DepartmentsController? _instance;

  DepartmentsController._();

  factory DepartmentsController() => _instance ??= DepartmentsController._();

  Future<Either<Failure, List<DepartmentModel>>> fetchDepartments(
    {
      required String instId,
      required String facId
    }
  ) async {

    final faculty = locator<Institution>(instanceName: "Departments");

    var response = await faculty.getDepartment(
      facId: facId,
      instId: instId
    );

    return response.fold(
      (failure){
        return Left(failure);
      },
      (result){
        List<DepartmentModel> departments = 
              (result.data["data"]["data"] as List<dynamic>)
              .map((item) => DepartmentModel.fromJson(item))
              .toList();
        
        List<DepartmentModel> departmentsData = departments.map((department) => DepartmentModel(
          id: department.id,
          facultyId: department.facultyId, 
          departmentName: department.departmentName, 
          createdAt: department.createdAt, 
          updatedAt: department.updatedAt)).toList();


        return Right(departmentsData);
      }
    );
    
  }

}