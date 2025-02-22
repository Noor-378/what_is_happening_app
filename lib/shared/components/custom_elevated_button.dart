import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton(
      {super.key,
        required this.onPressed,
      required this.width,
      required this.height,
      required this.text});
  final Function() onPressed;
  final double width;
  final double height;
  final String text;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        fixedSize: Size(width, height),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        ),
        elevation: 15,
        side: BorderSide(
          color: Colors.blue,
          width: 2,
        ),
        backgroundColor: Theme.of(context).colorScheme.error,
      ),
      child: Text(
        text,
        style: TextStyle(
          color: Colors.blue,
          fontSize: 17,
          fontWeight: FontWeight.w900,
        ),
      ),
    );
  }
}
