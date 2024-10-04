import 'package:flutter/material.dart';

class Day2day extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _buildSearchBar(),
        actions: [
          CircleAvatar(
            backgroundColor: Colors.green,
            child: Icon(Icons.chat_bubble, color: Colors.white),
          ),
          SizedBox(width: 10),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildCategorySection(),
            _buildTopRatedFavorites(),
            _buildTopPicks(),
            _buildPopularDishes(), // New Section
            _buildRecommendedForYou(), // New Section
          ],
        ),
      ),
    );
  }

  Widget _buildSearchBar() {
    return Container(
      height: 40,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Search "biryani"',
          prefixIcon: Icon(Icons.search),
          border: InputBorder.none,
        ),
      ),
    );
  }

  Widget _buildCategorySection() {
    final categories = [
      {'icon': 'assets/foodimages/free_food.jpg', 'label': 'Free items'},
      {'icon': 'assets/foodimages/starters.png', 'label': 'Starters'},
      {
        'icon': 'assets/foodimages/bevrages.jpeg',
        'label': 'Juices & Beverages'
      },
      {'icon': 'assets/foodimages/soup.jpg', 'label': 'Soups/Salads'},
    ];

    return Container(
      height: 100,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return Container(
            width: 80,
            child: Column(
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage(categories[index]['icon']!),
                  radius: 30,
                ),
                SizedBox(height: 5),
                Text(
                  categories[index]['label']!,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 12),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildTopRatedFavorites() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            'Top-Rated Favorites',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        Container(
          height: 200,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              _buildFoodItem(
                'Watermelon Juice',
                4.3,
                'Undu Magizh kitchen',
                1.8,
                'assets/foodimages/Watermelon_mint_juice-500x375.jpg',
              ),
              _buildFoodItem(
                'Rose milk',
                4.1,
                'Undu Magizh kitchen',
                1.8,
                'assets/foodimages/rose milk.jpg',
              ),
              _buildFoodItem(
                'Raveera',
                4.0,
                'Undu Magizh kitchen',
                1.8,
                'assets/foodimages/raveera.jpeg',
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildTopPicks() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            'Top Picks for You',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        Container(
          height: 200,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              _buildFoodItem(
                'Chappathi with ku...',
                4.0,
                '',
                1.8,
                'assets/foodimages/roti.jpg',
              ),
              _buildFoodItem(
                'Phulka',
                4.6,
                '',
                1.2,
                'assets/foodimages/phulka.jpg',
              ),
              _buildFoodItem(
                'Arisi Paruppu Sa...',
                4.1,
                '',
                1.8,
                'assets/foodimages/arsi_papru.jpg',
              ),
            ],
          ),
        ),
      ],
    );
  }

  // New Section: Popular Dishes
  Widget _buildPopularDishes() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            'Popular Dishes',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        Container(
          height: 200,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              _buildFoodItem(
                'Paneer Butter Masala',
                4.5,
                'Spicy Kitchen',
                2.0,
                'assets/foodimages/panner butter masala.jpeg',
              ),
              _buildFoodItem(
                'Chicken Biryani',
                4.8,
                'Royal Biryani',
                3.5,
                'assets/foodimages/ckbiryani.jpeg',
              ),
              _buildFoodItem(
                'Vegetable Fried Rice',
                4.2,
                'Rice House',
                2.8,
                'assets/foodimages/vegrice.jpeg',
              ),
            ],
          ),
        ),
      ],
    );
  }

  // New Section: Recommended for You
  Widget _buildRecommendedForYou() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            'Recommended for You',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        GridView.count(
          crossAxisCount: 2,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          padding: const EdgeInsets.all(16),
          children: [
            _buildRecommendedItem('Dumplings', 4.4, 'Dumpling World',
                'assets/foodimages/dumplings.jpeg'),
            _buildRecommendedItem('Pasta Alfredo', 4.7, 'Italian Bistro',
                'assets/foodimages/pasta.jpeg'),
            _buildRecommendedItem('Caesar Salad', 4.3, 'Healthy Eats',
                'assets/foodimages/salad.jpeg'),
            _buildRecommendedItem('Chocolate Cake', 4.9, 'Dessert Haven',
                'assets/foodimages/choc cake.jpeg'),
          ],
        ),
      ],
    );
  }

  // Helper for Recommended Items
  Widget _buildRecommendedItem(
      String name, double rating, String kitchen, String imagePath) {
    return Card(
      margin: EdgeInsets.all(8),
      child: Column(
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(8)),
              child: Image.asset(imagePath, fit: BoxFit.cover),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name, style: TextStyle(fontWeight: FontWeight.bold)),
                Row(
                  children: [
                    Icon(Icons.star, color: Colors.yellow, size: 16),
                    Text('$rating',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  ],
                ),
                Text(kitchen),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFoodItem(String name, double rating, String kitchen,
      double distance, String imagePath) {
    return Container(
      width: 150,
      margin: EdgeInsets.only(left: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 100,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(8),
            ),
            child: Center(
              child: Image.asset(imagePath),
            ),
          ),
          SizedBox(height: 8),
          Row(
            children: [
              Icon(Icons.star, color: Colors.yellow, size: 16),
              Text('$rating', style: TextStyle(fontWeight: FontWeight.bold)),
            ],
          ),
          Text(name, style: TextStyle(fontWeight: FontWeight.bold)),
          Text(kitchen),
          Row(
            children: [
              Icon(Icons.location_on, size: 16, color: Colors.green),
              Text('$distance km'),
            ],
          ),
        ],
      ),
    );
  }
}
