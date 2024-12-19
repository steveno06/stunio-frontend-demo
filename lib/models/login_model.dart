class LoginCredentials{
  final String username;
  final String password;
  LoginCredentials({required this.username, required this.password});
}

class LoginResponse{
  final bool success;
  final String? error;
  final int? userId;
  final String? userType;

  LoginResponse({required this.success, this.error, this.userId, this.userType});
}