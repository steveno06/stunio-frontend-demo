import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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
        if(viewModel.pageSection == RegisterSection.studentOrBusiness){
          return Center(
            child: (
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                Text("Welcome to Stunio! Are you a student or business?"),
                TextButton(onPressed: (){
                  viewModel.setUserType(UserType.student);
                  viewModel.nextSection();
                }, child: Text("Student")),
                TextButton(onPressed: (){
                  viewModel.setUserType(UserType.business);
                  viewModel.nextSection();
                }, child: Text("Business"))
              ],)
            ),
          );
        }
        if(viewModel.pageSection == RegisterSection.common){
          return(
            Center(
              child: Column(
                children: [
                  Text("Lets get the essentials"),
                  TextField(decoration: InputDecoration(hintText: "username")),
                  TextField(decoration: InputDecoration(hintText: "email address")),
                  TextField(decoration: InputDecoration(hintText: "password")),
                  TextButton(onPressed: (){
                    viewModel.setCommonData("us5", "asd5@gmail.com", "pass");
                    viewModel.nextSection();
                  }, child: Text("Next Steps"))
                ],
            ),
            )
          );
        }

        if(viewModel.pageSection == RegisterSection.studentDetailed){
          return(
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Let's get to know you a little better as a student"),
                  TextField(decoration: InputDecoration(hintText: "school")),
                  TextField(decoration: InputDecoration(hintText: "major")),
                  TextField(decoration: InputDecoration(hintText: "graduation year")),
                  TextButton(onPressed: (){
                    viewModel.setStudentData("asd", "asd", 2030);
                    viewModel.register();
                    //Call register service in the viewmodel
                  }, child: Text("Create Student Account"))
                ],
              ),
            )
          );
        }

        if(viewModel.pageSection == RegisterSection.businessDetailed){
          return(
            Center(
              child: Column(
                children: [
                  Text("Tell us more about your business"),
                  TextField(decoration: InputDecoration(hintText: "company name")),
                  TextField(decoration: InputDecoration(hintText: "industry")),
                  TextField(decoration: InputDecoration(hintText: "company size")),
                  TextButton(onPressed: (){
                    viewModel.setBusinessData("asd", "asd", 12);
                    viewModel.register();
                    
                  }, child: Text("Create Business Account"))
                ],
              ),
            )
          );
        }

        return(
          Center(child: Text("An error has occured"),)
        );
      }),
      )
    );
  }
}