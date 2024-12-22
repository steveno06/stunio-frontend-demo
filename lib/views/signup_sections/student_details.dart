import 'package:flutter/material.dart';
import 'package:stunio_frontend/viewmodels/signup_viewmodel.dart';
import 'package:stunio_frontend/views/components/header_2.dart';
import 'package:stunio_frontend/views/components/simple_button.dart';
import 'package:stunio_frontend/views/components/simple_text_field.dart';
import 'package:stunio_frontend/views/student_homepage.dart';

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
    return Padding(
      padding: const EdgeInsets.all(14),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 14),
              child: Header2(label: "Tell us more about you as a student"),
            ),
            SimpleTextField(fieldName: "School", inputController: _schoolController),
            SimpleTextField(fieldName: "Major", inputController: _majorController),
            SimpleTextField(fieldName: "Graduation Year", inputController: _graduationYearController),
            Padding(
              padding: const EdgeInsets.only(top: 14),
              child: SimpleButton(onPressed: () async {
                 widget.viewModel.setStudentData(
                  _schoolController.text, 
                  _majorController.text, 
                  int.parse(_graduationYearController.text)
                );
                await widget.viewModel.register().then((success){
                  if(success){
                    Navigator.pushReplacement(
                      context, 
                      MaterialPageRoute(builder: (context)=>StudentHomepage(userId: widget.viewModel.userId!, userType: widget.viewModel.userTypeResponse!))
                    );
                  }
                });
              }, label: "Create Student Account"),
            )
          ],
        ),
      ),
    );
  }
}