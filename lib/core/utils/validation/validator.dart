class Validator {
  static String? requiredValidator(String? text) {
    if (text!.trim().isEmpty) return 'This field is required';
    return null;
  }
}
