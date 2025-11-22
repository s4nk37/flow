import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/router/app_router.dart';
import '../../../../core/utils/validators.dart';
import '../../../../core/widgets/app_button.dart';
import '../../../../core/widgets/app_text_field.dart';
import '../../domain/usecases/register_usecase.dart';
import '../bloc/auth_bloc.dart';

class SignupPage extends StatefulWidget {
  final String email;
  const SignupPage({super.key, required this.email});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final _nameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  
  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;
  
  String? _nameError;
  String? _passwordError;
  String? _confirmPasswordError;

  @override
  void dispose() {
    _nameController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _validateAndSignup(BuildContext context) {
    final nameError = Validators.name(_nameController.text);
    final passwordError = Validators.password(_passwordController.text);
    final confirmError = Validators.confirmPassword(
      _confirmPasswordController.text,
      _passwordController.text,
    );

    setState(() {
      _nameError = nameError;
      _passwordError = passwordError;
      _confirmPasswordError = confirmError;
    });

    if (nameError == null && passwordError == null && confirmError == null) {
      context.read<AuthBloc>().add(
            AuthRegister(
              params: RegisterParams(
                name: _nameController.text.trim(),
                email: widget.email,
                password: _passwordController.text,
              ),
            ),
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: BlocConsumer<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is AuthAuthenticated) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Welcome, ${state.user.name}! Your account has been created.'),
                  backgroundColor: Colors.green.shade600,
                  behavior: SnackBarBehavior.floating,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  duration: const Duration(seconds: 3),
                ),
              );
              context.go(AppRouter.homePath);
            } else if (state is AuthError) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.message),
                  backgroundColor: Colors.red.shade400,
                  behavior: SnackBarBehavior.floating,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              );
            }
          },
          builder: (context, state) {
            final isLoading = state is AuthLoading;

            return SingleChildScrollView(
              child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 16),

                      // Back button
                      IconButton(
                        icon: const Icon(Icons.arrow_back, color: Colors.black),
                        onPressed: () => context.pop(),
                        style: IconButton.styleFrom(
                          backgroundColor: Colors.grey.shade100,
                        ),
                      ),

                  const SizedBox(height: 40),

                  const Text(
                    'Almost there!',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),

                  const SizedBox(height: 12),

                  Text(
                    widget.email,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey.shade600,
                    ),
                  ),

                  const SizedBox(height: 40),

                  // Full name field
                  AppTextField(
                    controller: _nameController,
                    labelText: 'Full Name',
                    errorText: _nameError,
                    prefixIcon: Icons.person_outline,
                    textCapitalization: TextCapitalization.words,
                    onChanged: (_) {
                      if (_nameError != null) {
                        setState(() => _nameError = null);
                      }
                    },
                  ),

                  const SizedBox(height: 20),

                  // Password field
                  AppTextField(
                    controller: _passwordController,
                    labelText: 'Password',
                    errorText: _passwordError,
                    prefixIcon: Icons.lock_outline,
                    obscureText: _obscurePassword,
                    suffixIcon: IconButton(
                      icon: Icon(
                        _obscurePassword
                            ? Icons.visibility_off
                            : Icons.visibility,
                      ),
                      onPressed: () {
                        setState(() => _obscurePassword = !_obscurePassword);
                      },
                    ),
                    onChanged: (_) {
                      if (_passwordError != null) {
                        setState(() => _passwordError = null);
                      }
                    },
                  ),

                  const SizedBox(height: 20),

                  // Confirm password field
                  AppTextField(
                    controller: _confirmPasswordController,
                    labelText: 'Confirm Password',
                    errorText: _confirmPasswordError,
                    prefixIcon: Icons.lock_outline,
                    obscureText: _obscureConfirmPassword,
                    suffixIcon: IconButton(
                      icon: Icon(
                        _obscureConfirmPassword
                            ? Icons.visibility_off
                            : Icons.visibility,
                      ),
                      onPressed: () {
                        setState(() =>
                            _obscureConfirmPassword = !_obscureConfirmPassword);
                      },
                    ),
                    onChanged: (_) {
                      if (_confirmPasswordError != null) {
                        setState(() => _confirmPasswordError = null);
                      }
                    },
                  ),

                  const SizedBox(height: 32),

                  // Create Account Button
                  AppButton(
                    text: 'Create Account',
                    isLoading: isLoading,
                    onPressed: () => _validateAndSignup(context),
                  ),

                  const SizedBox(height: 24),
                    ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
