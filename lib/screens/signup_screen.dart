import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'shopping_home_screen.dart';

class SignUpScreen extends StatefulWidget {
  final Function(Locale) onLanguageChanged;
  final Locale currentLocale;
  
  const SignUpScreen({
    super.key,
    required this.onLanguageChanged,
    required this.currentLocale,
  });

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  String? _validateName(String? value) {
    final localizations = AppLocalizations.of(context)!;
    if (value == null || value.isEmpty) {
      return localizations.enterFullName;
    }
    if (!RegExp(r'^[A-Z]').hasMatch(value)) {
      return localizations.nameStartUppercase;
    }
    return null;
  }

  String? _validateEmail(String? value) {
    final localizations = AppLocalizations.of(context)!;
    if (value == null || value.isEmpty) {
      return localizations.enterEmail;
    }
    if (!value.contains('@')) {
      return localizations.invalidEmail;
    }
    return null;
  }

  String? _validatePassword(String? value) {
    final localizations = AppLocalizations.of(context)!;
    if (value == null || value.isEmpty) {
      return localizations.enterPassword;
    }
    if (value.length < 6) {
      return localizations.passwordTooShort;
    }
    return null;
  }

  String? _validateConfirmPassword(String? value) {
    final localizations = AppLocalizations.of(context)!;
    if (value == null || value.isEmpty) {
      return localizations.enterConfirmPassword;
    }
    if (value != _passwordController.text) {
      return localizations.passwordsNotMatch;
    }
    return null;
  }

  void _handleSignUp() {
    if ((_formKey.currentState as FormState).validate()) {
      final localizations = AppLocalizations.of(context)!;
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text(localizations.accountCreated),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.pushReplacement(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) =>
                        ShoppingHomeScreen(
                          onLanguageChanged: widget.onLanguageChanged,
                          currentLocale: widget.currentLocale,
                        ),
                    transitionsBuilder: (context, animation, secondaryAnimation, child) {
                      return FadeTransition(
                        opacity: animation,
                        child: child,
                      );
                    },
                  ),
                );
              },
              child: Text(localizations.close),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        title: Text(localizations.signUp),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            icon: const Icon(Icons.language, color: Colors.white),
            onPressed: () {
              _showLanguageDialog(context);
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 20),
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(
                  labelText: localizations.fullName,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  prefixIcon: const Icon(Icons.person),
                ),
                validator: _validateName,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: localizations.email,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  prefixIcon: const Icon(Icons.email),
                ),
                keyboardType: TextInputType.emailAddress,
                validator: _validateEmail,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _passwordController,
                decoration: InputDecoration(
                  labelText: localizations.password,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  prefixIcon: const Icon(Icons.lock),
                ),
                obscureText: true,
                validator: _validatePassword,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _confirmPasswordController,
                decoration: InputDecoration(
                  labelText: localizations.confirmPassword,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  prefixIcon: const Icon(Icons.lock_outline),
                ),
                obscureText: true,
                validator: _validateConfirmPassword,
              ),
              const SizedBox(height: 32),
              SizedBox(
                height: 55,
                child: ElevatedButton(
                  onPressed: _handleSignUp,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurple,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(
                    localizations.signUp,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showLanguageDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Select Language / اختر اللغة'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: const Text('🇺🇸'),
                title: const Text('English'),
                onTap: () {
                  Navigator.of(context).pop();
                  widget.onLanguageChanged(const Locale('en'));
                },
              ),
              ListTile(
                leading: const Text('🇸🇦'),
                title: const Text('العربية'),
                onTap: () {
                  Navigator.of(context).pop();
                  widget.onLanguageChanged(const Locale('ar'));
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
