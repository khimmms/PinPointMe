import 'package:flutter/material.dart';

class RescuedPopup extends StatefulWidget {
  @override
  State<RescuedPopup> createState() => _RescuedPopupState();
}

class _RescuedPopupState extends State<RescuedPopup> {
  final String roomNumber = 'RM 201'; // Make room number variable

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('lib/assets/background.png'),
            fit: BoxFit.fill,
          ),
        ),

        child: Column(
          children: [
            SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  Image.asset(
                    'lib/assets/ppm_w_word.png',
                    height: 70,
                  ),
                  SizedBox(width: 5),
                ],
              ),
            ),

            SizedBox(height: 10),
            Divider(color: Colors.grey[300], thickness: 1),
            SizedBox(height: 70), // Reduced height

            // Back button placed below the image
            Padding(
              padding: const EdgeInsets.only(left: 16.0, top: 8.0), // Adjust padding as needed
              child: Align(
                alignment: Alignment.centerLeft,
                child: IconButton(
                  icon: Icon(Icons.arrow_back, color: Colors.black87),
                  onPressed: () {
                    // Redirect to WaitingPage when back icon is clicked
                    Navigator.pop(context);
                  },
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.red,
                            child: Icon(Icons.person, color: Colors.white),
                          ),
                          SizedBox(width: 10),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('John Doe', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                              Text('202200000'),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Divider(color: const Color.fromARGB(255, 116, 109, 109), thickness: 1),
                      Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(height: 15),
                            Text(
                              'GD1 | 2nd FLR, $roomNumber',
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 15),
                          ],
                        ),
                      ),
                      SizedBox(height: 10),
                      Divider(color: const Color.fromARGB(255, 116, 109, 109), thickness: 1),
                      SizedBox(height: 10),
                      Text('Higher Education', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
                      InkWell(
                        onTap: () {},
                        child: Text(
                          'user.com@sdca.edu.ph',
                          style: TextStyle(color: Colors.blue, decoration: TextDecoration.underline),
                        ),
                      ),
                      SizedBox(height: 20),
                      // Display temporary date and time
                      Text(
                        'Date Rescued: 2025-02-22 - 10:38',
                        style: TextStyle(fontSize: 16, color: Colors.black87),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}