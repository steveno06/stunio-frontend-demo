import 'package:flutter/material.dart';
import 'package:stunio_frontend/viewmodels/business_home_viewmodel.dart';
import 'package:stunio_frontend/views/components/header_2.dart';
import 'package:stunio_frontend/views/components/simple_button.dart';
import 'package:stunio_frontend/views/components/simple_text_field.dart';

class CreateBusinessJob extends StatefulWidget {
  const CreateBusinessJob({super.key, required this.viewModel});
  final BusinessHomeViewmodel viewModel;

  @override
  State<CreateBusinessJob> createState() => _CreateBusinessJobState();
}

class _CreateBusinessJobState extends State<CreateBusinessJob> {

  final _eventTitleController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _requiredStudentsController = TextEditingController();
  final _dateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(14),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 14),
            child: Header2(label: "Job Creation"),
          ),
          SimpleTextField(fieldName: "Event Title", inputController: _eventTitleController),
          SimpleTextField(fieldName: "Description", inputController: _descriptionController),
          SimpleTextField(fieldName: "Required Student Helpers", inputController: _requiredStudentsController),
          SimpleTextField(fieldName: "Date", inputController: _dateController),
          Padding(
            padding: const EdgeInsets.only(top: 14),
            child: SimpleButton(onPressed: () {}, label: "Create Job"),
          )
        ],
      ),
      );
  }
}