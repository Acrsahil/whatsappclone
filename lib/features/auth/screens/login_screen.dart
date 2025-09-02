import 'package:country_picker/country_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:whatsapp_ui/colors.dart';
import 'package:whatsapp_ui/common/widgets/custom_button.dart';
import 'package:whatsapp_ui/common/widgets/textfield_widget.dart';
import 'package:whatsapp_ui/features/auth/repository/auth_controller.dart';

class LoginScreen extends ConsumerStatefulWidget {
  static const routeName = '/login-screen';
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final TextEditingController _phoneController = TextEditingController();
  Country? _selectedCountry;

  @override
  void dispose() {
    _phoneController.dispose();
    super.dispose();
  }

  void _pickCountry() {
    showCountryPicker(
      context: context,
      onSelect: (Country country) {
        setState(() {
          _selectedCountry = country;
        });
      },
    );
  }

  void _sendPhoneNumber() {
    final phoneNumber = _phoneController.text.trim();
    if (_selectedCountry != null && phoneNumber.isNotEmpty) {
      ref
          .read(AuthControllerProvider)
          .signInWithPhone(
            context,
            '+${_selectedCountry!.phoneCode}$phoneNumber',
          );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Please select a country and enter a valid phone number',
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Enter your Phone Number"),
        elevation: 0,
        backgroundColor: blackColor,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment:
              MainAxisAlignment.spaceBetween, // ✅ pushes button to bottom
          children: [
            Column(
              // top content
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'WANXIN will need to verify your phone number.',
                  style: TextStyle(color: blackColor),
                ),
                const SizedBox(height: 10),
                CustomButton(
                  onPressed: _pickCountry,
                  text: _selectedCountry == null
                      ? "Pick Country"
                      : _selectedCountry!.name,
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    if (_selectedCountry != null)
                      Text(
                        '+${_selectedCountry!.phoneCode}',
                        style: TextStyle(
                          color: blackColor,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: TextField(
                        controller: _phoneController,
                        keyboardType: TextInputType.phone,
                        style: TextStyle(color: blackColor),
                        decoration: InputDecoration(
                          hintText: 'Phone number',
                          hintStyle: TextStyle(
                            color: blackColor.withOpacity(0.6),
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: blackColor.withOpacity(0.3),
                            ),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: blackColor),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),

            // ✅ NEXT button pinned at bottom
            SizedBox(
              width: 90,
              child: CustomButton(onPressed: _sendPhoneNumber, text: "NEXT"),
            ),
          ],
        ),
      ),
    );
  }
}
