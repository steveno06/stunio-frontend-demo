import "package:http/http.dart" as http;
import 'dart:convert';
import "../models/login_model.dart";

class AuthService{
  static const String _baseUrl = "http://127.0.0.1:8000/";

  Future<LoginResponse> login(LoginCredentials credentials) async {
    try{
      final response = await http.post(
        Uri.parse(
          '$_baseUrl/users/login'
          
          ),
          body: {
            "username": credentials.username,
            "password": credentials.password
          }
      );

      final data = json.decode(response.body);

      if(response.statusCode == 200){
        return LoginResponse(success: true, userId: data['user_id']);
      } else {
        return LoginResponse(success: false, error: "Invalid Login");
      }
    }
    catch(e){
      return LoginResponse(success: false, error: "Connection error occured");
    }
  }


}