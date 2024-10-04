import 'package:flutter/material.dart';

class FoodOrderTrackingScreen extends StatelessWidget {
  // Sample data for food orders
  final List<Map<String, dynamic>> foodOrders = [
    {
      'restaurantName': 'The Gourmet Kitchen',
      'orderId': '#A12345',
      'date': '2024-10-01',
      'items': [
        {
          'name': 'Margherita Pizza',
          'quantity': 1,
          'price': '₹500',
          'image': 'assets/foodimages/pizza.jpeg'
        },
        {
          'name': 'Caesar Salad',
          'quantity': 1,
          'price': '₹250',
          'image': 'assets/foodimages/salad.jpeg'
        },
      ],
      'totalAmount': '₹750',
      'status': 'In Transit',
      'estimatedDelivery': '30 minutes',
    },
    {
      'restaurantName': 'Spicy Delights',
      'orderId': '#A12346',
      'date': '2024-09-30',
      'items': [
        {
          'name': 'Paneer Butter Masala',
          'quantity': 2,
          'price': '₹400',
          'image': 'assets/foodimages/panner butter masala.jpeg'
        },
        {
          'name': 'Biryani',
          'quantity': 1,
          'price': '₹600',
          'image': 'assets/foodimages/ckbiryani.jpeg'
        },
      ],
      'totalAmount': '₹1000',
      'status': 'Delivered',
      'estimatedDelivery': 'Just Now',
    },
    {
      'restaurantName': 'Sushi Palace',
      'orderId': '#A12347',
      'date': '2024-09-29',
      'items': [
        {
          'name': 'California Roll',
          'quantity': 2,
          'price': '₹700',
          'image': 'assets/foodimages/sushi.jpeg'
        },
        {
          'name': 'Miso Soup',
          'quantity': 1,
          'price': '₹150',
          'image': 'assets/foodimages/soup.jpg'
        },
      ],
      'totalAmount': '₹850',
      'status': 'Pending',
      'estimatedDelivery': '45 minutes',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Order Tracking',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.green,
        centerTitle: true,
      ),
      body: SafeArea(
        child: ListView.builder(
          itemCount: foodOrders.length,
          itemBuilder: (context, index) {
            return _buildOrderCard(foodOrders[index]);
          },
        ),
      ),
    );
  }

  Widget _buildOrderCard(Map<String, dynamic> order) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      elevation: 8,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              order['restaurantName'],
              style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.green),
            ),
            const SizedBox(height: 8),
            Text(
              'Order ID: ${order['orderId']}',
              style: const TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 8),
            Text(
              'Date: ${order['date']}',
              style: const TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 12),
            ...order['items'].map<Widget>((item) {
              return _buildOrderItem(item);
            }).toList(),
            const SizedBox(height: 12),
            Text(
              'Total Amount: ${order['totalAmount']}',
              style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.greenAccent),
            ),
            const SizedBox(height: 8),
            Text(
              'Status: ${order['status']}',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: _getStatusColor(order['status']),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Estimated Delivery: ${order['estimatedDelivery']}',
              style: const TextStyle(color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOrderItem(Map<String, dynamic> item) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  item['image'],
                  width: 50,
                  height: 50,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 8),
              Text(
                '${item['name']} (x${item['quantity']})',
                style: const TextStyle(fontSize: 16),
              ),
            ],
          ),
          Text(
            item['price'],
            style: const TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }

  Color _getStatusColor(String status) {
    switch (status) {
      case 'Delivered':
        return Colors.green;
      case 'In Transit':
        return Colors.orange;
      case 'Pending':
        return Colors.blue;
      case 'Cancelled':
        return Colors.red;
      default:
        return Colors.black;
    }
  }
}
