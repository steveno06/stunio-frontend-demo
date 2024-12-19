import 'package:flutter/material.dart';
import 'package:stunio_frontend/viewmodels/signup_viewmodel.dart';

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
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Lets get the essentials"),
          TextField(
            controller: _usernameController,
            decoration: const InputDecoration(hintText: "username"),
          ),
          TextField(
            controller: _emailController,
            decoration: const InputDecoration(hintText: "email"),
          ),
          TextField(
            controller: _passwordController,
            decoration: InputDecoration(hintText: "password"),
            obscureText: true,
          ),
          TextButton(onPressed: (){
            widget.viewModel.setCommonData(
              _usernameController.text,
              _emailController.text, 
              _passwordController.text
            );
            widget.viewModel.nextSection();
          }, child: Text("Next Steps"))
        ],
      ),
    );
  }
}