import 'package:flutter/material.dart';
import 'package:ecommerce/feature/landing_screen/presentation/landing_screen.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  // Controllers for text fields
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  // Flags for form validation and button state
  bool isButtonEnabled = false;

  @override
  Widget build(BuildContext context) {
    // Using SingleChildScrollView to avoid overflow when keyboard is visible
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildEmailField(),
              const SizedBox(height: 20),
              _buildPasswordField(),
              const SizedBox(height: 20),
              _buildLoginButton(),
            ],
          ),
        ),
      ),
    );
  }

  // Email field with validation
  Widget _buildEmailField() {
    return TextField(
      key: const ValueKey("emailField"), // Finder: byValueKey('emailField')
      controller: emailController,
      onChanged: (value) => _validateForm(),
      decoration: InputDecoration(
        labelText: "Email",
        hintText: "Enter your email",
        border: const OutlineInputBorder(),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: 1,
            color:
                _isValidEmail(emailController.text) ? Colors.green : Colors.red,
          ),
        ),
      ),
    );
  }

  // Password field with validation
  Widget _buildPasswordField() {
    return TextField(
      key: const ValueKey(
          "passwordField"), // Finder: byValueKey('passwordField')
      controller: passwordController,
      onChanged: (value) => _validateForm(),
      obscureText: true,
      decoration: InputDecoration(
        labelText: "Password",
        hintText: "Enter your password",
        border: const OutlineInputBorder(),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: 1,
            color: _isValidPassword(passwordController.text)
                ? Colors.green
                : Colors.red,
          ),
        ),
      ),
    );
  }

  // Login button that is enabled/disabled based on form validation
  Widget _buildLoginButton() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        key: const ValueKey("loginButton"), // Finder: byValueKey('loginButton')
        onPressed: isButtonEnabled ? _login : null,
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.all(10),
          backgroundColor: isButtonEnabled ? Colors.blue : Colors.grey,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: const Text(
          "Login",
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
    );
  }

  // Form validation logic
  void _validateForm() {
    final isEmailValid = _isValidEmail(emailController.text);
    final isPasswordValid = _isValidPassword(passwordController.text);
    setState(() {
      isButtonEnabled = isEmailValid && isPasswordValid;
    });
  }

  // Email validation using regular expression
  bool _isValidEmail(String email) {
    if (email.isEmpty) return false;
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return emailRegex.hasMatch(email);
  }

  // Simple password validation
  bool _isValidPassword(String password) {
    return password.isNotEmpty && password.length >= 8;
  }

// Mock login function for demonstration
  void _login() {
    // Check if email and password match the expected credentials
    if (emailController.text == "xyz@gmail.com" &&
        passwordController.text == "12345678") {
      // Navigate to the LandingPage if the credentials match
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LandingPage()),
      );
    } else {
      // Show a SnackBar if the email and password do not match
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Email or Password is incorrect'),
          duration: Duration(seconds: 1),
          action: SnackBarAction(
            label: 'Dismiss',
            onPressed: () {
              // This will dismiss the SnackBar before its duration expires
              ScaffoldMessenger.of(context).hideCurrentSnackBar();
            },
          ),
        ),
      );
    }
  }
}
