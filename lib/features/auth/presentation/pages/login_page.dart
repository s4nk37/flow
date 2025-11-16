import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../../../core/services/auth_service.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login Page')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Welcome to the Login Page',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: () async {
                final GoogleSignInAccount? user = await AuthService()
                    .signInWithGoogle();
                print('User: $user');
              },
              icon: const Icon(Icons.g_translate),
              label: const Text('Continue with Google'),
            ),
            ElevatedButton.icon(
              onPressed: () async {
                final user = await AuthService().signOut();
                print('User: ');
              },
              icon: const Icon(Icons.g_translate),
              label: const Text('Signout with Google'),
            ),
          ],
        ),
      ),
    );
  }
}
