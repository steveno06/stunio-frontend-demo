import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stunio_frontend/views/business_homepage.dart';
import 'package:stunio_frontend/views/components/simple_button.dart';
import 'package:stunio_frontend/views/components/simple_text_field.dart';
import 'package:stunio_frontend/views/signup_page.dart';
import 'package:stunio_frontend/views/student_homepage.dart';
import '../viewmodels/login_viewmodel.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ChangeNotifierProvider(
        create: (_) => LoginViewModel(),
        child: Consumer<LoginViewModel>(
          builder: (context, viewModel, _){
            return Padding(
              padding: const EdgeInsets.all(14),
              child: (
                Center(
                  child: (
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Stunio", style: TextStyle(color: const Color.fromARGB(255, 6, 108, 192), fontSize: 40, fontWeight: FontWeight.w700),),
                        SimpleTextField(fieldName: "Username", inputController: _usernameController),
                        SimpleTextField(fieldName: "Password", inputController: _passwordController, isObscure: true),
                        Padding(
                          padding: const EdgeInsets.only(top: 14, bottom: 7),
                          child: SimpleButton(onPressed: () async {
                            await viewModel.login(_usernameController.text, _passwordController.text).then(
                              (success){
                                if(success){
                                  if(viewModel.userType == "STUDENT"){
                                    Navigator.pushReplacement(
                                      context, 
                                      MaterialPageRoute(builder: (context) => StudentHomepage(userId: viewModel.userId!, userType: viewModel.userType!))
                                    );
                                  } else if(viewModel.userType == "BUSINESS"){
                                    Navigator.pushReplacement(
                                      context, 
                                      MaterialPageRoute(builder: (context) => BusinessHomepage(userId: viewModel.userId!, userType: viewModel.userType!))
                                    );
                                  }
                                  
                                }
                              }
                            );
                          }, label: "Login"),
                        ),
                        SimpleButton(onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=> SignupPage()));
                        }, label: "Sign Up")
                      ],)
                  ),
                )
              ),
            );
          }
          )
      
      )

    );
  }
}