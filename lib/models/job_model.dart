class Job{
  final int id;
  final String title;
  final String description;
  final String date;

  Job({required this.id, required this.title, required this.description, required this.date});

  factory Job.fromJson(Map<String, dynamic> json){
    return Job(
      id: json['id'] as int,
      title: json['title'] as String,
      description: json['description'] as String,
      date: json['event_date'] as String
    );
  }
}

class StudentJobResponse{
  final bool success;
  List<Job> activeJobs;
  List<Job> invitedJobs;

  StudentJobResponse({required this.activeJobs, required this.invitedJobs, required this.success});
}

class BusinessJob{
  final int id;
  final String title;
  final String description;
  final String date;
  final bool isBooked;

  BusinessJob({
    required this.id, 
    required this.title, 
    required this.description, 
    required this.date, 
    required this.isBooked});
  
  factory BusinessJob.fromJson(Map<String, dynamic> json){
    return BusinessJob(
      id: json['id'], 
      title: json['title'], 
      description: json['description'], 
      date: json['event_date'], 
      isBooked: json['is_booked']
    );
  }
}

class BusinessJobResponse{
  final bool success;
  List<BusinessJob> businessJobs;

  BusinessJobResponse({required this.success, required this.businessJobs});
}