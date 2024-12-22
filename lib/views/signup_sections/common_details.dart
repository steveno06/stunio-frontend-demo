import 'package:flutter/material.dart';
import 'package:stunio_frontend/viewmodels/signup_viewmodel.dart';
import 'package:stunio_frontend/views/components/header_2.dart';
import 'package:stunio_frontend/views/components/simple_button.dart';
import 'package:stunio_frontend/views/components/simple_text_field.dart';

class CommonDetails extends StatefulWidget {
  final SignupViewmodel viewModel;
  const CommonDetails({required this.viewModel, super.key});

  @override
  State<CommonDetails> createState() => _CommonDetailsState();
}

class _CommonDetailsState extends State<CommonDetails> {
  final _usernameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _usernameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
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
              child: const Header2(label: "Lets get the essentials"),
            ),
            SimpleTextField(fieldName: "Username", inputController: _usernameController),
            SimpleTextField(fieldName: "Email", inputController: _emailController),
            SimpleTextField(fieldName: "Password", inputController: _passwordController, isObscure: true),
            Padding(
              padding: const EdgeInsets.only(top: 14),
              child: SimpleButton(onPressed: (){
                widget.viewModel.setCommonData(
                  _usernameController.text,
                  _emailController.text, 
                  _passwordController.text
                );
                widget.viewModel.nextSection();
              }, label: "Next Steps"),
            )
          ],
        ),
      ),
    );
  }
}