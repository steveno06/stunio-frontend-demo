import 'package:flutter/material.dart';
import 'package:stunio_frontend/views/components/student_job_card.dart';

import '../../models/job_model.dart';

class StudentInvitedJobs extends StatelessWidget {
  const StudentInvitedJobs({super.key, required this.invitedJobs});

  final List<Job> invitedJobs;

  @override
  Widget build(BuildContext context) {
    return invitedJobs.isEmpty
      ? const Center(child: Text("No invited jobs yet"),)

      : Padding(
        padding: const EdgeInsets.all(14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Invited Jobs", style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),),
            SizedBox(
              height: 500,
              child: ListView.builder(
                itemCount: invitedJobs.length,
                itemBuilder: (context, index){
                  final job = invitedJobs[index];
                  return StudentJobCard(title: job.title, date: job.date, description: job.description);
                }
                ),
            ),
          ],
        ),
      )
    ;
  }
}