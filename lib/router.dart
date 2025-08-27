import 'package:flutter/material.dart';
import 'package:whatsapp_ui/common/widgets/error.dart';
import 'package:whatsapp_ui/features/auth/screens/login_screen.dart';
import 'package:whatsapp_ui/features/auth/screens/otp_screen.dart';
import 'package:whatsapp_ui/features/auth/screens/user_information_screen.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case LoginScreen.routeName:
      return MaterialPageRoute(builder: (context) => const LoginScreen());

    case OTPScreen.routeName:
      final args = settings.arguments;
      // Expecting a Map with verificationId
      if (args == null ||
          args is! Map<String, dynamic> ||
          !args.containsKey('verificationId')) {
        return MaterialPageRoute(
          builder: (context) => const Scaffold(
            body: Center(child: Text("Missing verificationId")),
          ),
        );
      }
      final verificationId = args['verificationId'] as String;
      return MaterialPageRoute(
        builder: (context) => OTPScreen(verificationId: verificationId),
      );

    case UserInformationScreen.routeName:
      return MaterialPageRoute(
        builder: (context) => const UserInformationScreen(),
      );

    default:
      return MaterialPageRoute(
        builder: (context) =>
            const Scaffold(body: ErrorScreen(error: "This page doesn't exist")),
      );
  }
}
