import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stunio_frontend/viewmodels/student_home_viewmodel.dart';

class StudentHomepage extends StatelessWidget {
  final int userId;
  final String userType;

  const StudentHomepage({required this.userId, required this.userType, super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => StudentHomeViewmodel(userId: userId, userType: userType),
      child: Scaffold(
        body: Consumer<StudentHomeViewmodel>(
          builder: (context, viewModel, _){
            return Center(
              child: Text("${viewModel.userId}   ${viewModel.userType}"),
            );
          }
          ),
      ),
      );
  }
}