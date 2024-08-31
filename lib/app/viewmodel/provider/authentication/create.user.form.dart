import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../model/authentication/create.user.dart';

part 'create.user.form.g.dart';

@Riverpod(keepAlive: true)
class CreateUserFormNotifier extends _$CreateUserFormNotifier {

  @override
  CreateUserModel build() {
    return CreateUserModel(
      firstname: '',
      lastname: '',
      username: '',
      gender: '',
      matricNumber: '',
      email: '',
      phone: '',
      institution: '',
      faculty: 0,
      department: 0,
      password: '',
    );
  }

  void updateFirstname(String value) {
    state = state.copyWith(firstname: value);
  }

  void updateLastname(String value) {
    state = state.copyWith(lastname: value);
  }

  void updateUsername(String value) {
    state = state.copyWith(username: value);
  }

  void updateGender(String value) {
    state = state.copyWith(gender: value);
  }

  void updateMatricNumber(String value) {
    state = state.copyWith(matricNumber: value);
  }

  void updateEmail(String value) {
    state = state.copyWith(email: value);
  }

  void updatePhone(String value) {
    state = state.copyWith(phone: value);
  }

  void updateInstitution(String value) {
    state = state.copyWith(institution: value);
  }

  void updateFaculty(String value) {
    state = state.copyWith(faculty: int.parse(value));
  }

  void updateDepartment(String value) {
    state = state.copyWith(department: int.parse(value));
  }

  void updatePassword(String value) {
    state = state.copyWith(password: value);
  }

  void resetForm() {
    state = CreateUserModel(
      firstname: '',
      lastname: '',
      username: '',
      gender: '',
      matricNumber: '',
      email: '',
      phone: '',
      institution: '',
      faculty: 0,
      department: 0,
      password: '',
    );
  }
}
