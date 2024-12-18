import 'package:flutter/foundation.dart';
import '../services/auth_service.dart';
import '../models/login_model.dart';

class LoginViewModel extends ChangeNotifier{
  final AuthService _authService = AuthService();

  bool _isLoading = false;
  String? _error;
  String? _userId;

  bool get isLoading => _isLoading;
  String? get error => _error;
  String? get userId => _userId;

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