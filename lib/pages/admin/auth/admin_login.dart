import 'package:flutter/material.dart';

class AdminLogin extends StatefulWidget {
  @override
  _AdminLoginState createState() => _AdminLoginState();
}

class _AdminLoginState extends State<AdminLogin> {
  final _forrmKey = GlobalKey<FormState>();
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _adminIdController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  String? _selectedRole;

  final List<String> _roles = ['Admin', 'Student', 'Staff'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('lib/assets/admin_background.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Container(
            width: 800,
            height: 500,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: const Color.fromARGB(255, 186, 186, 186).withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 155, 178, 194),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        bottomLeft: Radius.circular(10),
                      ),
                    ),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'lib/assets/ppm_logo.png',
                            width: 200,
                            height: 200,
                          ),
                          Image.asset(
                            'lib/assets/header.png',
                            width: 150,
                            height: 150,
                          ),
                          SizedBox(height: 50),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Let's get started.",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 20),
                        TextFormField(
                          controller: _fullNameController,
                          decoration: InputDecoration(
                            labelText: 'Fullname',
                            border: OutlineInputBorder(),
                          ),
                        ),
                        SizedBox(height: 10),
                        TextFormField(
                          controller: _adminIdController,
                          decoration: InputDecoration(
                            labelText: 'Admin ID',
                            border: OutlineInputBorder(), 
                          ),
                        ),
                        SizedBox(height: 10),
                        TextFormField(
                          controller: _emailController,
                          decoration: InputDecoration(
                            labelText: 'Email',
                            border: OutlineInputBorder(),
                          ),
                        ),
                        SizedBox(height: 10),
                        DropdownButtonFormField<String>(
                          value: _selectedRole,
                          decoration: InputDecoration(
                            labelText: 'Role',
                            border: OutlineInputBorder(),
                          ),
                          onChanged: (newValue) {
                            setState(() {
                              _selectedRole = newValue;
                            });
                          },
                          items: _roles
                              .map<DropdownMenuItem<String>>(
                                (role) => DropdownMenuItem<String>(
                                  value: role,
                                  child: Text(role),
                                ),
                              )
                              .toList(),
                        ),
                        SizedBox(height: 20),
                        Text(
                          'By tapping next, we will collect your email\'s information to be able to send you a One-Time Password (OTP).',
                          style: TextStyle(fontSize: 12),
                        ),
                            SizedBox(height: 20),
                        Center( // Wrap the button with Center
                          child: SizedBox( // Use SizedBox to control width
                            width: 250, // Adjust width as needed
                            child: ElevatedButton(
                              onPressed: () {
                                
                                // ... (button action)
                              },
                              child: Text('Next'),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.blue,
                                  foregroundColor: Colors.white,
                                  shape: RoundedRectangleBorder( // Add shape property
                                    borderRadius: BorderRadius.circular(5), // Adjust radius as needed
                                  ),
                                ),
                          ),
                        ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}