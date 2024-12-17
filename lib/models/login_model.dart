class LoginCredentials{
  final String username;
  final String password;
  LoginCredentials({required this.username, required this.password});
}

class LoginResponse{
  final bool success;
  final String? error;
  final String? userId;

  LoginResponse({required this.success, this.error, this.userId});
}