import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.isValid,
  });

  final bool isValid;

  @override
  Widget build(BuildContext context) {
    return Ink(
      height: 40,
      width: 90,
      decoration: BoxDecoration(
        color: isValid ? Colors.deepPurple : Colors.grey,
        borderRadius: BorderRadius.circular(10),
      ),
      child: const Center(
        child: Text(
          'Entrar',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}