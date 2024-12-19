import 'package:flutter/material.dart';
import 'package:stunio_frontend/viewmodels/signup_viewmodel.dart';

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
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Tell us more about your business!"),
          TextField(
            controller: _companyNameController,
            decoration: InputDecoration(hintText: "company name"),
          ),
          TextField(
            controller: _industryController,
            decoration: InputDecoration(hintText: "industry"),
          ),
          TextField(
            controller: _companySizeController,
            decoration: InputDecoration(hintText: "company size"),
          ),
          TextButton(onPressed: () async {
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
          }, child: Text("Create Business Account"))
        ],
      ),
    );
  }
}