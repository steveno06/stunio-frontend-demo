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
      create: (context) {
        final viewModel = StudentHomeViewmodel(userId: userId, userType: userType);
        viewModel.get_student_jobs(userId);
        return viewModel;
      },
      child: Scaffold(
        body: Consumer<StudentHomeViewmodel>(
          builder: (context, viewModel, _) {
            if (viewModel.activeJobs == null) {
              return const Center(child: CircularProgressIndicator());
            }
            
            return Center(
              child: Text("${viewModel.userId}   ${viewModel.activeJobs}"),
            );
          }
        ),
      ),
    );
  }
}