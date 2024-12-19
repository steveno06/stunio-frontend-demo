import 'package:flutter/material.dart';
import 'package:stunio_frontend/viewmodels/signup_viewmodel.dart';

class Usertypeselection extends StatelessWidget {
  final SignupViewmodel viewModel;

  const Usertypeselection({required this.viewModel, super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("Welcome to Stunio! Are you a student or business?"),
          TextButton(onPressed: (){
            viewModel.setUserType(UserType.student);
            viewModel.nextSection();
          }, child: Text("Student")),
          TextButton(onPressed: (){
            viewModel.setUserType(UserType.business);
            viewModel.nextSection();
          }, child: Text("Business"))
        ],
      ),
    );
  }
}