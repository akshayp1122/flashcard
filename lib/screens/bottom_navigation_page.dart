import 'package:flutter/material.dart';

class CurvedBottomNavigationBarPage extends StatefulWidget {
  @override
  _CurvedBottomNavigationBarPageState createState() =>
      _CurvedBottomNavigationBarPageState();
}

class _CurvedBottomNavigationBarPageState
    extends State<CurvedBottomNavigationBarPage> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    Center(child: Text('Home Page', style: TextStyle(fontSize: 24))),
    Center(child: Text('Profile Page', style: TextStyle(fontSize: 24))),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Curved Bottom Navigation"),
      ),
      body: _pages[_currentIndex],
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print("Floating Action Button Pressed!");
        },
        backgroundColor: Colors.blue,
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 8.0,
        child: SizedBox(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Home Button
              MaterialButton(
                minWidth: 40,
                onPressed: () {
                  setState(() {
                    _currentIndex = 0;
                  });
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.home,
                      color: _currentIndex == 0 ? Colors.blue : Colors.grey,
                    ),
                    Text(
                      "Home",
                      style: TextStyle(
                        color: _currentIndex == 0 ? Colors.blue : Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
              // Spacer for FAB
              const SizedBox(width: 40),
              // Profile Button
              MaterialButton(
                minWidth: 40,
                onPressed: () {
                  setState(() {
                    _currentIndex = 1;
                  });
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.person,
                      color: _currentIndex == 1 ? Colors.blue : Colors.grey,
                    ),
                    Text(
                      "Profile",
                      style: TextStyle(
                        color: _currentIndex == 1 ? Colors.blue : Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
