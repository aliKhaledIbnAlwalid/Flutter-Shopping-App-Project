import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SettingsScreen extends StatelessWidget {
  final Function(Locale) onLanguageChanged;
  final Locale currentLocale;
  
  const SettingsScreen({
    super.key,
    required this.onLanguageChanged,
    required this.currentLocale,
  });

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;
    final currentLocale = Localizations.localeOf(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            const Text(
              'Language Settings',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.deepPurple,
              ),
            ),
            const SizedBox(height: 16),
            Card(
              elevation: 4,
              child: ListTile(
                leading: const Icon(Icons.language, color: Colors.deepPurple),
                title: const Text('Language'),
                subtitle: Text(currentLocale.languageCode == 'ar' ? 'العربية' : 'English'),
                trailing: const Icon(Icons.arrow_forward_ios),
                onTap: () {
                  _showLanguageDialog(context);
                },
              ),
            ),
            const SizedBox(height: 20),
            Card(
              elevation: 4,
              child: ListTile(
                leading: const Icon(Icons.info, color: Colors.deepPurple),
                title: Text(localizations.appTitle),
                subtitle: const Text('Version 1.0.0'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showLanguageDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Select Language'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: const Text('🇺🇸'),
                title: const Text('English'),
                onTap: () {
                  _changeLanguage(context, const Locale('en'));
                },
              ),
              ListTile(
                leading: const Text('🇸🇦'),
                title: const Text('العربية'),
                onTap: () {
                  _changeLanguage(context, const Locale('ar'));
                },
              ),
            ],
          ),
        );
      },
    );
  }

  void _changeLanguage(BuildContext context, Locale locale) {
    Navigator.of(context).pop();
    onLanguageChanged(locale);
  }
}
