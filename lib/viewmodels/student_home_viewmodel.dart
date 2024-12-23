import 'package:flutter/foundation.dart';
import 'package:stunio_frontend/models/job_model.dart';
import 'package:stunio_frontend/services/job_service.dart';

class StudentHomeViewmodel extends ChangeNotifier{
  final JobService _jobService = JobService();
  
  int _currentIndex = 0;
  final int userId;
  final String userType;

  List<Job>? _activeJobs;
  List<Job>? _invitedJobs;
  bool _isLoading = false;

  List<Job>? get activeJobs => _activeJobs;
  List<Job>? get invitedJobs => _invitedJobs;
  bool get isLoading => _isLoading;
  int get currentIndex => _currentIndex;

  void setCurrentIndex(int index){
    _currentIndex = index;
    notifyListeners();
  }

  StudentHomeViewmodel({required this.userId, required this.userType});

  Future<bool> get_student_jobs(int studentId)async{
    _isLoading = true;
    notifyListeners();

    try {
      final response = await _jobService.getStudentJobs(studentId);

      if(response.success){
        _activeJobs = response.activeJobs;
        _invitedJobs = response.invitedJobs;
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

  Future<bool> acceptJob(int jobInviteId) async {
    try {
      final response = await _jobService.acceptJob(jobInviteId);
      if(response){
        return true;
      }
      return false;
    } catch (e) {
      return false;
    }
  }

  Future<bool> declineJob(int jobInviteId) async {
    try {
      final response = await _jobService.declineJob(jobInviteId);
      if(response){
        return true;
      }
      return false;
    } catch (e) {
      return false;
    }
  }
}