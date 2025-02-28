import 'package:flutter/material.dart';
import 'package:practice/screens/login_page.dart';

class SignUpPage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _userController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: _buildBackgroundGradient(),
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Form(
              key: _formKey,
              child: ListView(
                children: [
                  const SizedBox(height: 40),
                  _buildHeader(context),
                  const SizedBox(height: 40),
                  _buildUsernameField(),
                  const SizedBox(height: 20),
                  _buildEmailField(),
                  const SizedBox(height: 20),
                  _buildPasswordField(),
                  const SizedBox(height: 30),
                  _buildSignUpButton(context),
                  const SizedBox(height: 30),
                  _buildSocialButtons(),
                  const SizedBox(height: 40),
                  _buildLoginLink(context),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  BoxDecoration _buildBackgroundGradient() {
    return const BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          Color(0xFF444757),
          Color(0xFF161623),
        ],
        stops: [0.0, 0.7],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Column(
      children: [
        Text(
          'Create Account',
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
        ),
        const SizedBox(height: 12),
        Text(
          'Join our community today!',
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: Colors.white70,
              ),
        ),
      ],
    );
  }

  Widget _buildUsernameField() {
    return TextFormField(
      controller: _userController,
      style: const TextStyle(color: Colors.white),
      decoration: _inputDecoration(
        label: 'Username',
        hint: 'Enter your username',
        icon: Icons.person_outline,
      ),
      validator: (value) {
        if (value == null || value.isEmpty) return 'Please enter a username';
        return null;
      },
    );
  }

  Widget _buildEmailField() {
    return TextFormField(
      controller: _emailController,
      style: const TextStyle(color: Colors.white),
      keyboardType: TextInputType.emailAddress,
      decoration: _inputDecoration(
        label: 'Email',
        hint: 'Enter your email',
        icon: Icons.email_outlined,
      ),
      validator: (value) {
        if (value == null || value.isEmpty) return 'Please enter an email';
        if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
          return 'Invalid email format';
        }
        return null;
      },
    );
  }

  Widget _buildPasswordField() {
    return TextFormField(
      controller: _passwordController,
      style: const TextStyle(color: Colors.white),
      obscureText: true,
      decoration: _inputDecoration(
        label: 'Password',
        hint: 'Enter your password',
        icon: Icons.lock_outlined,
      ),
      validator: (value) {
        if (value == null || value.isEmpty) return 'Please enter a password';
        if (value.length < 6) return 'Password must be 6+ characters';
        return null;
      },
    );
  }

  InputDecoration _inputDecoration({
    required String label,
    required String hint,
    required IconData icon,
  }) {
    return InputDecoration(
      labelText: label,
      hintText: hint,
      labelStyle: const TextStyle(color: Colors.white70),
      hintStyle: const TextStyle(color: Colors.white54),
      prefixIcon: Icon(icon, color: Colors.white70),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Colors.white70),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Colors.white70),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Colors.white),
      ),
      filled: true,
      fillColor: Colors.white.withOpacity(0.1),
      contentPadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
    );
  }

  Widget _buildSignUpButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        if (_formKey.currentState!.validate()) {
          // Handle signup logic
        }
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Theme.of(context).colorScheme.primary,
        padding: const EdgeInsets.symmetric(vertical: 16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      child: const Text(
        'Sign Up',
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    );
  }

  Widget _buildSocialButtons() {
    return Column(
      children: [
        const Text('Or sign up with', style: TextStyle(color: Colors.white70)),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _socialButton('assets/images/google.jpg', 'Google'),
            const SizedBox(width: 20),
            _socialButton('assets/images/facebook.jpg', 'Facebook'),
          ],
        ),
      ],
    );
  }

  Widget _socialButton(String imagePath, String label) {
    return Tooltip(
      message: 'Sign up with $label',
      child: OutlinedButton(
        onPressed: () {},
        style: OutlinedButton.styleFrom(
          side: const BorderSide(color: Colors.white70),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          padding: const EdgeInsets.all(14),
        ),
        child: Image.asset(imagePath, height: 24, width: 24),
      ),
    );
  }

  Widget _buildLoginLink(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Already have an account? ",
            style: TextStyle(color: Colors.white70)),
        TextButton(
          onPressed: () => _showLoginSheet(context),
          child: Text(
            'Login',
            style: TextStyle(
              color: Theme.of(context).colorScheme.secondary,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }

  void _showLoginSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        decoration: const BoxDecoration(
          color: Color(0xFF444757),
          borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
        ),
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
          top: 24,
          left: 24,
          right: 24,
        ),
        child: LoginPage(),
      ),
    );
  }
}
