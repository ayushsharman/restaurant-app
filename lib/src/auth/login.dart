import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:temp_customer_app/src/routes/navigation.dart';

class LoginSignupPage extends StatefulWidget {
  @override
  _LoginSignupPageState createState() => _LoginSignupPageState();
}

class _LoginSignupPageState extends State<LoginSignupPage>
    with SingleTickerProviderStateMixin {
  bool isLogin = true;
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _animation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _toggleView() {
    setState(() {
      if (isLogin) {
        _animationController.forward();
      } else {
        _animationController.reverse();
      }
      isLogin = !isLogin;
    });
  }

  void _navigateToBottomNavigation() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => BottomNavigation()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                    'assets/foodimages/HomeKrafted Logo.png'), // Use local asset path
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.black.withOpacity(0.7),
                  Colors.green.withOpacity(0.5),
                ],
              ),
            ),
          ),
          SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 50),
                    const Center(
                      child: Text(
                        'Welcome to\n Homecraft',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.easeInOut,
                      padding: const EdgeInsets.all(24),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.9),
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 10,
                            offset: const Offset(0, 5),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              _buildToggleButton('Sign Up', !isLogin),
                              _buildToggleButton('Log In', isLogin),
                            ],
                          ),
                          const SizedBox(height: 30),
                          AnimatedSwitcher(
                            duration: const Duration(milliseconds: 500),
                            child: isLogin
                                ? _buildLoginForm()
                                : _buildSignUpForm(),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 30),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildToggleButton(String text, bool isActive) {
    return GestureDetector(
      onTap: _toggleView,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        decoration: BoxDecoration(
          color: isActive ? Colors.green : Colors.transparent,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: isActive ? Colors.white : Colors.black54,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget _buildLoginForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _buildTextField(
          hint: 'Email or Username',
          icon: Icons.email,
        ),
        const SizedBox(height: 16),
        _buildTextField(
          hint: 'Password',
          icon: Icons.lock,
          isPassword: true,
        ),
        const SizedBox(height: 8),
        Align(
          alignment: Alignment.centerRight,
          child: TextButton(
            onPressed: () {},
            child: const Text(
              'Forgot Password?',
              style: TextStyle(color: Colors.green),
            ),
          ),
        ),
        const SizedBox(height: 24),
        ElevatedButton(
          onPressed: _navigateToBottomNavigation,
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.green,
            padding: const EdgeInsets.symmetric(vertical: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
          ),
          child: const Text('Log In', style: TextStyle(color: Colors.white)),
        ),
        const SizedBox(height: 24),
        const Row(
          children: [
            Expanded(child: Divider()),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text('OR', style: TextStyle(color: Colors.black54)),
            ),
            Expanded(child: Divider()),
          ],
        ),
        const SizedBox(height: 24),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildSocialButton(Icons.facebook, Colors.blue),
            const SizedBox(width: 16),
            _buildSocialButton(Icons.g_mobiledata, Colors.green),
            const SizedBox(width: 16),
            _buildSocialButton(Icons.apple, Colors.black),
          ],
        ),
      ],
    );
  }

  Widget _buildSignUpForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _buildTextField(hint: 'First Name', icon: Icons.person),
        const SizedBox(height: 16),
        _buildTextField(hint: 'Last Name', icon: Icons.person_outline),
        const SizedBox(height: 16),
        _buildTextField(hint: 'Email', icon: Icons.email),
        const SizedBox(height: 16),
        _buildTextField(hint: 'Password', icon: Icons.lock, isPassword: true),
        const SizedBox(height: 24),
        ElevatedButton(
          onPressed: _navigateToBottomNavigation,
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.green,
            padding: const EdgeInsets.symmetric(vertical: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
          ),
          child: const Text('Sign Up', style: TextStyle(color: Colors.white)),
        ),
        const SizedBox(height: 16),
        TextButton(
          onPressed: _toggleView,
          child: const Text(
            'Already have an account? Log In',
            style: TextStyle(color: Colors.green),
          ),
        ),
      ],
    );
  }

  Widget _buildTextField({
    required String hint,
    required IconData icon,
    bool isPassword = false,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(30),
      ),
      child: TextField(
        obscureText: isPassword,
        decoration: InputDecoration(
          hintText: hint,
          prefixIcon: Icon(icon, color: Colors.green),
          border: InputBorder.none,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        ),
      ),
    );
  }

  Widget _buildSocialButton(IconData icon, Color color) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color.withOpacity(0.1),
      ),
      child: Icon(icon, color: color),
    );
  }
}
