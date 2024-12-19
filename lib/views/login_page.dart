import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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
            return(
              Center(
                child: (
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("${viewModel.isLoading}"),
                      Text("${viewModel.userId}"),
                      Text("${viewModel.userType}"),
                      Text("${viewModel.error}"),
                      TextField(
                        controller: _usernameController,
                        decoration: InputDecoration(hintText: "username", border: OutlineInputBorder()),
                      ),
                      TextField(
                        controller: _passwordController,
                        decoration: InputDecoration(hintText: "password", border: OutlineInputBorder()),
                      ),
                      TextButton(onPressed: ()async{
                        await viewModel.login(_usernameController.text, _passwordController.text).then(
                          (success){
                            if(success){
                              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> StudentHomepage(userId: viewModel.userId!, userType: viewModel.userType!)

                              ));
                            }
                          }
                        );
                        
                      

                      }, child: Text("Login")
                      ),
                      TextButton(onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> SignupPage()));
                      },
                      child: Text("Sign up"),)
                    ],)
                ),
              )
            );
          }
          )
      
      )

    );
  }
}