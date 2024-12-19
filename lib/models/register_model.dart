class StudentRegisterFields{
  final String username;
  final String password;
  final String email;
  final String school;
  final String major;
  final int graduationYear;

  StudentRegisterFields({
    required this.username, 
    required this.password, 
    required this.email, 
    required this.school, 
    required this.major, 
    required this.graduationYear,
  });
}

class BusinessRegisterFields{
  final String username;
  final String password;
  final String email;
  final String companyName;
  final String industry;
  final int companySize;

  BusinessRegisterFields({
    required this.username,
    required this.password,
    required this.email,
    required this.companyName,
    required this.industry,
    required this.companySize
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