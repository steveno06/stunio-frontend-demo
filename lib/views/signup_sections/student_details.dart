import 'package:flutter/material.dart';
import 'package:stunio_frontend/viewmodels/signup_viewmodel.dart';

class StudentDetails extends StatefulWidget {
  final SignupViewmodel viewModel;
  const StudentDetails({required this.viewModel, super.key});

  @override
  State<StudentDetails> createState() => _StudentDetailsState();
}

class _StudentDetailsState extends State<StudentDetails> {
  final _schoolController = TextEditingController();
  final _majorController =TextEditingController();
  final _graduationYearController = TextEditingController();

  @override
  void dispose() {
    _schoolController.dispose();
    _majorController.dispose();
    _graduationYearController.dispose();
    super.dispose();
  }

  
  
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Tell us more about you as a student!"),
          TextField(
            controller: _schoolController,
            decoration: InputDecoration(hintText: "school"),
          ),
          TextField(
            controller: _majorController,
            decoration: InputDecoration(hintText: "major"),
          ),
          TextField(
            controller: _graduationYearController,
            decoration: InputDecoration(hintText: "graduation year"),
          ),
          TextButton(onPressed: (){
            widget.viewModel.setStudentData(
              _schoolController.text, 
              _majorController.text, 
              int.parse(_graduationYearController.text)
            );
            widget.viewModel.register();
          }, child: Text("Create Student Account"))
        ],
      ),
    );
  }
}