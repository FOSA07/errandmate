mixin Validators {

  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) return 'Please enter your email';

    final emailRegExp = RegExp(
      r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
    );

    if (!emailRegExp.hasMatch(value)) return 'Please enter a valid email address';

    return null;
  }

  String? validatePassword(
    String? value, {
      bool? validateFormat
    }) {
    if (value == null || value.isEmpty) return 'Please enter a password';

    if(validateFormat!){
      String pattern =
      r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$';

      RegExp regExp = RegExp(pattern);

      if(!regExp.hasMatch(value)) {
        return "Password must contain at least"
        "";
      }
    }

    return null;
  }

  String? validateName (String? value) {

    if (value == null || value.isEmpty) return 'Field cannot be empty';

    final RegExp nameRegExp = RegExp(r'^[a-zA-Z]+$');

    if(!nameRegExp.hasMatch(value)) return 'Please enter a valid name';

    return null;
  }

}