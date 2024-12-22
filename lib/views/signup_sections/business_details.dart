import 'package:flutter/material.dart';
import 'package:stunio_frontend/viewmodels/signup_viewmodel.dart';
import 'package:stunio_frontend/views/components/header_2.dart';
import 'package:stunio_frontend/views/components/simple_button.dart';
import 'package:stunio_frontend/views/components/simple_text_field.dart';

import '../business_homepage.dart';

class BusinessDetails extends StatefulWidget {
  final SignupViewmodel viewModel;
  const BusinessDetails({required this.viewModel, super.key});

  @override
  State<BusinessDetails> createState() => _BusinessDetailsState();
}

class _BusinessDetailsState extends State<BusinessDetails> {

  final _companyNameController = TextEditingController();
  final _industryController = TextEditingController();
  final _companySizeController = TextEditingController();

  @override
  void dispose() {
    _companyNameController.dispose();
    _industryController.dispose();
    _companySizeController.dispose();
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
              child: Header2(label: "Tell us more about your business!"),
            ),
            SimpleTextField(fieldName: "Company Name", inputController: _companyNameController),
            SimpleTextField(fieldName: "Industry", inputController: _industryController),
            SimpleTextField(fieldName: "Company Size", inputController: _companySizeController),
            Padding(
              padding: const EdgeInsets.only(top: 14),
              child: SimpleButton(onPressed: () async {
                widget.viewModel.setBusinessData(
                  _companyNameController.text, 
                  _industryController.text, 
                  int.parse(_companySizeController.text
                ));
                await widget.viewModel.register().then((success){
                  if(success){
                    Navigator.pushReplacement(
                      context, 
                      MaterialPageRoute(builder: (context) => BusinessHomepage(userId: widget.viewModel.userId!, userType: widget.viewModel.userTypeResponse!))
                    );
                  }
                });
              }, label: "Create Business Account"),
            )
          ],
        ),
      ),
    );
  }
}