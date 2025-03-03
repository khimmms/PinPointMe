import 'package:flutter/material.dart';
import 'package:frontend/pages/rescuer_dashboard/in_progress.dart';
import 'package:frontend/pages/rescuer_dashboard/rescued.dart';
import 'package:frontend/pages/rescuer_dashboard/pending_popup.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rescuer Dashboard Pending',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: PendingDashboard(),
    );
  }
}

class PendingDashboard extends StatefulWidget {
  @override
  State<PendingDashboard> createState() => _PendingDashboardState();
}

class _PendingDashboardState extends State<PendingDashboard> {
  int _selectedBtmNav = 0;
  int _selectedIndex = 0;

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
          image: DecorationImage(
            image: AssetImage('lib/assets/background.png'),
            fit: BoxFit.fill,
          ),
        ),
        child: Column(
          children: [
            SizedBox(height: 10),
            Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.only(left: 16.0),
              height: 100,
              child: Container(
                width: 200,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('lib/assets/header.png'),
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ),
            ),
            Divider(color: Colors.grey[300], thickness: 1),
            SizedBox(height: 10),
            Center(
              child: Text(
                'Alerts and Notifications',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                  fontSize: 16.0,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      setState(() => _selectedIndex = 0);
                      Navigator.push(context, MaterialPageRoute(builder: (context) => PendingDashboard()));
                    },
                    child: Text('Pending'),
                    style: ElevatedButton.styleFrom(
                      foregroundColor: _selectedIndex == 0 ? Colors.white : Colors.black,
                      backgroundColor: _selectedIndex == 0 ? Colors.cyan : Colors.grey[400],
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() => _selectedIndex = 1);
                      Navigator.push(context, MaterialPageRoute(builder: (context) => InProgressDashboard()));
                    },
                    child: Text('In progress'),
                    style: ElevatedButton.styleFrom(
                      foregroundColor: _selectedIndex == 1 ? Colors.white : Colors.black,
                      backgroundColor: _selectedIndex == 1 ? Colors.cyan : Colors.grey[400],
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() => _selectedIndex = 2);
                      Navigator.push(context, MaterialPageRoute(builder: (context) => RescuedDashboard()));
                    },
                    child: Text('Rescued'),
                    style: ElevatedButton.styleFrom(
                      foregroundColor: _selectedIndex == 2 ? Colors.white : Colors.black,
                      backgroundColor: _selectedIndex == 2 ? Colors.cyan : Colors.grey[400],
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 6.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.red[400],
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: ListTile(
                        title: InkWell(
                          onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => PendingPopup())),
                          child: Text(
                            'User Name',
                            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18.0),
                          ),
                        ),
                        subtitle: Text('Scanned at GD1, 5th floor, RM 502 on ...', style: TextStyle(color: Colors.white)),
                        trailing: Icon(Icons.error_outline, color: Colors.white, size: 45.0),
                      ),
                    ),
                  );
                },
              ),
            ),
            BottomNavigationBar(
              items: _buildBottomNavBarItems(),
              currentIndex: _selectedBtmNav,
              selectedItemColor: Colors.black,
              unselectedItemColor: Colors.grey,
              showSelectedLabels: true,
              showUnselectedLabels: true,
              backgroundColor: const Color.fromARGB(255, 230, 228, 239),
              onTap: (btmIndex) {
                setState(() => _selectedBtmNav = btmIndex);
              },
            ),
          ],
        ),
      ),
    );
  }
}