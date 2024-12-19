class UserRegisterFields{
  final String username;
  final String password;
  final String email;

  final String? school;
  final String? major;
  final int? graduationYear;

  final String? companyName;
  final String? industry;
  final int? companySize;

  UserRegisterFields({
    required this.username, 
    required this.password, 
    required this.email, 

    this.school,
    this.major,
    this.graduationYear,

    this.companyName,
    this.industry,
    this.companySize
  });
}

class RegisterResponse{
  final bool success;
  final String? error;
  final int? userId;

  RegisterResponse({
    required this.success,
    this.error,
    this.userId
  });
}