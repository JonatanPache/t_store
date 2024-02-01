import 'package:flutter/material.dart';
import 'package:t_store/features/shop/screens/home/widgets/home_appbar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header

            // App bar
            THomeAppBar()
          ],
        ),
      ),
    );
  }
}
