import 'package:flutter/material.dart';
import 'package:trogon/screens/chat_screen.dart';
import 'package:trogon/screens/flash_card_page.dart';
import 'package:trogon/screens/homescreen2.dart';
import 'package:trogon/screens/upgrade_screen.dart';

class AllPagesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: ClipRRect(
          borderRadius: const BorderRadius.vertical(
            bottom: Radius.circular(90.0),
          ),
          child: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFFA40DEE), Color(0xFF9C1EC2)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: const Align(
              alignment: Alignment.center,
              child: Padding(
                padding: EdgeInsets.only(bottom: 16.0),
                child: Text(
                  'All Pages',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: Colors.black,
                shape: RoundedRectangleBorder(
                  side: const BorderSide(
                    color: Color(0xFF9C1EC2),
                    width: 1.0, // Set border width here
                  ),
                  borderRadius: BorderRadius.circular(
                      8.0), // Adjust the radius for corner roundness
                ),
                padding: const EdgeInsets.symmetric(
                    horizontal: 20, vertical: 10), // Add padding if needed
                elevation: 2, // Add a subtle shadow
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => FlashCardScreen()),
                );
              },
              child: Text("Flash card page"),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: Colors.black,
                shape: RoundedRectangleBorder(
                  side: const BorderSide(
                    color: Color(0xFF9C1EC2),
                    width: 1.0, // Set border width here
                  ),
                  borderRadius: BorderRadius.circular(
                      8.0), // Adjust the radius for corner roundness
                ),
                padding: const EdgeInsets.symmetric(
                    horizontal: 20, vertical: 10), // Add padding if needed
                elevation: 2, // Add a subtle shadow
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ChatScreen()),
                );
              },
              child: Text("chat page"),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: Colors.black,
                shape: RoundedRectangleBorder(
                  side: const BorderSide(
                    color: Color(0xFF9C1EC2),
                    width: 1.0, // Set border width here
                  ),
                  borderRadius: BorderRadius.circular(
                      8.0), // Adjust the radius for corner roundness
                ),
                padding: const EdgeInsets.symmetric(
                    horizontal: 20, vertical: 10), // Add padding if needed
                elevation: 2, // Add a subtle shadow
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => FlashCardSearchScreen()),
                );
              },
              child: Text("Search flash card"),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: Colors.black,
                shape: RoundedRectangleBorder(
                  side: const BorderSide(
                    color: Color(0xFF9C1EC2),
                    width: 1.0, // Set border width here
                  ),
                  borderRadius: BorderRadius.circular(
                      8.0), // Adjust the radius for corner roundness
                ),
                padding: const EdgeInsets.symmetric(
                    horizontal: 20, vertical: 10), // Add padding if needed
                elevation: 2, // Add a subtle shadow
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => UpgradePage()),
                );
              },
              child: Text("Upgrade page"),
            ),
          ],
        ),
      ),
    );
  }
}
