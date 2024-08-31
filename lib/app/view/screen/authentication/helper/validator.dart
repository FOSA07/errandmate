mixin Validators {

  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) return 'Please enter your email';

    final emailRegExp = RegExp(
      r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
    );

    value = value.trim();

    if (!emailRegExp.hasMatch(value)) return 'Please enter a valid email address';

    return null;
  }

  String? validatePassword(
    String? value, {
      bool? validateFormat
    }) {
    if (value == null || value.isEmpty) return 'Please enter a password';

    if(value.length < 8) return 'Please enter more than 8 characters';

    // if(validateFormat!){
      String pattern =
      r'^(?=.*[a-zA-Z]).{8,40}$';

      RegExp regExp = RegExp(pattern);

      value = value.trim();

      if(!regExp.hasMatch(value)) {
        return "Password must contain at least a letter";
      }
    // }

    if (value.length < 7) return "Enter more than 6 characters";

    return null;
  }

  String? validateName (String? value) {

    if (value == null || value.isEmpty) return 'Field cannot be empty';

    final RegExp nameRegExp = RegExp(r'^[a-zA-Z]+$');

    value = value.trim();

    if(!nameRegExp.hasMatch(value)) return 'Please enter a valid name';

    return null;

  }

  String? validateUserName (String? value) {

    if (value == null || value.isEmpty) return 'Field cannot be empty';

    return null;

  }


  String? validateMatric(String? value) {
    final RegExp regex = RegExp(r'^\d{2}/\d{2}/\d{4}$');

    if (value == null || !regex.hasMatch(value)) {
      return 'Invalid format. Please enter in the format XX/XX/XXXX';
    }

    return null;
  }

  String? validatePhoneNumber(String? value) {
    final RegExp regex = RegExp(
      r'^(\+234|234|0)?[789][01]\d{8}$'
    );

    if (value == null || !regex.hasMatch(value)) {
      return 'Invalid phone number';
    }

    return null;
  }


}