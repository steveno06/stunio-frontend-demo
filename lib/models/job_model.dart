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