import 'package:flutter/foundation.dart';
import 'package:http/http.dart';
import 'package:stunio_frontend/models/job_model.dart';
import 'package:stunio_frontend/services/job_service.dart';

class BusinessHomeViewmodel extends ChangeNotifier {
  final JobService _jobService = JobService();
  
  final int userId;
  final String userType;

  List<BusinessJob>? _jobs;
  bool _isLoading = false;

  List<BusinessJob>? get jobs => _jobs;
  bool get isLoading => _isLoading;

  BusinessHomeViewmodel({required this.userId, required this.userType});

  Future<bool> getBusinessJobs(int businessId) async {
    _isLoading = true;
    notifyListeners();

    try {
      final response = await _jobService.getBusinessJobs(businessId);
      if(response.success){
        _jobs = response.businessJobs;
        _isLoading = false;
        notifyListeners();
        return true;
      }

      _isLoading = false;
      notifyListeners();
      return false;

    } catch (e) {
      _isLoading = false;
      notifyListeners();
      return false;
    }
  }
}