import 'package:flutter/material.dart';
import 'package:stunio_frontend/viewmodels/signup_viewmodel.dart';
import 'package:stunio_frontend/views/components/header_2.dart';
import 'package:stunio_frontend/views/components/simple_button.dart';

class Usertypeselection extends StatelessWidget {
  final SignupViewmodel viewModel;

  const Usertypeselection({required this.viewModel, super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 14),
            child: Header2(label: "Welcome to Stunio! Are you a student or business?"),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SimpleButton(onPressed: (){
                viewModel.setUserType(UserType.student);
                viewModel.nextSection();
              }, label: "Student"),
              SimpleButton(onPressed: (){
                viewModel.setUserType(UserType.business);
                viewModel.nextSection();
              }, label: "Business")
            ],
          )
        ],
      ),
    );
  }
}