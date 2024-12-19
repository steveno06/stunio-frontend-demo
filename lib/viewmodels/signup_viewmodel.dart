import 'package:flutter/foundation.dart';
import 'package:http/http.dart';
import 'package:stunio_frontend/models/register_model.dart';

import '../services/auth_service.dart';
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
  final AuthService _authService = AuthService();
  bool _isLoading = false;
  String? _error;
  int? _userId;
  String? _userTypeResponse;

  bool get isLoading => _isLoading;
  String? get error => _error;
  int? get userId => _userId;
  String? get userTypeResponse => _userTypeResponse;




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

  Future<bool> register() async {
    _isLoading = true;
    notifyListeners();
    UserRegisterFields user;
    try{
      if(_userType == UserType.student){
        user = UserRegisterFields(
          username: _username!,
          password: _password!,
          email: _email!,
          userType: _userType!,
          school: _school,
          major: _major, 
          graduationYear: _graduationYear
        );
      } else if(_userType == UserType.business){
        user = UserRegisterFields(
          username: _username!, 
          password: _password!, 
          email: _email!,
          userType: _userType!,
          companyName: _companyName,
          industry: _industry,
          companySize: _companySize
        );
      } else{
        return false;
      }

      final response = await _authService.register(user);
      _isLoading = false;
      if(response.success){
        _userId = response.userId;
        _userTypeResponse = response.userType;
        _error = null;
        
      } else {
        _error = response.error;
      }
      
      notifyListeners();
      return response.success;
    }
    catch (e){
      return false;
    }
  }

}