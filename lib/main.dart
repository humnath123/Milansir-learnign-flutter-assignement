import 'package:flutter/material.dart';

import 'screens/home_page.dart';

void main() {
  runApp(const EcommerceSachin());
}

class EcommerceSachin extends StatelessWidget {
  const EcommerceSachin({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Humnath_E-commerce',
      color: Colors.red,
      home: const HomePage(),
    );
  }
}
