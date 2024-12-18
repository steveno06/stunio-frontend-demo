import 'package:flutter/foundation.dart';
enum UserType{
  student,
  business
}

enum RegisterSection{
  studentOrBusiness,
  common,
  studentDetailed,
  businessDetailed
}

class SignupViewmodel extends ChangeNotifier{
  RegisterSection _pageSection = RegisterSection.studentOrBusiness;
  UserType? _userType;
  //Common data
  String? _username;
  String? _password;
  String? _email;
  
  //Student data
  String? _school;
  String? _major;
  int? _graduationYear;

  //Business data
  String? _companyName;
  String? _industry;
  int? _companySize;

  RegisterSection get pageSection => _pageSection;

  void nextSection(){
    if(_pageSection == RegisterSection.studentOrBusiness){
      _pageSection = RegisterSection.common;
      notifyListeners();
    } else if(_pageSection == RegisterSection.common && _userType == UserType.student){
      _pageSection = RegisterSection.studentDetailed;
      notifyListeners();
    } else if(_pageSection == RegisterSection.common && _userType == UserType.business){
      _pageSection = RegisterSection.businessDetailed;
      notifyListeners();
    }
  }

  void setUserType(UserType userType){
    _userType = userType;
  }

  void setCommonData(String username, String email, String password){
    _username = username;
    _email = email;
    _password = password;
  }

  void setStudentData(String school, String major, int graduationYear){
    _school = school;
    _major = major;
    _graduationYear = graduationYear;
  }

  void setBusinessData(String companyName, String industry, int companySize){
    _companyName = companyName;
    _industry = industry;
    _companySize = companySize;
  }

}