import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

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
          "Developed by QUIKZI STORE",
          style: TextStyle(fontSize: 16, color: theme.hintColor),
        ),
        const SizedBox(height: 30),
        const Divider(),
        Text(
          "QuikZi is an online tech store dedicated to providing high-quality computer accessories at affordable prices. From gaming laptops to RGB keyboards and controllers, we bring the best gear right to your fingertips. Our mission is to make tech shopping easy, reliable, and accessible for everyone. Whether you're a gamer, student, or professional, QuikZi has something for you.",
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
            color: theme.textTheme.bodyMedium?.color ?? Colors.black,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 30),
        const Divider(),
        const SizedBox(height: 20),
        Text(
          "Connect with us on",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: theme.primaryColor,
          ),
        ),
        const SizedBox(height: 10),

        // Facebook
        Text.rich(
          TextSpan(
            children: [
              const TextSpan(text: "Facebook: "),
              TextSpan(
                text: "@QuikZiStore",
                style: TextStyle(
                  color: Colors.blue[900],
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 15),
        ),

        const SizedBox(height: 8),

        // Instagram
        Text.rich(
          TextSpan(
            children: [
              const TextSpan(text: "Instagram: "),
              TextSpan(
                text: "@quikzi_official",
                style: TextStyle(
                  color: Colors.pinkAccent,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 15),
        ),

        const SizedBox(height: 8),

        // Twitter
        Text.rich(
          TextSpan(
            children: [
              const TextSpan(text: "Twitter: "),
              TextSpan(
                text: "@quikzi_store",
                style: TextStyle(
                  color: Colors.lightBlue,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 15),
        ),

        const SizedBox(height: 8),

        // Email
        Text(
          "Email: support@quikzi.com",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
            color: theme.textTheme.bodyMedium?.color ?? Colors.black54,
          ),
        ),

        const SizedBox(height: 40),
      ],
    );

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: content,
        ),
      ),
    );
  }
}
