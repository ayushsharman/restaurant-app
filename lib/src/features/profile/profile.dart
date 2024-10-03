import 'package:flutter/material.dart';

class AccountManagementScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text('Manage Account'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _buildUserInfoCard(),
              SizedBox(height: 16),
              _buildQuickAccessRow(),
              SizedBox(height: 16),
              _buildReferralCard(),
              SizedBox(height: 16),
              _buildCookJoinCard(),
              SizedBox(height: 16),
              _buildAccountOptionsList(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildUserInfoCard() {
    return Card(
      child: ListTile(
        leading: CircleAvatar(
          child: Text('25%'),
          backgroundColor: Colors.green[100],
          foregroundColor: Colors.green,
        ),
        title:
            Text('Akash yadav', style: TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text('+918708945628'),
        trailing: Icon(Icons.edit),
      ),
    );
  }

  Widget _buildQuickAccessRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildQuickAccessItem(Icons.home, 'Manage\nAddresses'),
        _buildQuickAccessItem(Icons.favorite, 'Favourite\nKitchens'),
        _buildQuickAccessItem(Icons.eco, 'Pure Veg', isSwitch: true),
      ],
    );
  }

  Widget _buildQuickAccessItem(IconData icon, String label,
      {bool isSwitch = false}) {
    return Column(
      children: [
        isSwitch
            ? Switch(value: true, onChanged: (value) {})
            : Icon(icon, color: Colors.grey),
        Text(label,
            textAlign: TextAlign.center, style: TextStyle(fontSize: 12)),
      ],
    );
  }

  Widget _buildReferralCard() {
    return Card(
      margin: const EdgeInsets.all(16),
      elevation: 8, // Adds shadow to the card
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12), // Rounded edges for the card
      ),
      child: Stack(
        children: [
          // Background Image with Opacity and Shadow
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                borderRadius:
                    BorderRadius.circular(12), // Rounded corners for the image
                boxShadow: [
                  BoxShadow(
                    color: Colors.black
                        .withOpacity(0.3), // Adds shadow to the image
                    spreadRadius: 2,
                    blurRadius: 8,
                    offset: Offset(0, 5), // Shadow positioning
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius:
                    BorderRadius.circular(12), // Ensures image fits card radius
                child: Stack(
                  children: [
                    Image.asset(
                      'assets/foodimages/referimage.jpg', // Replace with your image path
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: double.infinity,
                    ),
                    // Gradient overlay for better text visibility
                    Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Colors.black.withOpacity(0.9),
                            Colors.transparent,
                          ],
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          // Content over the background image
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Refer Your Friend',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.white, // Changed to white for better contrast
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'Refer your friend and gift Rs. 100, Earn\nRs. 50 on your friend’s first order.',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight:
                          FontWeight.bold // Changed to white for readability
                      ),
                ),
                SizedBox(height: 8),
                Text(
                  'T & C Apply',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.white, // Text remains readable
                  ),
                ),
                SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(20), // Rounded button corners
                    ),
                    elevation: 4, // Adds shadow to the button
                    shadowColor: Colors.black.withOpacity(0.3),
                  ),
                  child: Text(
                    'Invite Your Friend',
                    style: TextStyle(color: Colors.white), // Button text color
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCookJoinCard() {
    return Card(
      margin: const EdgeInsets.all(16),
      child: Stack(
        children: [
          // Background image
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                    'assets/foodimages/chef.jpeg'), // Add your image path
                fit: BoxFit.cover,
              ),
              borderRadius:
                  BorderRadius.circular(12), // To round the edges of the image
            ),
            height: 180, // Adjust the height as needed
          ),
          // Content on top of the image
          Container(
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              borderRadius:
                  BorderRadius.circular(12), // Match the card's border radius
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Turn your passion into profits',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white, // Text color on image
                      fontSize: 18,
                    )),
                Text(
                    'Join us as a cook and start your\nentrepreneurial journey today.',
                    style: TextStyle(color: Colors.white)),
                Text('T & C Apply',
                    style: TextStyle(fontSize: 12, color: Colors.white)),
                SizedBox(height: 8),
                ElevatedButton(
                  child: Text(
                    'Join Now',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAccountOptionsList() {
    final options = [
      {'icon': Icons.history, 'title': 'My Coin History'},
      {'icon': Icons.shopping_bag, 'title': 'Your Orders'},
      {'icon': Icons.headset_mic, 'title': 'Help & Support'},
      {'icon': Icons.question_answer, 'title': 'Legal & FAQ\'s'},
      {'icon': Icons.policy, 'title': 'Refund Policy'},
      {'icon': Icons.privacy_tip, 'title': 'Privacy Policy'},
      {'icon': Icons.description, 'title': 'Terms & Conditions'},
      {'icon': Icons.settings, 'title': 'Settings'},
      {'icon': Icons.location_on, 'title': 'Delivery Areas'},
      {'icon': Icons.exit_to_app, 'title': 'Log Out'},
    ];

    return Column(
      children: options
          .map((option) => Container(
                margin: const EdgeInsets.symmetric(vertical: 2, horizontal: 5),
                decoration: BoxDecoration(
                  color: Colors.white, // Background color of each container
                  borderRadius: BorderRadius.circular(8), // Rounded corners
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2), // Shadow color
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: const Offset(0, 3), // Shadow position
                    ),
                  ],
                ),
                child: _buildListTile(
                    option['icon'] as IconData, option['title'] as String),
              ))
          .toList(),
    );
  }

  Widget _buildListTile(IconData icon, String title) {
    return ListTile(
      leading: Icon(icon, color: Colors.grey),
      title: Text(title),
      trailing: Icon(Icons.chevron_right),
      onTap: () {
        // Add action here
      },
    );
  }
}
