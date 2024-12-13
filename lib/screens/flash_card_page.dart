import 'package:flutter/material.dart';

class FlashCardSearchScreen extends StatelessWidget {
  const FlashCardSearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(Icons.arrow_back, color: Colors.black)),
        title: const Text(
          'Flash Card',
          style: TextStyle(color: Colors.black, fontSize: 22),
        ),
        actions: const [
          Icon(Icons.add, color: Colors.black),
          SizedBox(width: 16),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Search Bar
            TextField(
              decoration: InputDecoration(
                hintText: 'Search',
                prefixIcon: const Icon(Icons.search),
                filled: true,
                fillColor: Color(0xFFF5F5F5),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(height: 20),
            // Flash Card Categories List
            Expanded(
              child: ListView(
                children: const [
                  FlashCardCategory(
                    title: 'Everyday Phrases',
                    subtitle:
                        'Master Common Expressions Used In Daily Conversations.',
                  ),
                  FlashCardCategory(
                    title: 'Travel Vocabulary',
                    subtitle: 'Essential Words And Phrases For Your Next Trip.',
                  ),
                  FlashCardCategory(
                    title: 'Business English',
                    subtitle:
                        'Key Terms And Dialogues For Professional Settings.',
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

// Custom Widget for Flash Card Category
class FlashCardCategory extends StatelessWidget {
  final String title;
  final String subtitle;

  const FlashCardCategory({
    super.key,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color:   Color(0xFFF90CD),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Icon(Icons.more_vert, color: Colors.black),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            subtitle,
            style: const TextStyle(color: Colors.black54),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.add),
                label: const Text('Add Card'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFFA40DEE),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              OutlinedButton(
                onPressed: () {},
                child: const Text('Practice'),
                style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.black,
                  side: const BorderSide(color: Colors.purple),
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
