import 'package:flutter/material.dart';
import 'package:stunio_frontend/views/components/business_job_card.dart';

import '../../models/job_model.dart';

class BusinessJobs extends StatelessWidget {
  const BusinessJobs({super.key, required this.jobs});

  final List<BusinessJob> jobs;

  @override
  Widget build(BuildContext context) {
    return jobs.isEmpty
      ? const Center(child: Text("No jobs created yet"),)

      : Padding(
        padding: const EdgeInsets.all(14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Your Jobs", style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),),
            SizedBox(
              height: 500,
              child: ListView.builder(
                itemCount: jobs.length,
                itemBuilder: (context, index){
                  final job = jobs[index];
                  return BusinessJobCard(title: job.title, date: job.date, description: job.description,);
                }
                ),
            ),
          ],
        ),
      );;
  }
}