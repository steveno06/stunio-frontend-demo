import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stunio_frontend/views/signup_sections/business_details.dart';
import 'package:stunio_frontend/views/signup_sections/common_details.dart';
import 'package:stunio_frontend/views/signup_sections/student_details.dart';
import 'package:stunio_frontend/views/signup_sections/user_type_selection.dart';
import '../viewmodels/signup_viewmodel.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ChangeNotifierProvider(create: (_) => SignupViewmodel(),
      child: Consumer<SignupViewmodel>(builder: (context, viewModel, _){
        switch(viewModel.pageSection){
          case RegisterSection.studentOrBusiness:
            return Usertypeselection(viewModel: viewModel);
          case RegisterSection.common:
            return CommonDetails(viewModel: viewModel);
          case RegisterSection.studentDetailed:
            return StudentDetails(viewModel: viewModel);
          case RegisterSection.businessDetailed:
            return BusinessDetails(viewModel: viewModel);
        }
      }),
      )
    );
  }
}