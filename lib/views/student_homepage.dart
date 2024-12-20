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
      child: Consumer<StudentHomeViewmodel>(
          builder: (context, viewModel, _) {
            if (viewModel.activeJobs == null || viewModel.invitedJobs == null) {
              return const Center(child: CircularProgressIndicator());
            }
            
            return Scaffold(
              body: Center(
              child: viewModel.currentIndex == 0
                ? const Text("Active Jobs")
                : const Text("Invited Jobs")
              ),
              bottomNavigationBar: BottomNavigationBar(
                currentIndex: viewModel.currentIndex,
                onTap: (index) => viewModel.setCurrentIndex(index),
                items: const [
                  BottomNavigationBarItem(icon: Icon(Icons.work), label: "Active Jobs"),
                  BottomNavigationBarItem(icon: Icon(Icons.mail), label: "Invited Jobs")
                ]
              ),
            );
          }
        ),
      );
  }
}