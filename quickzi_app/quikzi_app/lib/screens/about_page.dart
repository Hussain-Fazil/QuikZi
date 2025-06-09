import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;

    final content = Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(height: 40),
        CircleAvatar(
          radius: 50,
          backgroundColor: theme.primaryColor.withOpacity(0.2),
          child: const Icon(
            Icons.shopping_bag,
            size: 50,
            color: Colors.blueAccent,
          ),
        ),
        const SizedBox(height: 20),
        Text(
          "QuikZi",
          style: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.bold,
            color: theme.primaryColor,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          "Developed by Mohammed Fazil Hussain",
          style: TextStyle(fontSize: 16, color: theme.hintColor),
        ),
        const SizedBox(height: 30),
        const Divider(),
        Text(
          "QuikZi is an online tech store dedicated to providing high-quality computer accessories at affordable prices. From gaming laptops to RGB keyboards and controllers, we bring the best gear right to your fingertips. Our mission is to make tech shopping easy, reliable, and accessible for everyone. Whether you're a gamer, student, or professional, QuikZi has something for you.",
          style: TextStyle(
            fontSize: 15,
            color: theme.textTheme.bodyMedium?.color,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 30),
        const Divider(),
      ],
    );

    return Scaffold(
      body: isPortrait
          ? Padding(padding: const EdgeInsets.all(20), child: content)
          : SafeArea(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(20),
                child: content,
              ),
            ),
    );
  }
}
