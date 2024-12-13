import 'package:flutter/material.dart';
import 'package:flip_card/flip_card.dart';
import 'package:trogon/screens/chat_screen.dart';
// import 'package:trogon/screens/home_screen.dart';

class FlashCardScreen extends StatefulWidget {
  const FlashCardScreen({super.key});

  @override
  _FlashCardScreenState createState() => _FlashCardScreenState();
}

class _FlashCardScreenState extends State<FlashCardScreen> {
  final PageController _pageController = PageController(viewportFraction: 0.8);
  int _currentIndex = 0;

  final List<Map<String, String>> flashCards = [
    {'front': 'Obvio', 'back': 'It means obvious.'},
    {'front': 'Hola', 'back': 'It means hello.'},
    {'front': 'Gracias', 'back': 'It means thank you.'},
    {'front': 'Adiós', 'back': 'It means goodbye.'},
  ];

  void _nextPage() {
    if (_currentIndex < flashCards.length - 1) {
      _pageController.nextPage(
          duration: const Duration(milliseconds: 300), curve: Curves.easeIn);
      setState(() => _currentIndex++);
    }
  }

  void _previousPage() {
    if (_currentIndex > 0) {
      _pageController.previousPage(
          duration: const Duration(milliseconds: 300), curve: Curves.easeIn);
      setState(() => _currentIndex--);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(120.0),
        child: AppBar(
          leading: Material(
            // Wrap with Material for inkwell effect
            color: Colors.transparent,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                // borderRadius: BorderRadius.circular(20), // Rounded corners
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    border: Border.all(
                      color: Colors.white,
                      width: 2.0,
                    ),
                  ),
                  padding: const EdgeInsets.all(8.0),
                  child: const Icon(
                    Icons.arrow_back_ios,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          actions: [
            Material(
              // Wrap with Material for inkwell effect
              color: Colors.transparent,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  // borderRadius: BorderRadius.circular(20), // Rounded corners
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => ChatScreen()));
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      border: Border.all(
                        color: Colors.white,
                        width: 2.0,
                      ),
                    ),
                    padding: const EdgeInsets.all(8.0),
                    child: const Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
          automaticallyImplyLeading: false,
          flexibleSpace: ClipRRect(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(90.0),
            ),
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFFA40DEE), Color(0xFF9C1EC2)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 16.0),
                  child: Text(
                    'Flash Card',
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
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // Header with progress
            Padding(
              padding: const EdgeInsets.only(left: 40.0, right: 40, top: 50),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Everyday Phrases',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      SizedBox(
                        width: 40,
                        height: 40,
                        child: CircularProgressIndicator(
                          value: (_currentIndex + 1) /
                              flashCards.length, // Progress value
                          strokeWidth: 4,
                          color: Color(0xFF9C1EC2), // Customize the color
                          backgroundColor:
                              Colors.grey[300], // Background track color
                        ),
                      ),
                      Text(
                        '${_currentIndex + 1}/${flashCards.length}',
                        style: const TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            // Center flippable card with PageView
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                itemCount: flashCards.length,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return Center(
                    child: FlipCard(
                      front: _buildCard(flashCards[index]['front']!),
                      back: _buildCard(flashCards[index]['back']!),
                    ),
                  );
                },
              ),
            ),
            // Navigation buttons
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                          horizontal: 20,
                          vertical: 10), // Add padding if needed
                      elevation: 2, // Add a subtle shadow
                    ),
                    onPressed: _previousPage,
                    child: const Text('Previous'),
                  ),
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
                          horizontal: 20,
                          vertical: 10), // Add padding if needed
                      elevation: 2, // Add a subtle shadow
                    ),
                    onPressed: _nextPage,
                    child: const Text('Next'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCard(String text) {
    return Container(
      width: 270,
      height: 270,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: const LinearGradient(
          colors: [Colors.purpleAccent, Colors.purple],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 20,
            ),
            Text(
              text,
              style: const TextStyle(
                fontSize: 35,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.volume_up_outlined,
                  color: Colors.white,
                  size: 20.0,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  text,
                  style: TextStyle(color: Colors.white, fontSize: 20),
                )
              ],
            ),
            Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
              decoration: BoxDecoration(
                color: Colors.white, // Background color
                borderRadius: BorderRadius.circular(15.0), // Rounded corners
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1), // Shadow color
                    blurRadius: 5.0,
                    offset: Offset(0, 3), // Shadow position
                  ),
                ],
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.black,
                    size: 20.0,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
