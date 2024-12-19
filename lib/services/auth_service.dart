import "package:http/http.dart" as http;
import 'package:stunio_frontend/viewmodels/signup_viewmodel.dart';
import 'dart:convert';
import "../models/login_model.dart";
import '../models/register_model.dart';

class AuthService{
  static const String _baseUrl = "http://10.0.2.2:8000";

  Future<LoginResponse> login(LoginCredentials credentials) async {
    try{
      final response = await http.post(
        Uri.parse(
          '$_baseUrl/users/login'
          
          ),
          headers: {
          "Content-Type": "application/json", // Specify JSON content type
          },
          body: jsonEncode({
            "username": credentials.username,
            "password": credentials.password
          })
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

  Future<RegisterResponse> register(UserRegisterFields registerFields) async {
    String body = jsonEncode({});

    

    if(registerFields.userType == UserType.student){
      body = jsonEncode({
        "username": registerFields.username,
        "password": registerFields.password,
        "user_type": "STUDENT",
        "email": registerFields.email,
        "school": registerFields.school,
        "major": registerFields.major,
        "graduation_year": registerFields.graduationYear
      });
    } else if(registerFields.userType == UserType.business){
      body = jsonEncode({
        "username": registerFields.username,
        "password": registerFields.password,
        "user_type": "BUSINESS",
        "email": registerFields.email,
        "company_name": registerFields.companyName,
        "industry": registerFields.industry,
        "business_size": registerFields.companySize
      });
    }
    
    try {
      final response = await http.post(
        Uri.parse('$_baseUrl/users/register'),
        headers: {
          "Content-Type": "application/json", // Specify JSON content type
        },
        body: body
      );

      final data = jsonDecode(response.body);
      if(response.statusCode == 200){
        return RegisterResponse(success: true);
      } else{
        return RegisterResponse(success: false, error: "Error registering user");
      }
    } catch (e) {
      return RegisterResponse(success: false, error: "Connection error occured");
    }
  }
}