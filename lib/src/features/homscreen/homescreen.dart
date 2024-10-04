import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildSearchBar(),
            _buildAyudhaPoojaOfferCard(),
            _buildQuickActionButtons(),
            _buildLunchNowButton(),
            _buildNavratriOfferCard(),
            _buildCategoryToggle(),
            _buildSpecialCategories(),
            _buildPopularRestaurants(),
          ],
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      title: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Mohali',
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
          Text('Airport Road, Mohali',
              style: TextStyle(fontSize: 12, color: Colors.grey)),
        ],
      ),
      leading: const Icon(Icons.location_on, color: Colors.green),
      actions: [
        IconButton(
            icon: const Icon(Icons.search, color: Colors.black),
            onPressed: () {}),
      ],
    );
  }

  Widget _buildSearchBar() {
    return Container(
      padding: const EdgeInsets.all(16),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Search "briyani"',
          prefixIcon: const Icon(Icons.search),
          suffixIcon: const Icon(Icons.mic),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
          filled: true,
          fillColor: Colors.grey[200],
        ),
      ),
    );
  }

  Widget _buildAyudhaPoojaOfferCard() {
    return Card(
      margin: const EdgeInsets.all(16),
      child: Stack(
        children: [
          // Background Image
          Positioned.fill(
            child: Opacity(
              opacity: 0.92, // Adjust the opacity of the background image
              child: Image.asset(
                'assets/foodimages/sweets1.jpeg', // Replace with your actual image path
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Content over the background
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Tradition meets taste',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors
                          .black), // Ensures text is visible over the image
                ),
                const Text(
                  'Ayudha pooja delights',
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors
                          .black), // Ensures text is visible over the image
                ),
                const SizedBox(height: 8),
                const Text(
                  'Get upto 15% off*',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                const SizedBox(height: 8),
                ElevatedButton(
                  onPressed: () {},
                  style:
                      ElevatedButton.styleFrom(backgroundColor: Colors.white),
                  child: const Text('ORDER AHEAD'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildQuickActionButtons() {
    return SizedBox(
      height: 100,
      child: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        scrollDirection: Axis.horizontal,
        children: [
          _buildQuickActionButton('Subscription', Icons.calendar_today),
          _buildQuickActionButton('Party Orders', Icons.cake),
          _buildQuickActionButton('Home Products', Icons.home),
          _buildQuickActionButton('Pre-Booking', Icons.bookmark),
        ],
      ),
    );
  }

  Widget _buildQuickActionButton(String label, IconData icon) {
    return SizedBox(
      width: 80,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.grey[200],
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: Colors.green),
          ),
          const SizedBox(height: 4),
          Text(label,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 12)),
        ],
      ),
    );
  }

  Widget _buildLunchNowButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        children: [
          Expanded(
            child: ElevatedButton.icon(
              icon: const Icon(Icons.flash_on, color: Colors.white),
              label: const Text('Lunch now',
                  style: TextStyle(color: Colors.white)),
              onPressed: () {},
              style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: OutlinedButton.icon(
              icon: const Icon(Icons.access_time, color: Colors.green),
              label: const Text('For later',
                  style: TextStyle(color: Colors.green)),
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNavratriOfferCard() {
    return Card(
      margin: const EdgeInsets.all(16),
      child: Stack(
        children: [
          // Background Image
          Positioned.fill(
            child: Opacity(
              opacity: 0.82, // Adjust the opacity of the background image
              child: Image.asset(
                'assets/foodimages/navratri.jpeg', // Replace with your actual image path
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Content over the background
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Navratri Festive Specials!',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors
                          .black), // Ensures text is visible over the image
                ),
                const SizedBox(height: 8),
                const Text(
                  '10% off* on prebooking',
                  style: TextStyle(fontSize: 16, color: Colors.purple),
                ),
                const SizedBox(height: 8),
                ElevatedButton(
                  onPressed: () {},
                  style:
                      ElevatedButton.styleFrom(backgroundColor: Colors.purple),
                  child: const Text(
                    'Pre-Book Now',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryToggle() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          const Icon(Icons.star, color: Colors.green),
          const Text('Top Rated'),
          const Spacer(),
          const Text('Pure Veg'),
          Switch(value: false, onChanged: (bool value) {}),
        ],
      ),
    );
  }

  Widget _buildSpecialCategories() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.all(16),
          child: Text('Special Categories to Cherish',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        ),
        SizedBox(
          height: 120,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              _buildSpecialCategoryItem(
                  'Desserts', 'assets/foodimages/dessert.jpeg'),
              _buildSpecialCategoryItem(
                  'Breakfast', 'assets/foodimages/dinnner.jpg'),
              _buildSpecialCategoryItem('Lunch', 'assets/foodimages/lunch.jpg'),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildSpecialCategoryItem(String title, String imagePath) {
    return Container(
      width: 100,
      margin: const EdgeInsets.only(left: 16),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(imagePath,
                height: 80, width: 100, fit: BoxFit.cover),
          ),
          const SizedBox(height: 4),
          Text(title, style: const TextStyle(fontSize: 12)),
        ],
      ),
    );
  }

  Widget _buildPopularRestaurants() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.all(16),
          child: Text('Popular Restaurants',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        ),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 3,
          itemBuilder: (context, index) {
            return _buildRestaurantItem('Restaurant ${index + 1}',
                '4.${5 - index}', '${20 + index * 5} mins');
          },
        ),
      ],
    );
  }

  Widget _buildRestaurantItem(String name, String rating, String deliveryTime) {
    return ListTile(
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Image.asset('assets/foodimages/ladoo_poster.jpg',
            width: 60, height: 60, fit: BoxFit.cover),
      ),
      title: Text(name),
      subtitle: const Text('South Indian • North Indian • Chinese'),
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.star, color: Colors.yellow, size: 16),
              Text(rating),
            ],
          ),
          Text(deliveryTime),
        ],
      ),
    );
  }
}
