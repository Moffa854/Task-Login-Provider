import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/auth_provider.dart';
import '../shared_widgets/custom_button.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key});

  @override
  _LogInScreenState createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isLoading = false;

  Future<void> handleLogin(AuthProvider authProvider) async {
    setState(() {
      _isLoading = true;
    });

    try {
      await authProvider.signIn(
        _emailController.text,
        _passwordController.text,
      );
      Navigator.pushReplacementNamed(context, '/meScreen');
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Check Your Account')),
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
        title: const Text('Login In'),
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
                    text: 'Login In',
                    width: MediaQuery.of(context).size.width / 1.3,
                    onPressed: () => handleLogin(authProvider),
                  ),
            const SizedBox(height: 20),
            CustomButton(
              text: 'Sign Up',
              width: MediaQuery.of(context).size.width / 1.3,
              onPressed: () {
                Navigator.pushNamed(context, '/signUp');
              },
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
