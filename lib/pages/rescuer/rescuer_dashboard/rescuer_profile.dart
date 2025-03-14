import 'package:flutter/material.dart';


class RescuerProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.
          black87, size: 30),
          onPressed: () {
            Navigator.pop(context); // Go back to the previous screen  
          },
        ),
        title: Text('Me'), 
        elevation: 0, foregroundColor: Colors.white, 
      ), 
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('lib/assets/background.png'),
            fit: BoxFit.fill, 
          ), 
        ), 
        child: Center(
          child: Column(
            children: <Widget>[
              SizedBox(height: 150),
              Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.red,
                ),
                child: Icon(
                  Icons.person,
                  size: 60,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 20),
              Text(
                'User Name',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              Text(
                'Rescuer',
                style: TextStyle(fontSize: 16, color: const Color.fromARGB(255, 74, 74, 74)),
              ),
              Divider(color: const Color.fromARGB(255, 58, 55, 55), thickness: 2, indent: 80, endIndent: 80),
              SizedBox(height: 10),
              Text(
                'ID: 202200001',
                style: TextStyle(fontSize: 16),
              ),
              Text(
                'user.name@sdca.edu.ph',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  // Implement logout functionality here
                },
                child: Text('Logout', style: TextStyle(fontSize: 18)),
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.black87,
                  padding: EdgeInsets.symmetric(horizontal: 95, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0), // Adjusted BorderRadius
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}