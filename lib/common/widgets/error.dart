import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp_ui/colors.dart';
import 'package:whatsapp_ui/features/landing/screens/landing_screen.dart';
import 'package:whatsapp_ui/firebase_options.dart';
import 'package:whatsapp_ui/screens/mobile_layout_screen.dart';
import 'package:whatsapp_ui/screens/web_layout_screen.dart';
import 'package:whatsapp_ui/utils/responsive_layout.dart';

class ErrorScreen extends StatelessWidget {
    final String error;
    const ErrorScreen({
        Key? key,
        required this.error
    }) : super(key: key);
    @override
    Widget build(BuildContext context) {
        return Center(
            child: Text(error),
        );
    }
}
