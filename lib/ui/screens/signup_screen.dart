import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/auth_provider.dart';
import '../shared_widgets/custom_button.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isLoading = false;

  Future<void> _handleSignUp(AuthProvider authProvider) async {
    setState(() {
      _isLoading = true;
    });

    try {
      await authProvider.signUp(
        _emailController.text,
        _passwordController.text,
      );
      Navigator.pushReplacementNamed(context, '/meScreen');
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Sign Up Failed: $e')),
      );
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign Up'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            buildEmailField(),
            buildPasswordField(),
            const SizedBox(height: 20),
            _isLoading
                ? const CircularProgressIndicator()
                : CustomButton(
                    text: 'Sign Up',
                    width: MediaQuery.of(context).size.width / 1.3,
                    onPressed: () => _handleSignUp(authProvider),
                  ),
          ],
        ),
      ),
    );
  }

  Widget buildEmailField() {
    return TextField(
      controller: _emailController,
      decoration: const InputDecoration(labelText: 'Email'),
    );
  }

  Widget buildPasswordField() {
    return TextField(
      controller: _passwordController,
      decoration: const InputDecoration(labelText: 'Password'),
      obscureText: true,
    );
  }
}
