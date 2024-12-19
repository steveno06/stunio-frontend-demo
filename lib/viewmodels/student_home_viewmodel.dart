import 'package:flutter/foundation.dart';

class StudentHomeViewmodel extends ChangeNotifier{
  final int userId;
  final String userType;

  StudentHomeViewmodel({required this.userId, required this.userType});
}