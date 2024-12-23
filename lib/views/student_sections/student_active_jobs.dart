import 'package:flutter/material.dart';

import '../../models/job_model.dart';
import '../components/student_job_card.dart';

class StudentActiveJobs extends StatelessWidget {
  const StudentActiveJobs({super.key, required this.activeJobs});

  final List<Job> activeJobs;

  @override
  Widget build(BuildContext context) {
    return activeJobs.isEmpty
      ? const Center(child: Text("No accepted jobs yet"),)

      : Padding(
        padding: const EdgeInsets.all(14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Accepted Jobs", style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),),
            SizedBox(
              height: 500,
              child: ListView.builder(
                itemCount: activeJobs.length,
                itemBuilder: (context, index){
                  final job = activeJobs[index];
                  return StudentJobCard(title: job.title, date: job.date, description: job.description);
                }
                ),
            ),
          ],
        ),
      );
  }
}