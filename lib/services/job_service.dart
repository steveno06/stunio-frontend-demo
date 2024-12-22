import 'dart:convert';

import 'package:stunio_frontend/models/job_model.dart';
import 'package:http/http.dart' as http;

class JobService {
  static const String _baseUrl = "http://10.0.2.2:8000";

  Future<StudentJobResponse> getStudentJobs(int studentId) async {
    try{
      final response = await http.get(
        Uri.parse('$_baseUrl/jobs/student/$studentId')
      );

      final data = jsonDecode(response.body);
      

      if(response.statusCode == 200){
        final activeJobs = (data['active_jobs'] as List)
          .map((jobJson) => Job.fromJson(jobJson))
          .toList();

        final invitedJobs = (data['invited_jobs'] as List)
        .map((jobJson) => Job.fromJson(jobJson))
        .toList();

        return StudentJobResponse(activeJobs: activeJobs, invitedJobs: invitedJobs, success: true);
      } else {
        return StudentJobResponse(activeJobs: [], invitedJobs: [], success: false);
      }
    } catch (e){
      return StudentJobResponse(activeJobs: [], invitedJobs: [], success: false);
    }
  }

  Future<BusinessJobResponse> getBusinessJobs(int businessId) async {
    try {
      final response = await http.get(
        Uri.parse('$_baseUrl/jobs/business/$businessId')
      );
      final data = jsonDecode(response.body);

      if(response.statusCode == 200){
        final businessJobs = (data['business_jobs'] as List)
        .map((jobJson) => BusinessJob.fromJson(jobJson))
        .toList();

        return BusinessJobResponse(success: true, businessJobs: businessJobs);
      }
      return BusinessJobResponse(success: false, businessJobs: []);
    } catch (e) {
      return BusinessJobResponse(success: false, businessJobs: []);
    }
  }
}