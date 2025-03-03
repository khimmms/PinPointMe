import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pending Popup Dashboard',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: PendingPopup(),
    );
  }
}

class PendingPopup extends StatefulWidget {
  @override
  State<PendingPopup> createState() => _PendingPopupState();
}

class _PendingPopupState extends State<PendingPopup> {
  int _selectedBtmNav = 0;
  final String roomNumber = 'RM 201'; // Make room number variable

  List<BottomNavigationBarItem> _buildBottomNavBarItems() {
    return [
      BottomNavigationBarItem(
        icon: _buildNavItemIcon(0, Icons.home),
        label: '',
      ),
      BottomNavigationBarItem(
        icon: _buildNavItemIcon(1, Icons.mail),
        label: '',
      ),
      BottomNavigationBarItem(
        icon: _buildNavItemIcon(2, Icons.person),
        label: '',
      ),
    ];
  }

  Widget _buildNavItemIcon(int index, IconData iconData) {
    if (_selectedBtmNav == index) {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 17.0, vertical: 2.0),
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 186, 186, 223),
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Icon(iconData),
      );
    } else {
      return Icon(iconData);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFFE0F7FA), // Light blue background
              Colors.white,
            ],
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
                    'lib/assets/ppm_logo.png',
                    height: 50,
                  ),
                  SizedBox(width: 8),
                  Text(
                    'PinPointMe',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Divider(color: Colors.grey[300], thickness: 1),
            SizedBox(height: 10),
            Text(
              'Alerts and Notifications',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20), // Reduced height
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          ElevatedButton(
                            onPressed: () {},
                            child: Text('Message'),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue,
                              foregroundColor: Colors.white,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                            ),
                          ),
                          SizedBox(width: 10),
                          ElevatedButton(
                            onPressed: () {},
                            child: Text('Rescue'),
                            style: ElevatedButton.styleFrom(
                              foregroundColor: Colors.white,
                              backgroundColor: Colors.yellow[700],
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Spacer(),
            BottomNavigationBar(
              items: _buildBottomNavBarItems(),
              currentIndex: _selectedBtmNav,
              selectedItemColor: Colors.black,
              unselectedItemColor: Colors.grey,
              showSelectedLabels: true,
              showUnselectedLabels: true,
              backgroundColor: const Color.fromARGB(255, 230, 228, 239),
              onTap: (btmIndex) {
                setState(() {
                  _selectedBtmNav = btmIndex;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}