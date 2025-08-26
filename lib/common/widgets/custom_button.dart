
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp_ui/colors.dart';

class CustomButton extends StatelessWidget {
    final String text;
    final VoidCallback onPressed;
    const CustomButton({
        Key? key,
        required this.text,
        required this.onPressed,
        
    }): super(key:key);

    @override
    Widget build(BuildContext context) {
        return ElevatedButton(
            child: Text(text,style: const TextStyle(
            color: whiteColor,
        ),),
            onPressed: onPressed,
            style:ElevatedButton.styleFrom(
                backgroundColor:tabColor,
                minimumSize: const Size(double.infinity,50),
            )

        );
    }
}
