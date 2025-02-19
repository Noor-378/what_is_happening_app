import 'package:flutter/material.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return const Divider(
      height: 10,
      color: Colors.blueGrey,
      indent: 20,
      thickness: .3,
    );
  }
}
