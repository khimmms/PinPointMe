import 'package:flutter/material.dart';
import 'package:frontend/pages/rescuer/rescuer_dashboard/rescuer_messages.dart';

class RescuerInbox extends StatefulWidget {
  @override
  _IRescuerInboxState createState() => _IRescuerInboxState();
}

class _IRescuerInboxState extends State<RescuerInbox> {
  // Sample data representing rescuer names
  final List<String> rescuerNames = [
    'John Doe',
    'Alice Smith',
    'Bob Johnson',
    'Charlie Brown',
    'David Lee',
    'Emma White',
  ];

  // List to keep track of selected items
  List<bool> _selectedItems = [];

  // State variable to control the visibility of the "Select All" and "Delete" icons
  bool _isSelectionMode = false;

  void _selectAll() {
    bool areAllSelected = _selectedItems.every((selected) => selected);

    setState(() {
      if (areAllSelected) {
        // Deselect all if all are currently selected
        _selectedItems = List<bool>.filled(rescuerNames.length, false);
        _isSelectionMode = false; // Exit selection mode
      } else {
        // Select all
        _selectedItems = List<bool>.filled(rescuerNames.length, true);
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _selectedItems = List<bool>.filled(rescuerNames.length, false);
  }

  void _deleteSelected() {
    setState(() {
      for (int i = _selectedItems.length - 1; i >= 0; i--) {
        if (_selectedItems[i]) {
          rescuerNames.removeAt(i);
        }
      }
      _selectedItems = List<bool>.filled(rescuerNames.length, false);
      _isSelectionMode = false; // Exit selection mode after deleting
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 25, 117, 192),
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white, size: 30),
          onPressed: () {
            Navigator.pop(context); // Go back to the previous screen 
          },
        ),
        title: Text(
          'Inbox',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
        ),
        actions: _isSelectionMode
            ? [
                // "Select All" icon
                IconButton(
                  icon: Icon(Icons.select_all, color: Colors.white),
                  onPressed: _selectAll,
                ),
                // "Delete" icon
                IconButton(
                  icon: Icon(Icons.delete, color: Colors.white),
                  onPressed: _deleteSelected,
                ),
              ]
            : null, // No actions when not in selection mode
      ),
      body: Stack(
        children: [
          // Background image
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('lib/assets/background.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          
          // Main content (List of rescuer names)
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ListView.builder(
              itemCount: rescuerNames.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onLongPress: () {
                    // Enter selection mode on long press
                    setState(() {
                      _isSelectionMode = true;
                      _selectedItems[index] = true;
                    });
                  },
                  onTap: () {
                    if (_isSelectionMode) {
                      // Toggle item selection in selection mode
                      setState(() {
                        _selectedItems[index] = !_selectedItems[index];
                        if (!_selectedItems[index]) {
                          // If deselected, do nothing (no redirect)
                        }
                        if (_selectedItems.every((element) => element == false)) {
                          _isSelectionMode = false;
                        }

                      });
                    } else {
                      // Redirect to UserHistoryPopup on normal tap
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => RescuerMessage()),
                      );
                    }
                  },
                  child: Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    margin: EdgeInsets.symmetric(vertical: 8),
                    color: _selectedItems[index] ? Colors.grey[300] : Colors.white, // Highlight selected items
                    child: ListTile(
                      leading: Icon(Icons.mark_email_unread_rounded,
                          color: const Color.fromARGB(255, 227, 37, 37), size: 30),
                      title: Text(
                        rescuerNames[index],
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                      ),
                      subtitle: Text(
                        'Scanned on: ${DateTime.now().toLocal()}',
                        style: TextStyle(color: Colors.grey[600]),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}