class LoginCredentials{
  final String email;
  final String password;
  LoginCredentials({required this.email, required this.password});
}

class LoginResponse{
  final bool success;
  final String? error;
  final String? userType;

  LoginResponse({required this.success, this.error, this.userType});
}