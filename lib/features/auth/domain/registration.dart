const expectedCapture = 'FD48';

class RegistrationInput {
  const RegistrationInput({
    required this.name,
    required this.telephone,
    required this.email,
    required this.address,
    required this.businessName,
    required this.position,
    required this.businessType,
    required this.product,
    required this.size,
    required this.password,
    required this.confirmedPassword,
    required this.capture,
  });

  final String name;
  final String telephone;
  final String email;
  final String address;
  final String businessName;
  final String position;
  final String? businessType;
  final String? product;
  final String? size;
  final String password;
  final String confirmedPassword;
  final String capture;
}

/// Returns the first problem with a registration form, or null when it can be sent.
String? registrationError(RegistrationInput input) {
  final fields = <String, String>{
    'name': input.name,
    'telephone': input.telephone,
    'email': input.email,
    'address': input.address,
    'business name': input.businessName,
    'current position': input.position,
    'password': input.password,
    'confirmed password': input.confirmedPassword,
  };
  for (final entry in fields.entries) {
    if (entry.value.trim().isEmpty) {
      return 'Enter your ${entry.key}.';
    }
  }
  if (input.businessType == null) {
    return 'Select a type of business.';
  }
  if (input.product == null) {
    return 'Select a manufactured product.';
  }
  if (input.size == null) {
    return 'Select the size of the business.';
  }
  if (!input.email.contains('@')) {
    return 'Enter an email address.';
  }
  if (input.password != input.confirmedPassword) {
    return 'The passwords do not match.';
  }
  if (input.capture.trim().toUpperCase() != expectedCapture) {
    return 'Enter the capture code $expectedCapture.';
  }
  return null;
}
