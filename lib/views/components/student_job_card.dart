import 'package:flutter/material.dart';

class StudentJobCard extends StatelessWidget {
  const StudentJobCard({super.key, required this.title, required this.date, required this.description, this.handleAccept, this.handleDecline});

  final String title;
  final String date;
  final String description;
  final VoidCallback? handleAccept;
  final VoidCallback? handleDecline;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: handleAccept != null ? () => handleAccept!() : null,
      onLongPress: handleDecline != null ? () => handleDecline!() : null,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: TextStyle(color: const Color.fromARGB(255, 6, 108, 192), fontSize: 20, fontWeight: FontWeight.bold),),
              Text(date),
              Padding(
                padding: const EdgeInsets.only(top: 7),
                child: Text(description, maxLines: 3,),
              )
            ],
          ),
        ),
      ),
    );
  }
}