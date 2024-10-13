import '../../data/repository/user.storage.dart';
import '../../data/service/authentication/authentication.dart';
import '../../data/service/authentication/imp/create.account.dart';
import '../../data/service/authentication/imp/create.password.dart';
import '../../data/service/authentication/imp/forget.password.dart';
import '../../data/service/authentication/imp/login.dart';
import '../../data/service/authentication/imp/otp.dart';
import '../../data/service/department/department.dart';
import '../../data/service/errands/errands.dart';
import '../../data/service/errands/imp/create.errands.dart';
import '../../data/service/errands/imp/get.available.errands.dart';
import '../../data/service/faculty/faculty.dart';
import '../../data/service/institution/imp/institutions.dart';
import '../../data/service/institution/institution.dart';
import '../../data/service/user/imp/profile.dart';
import '../../data/service/user/user.dart';
import '../../route/route.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

final locator = GetIt.instance;

void setUpLocator(){
  locator.registerLazySingleton<GoRouter>(() => routes);
  locator.registerLazySingleton<Institution>(
    () => Institutions(),
    instanceName: "Institutions"
  );
  locator.registerLazySingleton<Institution>(
    () => Faculties(),
    instanceName: "Faculties"
  );
  locator.registerLazySingleton<Institution>(
    () => Departments(),
    instanceName: "Departments"
  );
  locator.registerLazySingleton<Authentication>(
    () => CreateUserAccountService(),
    instanceName: "CreateUserAccount"
  );
  locator.registerLazySingleton<Authentication>(
    () => LoginService(),
    instanceName: "LoginService"
  );
  locator.registerLazySingleton<Authentication>(
    () => OTPService(),
    instanceName: "SendOTP"
  );
  locator.registerLazySingleton<Authentication>(
    () => ForgetPasswordService(),
    instanceName: "ForgetPasswordService"
  );
  locator.registerLazySingleton<Authentication>(
    () => CreatePasswordService(),
    instanceName: "CreatePasswordService"
  );
  locator.registerLazySingleton<SecureStorageService>(
    () => SecureStorageService()
  );
  locator.registerLazySingleton<User>(
    () => UserProfileService(),
    instanceName: "UserProfile"
  );
  locator.registerLazySingleton<Errands>(
    () => GetErrandsService(),
    instanceName: "GetErrandsService"
  );
  locator.registerLazySingleton<Errands>(
    () => CreateErrandTaskService(),
    instanceName: "CreateErrandTaskService"
  );

}