import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:whatsapp_ui/common/utils/utils.dart';
import 'package:whatsapp_ui/features/auth/screens/otp_screen.dart';
import 'package:whatsapp_ui/features/auth/screens/user_information_screen.dart';

final authRepositoryProvider = Provider(
  (ref) => AuthRepository(
    auth: FirebaseAuth.instance,
    firestore: FirebaseFirestore.instance,
  ),
);

class AuthRepository {
  final FirebaseAuth auth;
  final FirebaseFirestore firestore;
  AuthRepository({required this.auth, required this.firestore});

  void signInWithPhone(BuildContext context, String phoneNumber) async {
    try {
      print('Starting phone verification for: $phoneNumber'); // Debug log
      
      await auth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted: (PhoneAuthCredential credential) async {
          print('Verification completed automatically'); // Debug log
          try {
            await auth.signInWithCredential(credential);
            print('User signed in automatically');
            // Navigate to home screen or handle success
          } catch (e) {
            print('Error during automatic sign in: $e');
            showSnakBar(
              context: context,
              content: "Auto sign-in failed: $e",
            );
          }
        },
        verificationFailed: (FirebaseAuthException e) {
          print('Verification failed: ${e.code} - ${e.message}'); // Debug log
          showSnakBar(
            context: context,
            content: e.message ?? "Verification failed",
          );
        },
        codeSent: (String verificationId, int? resendToken) {
          print('Code sent! VerificationId: $verificationId'); // Debug log
          print('Navigating to OTP screen...'); // Debug log
          
          // Navigate to OTP screen and pass the verificationId
          Navigator.pushNamed(
            context, 
            OTPScreen.routeName,
            arguments: {
              'verificationId': verificationId,
              'phoneNumber': phoneNumber,
            },
          );
        },
        codeAutoRetrievalTimeout: (String verificationId) {
          print('Auto retrieval timeout for verificationId: $verificationId'); // Debug log
        },
        timeout: const Duration(seconds: 60),
      );
    } on FirebaseAuthException catch (e) {
      print('FirebaseAuthException: ${e.code} - ${e.message}'); // Debug log
      showSnakBar(
        context: context,
        content: e.message ?? "Something went wrong",
      );
    } catch (e) {
      print('General exception: $e'); // Debug log
      showSnakBar(
        context: context,
        content: "Unexpected error: $e",
      );
    }
  }

  // ✅ Final verifyOTP function (cleaned-up)
  Future<void> verifyOTP({
    required BuildContext context,
    required String verificationId,
    required String userOTP,
  }) async {
    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId,
        smsCode: userOTP,
      );

      await auth.signInWithCredential(credential);

      // ✅ Navigate to home screen after successful OTP
      Navigator.pushNamedAndRemoveUntil(
        context,
        UserInformationScreen.routeName, // <-- change this to your home screen route
        (route) => false,
      );
    } on FirebaseAuthException catch (e) {
      showSnakBar(
        context: context,
        content: "OTP verification failed: ${e.message}",
      );
    }
  }
}

