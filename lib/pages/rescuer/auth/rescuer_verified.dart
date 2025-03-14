import 'package:flutter/material.dart';
import 'package:frontend/pages/rescuer/rescuer_dashboard/pending/pending.dart';

class RescuerVerified extends StatefulWidget {
  @override
  _RescuerVerifiedState createState() => _RescuerVerifiedState();
}

class _RescuerVerifiedState extends State<RescuerVerified> {
  @override
  void initState() {
    super.initState();

    // Add a delay of 2 seconds before navigating to the Rescuer Dashboard page
    Future.delayed(Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => PendingDashboard()), // Navigate to UserDashboard
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('lib/assets/background.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(60),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: 120),
                Center(
                  child: Image.asset('lib/assets/verify.png', height: 100),
                ),
                SizedBox(height: 20),
                Text(
                  'Verification Complete.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}