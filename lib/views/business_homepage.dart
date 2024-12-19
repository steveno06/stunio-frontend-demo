import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stunio_frontend/viewmodels/business_home_viewmodel.dart';

class BusinessHomepage extends StatelessWidget {
  final int userId;
  final String userType;
  const BusinessHomepage({required this.userId, required this.userType, super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => BusinessHomeViewmodel(userId: userId, userType: userType),
      child: Scaffold(
        body: Consumer(builder: (context, viewModel, _){
          return Center(
            child: Text("Welcome to the business home page ${userId}"),
          );
        }),
      ),
    );
  }
}