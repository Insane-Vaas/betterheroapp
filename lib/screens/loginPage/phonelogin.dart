import 'package:flutter/material.dart';

class PhoneLogin extends StatelessWidget {
  const PhoneLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: ListView(
        children: [
          Text("Enter your Phone Number to get OTP"),
          TextField(),
        ],
      ),
    );
  }
}
