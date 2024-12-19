import 'package:flutter/foundation.dart';

class BusinessHomeViewmodel extends ChangeNotifier {
  final int userId;
  final String userType;

  BusinessHomeViewmodel({required this.userId, required this.userType});
}