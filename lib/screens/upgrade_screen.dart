import 'package:flutter/material.dart';

class UpgradePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height / 3,
            color: Color(0xFF9C1EC2), // Purple color
            child: Center(
              child: Padding(
                padding: const EdgeInsets.only(left: 25.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Upgrade',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Unlock Premium Features And Take\nYour English Skills To The Next Level.',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                          onPressed: () {},
                          child: Text('Basic'),
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          child: Text('Gold'),
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          child: Text('Platinum'),
                        ),
                      ],
                    ),
                    SizedBox(height: 30),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 300,
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'BASIC',
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              Text('₹ 4500'),
                            ],
                          ),
                          
                          SizedBox(height: 20),
                          _buildFeatureItem(
                            'Self-Paced Learning - I Am Self-Motivated\nAnd Disciplined To Learn By Myself\nThrough Recorded Lessons.',
                          ),
                          _buildFeatureItem(
                            'Recorded Lessons By Aparna (6-Month Validity)',
                          ),
                          _buildFeatureItem(
                            'AI-Powered Speech/Pronunciation\nPractice Is Available For 2 Weeks\nWith An Option To Extend With An\nAdditional Add-On Subscription.',
                          ),
                          _buildFeatureItem(
                            'Anyone Can Add On More Time With AI\nFeatures. Rs. 300/ Month.',
                          ),
                          _buildFeatureItem(
                            'The Difference Is Basic Only Has 2 Weeks\nFree Vs. Gold',
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                         Column(
                           children: [
                            Text('4500'),
                            
                             Text('For 3 Months Plan'),
                           ],
                         ),
                        ElevatedButton(
                          style:ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFF9C1EC2),
                          foregroundColor: Colors.white,
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
                          onPressed: () {},
                          child: Text('Buy Now'),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                   
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFeatureItem(String text) {
    return Row(
      children: [
        Icon(Icons.check_circle, color: Colors.green),
        SizedBox(width: 10),
        Flexible(
          child: Text(text),
        ),
      ],
    );
  }
}
