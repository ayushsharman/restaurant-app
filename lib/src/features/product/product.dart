import 'package:flutter/material.dart';

class Products_screen extends StatefulWidget {
  @override
  _ProductsScreenState createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<Products_screen> {
  String selectedLocation = 'Home';
  int _currentBannerIndex = 0;

  final List<Map<String, dynamic>> banners = [
    {
      'title': 'Tradition meets taste',
      'subtitle': 'Ayudha pooja delights',
      'discount': '15% off*',
      'image': 'assets/foodimages/navratri.jpeg',
    },
    {
      'title': 'Diwali Special Offers',
      'subtitle': 'Festive sweets and snacks',
      'discount': '20% off*',
      'image': 'assets/foodimages/diwalioffer.jpeg',
    },
    {
      'title': 'Healthy Home Essentials',
      'subtitle': 'Organic and natural products',
      'discount': '10% off*',
      'image': 'assets/foodimages/organicfood.jpeg',
    },
  ];

  final List<Map<String, dynamic>> categories = [
    {
      'name': 'Ayudha Pooja delights',
      'image': 'assets/foodimages/navratri.jpeg'
    },
    {'name': 'Diwali specials', 'image': 'assets/foodimages/diwalioffer.jpeg'},
    {'name': 'Cakes', 'image': 'assets/foodimages/choc cake.jpeg'},
    {'name': 'Special offers', 'image': 'assets/foodimages/food-coupons.jpg'},
    {'name': 'Sun dried items', 'image': 'assets/foodimages/sun_dried.jpeg'},
    {'name': 'Ready made', 'image': 'assets/foodimages/readymadefood.png'},
    {
      'name': 'Flour and Health mix',
      'image': 'assets/foodimages/Health-mix.jpg'
    },
    {'name': 'Pickles', 'image': 'assets/foodimages/pickle.jpg'},
  ];

  final List<Map<String, dynamic>> featuredProducts = [
    {
      'name': 'Organic Honey',
      'image': 'assets/foodimages/honey.jpeg',
      'price': '₹299',
    },
    {
      'name': 'Homemade Pickles',
      'image': 'assets/foodimages/pickle.jpg',
      'price': '₹199',
    },
    {
      'name': 'Fresh Fruits',
      'image': 'assets/foodimages/fruit.jpeg',
      'price': '₹499',
    },
    {
      'name': 'Traditional Sweets',
      'image': 'assets/foodimages/sweets.jpg',
      'price': '₹399',
    },
  ];

  final List<Map<String, dynamic>> specialOffers = [
    {
      'name': 'Festive Combo',
      'image': 'assets/foodimages/combopack.jpeg',
      'originalPrice': '₹999',
      'discountedPrice': '₹799',
    },
    {
      'name': 'Snack Box',
      'image': 'assets/foodimages/snack.jpg',
      'originalPrice': '₹499',
      'discountedPrice': '₹399',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            _buildHeader(),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildSearchBar(),
                    _buildBannerCarousel(),
                    _buildHomeShelf(),
                    _buildDivider(),
                    _buildAyudhaPoojaDelights(),
                    _buildDivider(),
                    _buildFeaturedProducts(),
                    _buildDivider(),
                    _buildSpecialOffers(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
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
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: Colors.grey[300]!),
      ),
      child: const Row(
        children: [
          Icon(Icons.search, color: Colors.grey),
          SizedBox(width: 8),
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search "Pickle, Masala powder"',
                border: InputBorder.none,
              ),
            ),
          ),
          CircleAvatar(
            backgroundColor: Colors.green,
            child: Icon(Icons.chat, color: Colors.white, size: 20),
          ),
        ],
      ),
    );
  }

  Widget _buildBannerCarousel() {
    return Container(
      height: 200,
      child: PageView.builder(
        itemCount: banners.length,
        onPageChanged: (index) {
          setState(() {
            _currentBannerIndex = index;
          });
        },
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              color: Colors.purple[800],
              borderRadius: BorderRadius.circular(16),
              image: DecorationImage(
                image: AssetImage(banners[index]['image']),
                fit: BoxFit.cover,
              ),
            ),
            child: Stack(
              children: [
                Positioned(
                  left: 16,
                  bottom: 16,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        banners[index]['title'],
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        banners[index]['subtitle'],
                        style:
                            const TextStyle(color: Colors.white, fontSize: 14),
                      ),
                      Text(
                        'Get up to ${banners[index]['discount']}',
                        style: const TextStyle(
                            color: Colors.yellow,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  right: 16,
                  bottom: 16,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: const Text('ORDER AHEAD'),
                    style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.purple[800],
                        backgroundColor: Colors.white),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildHomeShelf() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.all(16.0),
          child: Text(
            'Our Home Shelf',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        Container(
          height: 204,
          child: GridView.builder(
            scrollDirection: Axis.horizontal,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.8,
            ),
            itemCount: categories.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage(categories[index]['image']),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    categories[index]['name'],
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 12),
                  ),
                ],
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildDivider() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 16),
      height: 4,
      color: Colors.grey[200],
    );
  }

  Widget _buildAyudhaPoojaDelights() {
    // Sample data for Ayudha Pooja Delights
    final List<Map<String, String>> ayudhaPoojaDelights = [
      {
        'name': 'Sundal',
        'image':
            'assets/foodimages/sundal.jpeg', // Replace with actual image paths
      },
      {
        'name': 'Kheer',
        'image': 'assets/foodimages/khher.jpeg',
      },
      {
        'name': 'Puliyodarai',
        'image': 'assets/foodimages/puliyodarai.jpeg',
      },
      {
        'name': 'Vada',
        'image': 'assets/foodimages/vada.jpeg',
      },
      {
        'name': 'Payasam',
        'image': 'assets/foodimages/payasam.jpeg',
      },
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.all(16.0),
          child: Text(
            'Ayudha Pooja Delights',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        Container(
          height: 150, // Set a fixed height for the list
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: ayudhaPoojaDelights.length,
            itemBuilder: (context, index) {
              return Container(
                width: 100, // Set a width for each item
                margin: const EdgeInsets.symmetric(horizontal: 8),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.1),
                      spreadRadius: 1,
                      blurRadius: 5,
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: ClipRRect(
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(10)),
                        child: Image.asset(
                          ayudhaPoojaDelights[index]['image']!,
                          fit: BoxFit.cover,
                          width: 100,
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      ayudhaPoojaDelights[index]['name']!,
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 4),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildFeaturedProducts() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.all(16.0),
          child: Text(
            'Featured Products',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        Container(
          height: 150,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: featuredProducts.length,
            itemBuilder: (context, index) {
              return Container(
                width: 100,
                margin: const EdgeInsets.symmetric(horizontal: 8),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.1),
                      spreadRadius: 1,
                      blurRadius: 5,
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: ClipRRect(
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(10)),
                        child: Image.asset(
                          featuredProducts[index]['image'],
                          fit: BoxFit.cover,
                          width: 100,
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      featuredProducts[index]['name'],
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      featuredProducts[index]['price'],
                      textAlign: TextAlign.center,
                      style: const TextStyle(color: Colors.green),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildSpecialOffers() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.all(16.0),
          child: Text(
            'Special Offers',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        Container(
          height: 150,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: specialOffers.length,
            itemBuilder: (context, index) {
              return Container(
                width: 100,
                margin: const EdgeInsets.symmetric(horizontal: 8),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.1),
                      spreadRadius: 1,
                      blurRadius: 5,
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: ClipRRect(
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(10)),
                        child: Image.asset(
                          specialOffers[index]['image'],
                          fit: BoxFit.cover,
                          width: 100,
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      specialOffers[index]['name'],
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '${specialOffers[index]['originalPrice']} - ${specialOffers[index]['discountedPrice']}',
                      textAlign: TextAlign.center,
                      style: const TextStyle(color: Colors.green),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
