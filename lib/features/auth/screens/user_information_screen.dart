import 'package:flutter/material.dart';

class UserInformationScreen extends StatelessWidget {
  static const String routeName = '/user-information';
  const UserInformationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Stack(
                children: [
                  CircleAvatar(
                    backgroundImage: NetworkImage(
                      'https://www.pexels.com/photo/view-of-street-from-a-glass-window-531880/',
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.add_a_photo),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
