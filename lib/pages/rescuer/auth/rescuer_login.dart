import 'package:flutter/material.dart';
import 'package:frontend/pages/rescuer/auth/rescuer_verification.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rescuer Login',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: RescuerLogin(),
    );
  }
}

class RescuerLogin extends StatefulWidget {
  @override
  _RescuerLoginState createState() => _RescuerLoginState();
}

class _RescuerLoginState extends State<RescuerLogin> {
  final _formKey = GlobalKey<FormState>();
  final _fullnameController = TextEditingController();
  final _idController = TextEditingController();
  final _emailController = TextEditingController();
  String? _role;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('lib/assets/background.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: SingleChildScrollView( // Added SingleChildScrollView
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  SizedBox(height: 100),
                  Center(
                    child: Image.asset(
                      'lib/assets/ppm_logo.png',
                      height: 100,
                    ),
                  ),
                  SizedBox(height: 10),
                  Center(
                    child: Text(
                      'Let\'s get started.',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: 30),
                  TextFormField(
                    controller: _fullnameController,
                    decoration: InputDecoration(
                      labelText: 'Fullname',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) => value?.isEmpty ?? true ? 'Please enter your fullname' : null,
                  ),
                  SizedBox(height: 16),
                  TextFormField(
                    controller: _idController,
                    decoration: InputDecoration(
                      labelText: 'ID',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) => value?.isEmpty ?? true ? 'Please enter your ID' : null,
                  ),
                  SizedBox(height: 16),
                  TextFormField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      labelText: 'Email',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value?.isEmpty ?? true) {
                        return 'Please enter your email';
                      }
                      if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value!)) {
                        return 'Please enter a valid email address';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 16),
                  DropdownButtonFormField<String>(
                    value: _role,
                    decoration: InputDecoration(
                      labelText: 'Role',
                      border: OutlineInputBorder(),
                    ),
                    items: <String>['Admin', 'Faculty', 'Staff', 'Student']
                        .map((value) => DropdownMenuItem(
                              value: value,
                              child: Text(value),
                            ))
                        .toList(),
                    onChanged: (value) => setState(() => _role = value),
                    validator: (value) => value?.isEmpty ?? true ? 'Please select a role' : null,
                  ),
                  SizedBox(height: 40),
                  Text(
                    'By tapping next, we will collect your email\'s information to be able to send you a One-Time Password (OTP).',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 14),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        print('Fullname: ${_fullnameController.text}');
                        print('ID: ${_idController.text}');
                        print('Email: ${_emailController.text}');
                        print('Role: $_role');

                        // Navigate to the Authentication after validation
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => RescuerVerification()),
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(vertical: 16),
                      backgroundColor: Color.fromARGB(255, 24, 66, 216),
                    ),
                    child: Text('Next', style: TextStyle(color: Colors.white)),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}