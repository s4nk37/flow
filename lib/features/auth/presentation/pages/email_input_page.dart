import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/router/app_router.dart';
import '../../../../core/utils/validators.dart';
import '../../../../core/widgets/app_button.dart';
import '../../../../core/widgets/app_text_field.dart';
import '../bloc/auth_bloc.dart';

class EmailInputPage extends StatefulWidget {
  const EmailInputPage({super.key});

  @override
  State<EmailInputPage> createState() => _EmailInputPageState();
}

class _EmailInputPageState extends State<EmailInputPage> {
  final _emailController = TextEditingController();
  String? _emailError;

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  void _validateAndContinue() {
    final email = _emailController.text.trim();
    final error = Validators.email(email);

    setState(() => _emailError = error);

    if (error == null) {
      context.read<AuthBloc>().add(AuthCheckEmail(email: email));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthEmailChecked) {
            if (state.exists) {
              context.goNamed(
                AppRouter.passwordLoginPage,
                extra: state.email,
              );
            } else {
              context.goNamed(
                AppRouter.signupPage,
                extra: state.email,
              );
            }
          } else if (state is AuthError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message)),
            );
          }
        },
        builder: (context, state) {
          return SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                  const SizedBox(height: 16),

                  // Back button
                  IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.black),
                    onPressed: () => context.go(AppRouter.loginPath),
                    style: IconButton.styleFrom(
                      backgroundColor: Colors.grey.shade100,
                    ),
                  ),

                  const SizedBox(height: 40),

                  const Text(
                    "Enter your email",
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),

                  const SizedBox(height: 12),

                  Text(
                    "We'll check if you already have an account.",
                    style: TextStyle(
                      color: Colors.grey.shade600,
                      fontSize: 16,
                    ),
                  ),

                  const SizedBox(height: 40),

                  AppTextField(
                    controller: _emailController,
                    labelText: "Email Address",
                    errorText: _emailError,
                    prefixIcon: Icons.email_outlined,
                    keyboardType: TextInputType.emailAddress,
                    autofocus: true,
                    onChanged: (_) {
                      if (_emailError != null) {
                        setState(() => _emailError = null);
                      }
                    },
                    onSubmitted: (_) => _validateAndContinue(),
                  ),

                  const SizedBox(height: 32),

                  AppButton(
                    text: "Continue",
                    onPressed: _validateAndContinue,
                    isLoading: state is AuthLoading,
                  ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
