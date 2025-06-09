import 'package:flutter/material.dart';

class ProductDetailPage extends StatelessWidget {
  final String title;
  final String image;
  final String price;
  final Function(String, String, String) onAddToCart;

  const ProductDetailPage({
    super.key,
    required this.title,
    required this.image,
    required this.price,
    required this.onAddToCart,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;

    final content = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Product image
        Center(child: Image.asset(image, height: 180)),
        const SizedBox(height: 20),

        // Title and price
        Text(
          title,
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: theme.primaryColor,
          ),
        ),
        const SizedBox(height: 8),
        Text(price, style: TextStyle(fontSize: 18, color: theme.hintColor)),
        const SizedBox(height: 20),

        // Features section
        Text(
          "Product Features",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: theme.primaryColor,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          "- Super fast and strong\n"
          "- Great for gaming and working\n"
          "- 1-year warranty\n"
          "- Light and easy to carry",
          style: TextStyle(
            fontSize: 14,
            color: theme.textTheme.bodyMedium?.color,
          ),
        ),

        const SizedBox(height: 20),

        // Delivery information card
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: theme.cardColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            children: [
              Icon(Icons.local_shipping, color: theme.primaryColor),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  "Delivery in 2–4 days all over Sri Lanka.",
                  style: TextStyle(
                    fontSize: 14,
                    color: theme.textTheme.bodyMedium?.color,
                  ),
                ),
              ),
            ],
          ),
        ),

        const SizedBox(height: 10),

        // Payment information
        Text(
          "*You can pay by card or when the item arrives.",
          style: TextStyle(
            fontSize: 13,
            fontStyle: FontStyle.italic,
            color: theme.hintColor,
          ),
        ),

        const SizedBox(height: 20),

        // Add to cart button
        SizedBox(
          width: double.infinity,
          child: ElevatedButton.icon(
            onPressed: () {
              onAddToCart(title, image, price);
              Navigator.pop(context); // Go back after adding
            },
            icon: const Icon(Icons.add_shopping_cart),
            label: const Text("Add to Cart"),
            style: ElevatedButton.styleFrom(
              backgroundColor: theme.primaryColor,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 14),
            ),
          ),
        ),
      ],
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(title, style: TextStyle(color: theme.primaryColor)),
        iconTheme: IconThemeData(color: theme.primaryColor),
        backgroundColor: theme.scaffoldBackgroundColor,
        elevation: 0,
      ),
      body: isPortrait
          ? Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ...content.children,
                  const Spacer(), // only in portrait!
                ],
              ),
            )
          : SafeArea(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(20),
                child: content,
              ),
            ),
    );
  }
}
