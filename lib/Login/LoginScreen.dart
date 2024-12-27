import 'package:flutter/material.dart';
import 'package:sloti_co/src/appButtons.dart';

class Loginscreen extends StatelessWidget {
  const Loginscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Column(
        children: [
          appButton.PrimaryButton(
            name: 'Sign In'
          )
        ],
      ),
    );
  }
}