class Validator {
  static String? validateField({required String value}) {
    if (value.isEmpty) {
      return "TextField can not be Empty";
    }
    return null;
  }

  static String? validateUserID({required String uid }) {
    if (uid.isEmpty) {
      return 'User ID can not be Empty';
    } else if (uid.length <= 5) {
      return 'User ID should be greater than 5 Characters';
    }
    return null;
  }
}
