import 'package:flutter/material.dart';
import 'package:whatsapp_ui/colors.dart';
import 'package:whatsapp_ui/common/widgets/custom_button.dart';
import 'package:whatsapp_ui/features/auth/screens/login_screen.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({Key? key}) : super(key: key);

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  String _selectedLanguage = "English"; // default language
  final List<String> _languages = [
    "English",
    "Nepali",
    "Hindi",
    "Spanish",
    "Chinese",
  ];

  void navigationToLoginScreen(BuildContext context) {
    Navigator.pushNamed(context, LoginScreen.routeName);
    // Later you can also pass the selected language
    // Navigator.pushNamed(context, LoginScreen.routeName, arguments: _selectedLanguage);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 50),
            const Text(
              "Welcome to Waixin",
              style: TextStyle(
                fontSize: 33,
                fontWeight: FontWeight.w600,
                color: blackColor,
              ),
            ),
            SizedBox(height: size.height / 12),

            // 🌐 Language Selection
            Padding(
  padding: const EdgeInsets.symmetric(horizontal: 20),
  child: DropdownButtonFormField<String>(
    value: _selectedLanguage,
    decoration: InputDecoration(
      labelText: "Choose Language",
      labelStyle: const TextStyle(color: blackColor),
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: blackColor, width: 1.5),
        borderRadius: BorderRadius.circular(12),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: blackColor, width: 2),
        borderRadius: BorderRadius.circular(12),
      ),
    ),
    dropdownColor: Colors.white,
    icon: const Icon(Icons.arrow_drop_down, color: blackColor),
    style: const TextStyle(
      color: blackColor,   // selected value color
      fontSize: 16,
    ),
    items: _languages
        .map((lang) => DropdownMenuItem(
              value: lang,
              child: Text(
                lang,
                style: const TextStyle(color: blackColor), // dropdown text color
              ),
            ))
        .toList(),
    onChanged: (value) {
      setState(() {
        _selectedLanguage = value!;
      });
    },
  ),
),

            SizedBox(height: size.height / 15),
            Image.asset('assets/logo.png', height: 240, width: 240),
            SizedBox(height: size.height / 15),

            const Padding(
              padding: EdgeInsets.all(15.0),
              child: Text(
                'Read our Privacy Policy. Tap "Agree and continue" to accept the Terms of Service.',
                style: TextStyle(color: blackColor),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: size.width * 0.75,
              child: CustomButton(
                text: "AGREE AND CONTINUE",
                onPressed: () => navigationToLoginScreen(context),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
