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
      create: (context){
        final viewModel = BusinessHomeViewmodel(userId: userId, userType: userType);
        viewModel.getBusinessJobs(userId);
        return viewModel;
      },
      child: Consumer<BusinessHomeViewmodel>(
        builder: (context, viewModel, _){
          if(viewModel.jobs == null){
            return const Scaffold(
              body: Center(child: CircularProgressIndicator()),
            );
          }
          return Scaffold(
            body: Center(
              child: Text("${viewModel.jobs!.length}"),
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: (){
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return Dialog(
                      insetPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                      child: ConstrainedBox(
                        constraints: BoxConstraints(
                          maxWidth: MediaQuery.of(context).size.width * 0.9,
                          maxHeight: MediaQuery.of(context).size.height * 0.8,
                        ),
                        child: Text("pop up")
                      ),
                    );
                  },
                );
              },
              child: const Icon(Icons.add),
            ),
          );
        },
        
      )
      
    );
  }
}