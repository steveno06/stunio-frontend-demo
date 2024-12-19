import 'package:flutter/foundation.dart';
import 'package:stunio_frontend/viewmodels/signup_viewmodel.dart';
import '../services/auth_service.dart';
import '../models/login_model.dart';

class LoginViewModel extends ChangeNotifier{
  final AuthService _authService = AuthService();

  bool _isLoading = false;
  String? _error;
  int? _userId;
  String? _userType;

  bool get isLoading => _isLoading;
  String? get error => _error;
  int? get userId => _userId;
  String? get userType => _userType;

  Future<bool> login(String username, String password) async {
    _isLoading = true;
    _error = null;
    _userId = null;
    notifyListeners();

    try{
      final credentials = LoginCredentials(username: username, password: password);
      final response = await _authService.login(credentials);

      _isLoading = false;

      if(response.success){
        _userId = response.userId;
        _userType = response.userType;
        _error = null;
      } else {
        _error = response.error;
      }

      notifyListeners();
      return response.success;

    } catch (e){
      _isLoading = false;
      _error = "Unexpected error occured";
      _userId = null;
      notifyListeners();
      return false;
    }
  }
}