import 'package:flutter/material.dart';
import 'package:frontend/pages/rescuer/rescuer_dashboard/in_progress/in_progress.dart';
import 'package:frontend/pages/rescuer/rescuer_dashboard/pending/pending.dart';
import 'package:frontend/pages/rescuer/rescuer_dashboard/rescued/rescued_popup.dart';
import 'package:frontend/pages/rescuer/rescuer_dashboard/rescuer_inbox.dart';
import 'package:frontend/pages/rescuer/rescuer_dashboard/rescuer_profile.dart';

class RescuedDashboard extends StatefulWidget {
  @override
  State<RescuedDashboard> createState() => _RescuedDashboardState();
}

class _RescuedDashboardState extends State<RescuedDashboard> {
  int _selectedBottomNavIndex = 0; 
  int _selectedIndex = 0; 

  @override
  void initState() {
    super.initState();
    // Listen for when the screen is resumed (back navigation)
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // Reset the bottom nav index if coming back to this screen
      setState(() {
        _selectedBottomNavIndex = 0; // Home icon should be selected
      });
    });
  }

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

  Widget _buildNavItemIcon(int btmIndex, IconData iconData) {
    if (_selectedBottomNavIndex == btmIndex) {
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
          children: _buildContent(context), 
        ),
      ),
    );
  }

  
  List<Widget> _buildContent(BuildContext context) {
    return [
      SizedBox(height: 10), 
      Container(
        alignment: Alignment.centerLeft, 
        padding: EdgeInsets.only(left: 16.0), 
        height: 90, 
        child: Container(
          width: 190, 
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('lib/assets/ppm_w_word.png'), 
              fit: BoxFit.fitWidth, 
            ),
          ),
        ),
      ),
      Divider(color: Colors.grey[300], thickness: 1), 
      SizedBox(height: 10), 
      Center(
        // Center the text
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
                setState(() => _selectedIndex = 1);
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => PendingDashboard())); 
              },
              child: Text('Pending'), 
              style: ElevatedButton.styleFrom(
                foregroundColor: _selectedIndex == 1 ? Colors.white : Colors.black, 
                backgroundColor: _selectedIndex == 1 ? Colors.cyan : Colors.grey[400], 
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)), 
              ),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() => _selectedIndex = 2); 
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => InProgressDashboard())); 
              },
              child: Text('In progress'), 
              style: ElevatedButton.styleFrom(
                foregroundColor: _selectedIndex == 2 ? Colors.white : Colors.black, 
                backgroundColor: _selectedIndex == 2 ? Colors.cyan : Colors.grey[400], 
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)), 
              ), 
            ),
            ElevatedButton(
              onPressed: () {
                setState(() => _selectedIndex = 0);
              },
              child: Text('Rescued'), 
              style: ElevatedButton.styleFrom(
                foregroundColor: _selectedIndex == 0 ? Colors.white : Colors.black, 
                backgroundColor: _selectedIndex == 0 ? Colors.cyan : Colors.grey[400], 
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
                  color: Color.fromARGB(255, 10, 140, 55),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: ListTile(
                  title: InkWell(
                    onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => RescuedPopup())),
                    child: Text(
                      'User Name',
                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18.0),
                    ),
                  ),
                  subtitle: Text('Scanned at GD1, 5th floor, RM 502 on ...', style: TextStyle(color: Colors.white)),
                  trailing: Icon(Icons.check_circle_outline_rounded, color: Colors.white, size: 45.0),
                ),
              ),
            );
          },
        ),
      ),
      BottomNavigationBar(
        items: _buildBottomNavBarItems(), 
        currentIndex: _selectedBottomNavIndex, 
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey, 
        showSelectedLabels: true, 
        showUnselectedLabels: true, 
        backgroundColor: const Color.fromARGB(255, 230, 228, 239), 
        onTap: (btmIndex) {
          // Handle tap on BottomNavigationBar
          setState(() => _selectedBottomNavIndex = btmIndex); // Update the selected index

          // navigation logic based on btmIndex
          switch (btmIndex) {
            case 0: // Home
              Navigator.push(context, MaterialPageRoute(builder: (context) => PendingDashboard())); 
              break;
            case 1: // Inbox
              Navigator.push(context, MaterialPageRoute(builder: (context) => RescuerInbox())).then((_) {
                // Reset the bottom nav index if coming back to this screen
                setState(() {
                  _selectedBottomNavIndex = 0; // Home icon should be selected
                });
              });
              break;
            case 2: // Profile
              Navigator.push(context, MaterialPageRoute(builder: (context) => RescuerProfile())).then((_) {
                // Reset the bottom nav index if coming back to this screen
                setState(() {
                  _selectedBottomNavIndex = 0; // Home icon should be selected
                });
              });
              break;
          } //switch
        }, //onTap
      ),
    ]; //List<Widget>
  } //_buildContent
}