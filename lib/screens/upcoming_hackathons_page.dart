import 'package:flutter/material.dart';

class UpcomingHackathonsPage extends StatefulWidget {
  const UpcomingHackathonsPage({super.key});

  @override
  State<UpcomingHackathonsPage> createState() => _UpcomingHackathonsPageState();
}

class _UpcomingHackathonsPageState extends State<UpcomingHackathonsPage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Center(
        child: Text(
          'Upcoming Hackathons Page - Coming Soon!',
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ),
    );
  }
}
